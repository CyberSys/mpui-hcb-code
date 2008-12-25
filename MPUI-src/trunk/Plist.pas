{   MPUI, an MPlayer frontend for Windows
    Copyright (C) 2005 Martin J. Fiedler <martin.fiedler@gmx.net>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}
unit Plist;

interface
{$WARN SYMBOL_PLATFORM OFF}

uses
  Windows, Messages, SysUtils, TntSysUtils, Variants, Graphics, TntGraphics,
  Forms, TntForms, StdCtrls, TntStdCtrls,  Controls, ShellAPI,
  Dialogs, TntDialogs, Buttons, TntButtons, Menus, TntMenus,
  ComCtrls, TntComCtrls, Classes, TntClasses, TntSystem, ExtCtrls,
  TntExtCtrls,TntFileCtrl;

type TPlaybackState=(psNotPlayed,psPlaying,psPlayed,psSkipped);
     TPlaylistEntry=record
                      State:TPlaybackState;
                      Selected:boolean;
                      FullURL:widestring;
                      DisplayURL:widestring;
                    end;
     TLyricTimeCodeEntry=record
                      timecode,LyricEntry:integer;
                    end;

type TPlaylist=class
               private
                 Data:array of TPlaylistEntry;
                 function GetCount:integer;
                 function GetItem(Index:integer):TPlaylistEntry;
                 function GetSelected(Index:integer):boolean;
                 procedure SetSelected(Index:integer; Value:boolean);
               public
                 procedure Clear;
                 procedure Add(const Entry:TPlaylistEntry);
                 procedure AddFiles(const URL:widestring);
                 function AddM3U(const FileName:WideString; FileExtIndex:integer):boolean;
                 procedure AddDirectory(Directory:WideString);
                 property Count:integer read GetCount;
                 property Items[Index:integer]:TPlaylistEntry read GetItem; default;
                 property Selected[Index:integer]:boolean read GetSelected write SetSelected;
                 function GetNext(ExitState:TPlaybackState; Direction:integer):integer;
                 procedure NowPlaying(Index:integer);
                 procedure Changed;
                 procedure MoveSelectedUp;
                 procedure MoveSelectedDown;
                 function FindItem(CheckStr,MovieName:widestring):boolean;
                 function FindPW(FileURL:widestring):String;
               end;

type TLyric=class
            private
              IsParsed:boolean;
              LyricTime:array of TLyricTimeCodeEntry;
              LyricStringsA:TStringList; LyricStringsW:TTntStringList;
              procedure ParseLyricA(const FileName:WideString);
              procedure ParseLyricW(const FileName:WideString; mode:TTntStreamCharSet);
              procedure SortLyric;
            public
              procedure ParseLyric(const FileName:WideString);
              procedure GetCurrentLyric;
              procedure ClearLyric;
            end;

type TWStringList=class(TTntStringList)
            private
            public
              procedure LoadFromFile(const FileName:WideString; CharSet:TTntStreamCharSet);
            end;

type
  TPlaylistForm = class(TTntForm)
    PlaylistBox: TTntListBox;
    BPlay: TBitBtn;
    BAdd: TTntBitBtn;
    BMoveUp: TTntBitBtn;
    BMoveDown: TTntBitBtn;
    BDelete: TTntBitBtn;
    BSave: TTntBitBtn;
    SaveDialog: TTntSaveDialog;
    BAddDir: TTntBitBtn;
    CShuffle: TTntSpeedButton;
    CLoop: TTntSpeedButton;
    COneLoop: TTntSpeedButton;
    BClear: TTntBitBtn;
    TntPageControl1: TTntPageControl;
    TntTabSheet1: TTntTabSheet;
    TntTabSheet2: TTntTabSheet;
    TMLyric: TTntListBox;
    TntCP: TTntPopupMenu;
    CP0: TTntMenuItem;
    CPO: TTntMenuItem;
    SC: TTntMenuItem;
    TC: TTntMenuItem;
    AR: TTntMenuItem;
    TU: TTntMenuItem;
    HE: TTntMenuItem;
    JA: TTntMenuItem;
    KO: TTntMenuItem;
    TH: TTntMenuItem;
    FR: TTntMenuItem;
    IC: TTntMenuItem;
    PO: TTntMenuItem;
    KO2: TTntMenuItem;
    GR0: TTntMenuItem;
    TU2: TTntMenuItem;
    GR1: TTntMenuItem;
    BA: TTntMenuItem;
    CY: TTntMenuItem;
    Ar0: TTntMenuItem;
    Ar1: TTntMenuItem;
    Ar2: TTntMenuItem;
    Ar3: TTntMenuItem;
    Ar4: TTntMenuItem;
    Ar5: TTntMenuItem;
    Ar6: TTntMenuItem;
    Ba0: TTntMenuItem;
    Ba1: TTntMenuItem;
    Ba2: TTntMenuItem;
    CE: TTntMenuItem;
    Ce0: TTntMenuItem;
    Ce1: TTntMenuItem;
    Ce2: TTntMenuItem;
    Ce3: TTntMenuItem;
    sc0: TTntMenuItem;
    sc1: TTntMenuItem;
    sc2: TTntMenuItem;
    sc3: TTntMenuItem;
    sc4: TTntMenuItem;
    tc0: TTntMenuItem;
    tc1: TTntMenuItem;
    sc5: TTntMenuItem;
    tc2: TTntMenuItem;
    tc3: TTntMenuItem;
    tc4: TTntMenuItem;
    tc5: TTntMenuItem;
    tc6: TTntMenuItem;
    CA1: TTntMenuItem;
    tc8: TTntMenuItem;
    cy0: TTntMenuItem;
    cy1: TTntMenuItem;
    cy2: TTntMenuItem;
    cy3: TTntMenuItem;
    cy4: TTntMenuItem;
    cy5: TTntMenuItem;
    cy6: TTntMenuItem;
    cy7: TTntMenuItem;
    Gr: TTntMenuItem;
    gr2: TTntMenuItem;
    gr3: TTntMenuItem;
    gr4: TTntMenuItem;
    he0: TTntMenuItem;
    he1: TTntMenuItem;
    he2: TTntMenuItem;
    he4: TTntMenuItem;
    he3: TTntMenuItem;
    he5: TTntMenuItem;
    jp0: TTntMenuItem;
    jp1: TTntMenuItem;
    jp2: TTntMenuItem;
    jp3: TTntMenuItem;
    jp4: TTntMenuItem;
    jp5: TTntMenuItem;
    jp6: TTntMenuItem;
    jp7: TTntMenuItem;
    ko0: TTntMenuItem;
    ko1: TTntMenuItem;
    ko3: TTntMenuItem;
    ko4: TTntMenuItem;
    ko5: TTntMenuItem;
    ko6: TTntMenuItem;
    lt0: TTntMenuItem;
    th0: TTntMenuItem;
    th1: TTntMenuItem;
    th2: TTntMenuItem;
    tu0: TTntMenuItem;
    tu1: TTntMenuItem;
    tu3: TTntMenuItem;
    tu4: TTntMenuItem;
    vi: TTntMenuItem;
    we: TTntMenuItem;
    fr0: TTntMenuItem;
    fr1: TTntMenuItem;
    fr2: TTntMenuItem;
    ic0: TTntMenuItem;
    ic1: TTntMenuItem;
    ic2: TTntMenuItem;
    gr5: TTntMenuItem;
    jp8: TTntMenuItem;
    iso0: TTntMenuItem;
    iso9: TTntMenuItem;
    iso15: TTntMenuItem;
    gr6: TTntMenuItem;
    he6: TTntMenuItem;
    RO: TTntMenuItem;
    RM: TTntMenuItem;
    CO: TTntMenuItem;
    I18: TTntMenuItem;
    DV: TTntMenuItem;
    BE: TTntMenuItem;
    TA: TTntMenuItem;
    TE: TTntMenuItem;
    AM: TTntMenuItem;
    OY: TTntMenuItem;
    KA: TTntMenuItem;
    MA: TTntMenuItem;
    ISCII1: TTntMenuItem;
    GU: TTntMenuItem;
    PG: TTntMenuItem;
    ND: TTntMenuItem;
    CLyricF: TComboBox;
    CLyricS: TComboBox;
    PLTC: TTntPanel;
    PLHC: TTntPanel;
    PLBC: TTntPanel;
    LScroll: TTntCheckBox;
    MGB: TTntMenuItem;
    MG2B: TTntMenuItem;
    MB2G: TTntMenuItem;
    N1: TTntMenuItem;
    BG: TTntMenuItem;
    procedure BAddDirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure PlaylistBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure BPlayClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure BAddClick(Sender: TObject);
    procedure BMoveClick(Sender: TObject);
    procedure CShuffleClick(Sender: TObject);
    procedure CLoopClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure COneLoopClick(Sender: TObject);
    procedure BClearClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure TMLyricDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormResize(Sender: TObject);
    procedure TMLyricEnter(Sender: TObject);
    procedure TntCPClick(Sender: TObject);
    procedure CLyricFChange(Sender: TObject);
    procedure CLyricSChange(Sender: TObject);
    procedure LScrollClick(Sender: TObject);
    procedure PLTCClick(Sender: TObject);
    procedure PLHCClick(Sender: TObject);
    procedure PLBCClick(Sender: TObject);

  private
    { Private declarations }
    BMPpsPlaying,BMPpsPlayed,BMPpsSkipped:TBitmap;
    procedure FormDropFiles(var msg:TMessage); message WM_DROPFILES;
    procedure FormMove(var msg:TMessage); message WM_MOVE;
  public
    { Public declarations }
    ControlledMove:boolean;
  end;

var
  PlaylistForm: TPlaylistForm;
  Playlist: TPlaylist;
  Lyric:TLyric;
  LDocked,RDocked,TDocked,BDocked:boolean;
  LL,TT:integer;

implementation

uses Main, Core, UnRAR, Locale,About, Options, SevenZip;

{$R *.dfm}
{$R plist_img.res}

procedure TWStringList.LoadFromFile(const FileName:WideString; CharSet:TTntStreamCharSet);
var Stream:TStream; DataLeft:Integer; SW:WideString; SA:AnsiString;
begin
  Stream := TTntFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Stream.Position := 0;
    BeginUpdate;
    try
      DataLeft:=Stream.Size-Stream.Position;
      if CharSet=csUtf8 then begin
        SetLength(SA, DataLeft div SizeOf(AnsiChar));
        Stream.Read(PAnsiChar(SA)^, DataLeft);
        SetTextStr(UTF8ToWideString(SA));
      end
      else if DataLeft<SizeOf(WideChar) then SW:=''
      else begin
        SetLength(SW,DataLeft div SizeOf(WideChar));
        Stream.Read(PWideChar(SW)^,DataLeft);
        if CharSet=csUnicodeSwapped then
          StrSwapByteOrder(PWideChar(SW));
        SetTextStr(SW);
      end;
    finally
      EndUpdate;
    end;
  finally
    Stream.Free;
  end;
end;

function LoadBitmapResource(const ResName:string; Transparent:boolean):TBitmap;
begin
  Result:=TBitmap.Create;
  Result.LoadFromResourceName(HInstance,ResName);
  if Transparent then begin
    Result.Transparent:=true;
    Result.TransparentMode:=tmAuto;
  end;
end;

procedure TPlaylist.Clear;
begin
  SetLength(Data,0);
end;

procedure TLyric.ClearLyric;
begin
  if length(LyricTime)>0 then begin
    SetLength(LyricTime,0);
    case HaveLyric of
      1: begin LyricStringsW.Free; MaxLenLyricW:=''; end;
      2: begin LyricStringsA.Free; MaxLenLyricA:=''; end;
    end;
    PlaylistForm.TMLyric.Refresh;
  end;
  HaveLyric:=0;
end;

procedure TPlaylist.Add(const Entry:TPlaylistEntry);
var len:integer;
begin
  if PClear then begin PClear:=false; Clear; end;
  len:=length(Data);
  SetLength(Data,len+1);
  Data[len]:=Entry;
//  Changed;
end;

procedure TPlaylist.AddFiles(const URL:widestring);
var PlistEntry:TPlaylistEntry; j:WideString; i:integer;
begin
  // check for .m3u .pls .asx .wpl .xspf playlist file
  j:=Tnt_WideLowerCase(WideExtractFileExt(URL));
  i:=CheckInfo(PlaylistType,j);
  if (i>-1) AND AddM3U(URL,i) then exit;
  // no playlist -> check for Arc file
  if CheckInfo(ZipType,j)>-1 then begin
    if IsLoaded(j) and (AddMovies(URL,FindPW(URL),true,j)>-1) then exit;
  end;

  // no playlist and Arc file-> enter directly
  if (Pos('://',URL)>1) or WideFileExists(URL) then begin
    with PlistEntry do begin
      State:=psNotPlayed;
      FullURL:=URL;
      if Pos('://',URL)>1 then       // why this? well, the above two lines read like the regexp
        DisplayURL:=URL             // /.{1,5}p:/,which matches http:, ftp:, rtp: and so on ...
      else
        DisplayURL:=WideExtractFileName(URL);
    end;
    Add(PlistEntry);
  end;
end;

function TPlaylist.GetCount:integer;
begin
  Result:=length(Data);
end;

function TPlaylist.GetItem(Index:integer):TPlaylistEntry;
begin
  if (Index<Low(Data)) OR (Index>High(Data))
    then raise ERangeError.Create('invalid playlist item')
    else Result:=Data[Index];
end;

function TPlaylist.GetSelected(Index:integer):boolean;
begin
  if (Index<Low(Data)) OR (Index>High(Data))
    then raise ERangeError.Create('invalid playlist item')
    else Result:=Data[Index].Selected;
end;

procedure TPlaylist.SetSelected(Index:integer; Value:boolean);
begin
  if (Index<Low(Data)) OR (Index>High(Data))
    then raise ERangeError.Create('invalid playlist item')
    else Data[Index].Selected:=Value;
end;

function TPlaylist.FindItem(CheckStr,MovieName:widestring):boolean;
var i,j:integer; k:widestring;
begin
  Result:=false;
  if Count<1 then exit;
  i:=Pos(CheckStr,MovieName);
  if i>0 then MovieName:=copy(MovieName,1,i-1);
  for j:=High(Data) downto Low(Data) do begin
    i:=Pos(CheckStr,Data[j].DisplayURL);
    if i>0 then k:=copy(Data[j].DisplayURL,1,i-1)
    else k:=Data[j].DisplayURL;
    if MovieName=k then begin
      Result:=true;
      exit;
    end;
  end;
end;

function TPlaylist.FindPW(FileURL:widestring):String;
var i,k,h:integer; j,s:WideString;
begin
  Result:='';
  if Count>0 then begin
    j:=WideExtractFileName(FileURL);
    i:=Pos('.part',j);
    if i>0 then begin
      j:=copy(j,1,i-1);
      for i:=High(Data) downto Low(Data) do begin
        if Tnt_WideLowerCase(WideExtractFileExt(Data[i].FullURL))='.rar' then begin
          h:=Pos(':',Data[i].DisplayURL);
          if h>0 then begin
            s:=WideExtractFileName(Data[i].FullURL);
            k:=Pos('.part',s);
            if k>0 then begin
              s:=copy(s,1,k-1);
              if s=j then Result:=copy(Data[i].DisplayURL,h+1,length(Data[i].DisplayURL)-h);
            end;
            break;
          end;
        end;
      end;
    end;
  end;
end;

function TPlaylist.GetNext(ExitState:TPlaybackState; Direction:integer):integer;
var i,UPCount:integer;
begin
  if Count=0 then begin Result:=-1; CurPlay:=-1; exit; end
  else Result:=CurPlay;
  if Result<0 then Result:=0
  else Data[Result].State:=ExitState;  // mark State of current track
  if OneLoop and AutoNext then exit;
  AutoNext:=true;
  if Shuffle and (not OneLoop) then begin // ***** SHUFFLE MODE *****
    if Loop and (Count>1) then begin
      repeat Result:=Random(Count);
      until Result<>CurPlay;
    end
    else begin
      // unplayed tracks left?
      UPCount:=0;
      for i:=0 to Count-1 do
        if Data[i].State=psNotPlayed then inc(UPCount);
      // find a track
      if UPCount=0 then begin
        repeat Result:=Random(Count);
        until Result<>CurPlay;
      end
      else begin
        repeat Result:=Random(Count);
        until Data[Result].State=psNotPlayed;
      end;
    end;
  end
  else begin        // ***** NORMAL MODE *****
    inc(Result,Direction);
    if (Result<0) or (Result>Count-1) then begin
      if Loop and (not OneLoop) then Result:=(Result+Count) MOD Count
      else Result:=-1;
    end;
  end;
  if PlaylistForm.Visible then PlaylistForm.PlaylistBox.Invalidate;

  MainForm.BPrev.Enabled:=(Result>0);
  if Result<0 then MainForm.BNext.Enabled:=(1<Playlist.Count)
  else MainForm.BNext.Enabled:=(Result+1<Playlist.Count);
  CurPlay:=Result;
end;

procedure TPlaylist.NowPlaying(Index:integer);
begin
  if (Index<Low(Data)) OR (Index>High(Data)) then exit;
  Data[Index].State:=psPlaying;
  if PlaylistForm.Visible then PlaylistForm.PlaylistBox.Invalidate;
  PlaylistForm.PlaylistBox.ItemIndex:=Index;
end;

procedure TPlaylist.Changed;
begin
  PClear:=false;
  if PlaylistForm.Visible then begin
    if PlaylistForm.PlaylistBox.Count<>Count then
      PlaylistForm.PlaylistBox.Count:=Count;
    PlaylistForm.PlaylistBox.Invalidate;
  end;
  if (Count=0) AND (not Running) then MainForm.BPlay.Enabled:=false;
  //if CurPlay<0 then CurPlay:=0;
  MainForm.BPrev.Enabled:=(CurPlay>0);
  MainForm.BNext.Enabled:=(CurPlay+1<Playlist.Count);
end;

procedure TPlaylist.MoveSelectedUp;
var i:integer; temp:TPlaylistEntry;
begin
  for i:=1 to High(Data) do
    if Data[i].Selected AND not(Data[i-1].Selected) then begin
      if Data[i].State=psPlaying then dec(CurPlay);
      temp:=Data[i];
      Data[i]:=Data[i-1];
      Data[i-1]:=temp;
    end;
  Changed;
end;

procedure TPlaylist.MoveSelectedDown;
var i:integer; temp:TPlaylistEntry;
begin
  for i:=(High(Data)-1) downto 0 do
    if Data[i].Selected AND not(Data[i+1].Selected) then begin
      if Data[i].State=psPlaying then inc(CurPlay);
      temp:=Data[i];
      Data[i]:=Data[i+1];
      Data[i+1]:=temp;
    end;
  Changed;
end;

function ExpandName(const BasePath, FileName:WideString):WideString;
begin
  Result:=FileName;
  if Pos(':',FileName)>0 then exit;
  if (length(FileName)>1) AND ((FileName[1]='/') OR (FileName[1]='\')) then exit;
  Result:=WideExpandUNCFileName(BasePath+FileName);
end;

function TPlaylist.AddM3U(const FileName:WideString; FileExtIndex:integer):boolean;
var FileNameList:TStringList; BasePath,f:WideString; s:String; i:integer;
procedure AddToPls(str:string; Mode:boolean);
begin
   if Mode then f:=UTF8Decode(str) else f:=WideString(str);
   if WideDirectoryExists(f) then begin
      AddDirectory(f);
      empty:=true;
   end
   else AddFiles(ExpandName(BasePath,f));
end;
procedure HandleStr(const b,e:string; Mode:boolean);
begin
  i:=pos(b,s);
  while i>0 do begin
    s:=copy(s,i+length(b),length(s));
    i:=pos(b,s);
    if e<>'' then AddToPls(copy(s,1,pos(e,s)-1),Mode)
    else begin
      if i>0 then AddToPls(copy(s,1,i-1),Mode)
      else AddToPls(s,Mode);
    end;
  end;
end;
begin
  Result:=false;
  FileNameList:=TStringList.Create;
  if IsWideStringMappableToAnsi(FileName) then 
    FileNameList.LoadFromFile(FileName)
  else FileNameList.LoadFromFile(WideExtractShortPathName(FileName));
  if FileNameList.Count<1 then exit;
  BasePath:=WideIncludeTrailingPathDelimiter(WideExtractFilePath(FileName));
  for i:=0 to FileNameList.Count-1 do begin
    s:=Trim(FileNameList[i]);
    if length(s)<1 then continue;
    case FileExtIndex of
    {m3u} 0: if s[1]<>'#' then AddToPls(s,false);
    {asx} 1: HandleStr('<Param Name = "SourceURL" Value = "','"',false);
    {wpl} 2: HandleStr('<media src="','"',true);
    {pls} 3: if s[1]='F' then AddToPls(copy(s,pos('=',s)+1,length(s)),false);
   {ttpl} 4: HandleStr('<item file="','"',true);
    {rmp} 5: HandleStr('<FILENAME>','</FILENAME>',false);
   {xspf} 6: HandleStr('<location>','</location>',true);
   {smpl} 7: HandleStr('path="','"/>',false);
   {m3u8} 8: if s[1]<>'#' then AddToPls(s,true);
  {mpcpl} 9: HandleStr('filename,','',false);
    end;
  end;
  Result:=True;
end;

procedure TLyric.ParseLyric(const FileName:WideString);
begin
  Isparsed:=false;
  ParseLyricW(FileName,csUtf8);
  ParseLyricW(FileName,csUnicode);
  ParseLyricW(FileName,csUnicodeSwapped);
  ParseLyricA(FileName);
end;

procedure TLyric.ParseLyricA(const FileName:WideString);
var s,timeTab:string; TimeEntry:TLyricTimeCodeEntry;
    lc,rc,offset,mins,secs,ms,len,Lyricindex,sMaxLen,i,j:integer;
    First:boolean; a:TStringList;
begin
  if IsParsed then exit;
  a:=TStringList.Create;
  if IsWideStringMappableToAnsi(FileName) then
    a.LoadFromFile(FileName)
  else a.LoadFromFile(WideExtractShortPathName(FileName));
  if a.Count<1 then begin a.Free; exit; end;
  Lyricindex:=0; offset:=0; len:=-1; sMaxLen:=0; First:=true;
  for j:=0 to a.Count-1 do begin
    s:=Trim(a[j]);
    if length(s)>7 then begin
      if not (s[2] in ['0'..'9']) then begin
        if pos('offset',s)>0 then begin
          lc:=pos(':',s); rc:=pos(']',s);
          if (lc>0) and (rc>lc) then offset:=StrToIntDef(copy(s,lc+1,rc-lc-1),0);
        end;
        continue;
      end;
    end
    else continue;

    lc:=pos('[',s); rc:=pos(']',s);
    while (lc>0) and (rc>lc) do begin
      timeTab:=copy(s,lc+1,rc-lc-1);
      mins:=StrToIntDef(copy(timeTab,1,2),-1);
      secs:=StrToIntDef(copy(timeTab,4,2),-1);
      if (mins>-1) and (secs>-1) then begin
        ms:=(mins*60 + secs)*1000+offset;
        if pos('.',timeTab)>0 then ms:=ms+StrToIntDef(copy(timeTab,7,2),0)*10;
        TimeEntry.timecode:=ms DIV 100;
        TimeEntry.LyricEntry:=Lyricindex;
        if First then begin
          First:=false; ClearLyric;
          LyricStringsA:=TStringList.Create;
        end;
        len:=length(LyricTime);
        SetLength(LyricTime,len+1);
        LyricTime[len]:=TimeEntry;
      end;
      s:=copy(s,rc+1,length(s));
      lc:=pos('[',s); rc:=pos(']',s);
    end;
    inc(Lyricindex);
    LyricStringsA.Add(s);
    i:=length(s);
    if i>sMaxLen then begin
      sMaxLen:=i; MaxLenLyricA:=s;
    end;
  end;
  a.Free;
  if len=-1 then exit;
  LyricCount:=len;
  SortLyric; dy:=0; CurLyric:=0;
  NextLyric:=0; LyricV:=0;
  with PlaylistForm do begin
    UpdatePW:=True;
    if Visible then TMLyric.Invalidate
    else begin
      TntPageControl1.TabIndex:=1;
      Show;
    end;
  end;
  HaveLyric:=2; LyricURL:=FileName; IsParsed:=true;
end;

procedure TLyric.ParseLyricW(const FileName:WideString; mode:TTntStreamCharSet);
var s,timeTab:WideString; TimeEntry:TLyricTimeCodeEntry;
    lc,rc,offset,mins,secs,ms,len,Lyricindex,sMaxLen,i,j:integer;
    First:boolean; a:TWStringList;
begin
  if IsParsed then exit;
  a:=TWStringList.Create;
  a.LoadFromFile(FileName,mode);
  if a.Count<1 then begin a.Free; exit; end;

  Lyricindex:=0; offset:=0; len:=-1; sMaxLen:=0; First:=true;

  for j:=0 to a.Count-1 do begin
    s:=Trim(a[j]);
    if length(s)>7 then begin
      if not (s[2] in [Wchar('0')..Wchar('9')]) then begin
        if pos('offset',s)>0 then begin
          lc:=pos(':',s); rc:=pos(']',s);
          if (lc>0) and (rc>lc) then offset:=StrToIntDef(copy(s,lc+1,rc-lc-1),0);
        end;
        continue;
      end;
    end
    else continue;

    lc:=pos('[',s); rc:=pos(']',s);
    while (lc>0) and (rc>lc) do begin
      timeTab:=copy(s,lc+1,rc-lc-1);
      mins:=StrToIntDef(copy(timeTab,1,2),-1);
      secs:=StrToIntDef(copy(timeTab,4,2),-1);
      if (mins>-1) and (secs>-1) then begin
        ms:=(mins*60 + secs)*1000+offset;
        if pos('.',timeTab)>0 then ms:=ms+StrToIntDef(copy(timeTab,7,2),0)*10;
        TimeEntry.timecode:=ms DIV 100;
        TimeEntry.LyricEntry:=Lyricindex;
        if First then begin
          First:=false; ClearLyric;
          LyricStringsW:=TTntStringList.Create;
        end;
        len:=length(LyricTime);
        SetLength(LyricTime,len+1);
        LyricTime[len]:=TimeEntry;
      end;
      s:=copy(s,rc+1,length(s));
      lc:=pos('[',s); rc:=pos(']',s);
    end;
    inc(Lyricindex);
    LyricStringsW.Add(s);
    i:=length(s);
    if i>sMaxLen then begin
      sMaxLen:=i; MaxLenLyricW:=s;
    end;
  end;
  a.Free;
  if len=-1 then exit;
  LyricCount:=len;
  SortLyric; dy:=0; CurLyric:=0;
  NextLyric:=0; LyricV:=0;
  with PlaylistForm do begin
    UpdatePW:=True;
    if Visible then TMLyric.Invalidate
    else begin
      TntPageControl1.TabIndex:=1;
      Show;
    end;
  end;
  HaveLyric:=1; LyricURL:=FileName; IsParsed:=true;
end;

procedure TLyric.SortLyric;
var i,j:integer; TmpEntry:TLyricTimeCodeEntry;
begin
  for i:=0 to LyricCount-1 do begin
    for j:=1 to LyricCount-i do begin
      if LyricTime[j].timecode<LyricTime[j-1].timecode then begin
        TmpEntry:=LyricTime[j-1]; LyricTime[j-1]:=LyricTime[j];
        LyricTime[j]:=TmpEntry;
      end;
    end;
  end;
end;

procedure TLyric.GetCurrentLyric;
var l,h,m,mv:integer;
begin
  if MSecPos<LyricTime[0].timecode then begin
    if CurLyric<>0 then begin
      CurLyric:=0; NextLyric:=0; LyricV:=0;
      PlaylistForm.TMLyric.Refresh;
    end;
    exit;
  end;
  if MSecPos>LyricTime[LyricCount].timecode then begin
     if CurLyric<>LyricCount then begin
       CurLyric:=LyricCount; NextLyric:=LyricCount; LyricV:=0;
       PlaylistForm.TMLyric.Refresh;
     end;
     exit;
  end;
  if (LyricV>0) and PScroll then begin
    dy:=dy+LyricV;
    l:=round(dy); dy:=dy-l;
    PlaylistForm.TMLyric.ScrollBy(0,-l);
  end;
  if (MSecPos>LyricTime[CurLyric].timecode) and (MSecPos<LyricTime[NextLyric].timecode) then exit;
  l:=0; h:=LyricCount; m:=0;
	while (l<=h) do begin
	  m:=(l+h) div 2; mv:=LyricTime[m].timecode;
    if mv<MSecPos then l:=m+1
	  else if mv>MSecPos then h:=m-1
	  else break;
  end;
  CurLyric:=m; NextLyric:=m+1; dy:=0;
  if NextLyric>LyricCount then NextLyric:=LyricCount
  else if CurLyric<>NextLyric then
    LyricV:=PlaylistForm.TMLyric.ItemHeight/(LyricTime[NextLyric].timecode-LyricTime[CurLyric].timecode);
  PlaylistForm.TMLyric.Refresh;
end;

procedure TPlaylist.AddDirectory(Directory:Widestring);
var SR:TSearchRecW; Entry:TPlaylistEntry;
begin
  Directory:=WideIncludeTrailingPathDelimiter(WideExpandUNCFileName(Directory));

  // check for DVD directory
  if (WideDirectoryExists(Directory+'VIDEO_TS')) then begin
    with Entry do begin
      State:=psNotPlayed;
      if IsWideStringMappableToAnsi(Directory) then
        FullURL:=' -dvd-device '+EscapeParam(Directory)+' dvd'
      else
        FullURL:=' -dvd-device '+EscapeParam(WideExtractShortPathName(Directory))+' dvd';
      DisplayURL:='DVD-1 <-- '+Directory;
    end;
    Add(Entry);
    exit;
  end;

  // no DVD ->is it a (S)VCD directory?
  if (WideDirectoryExists(Directory+'MPEGAV'))then begin
    Directory:=Directory+'MPEGAV';
    if WideDirectoryExists(Directory+'MPEG2') then Directory:=Directory+'\MPEG2';
  end;

  // no (S)VCD -> search the directory recursively
  if WideFindFirst(Directory+'*.*',faAnyFile,SR)=0 then begin
    repeat
      if SR.Name[1]<>'.' then begin   // exclude . or .. Directory
        empty:=false;
        if (SR.Attr AND faDirectory)<>0 then AddDirectory(Directory+SR.Name)
        else if CheckInfo(MediaType,Tnt_WideLowerCase(WideExtractFileExt(SR.Name)))>-1 then
          AddFiles(Directory+SR.Name);
      end;
    until WideFindNext(SR)<>0;
    WideFindClose(SR);
  end;
  
  // directory is empty, or no filesystem -> try use TrackMode to access directory
  if empty then begin
    with Entry do begin
      State:=psNotPlayed;
      if IsWideStringMappableToAnsi(Directory) then
        FullURL:=' -cdrom-device '+EscapeParam(Directory)+' vcd://'
      else
        FullURL:=' -cdrom-device '+EscapeParam(WideExtractShortPathName(Directory))+' vcd://';
      DisplayURL:='VCD <-- '+Directory;
    end;
    Add(Entry);
  end;
end;

procedure TPlaylistForm.FormCreate(Sender: TObject);
begin
  BMPpsPlaying:=LoadBitmapResource('PS_PLAYING',true);
  BMPpsPlayed :=LoadBitmapResource('PS_PLAYED' ,true);
  BMPpsSkipped:=LoadBitmapResource('PS_SKIPPED',true);
  ControlledMove:=true; TDocked:=true;
  if (not Wid) OR (not Win32PlatformIsUnicode) then begin
    Left:=MainForm.Left+MainForm.Width;
    Top:=MainForm.Top+MainForm.Height-Height;
  end;
  TntPageControl1.TabIndex:=0;
  TMLyric.Color:=LbgColor; TMLyric.Font.Color:=LTextColor;
  TMLyric.Font.Name:=LyricF; TMLyric.Font.Size:=LyricS;
  TMLyric.ItemHeight:=2*LyricS;
  TMLyric.Count:=round(TMLyric.Height/TMLyric.ItemHeight)-1;
end;

procedure TPlaylistForm.FormShow(Sender: TObject);
begin
  CLyricF.Items:=Screen.Fonts; CLyricF.Text:=TMLyric.Font.Name; 
  CLyricS.Text:=intToStr(TMLyric.Font.Size);
  PLTC.Color:=LTextColor; PLBC.Color:=LbgColor;
  PLHC.Color:=LhgColor; LScroll.Checked:=PScroll;
  PlaylistBox.Count:=Playlist.Count;
  DragAcceptFiles(Handle,true);
  MainForm.MShowPlaylist.Checked:=true;
  MainForm.BPlaylist.Down:=true;
  if (MainForm.Width>=Screen.Width) OR (MainForm.Height>=Screen.WorkAreaHeight) then MainForm.Enabled:=false;
  if (OnTop>0) OR MainForm.MFullScreen.Checked then SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
end;

procedure TPlaylistForm.FormHide(Sender: TObject);
begin
  DragAcceptFiles(Handle,false);
  MainForm.MShowPlaylist.Checked:=false;
  MainForm.BPlaylist.Down:=false;
  MainForm.Enabled:=true;
  if (OnTop=1) OR ((OnTop=2) AND (Status=sPlaying)) OR MainForm.MFullScreen.Checked then
    SetWindowPos(MainForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
end;

procedure TPlaylistForm.PlaylistBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin 
  with PlaylistBox.Canvas do begin
    FillRect(Rect);
    if (Index<0) OR (Index>=Playlist.Count) then exit;
    with Playlist[Index] do begin
      case State of
        psPlaying: Draw(Rect.Left+3,Rect.Top+1,BMPpsPlaying);
        psPlayed : Draw(Rect.Left+3,Rect.Top+1,BMPpsPlayed);
        psSkipped: Draw(Rect.Left+3,Rect.Top+1,BMPpsSkipped);
      end;
      //TextOut(Rect.Left+16,Rect.Top+1,DisplayURL);
      WideCanvasTextOut(PlaylistBox.Canvas,Rect.Left+16,Rect.Top+1,DisplayURL);
      //TextOutW(Handle,Rect.Left+16,Rect.Top+1,PWideChar(DisplayURL),length(DisplayURL));
    end;
  end;
end;

procedure TPlaylistForm.BPlayClick(Sender: TObject);
var Index:integer;
begin
  if Playlist.Count>0 then begin
    if (Sender<>BPlay) and (Sender<>PlaylistBox) then Index:=0
    else begin
      if PlaylistBox.SelCount>0 then
        Index:=PlaylistBox.ItemIndex-(PlaylistBox.SelCount-1)
      else Index:=0;
    end;
  end
  else exit;
  //ForceStop;
  MainForm.UpdateParams;
  if CurPlay>-1 then Playlist.Data[CurPlay].State:=psSkipped;
  MainForm.BPrev.Enabled:=(Index>0);
  MainForm.BNext.Enabled:=(Index+1<Playlist.Count);
  Playlist.NowPlaying(Index); CurPlay:=Index;
  MainForm.DoOpen(Playlist[Index].FullURL,Playlist[Index].DisplayURL);
end;

procedure TPlaylistForm.BDeleteClick(Sender: TObject);
var iOld,iNew:integer;
begin
  with Playlist do begin
    iNew:=0;
    for iOld:=0 to High(Data) do begin
      if not PlaylistBox.Selected[iOld] then begin
        if iNew<iOld then Data[iNew]:=Data[iOld];
        inc(iNew);
      end
      else begin
        if data[iOld].State=psPlaying then begin
          CurPlay:=-1; Firstrun:=true;
        end;
      end;
    end;
    SetLength(Data,iNew);
    Changed;
  end;
end;

procedure TPlaylistForm.BAddClick(Sender: TObject);
var i:integer;
begin
  with MainForm.OpenDialog do begin
    Title:=MainForm.MOpenFile.Caption;
    Options:=Options+[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:=MediaFilter+'|*.rar;*.zip;*.7z;*.ttpl;*.av*;*.mp*;*.vo*;*.dat;*.bin;*.qt;'
           +'*.divx;*.og*;*.mk*;*.wm*;*.as*;*.m*v;*.dv;*.26*;*.wav;*.wpl;'
           +'*.ac*;*.m4*;*.rm*;*.vivo;*.3g*;*.iso;*.img;*.grf;*.realpix;'
           +'*.m3u*;*.vp*;*.ts;*.vqf;*.nrg;*.cue;*.a52;*.aac;*.dts*;'
           +'*.pls;*.ns*;*.s3*;*.fl*;*.xm*;*.aif*;*.ds*;*.m*a;*.st*;'
           +'*.am*;*.mid*;*.smi*;*.pva;*.tp*;*.cda;*.au;*.jsv;*.pmp*;*.m2p;'
           +'*.ap*;*.drc;*.d2v;*.ivf;*.rt;*.rp*;*.roq;*.smk;*.swf;*.vg2;'
           +'*.bik;*.mod;*.mdz;*.ult;*.669;*.far;*.okt;*.ptm;*.kar;*.vid;'
           +'*.miz;*.rv;*.mac;*.mjf;*.cm*;*.mtm;*.rnx;*.voc;*.ratdvd;'
           +'*.snd;*.pss;*.tta;*.umx;*.ram;*.ra;*.it*;*.xspf;*.smpl|'
           +AnyFilter+'(*.*)|*.*';

    if Execute then begin
      if Sender<>BAdd then PClear:=true;
      for i:=0 to Files.Count-1 do
        Playlist.AddFiles(Files[i]);
      Playlist.Changed;
      if Sender<>BAdd then PlaylistForm.BPlayClick(Sender);
    end;
  end;
end;

procedure TPlaylistForm.FormDropFiles(var msg:TMessage);
var hDrop:THandle; i,h,DropCount:integer; j:boolean;
    fnbuf,k,FName,Lname:WideString; Entry:TPlaylistEntry;
    tw:array[0..1024]of wideChar; ta:array[0..1024]of Char;
begin
  hDrop:=msg.wParam;
  if Win32PlatformIsUnicode then DropCount:=DragQueryFileW(hDrop,cardinal(-1),nil,0)
  else DropCount:=DragQueryFile(hDrop,cardinal(-1),nil,0);
  for i:=0 to DropCount-1 do begin
    if Win32PlatformIsUnicode then begin
      DragQueryFileW(hDrop,i,tw,1024); fnbuf:=tw;
    end
    else begin
      DragQueryFile(hDrop,i,ta,1024); fnbuf:=WideString(ta);
    end;
    if WideDirectoryExists(fnbuf) then begin
      Playlist.AddDirectory(fnbuf);
      empty:=true; 
    end
    else begin
      k:=Tnt_WideLowerCase(WideExtractFileExt(fnbuf));
      if FilterDrop then j:=CheckInfo(MediaType,k)>ZipTypeCount
      else j:=CheckInfo(SubType,k)=-1;
      if j then Playlist.AddFiles(fnbuf)
      else begin
        if Running and (k='.lrc') and (HaveLyric=0) then begin
          FName:=WideExtractFileName(MediaURL);
          FName:=Tnt_WideLowerCase(Copy(FName,1,length(FName)-length(WideExtractFileExt(MediaURL))));
          LName:=WideExtractFileName(fnbuf);
          LName:=Tnt_WideLowerCase(Copy(LName,1,length(LName)-4));
          if FName=LName then Lyric.ParseLyric(fnbuf);
        end
        else begin
          if CheckInfo(ZipType,k)>-1 then begin
            if IsLoaded(k) then begin
              TmpPW:='';
              h:=AddMovies(fnbuf,playlist.FindPW(fnbuf),true,k);
              if HaveLyric=0 then ExtractLyric(fnbuf,TmpPW,k,-1);
              if (h<0) and ((Pos('://',fnbuf)>1) or WideFileExists(fnbuf)) then begin
                Entry.State:=psNotPlayed;
                Entry.FullURL:=fnbuf;
                if Pos('://',fnbuf)>1 then Entry.DisplayURL:=fnbuf
                else Entry.DisplayURL:=WideExtractFileName(fnbuf);
                playlist.Add(Entry);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  DragFinish(hDrop);
  Playlist.Changed;
  msg.Result:=0;
end;

procedure TPlaylistForm.BMoveClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to (Playlist.Count-1) do
    Playlist.Selected[i]:=PlaylistBox.Selected[i];
  if (Sender as TComponent).Tag=1
    then Playlist.MoveSelectedUp
    else Playlist.MoveSelectedDown;
  for i:=0 to (Playlist.Count-1) do
    PlaylistBox.Selected[i]:=Playlist.Selected[i];
  PlaylistBox.Invalidate;
end;

procedure TPlaylistForm.FormMove(var msg:TMessage);
begin
  msg.Result:=0;
  if not ControlledMove then begin ControlledMove:=true; exit; end;

  if (left>=(MainForm.Left+MainForm.Width-20)) and (left<=(MainForm.Left+MainForm.Width+20)) and
     (top>(MainForm.top-Height)) and (top<(MainForm.top+MainForm.Height)) then begin
    if not LDocked then TT:=MainForm.Top-top;
    Left:=MainForm.Left+MainForm.Width;
    LDocked:=true;
    if ControlledMove and (TT<>(MainForm.Top-top)) then TT:=MainForm.Top-top;
    ControlledMove:=true;
  end
  else LDocked:=False;

  if (left>=(MainForm.Left-Width-20)) and (left<=(MainForm.Left-Width+20)) and
     (top>(MainForm.top-Height)) and (top<(MainForm.top+MainForm.Height))then begin
    if not RDocked then TT:=MainForm.Top-top;
    Left:=MainForm.Left-Width;
    RDocked:=true;
    if ControlledMove and (TT<>(MainForm.Top-top)) then TT:=MainForm.Top-top;
    ControlledMove:=true;
  end
  else RDocked:=False;

  if ((top>=(MainForm.top+MainForm.Height)) and (top<=(MainForm.top+MainForm.Height+20)) and
     (left>=(MainForm.left-Width)) and (left<=(MainForm.left+MainForm.Width))) or
     ((top>=(MainForm.top+MainForm.Height-20)) and (top<(MainForm.top+MainForm.Height)) and
     (left>(MainForm.left-Width+20)) and (left<(MainForm.left+MainForm.Width-20))) then begin
    if not TDocked then LL:=MainForm.Left-left;
    Top:=MainForm.Top+MainForm.Height;
    TDocked:=true;
    if ControlledMove and (LL<>(MainForm.Left-left)) then LL:=MainForm.Left-left;
    ControlledMove:=true;
  end
  else TDocked:=False;

  if ((top>=(MainForm.top-Height-20)) and (top<=(MainForm.top-Height)) and
     (left>=(MainForm.left-Width)) and (left<=(MainForm.left+MainForm.Width))) or
     ((top>(MainForm.top-Height)) and (top<=(MainForm.top-Height-20)) and
     (left>(MainForm.left-Width+20)) and (left<(MainForm.left+MainForm.Width-20))) then begin
    if not BDocked then LL:=MainForm.Left-left;
    Top:=MainForm.Top-Height;
    BDocked:=true;
    if ControlledMove and (LL<>(MainForm.Left-left)) then LL:=MainForm.Left-left;
    ControlledMove:=true;
  end
  else BDocked:=False;
  
end;

procedure TPlaylistForm.CShuffleClick(Sender: TObject);
begin
  CShuffle.Down:=not Shuffle;
  MainForm.MShuffle.Checked:=CShuffle.Down;
  Shuffle:=CShuffle.Down;
end;

procedure TPlaylistForm.CLoopClick(Sender: TObject);
begin
  CLoop.Down:=not Loop;
  MainForm.MLoopAll.Checked:=CLoop.Down;
  Loop:=CLoop.Down;
end;

procedure TPlaylistForm.BSaveClick(Sender: TObject);
var FileNameList:TStringList; i:integer;
begin
  if SaveDialog.Execute then begin
    FileNameList:=TStringList.Create;
    for i:=0 to Playlist.Count-1 do FileNameList.Add(UTF8Encode(Playlist[i].FullURL));
    if IsWideStringMappableToAnsi(SaveDialog.FileName) then
      FileNameList.SaveToFile(SaveDialog.FileName)
    else FileNameList.SaveToFile(WideExtractShortPathName(SaveDialog.FileName));
  end;
end;

procedure TPlaylistForm.BAddDirClick(Sender: TObject);
var s:widestring;
begin
  if WideSelectDirectory(AddDirCp,'',s) then begin
    Playlist.AddDirectory(s);
    empty:=true; Playlist.Changed;
  end;
  {if AddDirForm.Execute(true) then begin
    Playlist.AddDirectory(AddDirForm.DirView.SelectedFolder.PathName);
    empty:=true; Playlist.Changed;
  end;}
end;

procedure TPlaylistForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F9 then Hide;
end;

procedure TPlaylistForm.COneLoopClick(Sender: TObject);
begin
  CShuffle.Enabled:=OneLoop; CLoop.Enabled:=OneLoop;
  MainForm.MShuffle.Enabled:=OneLoop; MainForm.MLoopAll.Enabled:=OneLoop;
  COneLoop.Down:=not OneLoop; MainForm.MOneLoop.Checked:=COneLoop.Down;
  OneLoop:=COneLoop.Down;
end;

procedure TPlaylistForm.BClearClick(Sender: TObject);
begin
  SetLength(Playlist.Data,0); CurPlay:=-1;
  Playlist.Changed;
end;

procedure TPlaylistForm.FormDblClick(Sender: TObject);
begin
  TDocked:=True; MainForm.UpdateDockedWindows;
end;

procedure TPlaylistForm.TMLyricDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var s,f:WideString; L,T,j,i,d:integer; k:string;

function Gb2Big5(str:string):string;
begin
  setlength(result,length(str));
  LCMapString(GetUserDefaultLCID,LCMAP_TRADITIONAL_CHINESE,PChar(str),length(str),PChar(result),length(result));
  result:=WideStringToStringEx(StringToWideStringEx(result,936),950);
end;

function Big52Gb(str:string):string;
begin
  str:=WideStringToStringEx(StringToWideStringEx(str,950),936);
  setlength(result,length(str));
  LCMapString(GetUserDefaultLCID,LCMAP_SIMPLIFIED_CHINESE,PChar(str),length(str),PChar(result),length(result));
end;
begin
  if HaveLyric=0 then exit;
  with TMLyric.Canvas do begin
    FillRect(Rect);
    with Lyric do begin
      if (length(LyricTime)<1) OR (Index<0)
         OR (Index>=TMLyric.Count) then exit;
      j:=Index+CurLyric-(TMLyric.Count div 2);
      if (j>=0) and (j<=LyricCount) then begin
        if j=CurLyric then Font.Color:=LhgColor;
        if HaveLyric=1 then begin
          s:=LyricStringsW[LyricTime[j].LyricEntry];
          if MG2B.Checked then begin
            f:=s;
            LCMapStringW(GetUserDefaultLCID,LCMAP_TRADITIONAL_CHINESE,PWChar(f),length(f),PWChar(s),length(s));
          end;
          if MB2G.Checked then begin
            f:=s;
            LCMapStringW(GetUserDefaultLCID,LCMAP_SIMPLIFIED_CHINESE,PWChar(f),length(f),PWChar(s),length(s));
          end;
        end
        else begin
          k:=LyricStringsA[LyricTime[j].LyricEntry];
          if MG2B.Checked then k:=Gb2Big5(k);
          if MB2G.Checked then k:=Big52Gb(k);
          s:=StringToWideStringEx(k,CP);
        end;
        L:=(Rect.Left+Rect.Right-WideCanvasTextWidth(TMLyric.Canvas,s)) div 2;
        T:=(Rect.Top+Rect.Bottom-WideCanvasTextHeight(TMLyric.Canvas,s)) div 2;
        WideCanvasTextOut(TMLyric.Canvas,L,T,s);
        if UpdatePW then begin
          UpdatePW:=false;
          if HaveLyric=1 then begin
            f:=MaxLenLyricW;
            if MG2B.Checked then
              LCMapStringW(GetUserDefaultLCID,LCMAP_TRADITIONAL_CHINESE,PWChar(MaxLenLyricW),length(MaxLenLyricW),PWChar(f),length(f));
            if MB2G.Checked then
              LCMapStringW(GetUserDefaultLCID,LCMAP_SIMPLIFIED_CHINESE,PWChar(MaxLenLyricW),length(MaxLenLyricW),PWChar(f),length(f));
            i:=10+WideCanvasTextWidth(TMLyric.Canvas,f)+width+rect.Left-rect.Right;
          end
          else begin
            k:=MaxLenLyricA;
            if MG2B.Checked then k:=Gb2Big5(k);
            if MB2G.Checked then k:=Big52Gb(k);
            i:=10+WideCanvasTextWidth(TMLyric.Canvas,StringToWideStringEx(k,CP))+width+rect.Left-rect.Right;
          end;
          if i>Screen.Width then i:=Screen.Width;
          if i<Constraints.MinWidth then i:=Constraints.MinWidth;
          d:=(i-Width) div 2;
          if (left+width)<=MainForm.Left then left:=left+Width-i
          else if left>(MainForm.Left+MainForm.Width) then
          else if (Left-d)<(MainForm.Left+MainForm.Width) then Left:=Left-d;
          Width:=i;
        end;
      end;
    end;
  end;
end;

procedure TPlaylistForm.FormResize(Sender: TObject);
begin
  TMLyric.Count:=round(TMLyric.Height/TMLyric.ItemHeight)-1;
end;

procedure TPlaylistForm.TMLyricEnter(Sender: TObject);
begin
  ActiveControl:=TntTabSheet2;
end;

procedure TPlaylistForm.TntCPClick(Sender: TObject);
var i,j,k:integer;
begin
  if (Sender as TMenuItem).Checked then exit;
  CP:=(Sender as TMenuItem).Tag;
  for i:=0 to TntCP.Items.Count-1 do begin
    TntCP.Items[i].Checked:=false;
    for j:=0 to TntCP.Items[i].Count-1 do begin
      TntCP.Items[i].Items[j].Checked:=false;
      for k:=0 to TntCP.Items[i].Items[j].Count-1 do
        TntCP.Items[i].Items[j].Items[k].Checked:=false;
    end;
  end;
  UpdatePW:=True;
  if Visible then TMLyric.Invalidate;
  (Sender as TMenuItem).Checked:=true;
end;

procedure TPlaylistForm.CLyricFChange(Sender: TObject);
begin
  if CLyricF.ItemIndex>-1 then begin
    TMLyric.Font.Name:=CLyricF.Text; UpdatePW:=True;
  end;
end;

procedure TPlaylistForm.CLyricSChange(Sender: TObject);
var i,e:integer;
begin
  Val(CLyricS.Text,i,e);
  if (e=0) and (i>0) then begin
    TMLyric.Font.Size:=i; TMLyric.ItemHeight:=2*i;
    TMLyric.Count:=round(TMLyric.Height/TMLyric.ItemHeight)-1;
    UpdatePW:=True;
  end;
end;

procedure TPlaylistForm.LScrollClick(Sender: TObject);
begin
  PScroll:=LScroll.Checked; 
end;

procedure TPlaylistForm.PLTCClick(Sender: TObject);
begin
  OptionsForm.ColorDialog1.Color:=PLTC.Color;
  if OptionsForm.ColorDialog1.Execute then
    PLTC.Color := OptionsForm.ColorDialog1.Color;
  LTextColor:=ColorToRGB(PLTC.Color);
  TMLyric.Font.Color:=LTextColor;
end;

procedure TPlaylistForm.PLHCClick(Sender: TObject);
begin
  OptionsForm.ColorDialog1.Color:=PLHC.Color;
  if OptionsForm.ColorDialog1.Execute then
    PLHC.Color := OptionsForm.ColorDialog1.Color;
  LhgColor:=ColorToRGB(PLHC.Color);
  if Visible then TMLyric.Invalidate;
end;

procedure TPlaylistForm.PLBCClick(Sender: TObject);
begin
  OptionsForm.ColorDialog1.Color:=PLBC.Color;
  if OptionsForm.ColorDialog1.Execute then
    PLBC.Color := OptionsForm.ColorDialog1.Color;
  LbgColor:=ColorToRGB(PLBC.Color);
  TMLyric.Color:=LbgColor; 
end;

initialization
  Playlist:=TPlaylist.Create;
  Lyric:=TLyric.Create;
finalization
  Playlist.Free;
  Lyric.Free;
end.
