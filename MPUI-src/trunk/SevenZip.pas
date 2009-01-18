// Delphi interface to 7-zip32.dll
// Written by Dominic Dum閑 (dominic@psas.co.za)
// Purpose: to create and extract files in the 7-zip format (www.7-zip.org)

// 7-zip32.dll written by Akky. Download it here:
// http://akky.cjb.net/download/7-zip32.html

// NB: I don't understand Japanese (no english docs are available for the dll)
// so I don't understand the purpose of all of the functions available,
// such as Set/GetCursorInterval, Cursormode etc...

// If anyone out there can provide more info on all the functions in the dll
// please let me know... :)

//-----------------------------------------------------------------------------
// HOW TO USE IT:
// Your program first needs to call LoadSevenZipDLL before any of the functions
// will work. Call UnloadSevenZipDLL when your program terminates...
// Obviously 7-zip32.dll file must be available to program (such as in the
// app's exe folder).

// Use SevenZipCreateArchive, SevenZipExtractArchive function to easily create
// and extract 7z files (with optional callback function)

// If you know what you're doing use SevenZipCommand function (works just like
// command line version of 7-zip). See 7-zip docs for command syntax.

// To get contents of archive file use SevenZipOpenArchive, SevenZipFindFirst,
// SevenZipFindNext and SevenZipCloseArchive (works like FindFirst, FindNext) 

//-----------------------------------------------------------------------------
// Revision history:
// v1.00 17 June 2005 - First release
// If you find any bugs or add any features please let me know

// v1.01 1 September 2005
// new feature:
//  --> Add parameter Password in SevenZipCreateArchive and SevenZipExtractArchive function
//      by J閠er Rabelo Ferreira (jeter.rabelo@jerasoft.com.br)

// --> Added BaseDirectory parameter to SevenZipCreateArchive for easier handling of
//     relative paths (note that absolute paths ARE NOT supported by the DLL) [Dominic Dum閑]

unit SevenZip;

interface
uses classes, sysutils, TntSysUtils,  windows, TntWindows, TntDialogs, SevenZipVCL;

const
  // codes returned by SevenZipCreateArchive and SevenZipExtractArchive
  SZ_OK = 0;
  SZ_ERROR = 1;
  SZ_CANCELLED = 2;
  SZ_DLLERROR = 3;
  FNAME_MAX32	= 512;

  FA_ENCRYPTED = $40;

type

  HARC = integer;

  TZipEXTRACTINGINFO = record
    dwFileSize          : DWORD;
    dwWriteSize         : DWORD;
    szSourceFileName    : array[ 0..FNAME_MAX32 ] of char;
    dummy1              : array[ 0..2 ] of char;
    szDestFileName      : array[ 0..FNAME_MAX32 ] of char;
    dummy               : array[ 0..2 ] of char;
  end;

  TZipEXTRACTINGINFOEX = record
    exinfo           : TZipEXTRACTINGINFO;
    dwCompressedSize : DWORD;
    dwCRC            : DWORD;
    uOSType          : UINT;
    wRatio           : WORD;
    wDate            : WORD;
    wTime            : WORD;
    szAttribute      : array[ 0..7 ] of char;
    szMode           : array[ 0..7 ] of char;
  end;

  TZipINDIVIDUALINFO = record
    dwOriginalSize   : DWORD;
	  dwCompressedSize : DWORD;
	  dwCRC            : DWORD;
    uFlag            : UINT;
		uOSType          : UINT;
    wRatio           : WORD;
    wDate            : WORD;
    wTime            : WORD;
    szFilename       : array[ 0..FNAME_MAX32 ] of char;
    dummy1           : array[ 0..2 ] of char;
    szAttribute      : array[ 0..7 ] of char;
    szMode           : array[ 0..7 ] of char;
  end;

  TZipCommand                = function (const hWnd: HWND; szCmdLine: PChar; szOutput: PChar; dwSize: DWORD): Integer; stdcall;
	TZipGetRunning             = function : BOOL; stdcall;
  TZipCheckArchive           = function( szFilename : PChar; iMode : integer ) : BOOL; stdcall;
	TZipOpenArchive            = function( hwnd : HWND; szFileName : PChar; dwMode : DWORD ) : HARC; stdcall;
	TZipCloseArchive           = function( harc : HARC ) : integer; stdcall;
	TZipFindFirst              = function( harc : HARC; szFilename : PChar; var lpSubInfo : TZipINDIVIDUALINFO ) : integer; stdcall;
	TZipFindNext               = function( harc : HARC; var lpSubInfo : TZipINDIVIDUALINFO ) : integer; stdcall;
  TZipGetAttribute           = function( harc : HARC ) : integer; stdcall;
  // Callback func should return FALSE to cancel the archiving process, else TRUE
  TZipCallbackProc           = function( hWnd : HWND; uMsg, nState : UINT; var ExInfo : TZipEXTRACTINGINFOEX ) : BOOL; stdcall;

  TZipSetOwnerWindow         = function( hwnd : HWND ) : BOOL; stdcall;
	TZipClearOwnerWindow       = function : BOOL; stdcall;
  TZipSetOwnerWindowEx       = function( hwnd : HWND; CallbackProc : TZipCallbackProc ) : BOOL; stdcall;
	TZipKillOwnerWindowEx      = function( hwnd : HWND ) : BOOL; stdcall;
	TZipSetUnicodeMode         = function( bUnicode : BOOL ) : BOOL; stdcall;

procedure LoadZipLibrary;
procedure UnLoadZipLibrary;
procedure Load7zLibrary;
procedure UnLoad7zLibrary;
procedure Extract7zLyric(ArcName,PW:WideString; Mode:integer);
procedure ExtractZipLyric(ArcName,PW:WideString; Mode:integer);
function Extract7zSub(ArcName,PW:WideString):WideString;
function ExtractZipSub(ArcName,PW:WideString):WideString;
function Add7zMovies(ArcName,PW:WideString; Add:boolean):integer;
function AddZipMovies(ArcName,PW:WideString; Add:boolean):integer;
procedure Extract7zMovie(ArcName,MovieName,PW:WideString);
procedure ExtractZipMovie(ArcName,MovieName,PW:WideString);

// NB: add '-hide' to command line switches if you want the CallBack function to be called
// (set up via SevenZipSetOwnerWindowEx).
// otherwise the DLL uses it's own internal progress dialog
function ZipCommand( hWnd : HWND;                     // parent window
                     CommandLine : string;            // 7zip command line (see 7zip docs)
                     var CommandOutput : string;      // returns 7zip output
                     MaxCommandOutputLen : integer = 32768 ) : integer;

// simplified func to extract archive
function ZipExtractArchive( hWnd : HWND; // parent window handle
                            ArchiveFilename : string;
                            FileList : string; // comma separated files to be extracted (wildcards ok)
                            RecurseFolders : Boolean;
                            Password: String; // '' Nothing happens
                            ExtractFullPaths : Boolean;
                            ExtractBaseDir : string;
                            ShowProgress   : Boolean;     // if true uses dll's internal progress indicator (callback func ignored)
                            Callback       : TZipCallbackProc = nil ) // optional callback (ShowProgress must be false)
                            : integer; // 0 = success

var
  IsZipLoaded: THandle =0; F7zaLibh: THandle = 0;
  Is7zLoaded: integer =0;
  _ZipCommand              : TZipCommand              = nil;
  ZipGetRunning            : TZipGetRunning           = nil;
  ZipCheckArchive          : TZipCheckArchive         = nil;
  ZipOpenArchive           : TZipOpenArchive          = nil;
  ZipCloseArchive          : TZipCloseArchive         = nil;
  ZipFindFirst             : TZipFindFirst            = nil;
  ZipFindNext              : TZipFindNext             = nil;
  ZipGetAttribute          : TZipGetAttribute         = nil;
  ZipSetOwnerWindow        : TZipSetOwnerWindow       = nil;
  ZipClearOwnerWindow      : TZipClearOwnerWindow     = nil;
  ZipSetOwnerWindowEx      : TZipSetOwnerWindowEx     = nil;
  ZipKillOwnerWindowEx     : TZipKillOwnerWindowEx    = nil;
  ZipSetUnicodeMode        : TZipSetUnicodeMode       = nil;

implementation
uses main, core, plist, locale;

procedure Load7zLibrary;
var i:integer;
begin
  if F7zaLibh<>0 then exit;
  for i:=szdllCount downto 0 do begin
    F7zaLibh := Tnt_LoadLibraryW(PWideChar(szdll[i]) );
    if F7zaLibh <> 0 then begin
      Is7zLoaded:=i+1;
      break;
    end;
  end;
end;

procedure UnLoad7zLibrary;
begin
  if F7zaLibh <> 0 then begin
    FreeLibrary( F7zaLibh );
    Is7zLoaded:=0;
  end;
end;

procedure LoadZipLibrary;
begin
  if IsZipLoaded<>0 then exit;
  IsZipLoaded:=Tnt_LoadLibraryW('7-zip32.dll');
  if IsZipLoaded<>0 then begin
    _ZipCommand             := GetProcAddress( IsZipLoaded, 'SevenZip' );
    ZipGetRunning           := GetProcAddress( IsZipLoaded, 'SevenZipGetRunning' );
    ZipCheckArchive         := GetProcAddress( IsZipLoaded, 'SevenZipCheckArchive' );
    ZipOpenArchive          := GetProcAddress( IsZipLoaded, 'SevenZipOpenArchive' );
    ZipCloseArchive         := GetProcAddress( IsZipLoaded, 'SevenZipCloseArchive' );
    ZipFindFirst            := GetProcAddress( IsZipLoaded, 'SevenZipFindFirst' );
    ZipFindNext             := GetProcAddress( IsZipLoaded, 'SevenZipFindNext' );
    ZipGetAttribute         := GetProcAddress( IsZipLoaded, 'SevenZipGetAttribute' );
    ZipSetOwnerWindow       := GetProcAddress( IsZipLoaded, 'SevenZipSetOwnerWindow' );
    ZipClearOwnerWindow     := GetProcAddress( IsZipLoaded, 'SevenZipClearOwnerWindow' );
    ZipSetOwnerWindowEx     := GetProcAddress( IsZipLoaded, 'SevenZipSetOwnerWindowEx' );
    ZipKillOwnerWindowEx    := GetProcAddress( IsZipLoaded, 'SevenZipKillOwnerWindowEx' );
    ZipSetUnicodeMode       := GetProcAddress( IsZipLoaded, 'SevenZipSetUnicodeMode' );
  end;
end;

procedure UnLoadZipLibrary;
begin
  if IsZipLoaded<>0 then begin
    FreeLibrary(IsZipLoaded);
    IsZipLoaded:=0;
  end;
end;

function ZipCommand(hWnd:HWND; CommandLine:string; var CommandOutput:string; MaxCommandOutputLen:integer=32768):integer;
begin
  SetLength(CommandOutput,MaxCommandOutputLen);
  Result:=_ZipCommand(hWnd,PChar(CommandLine),PChar(CommandOutput),MaxCommandOutputLen-1);
  CommandOutput:=string(PChar(CommandOutput));
end;

function ZipExtractArchive( hWnd : HWND; // parent window handle
                            ArchiveFilename : string;
                            FileList : string; // comma separated files to be extracted (wildcards ok)
                            RecurseFolders : Boolean;
                            Password: String; // '' Nothing happens
                            ExtractFullPaths : Boolean;
                            ExtractBaseDir : string;
                            ShowProgress   : Boolean;     // if true uses dll's internal progress indicator (callback func ignored)
                            Callback       : TZipCallbackProc = nil ) // optional callback (ShowProgress must be false)
                            : integer; // 0 = success

var S7ResultOutput,s7cmd:string;
begin
  if @Callback<>nil then ShowProgress:=false;
  if FileList='' then FileList:='*.*';

  try
    if ExtractFullPaths then s7cmd := 'x' else s7cmd := 'e';
    s7cmd:=s7cmd+' "'+ArchiveFilename+'" -o"'+ExtractBaseDir+'" "'+FileList+'"';
    if RecurseFolders then s7cmd:=s7cmd+' -r';
    if Password<>'' then s7Cmd:=s7Cmd+' -p'+Password;
    if not ShowProgress then s7cmd := s7cmd + ' -hide';
    s7cmd:=s7cmd+' -y'; // yes on all queries (will overwrite)

    try
      ZipSetOwnerWindowEx(hwnd,Callback );
      ZipCommand(hWnd,s7cmd,s7ResultOutput );
      ZipSetOwnerWindowEx(hwnd,nil);
      S7ResultOutput:=string(PChar(S7ResultOutput));
      if Pos('operation aborted',Lowercase(S7ResultOutput))>0 then
        Result:=SZ_CANCELLED
      else if Pos('error:',LowerCase(S7ResultOutput))>0 then
        Result:=SZ_ERROR
      else
        Result:=SZ_OK;
    except on e:exception do
        Result:=SZ_DLLERROR;
    end;
    finally
    end;
end;

function AddZipMovies(ArcName,PW:widestring; Add:boolean):integer;
var hArc:integer; fileInfo:TZipINDIVIDUALINFO; k,i:widestring;
    Entry:TPlaylistEntry; First:boolean;
begin
  Result:=0;
  if ZipGetRunning then begin
    Result:=-1; exit;
  end
  else begin
    ZipSetUnicodeMode(true);
    hArc:=ZipOpenArchive(0,PChar(UTF8Encode(ArcName)),0);
    if hArc=0 then begin Result:=-1; exit; end;
    if ZipFindFirst(hArc,'*',fileInfo)=0 then begin
      k:=WideExtractFileName(ArcName); TmpPW:=PW; First:=true;
      repeat
        if CheckInfo(MediaType,Tnt_WideLowerCase(WideExtractFileExt(UTF8Decode(fileInfo.szFilename))))>ZipTypeCount then begin
          inc(Result);
          if First then begin
            First:=false; //fileinfo.szAttribute[4]='G' 而不是'-'或#0时，文件是加密的
            if ((ZipGetAttribute(hArc) and FA_ENCRYPTED)=FA_ENCRYPTED) and (PW='') then
              WideInputQuery(LOCstr_SetPW_Caption,k,TmpPW);
          end;

          if Add then begin
            i:=UTF8Decode(fileInfo.szFilename)+' <-- '+k;
            if playlist.FindItem('',i)<0 then begin
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
      until ZipFindNext(hArc,fileInfo)<>0;
    end;
    ZipCloseArchive(hArc);
  end;
end;

function Add7zMovies(ArcName,PW:widestring; Add:boolean):integer;
var k,i:widestring; Entry:TPlaylistEntry; x,z:integer; sz:TSevenZip;
begin
  Result:=0; sz:=TSevenZip.Create(nil,Tnt_WideLowerCase(WideExtractFileExt(ArcName)));
  sz.Password:=PW; sz.SZFileName:=ArcName;
  x:=sz.List;
  if sz.Password<>'' then TmpPW:=sz.Password;
  if x=-1 then begin Result:=x; sz.Free; exit; end;
  k:=WideExtractFileName(ArcName);
  for z:=0 to x-1 do begin
    if CheckInfo(MediaType,Tnt_WideLowerCase(WideExtractFileExt(sz.Files.wstrings[z])))>ZipTypeCount then begin
      inc(Result);
      if Add then begin
        i:=sz.Files.wstrings[z]+' <-- '+k;
        if playlist.FindItem('',i)<0 then begin
          with Entry do begin
            State:=psNotPlayed;
            FullURL:=ArcName;
            if TmpPW='' then DisplayURL:=i else DisplayURL:=i+':'+sz.Password;
          end;
          playlist.Add(Entry);
        end;
      end
      else Break;
    end;
  end;
  sz.Free;
end;

procedure ExtractZipMovie(ArcName,MovieName,PW:widestring);
begin       
  ZipSetUnicodeMode(true);
  ZipExtractArchive(0,UTF8Encode(ArcName),UTF8Encode(MovieName),false,UTF8Encode(PW),true,TempDir,false,nil);
end;

procedure Extract7zMovie(ArcName,MovieName,PW:widestring);
var sz:TSevenZip;
begin       
  sz:=TSevenZip.Create(nil,Tnt_WideLowerCase(WideExtractFileExt(ArcName)));
  sz.Password:=PW; sz.SZFileName:=ArcName;
  sz.ExtrBaseDir:=TempDir;
  sz.Files.Clear;
  sz.Files.AddString(MovieName);
  sz.ExtractOptions:=sz.ExtractOptions + [ExtractNoPath];
  sz.Extract;
  sz.Free;
end;

procedure ExtractZipLyric(ArcName,PW:widestring; Mode:integer);
var hArc:integer; FName:WideString; fileInfo:TZipINDIVIDUALINFO;
    UArcName:UTF8String;
begin
  if ZipGetRunning then exit
  else begin
    ZipSetUnicodeMode(true);
    UArcName:=UTF8Encode(ArcName);
    hArc:=ZipOpenArchive(0,PChar(UArcName),0);
    if hArc=0 then exit;
    if ZipFindFirst(hArc,'*',fileInfo)=0 then begin
      if Mode>0 then FName:=Tnt_WideLowerCase(copy(ArcMovie,1,length(ArcMovie)-length(WideExtractFileExt(ArcMovie))))+'.lrc'
      else if Mode<0 then begin
        FName:=WideExtractFileName(MediaURL);
        FName:=Tnt_WideLowerCase(Copy(FName,1,length(FName)-length(WideExtractFileExt(MediaURL))))+'.lrc';
      end;
      repeat
        if FName=Tnt_WideLowerCase(WideExtractFileName(UTF8Decode(fileInfo.szFilename))) then begin
          if ZipExtractArchive(0,UArcName,fileInfo.szFilename,false,UTF8Encode(PW),true,TempDir,false,nil)<>0 then
            Break
          else begin
            LyricURL:=TempDir+UTF8Decode(fileInfo.szFilename);
            Lyric.ParseLyric(LyricURL);
            if HaveLyric<>0 then Break; 
          end;
        end;
      until ZipFindNext(hArc,fileInfo)<>0;
      ZipCloseArchive(hArc);
    end;
  end;
end;

procedure Extract7zLyric(ArcName,PW:widestring; Mode:integer);
var FName:WideString; x,z:integer; sz:TSevenZip; Flist:TWideStringList_;
begin
  sz:=TSevenZip.Create(nil,Tnt_WideLowerCase(WideExtractFileExt(ArcName)));
  sz.Password:=PW; sz.SZFileName:=ArcName;
  sz.ExtrBaseDir:=TempDir;
  sz.ExtractOptions:=sz.ExtractOptions+[ExtractNoPath];
  x:=sz.List;
  if x<1 then begin sz.Free; exit; end;
  Flist:=TWideStringList_.Create;
  Flist.WStrings:=sz.Files.wstrings;
  if Mode>0 then FName:=Tnt_WideLowerCase(copy(ArcMovie,1,length(ArcMovie)-length(WideExtractFileExt(ArcMovie))))+'.lrc'
  else if Mode<0 then begin
    FName:=WideExtractFileName(MediaURL);
    FName:=Tnt_WideLowerCase(Copy(FName,1,length(FName)-length(WideExtractFileExt(MediaURL))))+'.lrc';
  end;
  for z:=0 to x-1 do begin
    if Tnt_WideLowerCase(WideExtractFileName(Flist.wstrings[z]))=FName then begin
      sz.Files.Clear;
      sz.Files.AddString(Flist.wstrings[z]);
      if sz.Extract<>0 then Break
      else begin
        LyricURL:=TempDir+'hcb428.lrc';
        Lyric.ParseLyric(LyricURL);
        if HaveLyric<>0 then break;
      end;
    end;
  end;
  sz.Free;
  Flist.Clear;
  Flist.Free;
end;

function ExtractZipSub(ArcName,PW:widestring):WideString;
var i,j,HaveIdx,HaveSub:integer; FExt,FName:string;
    hArc:integer; UArcName:UTF8String; First:boolean;
    fileInfo:TZipINDIVIDUALINFO;
begin
  Result:=''; HaveIdx:=0; HaveSub:=0;
  ZipSetUnicodeMode(true);
  UArcName:=UTF8Encode(ArcName);
  {如果当前播放文档目录下有同名VOBSUB字幕或部分VOBSUB字幕就扫描同名RAR文档，
  检查是否含有VOBSUB字幕及VOBSUB字幕组成情况，以便决定是否解压RAR文档内的
  全部VOBSUB字幕或VOBSUB字幕的部分组件}
  if (DirHIdx+DirHSub)=1 then begin
    if ZipGetRunning then exit
    else begin
      hArc:=ZipOpenArchive(0,PChar(UArcName),0);
      if hArc=0 then exit;
      if ZipFindFirst(hArc,'*',fileInfo)=0 then begin
        repeat
          FExt:=Tnt_WideLowerCase(WideExtractFileExt(UTF8Decode(fileInfo.szFilename)));
          if FExt='.idx' then HaveIdx:=1;
          if FExt='.sub' then HaveSub:=1;
          if HaveIdx+HaveSub=2 then Break;
        until ZipFindNext(hArc,fileInfo)<>0;
      end;
      if ZipCloseArchive(hArc)<>0 then exit;
      if HaveIdx+HaveSub=0 then exit;
    end;
  end;
  //开始解压RAR文档
  if ZipGetRunning then exit
  else begin
    hArc:=ZipOpenArchive(0,PChar(UArcName),0);
    if hArc=0 then exit;  j:=0; TmpPW:=PW; First:=true;
    if ZipFindFirst(hArc,'*',fileInfo)=0 then begin
      repeat
        if First then begin
          First:=false;
          if ((ZipGetAttribute(hArc) and FA_ENCRYPTED)=FA_ENCRYPTED) and (PW='') then
            WideInputQuery(LOCstr_SetPW_Caption,ExtractFileName(ArcName),TmpPW);
        end;
        FExt:=Tnt_WideLowerCase(WideExtractFileExt(UTF8Decode(fileInfo.szFilename)));
        i:=CheckInfo(SubType,FExt);
        if i>ZipTypeCount then begin
          if i<SubTypeCount-1 then begin
            FName:=TempDir+UTF8Decode(fileInfo.szFilename);
            if ZipExtractArchive(0,UArcName,fileInfo.szFilename,false,UTF8Encode(PW),true,TempDir,false,nil)<>0 then
              Break
            else begin
              if (not IsWideStringMappableToAnsi(FName)) or (pos(',',FName)>0) then FName:=WideExtractShortPathName(FName);
              if Firstrun or (not Win32PlatformIsUnicode) then begin
                Loadsub:=2; Loadsrt:=2;
                AddChain(j,substring,EscapePath(EscapeParam(FName)));
              end
              else begin
                MainForm.Unpaused;
                SendCommand('sub_load '+EscapePath(EscapeParam(FName)));
              end
            end;
          end
          else begin
            if (DirHIdx+DirHSub=0) OR (HaveIdx+HaveSub=2) then begin
              FName:=WideExtractFileName(MediaURL);
              FName:=TempDir+copy(FName,1,length(FName)-length(WideExtractFileExt(MediaURL)));
              if ZipExtractArchive(0,UArcName,fileInfo.szFilename,false,UTF8Encode(PW),true,TempDir,false,nil)<>0 then
                Break
              else begin
                if WideCopyFile(TempDir+UTF8Decode(fileInfo.szFilename),FName+FExt,false) then
                  Result:=FName
                else Result:=TempDir+WideExtractFileName(UTF8Decode(fileInfo.szFilename));
              end;
            end
            else begin
              if ((HaveIdx+DirHSub=2) and (FExt='.idx')) OR
                 ((DirHIdx+HaveSub=2) and (FExt='.sub')) then begin
                FName:=copy(MediaURL,1,length(MediaURL)-length(WideExtractFileExt(MediaURL)));
                if ZipExtractArchive(0,UArcName,fileInfo.szFilename,false,UTF8Encode(PW),true,TempDir,false,nil)<>0 then
                  Break
                else begin
                  if WideCopyFile(TempDir+UTF8Decode(fileInfo.szFilename),FName+FExt,false) then
                    Result:=FName
                  else Result:=TempDir+WideExtractFileName(UTF8Decode(fileInfo.szFilename));
                end;
              end;
            end;
          end;
        end;
      until ZipFindNext(hArc,fileInfo)<>0;
    end;
    ZipCloseArchive(hArc);
    if (not Win32PlatformIsUnicode) and (j>0) then Restart;
  end;
end;

function Extract7zSub(ArcName,PW:widestring):WideString;
var i,j,z,x,HaveIdx,HaveSub:integer; FExt,FName:WideString;
    sz:TsevenZip; Flist:TWideStringList_;
begin
  Result:=''; HaveIdx:=0; HaveSub:=0;
  sz:=TSevenZip.Create(nil,Tnt_WideLowerCase(WideExtractFileExt(ArcName)));
  sz.Password:=PW; sz.SZFileName:=ArcName;
  sz.ExtrBaseDir:=TempDir;
  x:=sz.List;
  if sz.Password<>'' then TmpPW:=sz.Password;
  if x<1 then begin sz.Free; exit; end;
  (*如果当前播放文档目录下有同名VOBSUB字幕或部分VOBSUB字幕就扫描同名RAR文档，
  检查是否含有VOBSUB字幕及VOBSUB字幕组成情况，以便决定是否解压RAR文档内的
  全部VOBSUB字幕或VOBSUB字幕的部分组件*)
  if (DirHIdx+DirHSub)=1 then begin
    for z:=0 to x-1 do begin
      FExt:=Tnt_WideLowerCase(WideExtractFileExt(sz.Files.wstrings[z]));
      if FExt='.idx' then HaveIdx:=1;
      if FExt='.sub' then HaveSub:=1;
      if HaveIdx+HaveSub=2 then Break;
    end;
    if HaveIdx+HaveSub=0 then begin
      sz.Free; exit;
    end;
  end;
  //开始解压RAR文档
  Flist:=TWideStringList_.Create;
  Flist.WStrings:=sz.Files.wstrings;
  j:=0;
  for z:=0 to x-1 do begin
    FExt:=Tnt_WideLowerCase(WideExtractFileExt(Flist.wstrings[z]));
    i:=CheckInfo(SubType,FExt);
    if i>ZipTypeCount then begin
      if i<SubTypeCount-1 then begin
        sz.Files.Clear;
        sz.Files.AddString(Flist.wstrings[z]);
        sz.ExtractOptions:=sz.ExtractOptions-[ExtractNoPath];
        FName:=TempDir+Flist.wstrings[z];
        if sz.Extract<>0 then Break
        else begin
          if (not IsWideStringMappableToAnsi(FName)) or (pos(',',FName)>0) then FName:=WideExtractShortPathName(FName);
          if Firstrun or (not Win32PlatformIsUnicode) then begin
            Loadsub:=2; Loadsrt:=2;
            AddChain(j,substring,EscapePath(EscapeParam(FName)));
          end
          else begin
            MainForm.Unpaused;
            SendCommand('sub_load '+EscapePath(EscapeParam(FName)));
          end;
        end;
      end
      else begin
        if (DirHIdx+DirHSub=0) OR (HaveIdx+HaveSub=2) then begin
          sz.Files.Clear;
          sz.Files.AddString(Flist.wstrings[z]);
          sz.ExtractOptions:=sz.ExtractOptions+[ExtractNoPath];
          if sz.Extract<>0 then Break
          else Result:=TempDir+'hcb428';
        end
        else begin
          if ((HaveIdx+DirHSub=2) and (FExt='.idx')) OR
             ((DirHIdx+HaveSub=2) and (FExt='.sub')) then begin
            FName:=copy(MediaURL,1,length(MediaURL)-length(WideExtractFileExt(MediaURL)));
            sz.Files.Clear;
            sz.Files.AddString(Flist.wstrings[z]);
            sz.ExtractOptions:=sz.ExtractOptions+[ExtractNoPath];
            if sz.Extract<>0 then Break
            else begin
              if WideCopyFile(TempDir+Flist.wstrings[z],FName+FExt,false) then
                Result:=FName
              else Result:=TempDir+WideExtractFileName(Flist.wstrings[z]);
            end;
          end;
        end;
      end;
    end;
  end;
  sz.Free;
  Flist.Clear;
  Flist.Free;
  if (not Win32PlatformIsUnicode) and (j>0) then Restart;
end; 

end.
