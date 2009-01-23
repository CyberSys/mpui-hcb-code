//MYC:2006/08/17 = Correction in TRARHeaderDataEx interface in order to handle stress Filenames in archive
{
  see UNRARDLL.TXT for Informations about UnRar.dll - Functions and structures
}
// 动态载入UnRAR.dll
unit UnRar;

interface

uses
  Windows,SysUtils,TntSysUtils,TntWindows,Classes,TntDialogs,ComObj;

const
  // Constants from UnRar.h
  RAR_OM_LIST          = 0;
  RAR_OM_EXTRACT       = 1;
  RAR_SKIP             = 0;
  RAR_EXTRACT          = 2;

type
  // Header for every file in an archive
  TRARHeaderData = record
    ArcName      : array[0..1023] of char;
    ArcNameW     : array[0..1023] of WideChar;
    FileName     : array[0..1023] of char;
    FileNameW    : array[0..1023] of WideChar;
    Flags        : cardinal;
    PackSize     : cardinal;
    PackSizeHigh : cardinal;
    UnpSize      : cardinal;
    UnpSizeHigh  : cardinal;
    HostOS       : cardinal;
    FileCRC      : cardinal;
    FileTime     : cardinal;
    UnpVer       : cardinal;
    Method       : cardinal;
    FileAttr     : cardinal;
    CmtBuf       : PChar;
    CmtBufSize   : cardinal;
    CmtSize      : cardinal;
    CmtState     : cardinal;
    Reserved     : array[1..1024] of cardinal;
  end;

  // Archive-Data for opening rar-archive
  TRAROpenArchiveData = record
    ArcName    : PChar;
    ArcNameW   : PWideChar;
    OpenMode   : cardinal;
    OpenResult : cardinal;
    CmtBuf     : PChar;
    CmtBufSize : cardinal;
    CmtSize    : cardinal;
    CmtState   : cardinal;
    Flags      : cardinal;
    Reserved   : array[1..32] of cardinal;
  end;

  TUnRARThread = class(TThread)
                  private
                    procedure SetName;
                  protected
                    procedure Execute; override;
                end;

var
  // Flag for: Is Dll loaded...
  IsRarLoaded:THandle=0; IsShell32Loaded:THandle = 0;
  // function Pointer - Dll is always dynamicly loaded
  RAROpenArchive        : function(var ArchiveData: TRAROpenArchiveData): THandle; stdcall;
  RARCloseArchive       : function(hArcData: THandle): integer; stdcall;
  RARReadHeader         : function(hArcData: THandle; var HeaderData: TRARHeaderData): Integer; stdcall;
  RARProcessFile        : function(hArcData: THandle; Operation: Integer; DestPath, DestName: PwideChar): Integer; stdcall;
  RARSetPassword        : procedure(hArcData: THandle; Password: PChar); stdcall;
  SHGetKnownFolderPath  : function(rfid:PGUID; dwFlags:DWord; hToken:THandle; out ppszPath:PPWideChar):HRESULT; stdcall;
  
// helper functions for (un)loading the Dll and check for loaded
procedure LoadRarLibrary;
procedure UnLoadRarLibrary;
procedure LoadShell32Library;
procedure UnLoadShell32Library;
procedure ClearTmpFiles(Directory:WideString);
function AddRarMovies(ArcName,PW:widestring; Add:boolean):integer;
procedure ExtractRarMovie(ArcName,MovieName,PW:widestring);
procedure ExtractRarLyric(ArcName,PW:WideString; Mode:integer);
function ExtractRarSub(ArcName,PW:WideString):WideString;
Procedure CoTaskMemFree(pv:Pointer); stdcall; external 'ole32.dll';
function GetShellPath(rfid:TGUID):WideString;

implementation
uses Main,Core,plist,locale,SevenZip;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure UNRAR.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

type
  TThreadNameInfo = record
    FType: LongWord;     // must be 0x1000
    FName: PChar;        // pointer to name (in user address space)
    FThreadID: LongWord; // thread ID (-1 indicates caller thread)
    FFlags: LongWord;    // reserved for future use, must be zero
  end;

procedure TUnRARThread.SetName;
var ThreadNameInfo: TThreadNameInfo;
begin
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := PChar('HCB428');
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;

  try
    RaiseException( $406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo );
  except
  end;
end;

procedure TUnRARThread.Execute;
begin
  SetName;
  { Place thread code here }
  ExtractMovie(TmpURL,ArcMovie,ArcPW,Tnt_WideLowerCase(WideExtractFileExt(TmpURL)));
  tEnd:=true;
end;

// Loads the UnRar.dll
procedure LoadRarLibrary;
begin
  // UnRar.dll must exists in typically dll-paths
  // 1. Application-Directory
  // 2. Current Directory
  // 3. System-Directory
  // 4. Windows-Direcory
  // 5. Directories from PATH-Variable
  if IsRarLoaded <> 0 then exit;
  IsRarLoaded := Tnt_LoadLibraryW('unrar.dll');
  if IsRarLoaded <> 0 then begin
    @RAROpenArchive        := GetProcAddress(IsRarLoaded, 'RAROpenArchiveEx');
    @RARCloseArchive       := GetProcAddress(IsRarLoaded, 'RARCloseArchive');
    @RARReadHeader         := GetProcAddress(IsRarLoaded, 'RARReadHeaderEx');
    @RARProcessFile        := GetProcAddress(IsRarLoaded, 'RARProcessFileW');
    @RARSetPassword        := GetProcAddress(IsRarLoaded, 'RARSetPassword');
  end;
end;

// Unloading Library
procedure UnLoadRarLibrary;
begin
  if IsRarLoaded <> 0 then begin
    FreeLibrary(IsRarLoaded);
    IsRarLoaded := 0;
    RAROpenArchive        := nil;
    RARCloseArchive       := nil;
    RARReadHeader         := nil;
    RARProcessFile        := nil;
    RARSetPassword        := nil;
  end;
end;

procedure LoadShell32Library;
begin
  if IsShell32Loaded <> 0 then exit;
  IsShell32Loaded := Tnt_LoadLibraryW('shell32.dll'); 
  if IsShell32Loaded <> 0 then
    @SHGetKnownFolderPath:= GetProcAddress(IsShell32Loaded, 'SHGetKnownFolderPath');
end;

procedure UnLoadShell32Library;
begin
  if IsShell32Loaded <> 0 then begin
    FreeLibrary(IsShell32Loaded);
    IsShell32Loaded := 0;
    SHGetKnownFolderPath:= nil;
  end;
end;


function GetShellPath(rfid:TGUID):WideString;
var PathBuf:PPWideChar; APIResult:HRESULT;
begin //http://msdn.microsoft.com/en-us/library/bb762188(VS.85).aspx
  Result:='';
  if IsShell32Loaded=0 then LoadShell32Library;
  if IsShell32Loaded=0 then exit;
  APIResult:=SHGetKnownFolderPath(@rfid,0,0,PathBuf);
  OleCheck(APIResult);
  Result:=PWideChar(PathBuf);
  CoTaskMemFree(PathBuf);
end;

procedure ClearTmpFiles(Directory:WideString);
var SR:TSearchRecW;
begin  
  if not WideDirectoryExists(Directory) then exit;
  Directory:=WideIncludeTrailingPathDelimiter(Directory);
  if WideFindFirst(Directory+'*.*',faAnyFile,SR)=0 then begin
    repeat
      if SR.Name[1]<>'.' then begin   // exclude . or .. Directory
        if (SR.Attr AND faDirectory)<>0 then
          ClearTmpFiles(Directory+SR.Name)
        else WideDeleteFile(Directory+SR.Name);
      end;
    until WideFindNext(SR)<>0;
    WideFindClose(SR);
  end;
  WideRemoveDir(Directory); 
end;

function AddRarMovies(ArcName,PW:widestring; Add:boolean):integer;
var hArcData:THandle; HeaderData:TRARHeaderData;
    OpenArchiveData:TRAROpenArchiveData;
    Entry:TPlaylistEntry; i,k:widestring;
    First:boolean;
begin
  Result:=0;
  FillChar(OpenArchiveData ,sizeof(OpenArchiveData),0);
  OpenArchiveData.ArcNameW := PWideChar(ArcName);
  OpenArchiveData.OpenMode := RAR_OM_LIST;
  hArcData := RAROpenArchive(OpenArchiveData);
  if (hArcData = 0) OR (OpenArchiveData.OpenResult <> 0) then begin
    RARCloseArchive(hArcData);
    Result:=-1; exit;
  end;
  TmpPW:=PW; First:=true; k:=WideExtractFileName(ArcName);
  if (OpenArchiveData.Flags and $00000080) = $00000080 then begin
    First:=false;
    if PW='' then WideInputQuery(LOCstr_SetPW_Caption,k,TmpPW);
    if TmpPW<>'' then RARSetPassword(hArcData,PAnsiChar(AnsiString(TmpPW)));
  end;
  FillChar(HeaderData ,sizeof(HeaderData),0);
  repeat
    if RARReadHeader(hArcData, HeaderData) <> 0 then Break;
    if First then begin
      First:=false;
      if ((HeaderData.Flags and $00000004) = $00000004) and (PW='') then
        WideInputQuery(LOCstr_SetPW_Caption,k,TmpPW);
      if TmpPW<>'' then RARSetPassword(hArcData,PAnsiChar(AnsiString(TmpPW)));
    end;
    if CheckInfo(MediaType,Tnt_WideLowerCase(WideExtractFileExt(HeaderData.FileNameW)))>ZipTypeCount then begin
      inc(Result);
      if Add then begin
        i:=HeaderData.FileNameW+' <-- '+k;
        if playlist.FindItem('.part',i)<0 then begin
          with Entry do begin
              State:=psNotPlayed;
              FullURL:=ArcName;
              if TmpPW='' then DisplayURL:=i else DisplayURL:=i+':'+TmpPW;
          end;
          playlist.Add(Entry);
        end;
      end
      else Break;
    end;
    if RARProcessFile(hArcData, RAR_SKIP, nil, nil)<>0 then break;
  until False;
  RARCloseArchive(hArcData);
end;

procedure ExtractRarMovie(ArcName,MovieName,PW:widestring);
var hArcData:THandle; First:boolean;
    HeaderData:TRARHeaderData; OpenArchiveData:TRAROpenArchiveData;
begin
  FillChar(OpenArchiveData ,sizeof(OpenArchiveData),0);
  OpenArchiveData.ArcNameW := PWideChar(ArcName);
  OpenArchiveData.OpenMode := RAR_OM_EXTRACT;
  hArcData := RAROpenArchive(OpenArchiveData);
  if (hArcData = 0) OR (OpenArchiveData.OpenResult <> 0) then begin
    RARCloseArchive(hArcData); exit;
  end;
  First:=true;
  if (OpenArchiveData.Flags and $00000080) = $00000080 then begin
    First:=false; RARSetPassword(hArcData,PAnsiChar(AnsiString(PW)));
  end;
  FillChar(HeaderData ,sizeof(HeaderData),0);
  repeat
    if RARReadHeader(hArcData,HeaderData) <> 0 then Break;
    if HeaderData.FileNameW=MovieName then begin
      if First and ((HeaderData.Flags and $00000004) = $00000004) then RARSetPassword(hArcData,PAnsiChar(AnsiString(PW)));
      RARProcessFile(hArcData, RAR_EXTRACT, nil, PWideChar(TempDir+'hcb428'+WideExtractFileExt(HeaderData.FileNameW)));
      Break;
    end
    else if RARProcessFile(hArcData, RAR_SKIP, nil, nil)<>0 then break;
  until False;
  RARCloseArchive(hArcData);
end;


procedure ExtractRarLyric(ArcName,PW:widestring; Mode:integer);
var hArcData:THandle; First:boolean; FName:widestring;
    HeaderData:TRARHeaderData; OpenArchiveData:TRAROpenArchiveData;
begin
  FillChar(OpenArchiveData ,sizeof(OpenArchiveData),0);
  OpenArchiveData.ArcNameW := PWideChar(ArcName);
  OpenArchiveData.OpenMode := RAR_OM_EXTRACT;
  hArcData := RAROpenArchive(OpenArchiveData);
  if (hArcData = 0) OR (OpenArchiveData.OpenResult <> 0) then begin
    RARCloseArchive(hArcData); exit;
  end;
  First:=true;
  if (OpenArchiveData.Flags and $00000080) = $00000080 then begin
    First:=false; RARSetPassword(hArcData,PAnsiChar(AnsiString(PW)));
  end;
  FillChar(HeaderData ,sizeof(HeaderData),0);
  if Mode>0 then FName:=Tnt_WideLowerCase(copy(ArcMovie,1,length(ArcMovie)-length(WideExtractFileExt(ArcMovie))))+'.lrc'
  else if Mode<0 then begin
    FName:=WideExtractFileName(MediaURL);
    FName:=Tnt_WideLowerCase(Copy(FName,1,length(FName)-length(WideExtractFileExt(MediaURL))))+'.lrc';
  end;
  repeat
    if RARReadHeader(hArcData,HeaderData) <> 0 then Break;
    if FName=Tnt_WideLowerCase(WideExtractFileName(HeaderData.FileNameW)) then begin
      if First and ((HeaderData.Flags and $00000004) = $00000004) then RARSetPassword(hArcData,PAnsiChar(AnsiString(PW)));
      if RARProcessFile(hArcData, RAR_EXTRACT, nil, PWideChar(TempDir+'hcb428.lrc'))<>0 then
        Break
      else begin
        LyricURL:=TempDir+'hcb428.lrc';
        Lyric.ParseLyric(LyricURL);
        if HaveLyric<>0 then Break;
      end;
    end
    else if RARProcessFile(hArcData, RAR_SKIP, nil, nil)<>0 then break;
  until False;
  RARCloseArchive(hArcData);
end;

function ExtractRarSub(ArcName,PW:widestring):widestring;
var i,j,HaveIdx,HaveSub:integer; FName,FExt:widestring;
    First:boolean; hArcData:THandle; HeaderData:TRARHeaderData;
    OpenArchiveData:TRAROpenArchiveData;
begin
  Result:=''; j:=0; TmpPW:=PW; First:=true;
  HaveIdx:=0; HaveSub:=0;
  FillChar(OpenArchiveData ,sizeof(OpenArchiveData),0);
  OpenArchiveData.ArcNameW := PWideChar(ArcName);
  {如果当前播放文档目录下有同名VOBSUB字幕或部分VOBSUB字幕就扫描同名RAR文档，
  检查是否含有VOBSUB字幕及VOBSUB字幕组成情况，以便决定是否解压RAR文档内的
  全部VOBSUB字幕或VOBSUB字幕的部分组件}
  if (DirHIdx+DirHSub)=1 then begin
    OpenArchiveData.OpenMode := RAR_OM_LIST;
    hArcData := RAROpenArchive(OpenArchiveData);
    if (hArcData = 0) OR (OpenArchiveData.OpenResult <> 0) then begin
      RARCloseArchive(hArcData); exit;
    end;
    if (OpenArchiveData.Flags and $00000080) = $00000080 then begin
      First:=false;
      if PW='' then WideInputQuery(LOCstr_SetPW_Caption,WideExtractFileName(ArcName),TmpPW);
      if TmpPW<>'' then RARSetPassword(hArcData,PAnsiChar(AnsiString(TmpPW)));
    end;
    FillChar(HeaderData ,sizeof(HeaderData),0);
    repeat
      if RARReadHeader(hArcData, HeaderData) <> 0 then Break;
      FExt:=Tnt_WideLowerCase(WideExtractFileExt(HeaderData.FileNameW));
      if FExt='.idx' then HaveIdx:=1;
      if FExt='.sub' then HaveSub:=1;
      if HaveIdx+HaveSub=2 then Break;
      if RARProcessFile(hArcData, RAR_SKIP, nil, nil)<>0 then break;
    until False;
    if RARCloseArchive(hArcData)<>0 then exit;
    if HaveIdx+HaveSub=0 then exit;
  end;
  //开始解压RAR文档
  OpenArchiveData.OpenMode := RAR_OM_EXTRACT;
  hArcData := RAROpenArchive(OpenArchiveData);
  if (hArcData = 0) OR (OpenArchiveData.OpenResult <> 0) then begin
    RARCloseArchive(hArcData); exit;
  end;
  if First then begin
    if (OpenArchiveData.Flags and $00000080) = $00000080 then begin
      First:=false;
      if PW='' then WideInputQuery(LOCstr_SetPW_Caption,WideExtractFileName(ArcName),TmpPW);
      if TmpPW<>'' then RARSetPassword(hArcData,PAnsiChar(AnsiString(TmpPW)));
    end;
  end;
  FillChar(HeaderData ,sizeof(HeaderData),0);
  repeat
    if RARReadHeader(hArcData, HeaderData) <> 0 then Break;
    if First then begin
      First:=false;
      if ((HeaderData.Flags and $00000004) = $00000004) and (PW='') then
        WideInputQuery(LOCstr_SetPW_Caption,WideExtractFileName(ArcName),TmpPW);
      if TmpPW<>'' then RARSetPassword(hArcData,PAnsiChar(AnsiString(TmpPW)));
    end;
    FExt:=Tnt_WideLowerCase(WideExtractFileExt(HeaderData.FileNameW));
    i:=CheckInfo(SubType,FExt);
    if i<=ZipTypeCount then begin
      if RARProcessFile(hArcData, RAR_SKIP, nil, nil)<>0 then break;
    end
    else begin
      if i<SubTypeCount-1 then begin
        FName:=TempDir+HeaderData.FileName;
        if RARProcessFile(hArcData, RAR_EXTRACT, nil, PWideChar(FName))<>0 then
          Break
        else begin
          if (not IsWideStringMappableToAnsi(FName)) or (pos(',',FName)>0) then FName:=WideExtractShortPathName(FName);
          if Firstrun or (not Win32PlatformIsUnicode) then begin
            Loadsub:=2; Loadsrt:=2;
            AddChain(j,substring,EscapePath(EscapeParam(FName)));
          end
          else 
            SendCommand('sub_load '+EscapePath(EscapeParam(FName)));
        end;
      end
      else begin
        if (DirHIdx+DirHSub=0) OR (HaveIdx+HaveSub=2) then begin
          FName:=WideExtractFileName(MediaURL);
          FName:=TempDir+copy(FName,1,length(FName)-length(WideExtractFileExt(MediaURL)));
          if RARProcessFile(hArcData, RAR_EXTRACT, nil, PWideChar(FName+FExt))<>0 then
            Break
          else
            Result:=FName;
        end
        else begin
          if ((HaveIdx+DirHSub=2) and (FExt='.idx')) OR
             ((DirHIdx+HaveSub=2) and (FExt='.sub')) then begin
            FName:=copy(MediaURL,1,length(MediaURL)-length(WideExtractFileExt(MediaURL)));
            if RARProcessFile(hArcData, RAR_EXTRACT, nil, PWideChar(FName+FExt))<>0 then
              Break
            else
              Result:=FName;
          end
          else if RARProcessFile(hArcData, RAR_SKIP, nil, nil)<>0 then break;
        end;
      end;
    end;
  until False;
  RARCloseArchive(hArcData); 
  if (not Win32PlatformIsUnicode) and (j>0) then Restart;
end;

end.





{// Delphi interface unit for UnRAR.dll
// Translated from unrar.h
// Use Delphi 2.0 and higher to compile this module
//
// Ported to Delphi by Eugene Kotlyarov, fidonet: 2:5058/26.9 ek@oris.ru
// Fixed version by Alexey Torgashin <alextp@mail.ru>, 2:5020/604.24@fidonet
//
// Revisions:
// Aug 2001 - changed call convention for TChangeVolProc and TProcessDataProc
//          - added RARGetDllVersion function, see comment below
//
// Jan 2002 - Added RARSetCallback  // eugene
//
// Oct 2002 - Added RARHeaderDataEx, RAROpenArchiveDataEx // eugene
// 静态载入UnRAR.dll，如果找不到UnRAR.dll,程序将报错并无法启动

unit UnRAR;

interface

uses Windows,SysUtils,core;

const
  RAR_OM_LIST         =  0;
  RAR_OM_EXTRACT      =  1;
  RAR_SKIP            =  0;
  RAR_EXTRACT         =  2;

type
  RARHeaderData = packed record
    ArcName: packed array[0..Pred(260)] of Char;
    FileName: packed array[0..Pred(260)] of Char;
    Flags: UINT;
    PackSize: UINT;
    UnpSize: UINT;
    HostOS: UINT;
    FileCRC: UINT;
    FileTime: UINT;
    UnpVer: UINT;
    Method: UINT;
    FileAttr: UINT;
    CmtBuf: PChar;
    CmtBufSize: UINT;
    CmtSize: UINT;
    CmtState: UINT;
  end;

  RAROpenArchiveData = packed record
    ArcName: PChar;
    OpenMode: UINT;
    OpenResult: UINT;
    CmtBuf: PChar;
    CmtBufSize: UINT;
    CmtSize: UINT;
    CmtState: UINT;
  end;

function RAROpenArchive(var ArchiveData: RAROpenArchiveData): THandle;
  stdcall; external 'unrar.dll';
function RARCloseArchive(hArcData: THandle): Integer;
  stdcall; external 'unrar.dll';
function RARReadHeader(hArcData: THandle; var HeaderData: RARHeaderData): Integer;
  stdcall; external 'unrar.dll';
function RARProcessFile(hArcData: THandle; Operation: Integer; DestPath, DestName: PChar): Integer;
  stdcall; external 'unrar.dll';
function ExtractArchive(ArcName: PChar):string;

implementation

function ExtractArchive(ArcName: PChar):string;
var hArcData: THandle; FExt,FName: string;
  HeaderData: RARHeaderData; Haveidx,Havesub:boolean;
  OpenArchiveData: RAROpenArchiveData;
begin
  Result:='';
  OpenArchiveData.ArcName := ArcName;
  OpenArchiveData.OpenMode := RAR_OM_EXTRACT;
  hArcData := RAROpenArchive(OpenArchiveData);
  if (OpenArchiveData.OpenResult <> 0) then Exit;
  HeaderData.CmtBuf := nil;
  repeat
    if RARReadHeader(hArcData, HeaderData) <> 0 then Break;
    FExt:=LowerCase(ExtractFileExt(HeaderData.FileName));
    if (FExt='.idx') or (FExt='.sub') then begin
      FName:=ExtractFileName(MediaURL);
      FName:=TempDir+copy(FName,1,length(FName)-length(ExtractFileExt(MediaURL)));
      if RARProcessFile(hArcData, RAR_EXTRACT, nil, PChar(FName+FExt))<>0 then Break
      else Result:=FName;
    end
    else RARProcessFile(hArcData, RAR_SKIP, nil, nil);
  until False;
  RARCloseArchive(hArcData);
end;

end.

}
