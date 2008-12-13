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
unit Core;
interface
uses Windows, SysUtils, TntSysUtils, Classes, Forms, Menus,TntMenus,
     Controls, Dialogs, Graphics, ComCtrls, TntForms, MultiMon, ShFolder; //,ShellAPI;

const ABOVE_NORMAL_PRIORITY_CLASS:Cardinal=$00008000;

const CacheFill:array[0..3]of String=('缓存填充:','缓冲填充:','緩存填充:','緩沖填充:');
const GenIndex:array[0..1]of String=('正在生成索引:','正在生成索引:');

const szdllCount=2;
const szdll:array[0..szdllCount]of string=('7zxa.dll','7za.dll','7z.dll');

const ZipTypeCount=19;
const ZipType:array[0..ZipTypeCount]of string=('.7z','.rar','.zip','.arj','.bz2','.z','.lzh',
            '.cab','.lzma','.xar','.hfs','.dmg','.wim','.iso','.split','.rpm','.deb','.cpio',
            '.tar','.gz'
      );

const SubTypeCount=35;
      SubType:array[0..SubTypeCount]of string=('.7z','.rar','.zip','.arj','.bz2','.z','.lzh',
            '.cab','.lzma','.xar','.hfs','.dmg','.wim','.iso','.split','.rpm','.deb','.cpio',
            '.tar','.gz',
            '.lrc','.utf','.utf8','.utf-8','.srt','.smi','.rt','.txt','.ssa','.aqt','.jss',
            '.js','.ass','.mpsub','.idx','.sub'
      );
      
const MediaType:array[0..202]of string=('.7z','.rar','.zip','.arj','.bz2','.z','.lzh',
        '.cab','.lzma','.xar','.hfs','.dmg','.wim','.iso','.split','.rpm','.deb','.cpio',
        '.tar','.gz',
        '.aac','.ac3','.acc','.act','.aif','.aifc','.aiff','.amf','.amr','.amv','.ape',
        '.as','.asf','.asx',
        '.a52','.apl','.au','.avi','.avs','.bik','.bin','.cda','.cmf','.cmn','.cpk',
        '.cue','.d2v','.dat','.drc','.dsm','.dsv','.dsa','.dss','.dts','.dtswav',
        '.dv','.dvr-ms','.divx','.evo','.far','.fla','.flac','.flc','.fli','.flic','.flm',
        '.flv','.grf','.hdmov',
        '.img','.iso','.ivf','.it','.itz','.jsv','.kar','.m1a','.m2a','.m2p','.m2ts',
        '.m1v','.m2v','.m3u','.m3u8','.m4a','.m4b','.m4p','.m4v','.mac','.mdz','.mid',
        '.midi','.miz','.mjf','.mka','.mkv','.mod','.mov','.mp1','.mp2','.mp2v',
        '.mp3','.mp3pro','.mp4','.mp5','.mpa','.mpc','.mpcpl','.mpe','.mpeg','.mpg','.mpga','.mp+','.mpp',
        '.mtm','.mpv','.mpv2','.mqv','.mts','.nrg','.nsa','.nst','.nsv','.nuv','.ogg','.ogm','.okt','.pls','.pmp',
        '.pmp2','.pss','.ptm','.pva','.qt','.ra','.ram','.ratdvd','.rm','.rmi','.rmj',
        '.rmm','.rmp','.rms','.rmvb','.rmx','.rnx','.roq','.rp','.rpm','.rt','.rv','.realpix',
        '.s3m','.s3z','.scm','.sdp','.smil','.smk','.smpl','.snd','.stm','.stz','.swf','.tp','.tpr',
        '.ts','.tta','.ttpl','.ult','.umx','.vcd','.vfw','.vg2','.vid','.vivo','.vob','.voc','.vp3','.vp4','.vp5',
        '.vp6','.vp7','.vqf','.wav','.wax','.wm','.wma','.wmp','.wmv','.wmx',
        '.wpl','.wv','.wvx','.xm','.xmz','.xspf',
        '.26l','.264','.3g2','.3gp','.3gpp','.3gp2','.669'
      );

const PlaylistType:array[0..10]of string=(
        '.m3u','.asx','.wpl','.pls','.ttpl','.rmp','.xspf',
        '.smpl','.m3u8','.mpcpl','.wmx'
      );

const VideoDemuxer:array[0..5]of string=(
        'avinini','avini','avi','mpegts','lavf','lavfpref'
      );

const AudioDemuxer:array[0..11]of string=(
        'mkv','mpegts','mpegps','mpegpes','mpeges',
        'mpeg4es','h264es','lavf','lavfpref','avinini','avini','avi'
      );

type TStatus=(sNone,sOpening,sClosing,sPlaying,sPaused,sStopped,sError);
var Status:TStatus;

type TWin9xWarnLevel=(wlWarn,wlReject,wlAccept);
var Win9xWarnLevel:TWin9xWarnLevel;

var HomeDir,TempDir,SystemDir,AppdataDir,NoAccess,AudioFile:string;
var ArcPW,TmpPW,DisplayURL,MediaURL,TmpURL,ArcMovie:WideString;
    substring,Vobfile,winos,afChain:String;
    subfont,osdfont,ShotDir,LyricDir,LyricURL,LyricF:String;
    Ccap,Acap:WideString;
    DemuxerName,CacheV:string;
    MplayerLocation,WadspL,AsyncV:string;
    MAspect,subcode,MaxLenLyric,VideoOut:string;
    FirstOpen,Fd,Async,Cache,uof,DragM,FilterDrop:boolean;
    Wid,Dreset,UpdateSkipBar,Pri,HaveLyric,HaveChapters,HaveMsg:boolean;
    AutoPlay,ETime,InSubDir,SPDIF,ML,GUI,PScroll:boolean;
    Shuffle,Loop,OneLoop,Uni,Utf,empty,UseUni:boolean;
    ControlledResize,ni,nobps,Dnav,lavf,UseekC,vsync:boolean;
    Flip,Mirror,Yuy2,Eq2,LastEq2,Dda,LastDda,Wadsp:boolean;
    WantFullscreen,WantCompact,AutoQuit:boolean;
var VideoID,Ch,CurPlay,LyricS:integer;
    AudioID,MouseMode,SubPos:integer;
    SubID,TID,CID,AID,VCDST,VCDET,CDID:integer;
    subcount,Bp,Ep,CurrentLocale,afCount:integer;
    Lastsubcount,DirHIdx,DirHSub:integer;
    AudiochannelsID,CurLyric,NextLyric,LyricCount:integer;
    VobsubCount,VobFileCount:integer;
    CurrentSubCount,OnTop,VobAndInterSubCount,IntersubCount:integer;
    InterW,InterH,OldX,OldY,Scale,LastScale:integer;
    MFunc,CBHSA,bri,briD,contr,contrD,hu,huD,sat,satD,gam,gamD:integer;
var AudioOut,AudioDev,Postproc,Deinterlace,Aspect:integer;
    ReIndex,SoftVol,RFScr,dbbuf,Defaultslang,Firstrun,Volnorm,Dr:boolean;
    Loadsrt,LoadVob,Loadsub,Expand,TotalTime,TTime:integer;
    Params,Duration,DTFormat:string;
var HaveAudio,HaveVideo,LastHaveVideo,ChkAudio,ChkVideo,ChkStartPlay:boolean;
    NativeWidth,NativeHeight,MonitorID,MonitorW,MonitorH:integer;
    LastPos,SecondPos,OSDLevel,OpenM,MSecPos:integer;
var Volume,MWC,CP:integer;
    tEnd,Mute,LastMute,Ass,Efont,ISub,AutoNext,UpdatePW:boolean;
    FormatSet:TFormatSettings;
    ExplicitStop,Rot,DefaultFontIndex:integer;
    TextColor,OutColor,LTextColor,LbgColor,LhgColor:Longint;
    Speed,FSize,Fol,FB,dy,LyricV,Adelay,Sdelay:real;
    CurMonitor:TMonitor;
    HMonitorList:array of HMonitor;
    FontNames,FontPaths:TStringList;
    
var StreamInfo:record
      FileName, FileFormat, PlaybackTime: string;
      Video:record
        Decoder, Codec: string;
        Bitrate, Width, Height: integer;
        FPS, Aspect: real;
      end;
      Audio:record
        Decoder, Codec: string;
        Bitrate, Rate, Channels: integer;
      end;
      ClipInfo:array[0..9]of record
        Key, Value: string;
      end;
    end;

procedure AddChain(var Count:integer; var rs:string; const s:string);
function CheckOption(OPTN:string):boolean;
function SecondsToTime(Seconds:integer):String;
function TimeToSeconds(TimeCode:string):integer;
function EscapeParam(const Param:string):string;
function EscapePath(Path:string):string;
function CheckSubfont(Sfont:string):string;
function CheckInfo(const Map:array of string; Value:string):integer;
function ColorToStr(Color:Longint):string;
function GetShellDirectory(csidl:integer):String;
procedure SetLastPos;
procedure Init;
procedure Start;
procedure Stop;
procedure Restart;
procedure ForceStop;
function Running:boolean;
function IsLoaded(ArcType:string):boolean;
function AddMovies(ArcName,PW:widestring; Add:boolean; ArcType:string):integer;
procedure ExtractMovie(ArcName,MovieName,PW:widestring; ArcType:string);
procedure ExtractLyric(ArcName,PW:WideString; ArcType:string; Mode:integer);
function ExtractSub(ArcName,PW:WideString; ArcType:string):String;
procedure Terminate;
procedure SendCommand(Command:String);
procedure SendVolumeChangeCommand(Vol:integer);
procedure ResetStreamInfo;

implementation
uses Main,Log,plist,Info,UnRAR,Equalizer,Locale,Options,About,AddDir,Help,SevenZip;

type TClientWaitThread=class(TThread)
                         private procedure ClientDone;
                         protected procedure Execute; override;
                         public hProcess:Cardinal;
                       end;
type TProcessor=class(TThread)
                  private Data:String;
                  private procedure Process;
                  protected procedure Execute; override;
                  public hPipe:Cardinal;
                end;

var ClientWaitThread:TClientWaitThread;
    Processor:TProcessor;
    ClientProcess,ReadPipe,WritePipe:Cardinal;
    FirstChance:boolean;
    ExitCode:DWORD;
    LastLine:string;
    LineRepeatCount:integer;
    LastCacheFill:string;

procedure HandleInputLine(Line:String); forward;
procedure HandleIDLine(ID, Content: string); forward;

function IsLoaded(ArcType:string):boolean;
begin
  if ArcType='.rar' then begin
    if IsRarLoaded=0 then LoadRarLibrary;
    Result:=IsRarLoaded<>0;
    if not Result then begin
      if Is7zLoaded=0 then Load7zLibrary;
      Result:=Is7zLoaded>2;
    end;
  end
  else if ArcType='.zip' then begin
    if IsZipLoaded=0 then LoadZipLibrary;
    Result:=IsZipLoaded<>0;
    if not Result then begin
      if Is7zLoaded=0 then Load7zLibrary;
      Result:=Is7zLoaded>2;
    end;
  end
  else begin
    if Is7zLoaded=0 then Load7zLibrary;
    if ArcType='.7z' then begin
      Result:=Is7zLoaded<>0;
      if not Result then begin
        if IsZipLoaded=0 then LoadZipLibrary;
        Result:=IsZipLoaded<>0;
      end;
    end
    else Result:=Is7zLoaded>2;
  end;
end;

function AddMovies(ArcName,PW:widestring; Add:boolean; ArcType:string):integer;
begin
  Result:=0;
  if ArcType='.rar' then begin
    if IsRarLoaded<>0 then Result:=AddRarMovies(ArcName,PW,Add)
    else if Is7zLoaded>2 then Result:=Add7zMovies(ArcName,PW,Add);
  end
  else if ArcType='.zip' then begin
    if IsZipLoaded<>0 then Result:=AddZipMovies(ArcName,PW,Add)
    else if Is7zLoaded>2 then Result:=Add7zMovies(ArcName,PW,Add);
  end
  else if ArcType='.7z' then begin
    if Is7zLoaded<>0 then Result:=Add7zMovies(ArcName,PW,Add)
    else if IsZipLoaded<>0 then Result:=AddZipMovies(ArcName,PW,Add);
  end
  else if Is7zLoaded>2 then Result:=Add7zMovies(ArcName,PW,Add);
end;

procedure ExtractMovie(ArcName,MovieName,PW:widestring; ArcType:string);
begin
  if ArcType='.rar' then begin
    if IsRarLoaded<>0 then ExtractRarMovie(ArcName,MovieName,PW)
    else if Is7zLoaded>2 then Extract7zMovie(ArcName,MovieName,PW);
  end
  else if ArcType='.zip' then begin
    if IsZipLoaded<>0 then ExtractZipMovie(ArcName,MovieName,PW)
    else if Is7zLoaded>2 then Extract7zMovie(ArcName,MovieName,PW);
  end
  else if ArcType='.7z' then begin
    if Is7zLoaded<>0 then Extract7zMovie(ArcName,MovieName,PW)
    else if IsZipLoaded<>0 then ExtractZipMovie(ArcName,MovieName,PW);
  end
  else if Is7zLoaded>2 then Extract7zMovie(ArcName,MovieName,PW);
end;

procedure ExtractLyric(ArcName,PW:WideString; ArcType:string; Mode:integer);
begin
  if ArcType='.rar' then begin
    if IsRarLoaded<>0 then ExtractRarLyric(ArcName,PW,Mode)
    else if Is7zLoaded>2 then Extract7zLyric(ArcName,PW,Mode);
  end
  else if ArcType='.zip' then begin
    if IsZipLoaded<>0 then ExtractZipLyric(ArcName,PW,Mode)
    else if Is7zLoaded>2 then Extract7zLyric(ArcName,PW,Mode);
  end
  else if ArcType='.7z' then begin
    if Is7zLoaded<>0 then Extract7zLyric(ArcName,PW,Mode)
    else if IsZipLoaded<>0 then ExtractZipLyric(ArcName,PW,Mode);
  end
  else if Is7zLoaded>2 then Extract7zLyric(ArcName,PW,Mode);
end;

function ExtractSub(ArcName,PW:WideString; ArcType:string):String;
begin
  Result:='';
  if ArcType='.rar' then begin
    if IsRarLoaded<>0 then Result:=ExtractRarSub(ArcName,PW)
    else if Is7zLoaded>2 then Result:=Extract7zSub(ArcName,PW);
  end
  else if ArcType='.zip' then begin
    if IsZipLoaded<>0 then Result:=ExtractZipSub(ArcName,PW)
    else if Is7zLoaded>2 then Result:=Extract7zSub(ArcName,PW);
  end
  else if ArcType='.7z' then begin
    if Is7zLoaded<>0 then Result:=Extract7zSub(ArcName,PW)
    else if IsZipLoaded<>0 then Result:=ExtractZipSub(ArcName,PW);
  end
  else if Is7zLoaded>2 then Result:=Extract7zSub(ArcName,PW);
end;

function SplitLine(var Line:string):string;
var i:integer;
begin
  i:=Pos(#32,Line);
  if (length(Line)<72) OR (i<1) then begin
    Result:=Line;
    Line:='';
    exit;
  end;
  if(i>71) then begin
    Result:=Copy(Line,1,i-1);
    Delete(Line,1,i);
    exit;
  end;
  i:=72; while Line[i]<>#32 do dec(i);
  Result:=Copy(Line,1,i-1);
  Delete(Line,1,i);
end;

procedure AddChain(var Count:integer; var rs:string; const s:string);
begin
  inc(Count);
  if Count>1 then rs:=rs+','+s
  else rs:=s;
end;

function CheckOption(OPTN:string):boolean;
begin
  OPTN:=LowerCase(OPTN); Result:=False;
  if OPTN='-fs' then begin WantFullscreen:=True; Result:=True; end;
  if OPTN='-compact' then begin WantCompact:=True; Result:=True; end;
  if OPTN='-autoquit' then begin AutoQuit:=True; Result:=True; end;
  if OPTN='-enqueue' then Result:=True;
end;

function EscapeParam(const Param:string):string;
begin
  if Pos(#32,Param)>0 then Result:=#34+Param+#34 else Result:=Param;
end;

function EscapePath(Path:string):string;
var i:integer;
begin
  for i:=1 to length(Path) do if Path[i]='\' then Path[i]:='/';
  Result:=Path;
end;

function SecondsToTime(Seconds:integer):String;
var m,s:integer;
begin
  if Seconds<0 then Seconds:=0;
  m:=(Seconds DIV 60) MOD 60;
  s:= Seconds MOD 60;
  Result:=IntToStr(Seconds DIV 3600)
          +':'+char(48+m DIV 10)+char(48+m MOD 10)
          +':'+char(48+s DIV 10)+char(48+s MOD 10);
end;

function TimeToSeconds(TimeCode:string):integer;
begin
  Result:=(StrToIntDef(copy(TimeCode,1,2),0)*60+StrToIntDef(copy(TimeCode,4,2),0))*60+StrToIntDef(copy(TimeCode,7,2),0);
end;

function CheckInfo(const Map:array of string; Value:string):integer;
var i:integer;
begin
  for i:=Low(Map) to High(Map) do
    if Map[i]=Value then begin
      Result:=i;
      exit;
    end;
  Result:=-1;
end;

function CheckSubfont(Sfont:string):string;
var i:integer; s:string;
begin
  if FileExists(Sfont) then
    Result:=Sfont
  else begin
    Result:='';
    for i:=0 to FontPaths.Count-1 do begin
      s:=Trim(LowerCase(Sfont));
      if (LowerCase(FontNames[i])=s) or
         (LowerCase(FontPaths[i])=s) then begin
        Result:=FontPaths[i];
        exit;
      end;
    end;

    if Result='' then begin
      if DefaultFontIndex>-1 then Result:=FontPaths[DefaultFontIndex]
      else if FileExists(SystemDir+'Fonts\arial.ttf') then
        Result:=SystemDir+'Fonts\arial.ttf'
      else if FileExists(HomeDir+'mplayer\subfont.ttf') then
        Result:=HomeDir+'mplayer\subfont.ttf';
    end;
  end;
end;

function ColorToStr(Color:Longint):string;
var i:integer; s:string;
begin
  s:=Format('%.8x',[Color]);
  for i:=length(s) downto 1 do Result:=Result+s[i];
end;

procedure SetLastPos;
begin
  if not HaveVideo then
      LastPos:=SecondPos
  else begin
    if SecondPos<15 then
      LastPos:=SecondPos-5
    else
      LastPos:=SecondPos-15;
  end;
end;

function GetShellDirectory(csidl:integer):String;
var Buffer: PAnsiChar;
begin
  GetMem(Buffer,MAX_PATH+1);
  SHGetFolderPath(0,csidl,0,0,Buffer);
  Result:=Buffer;
  FreeMem(Buffer);
end;

procedure Init;
begin
  SystemDir:=IncludeTrailingPathDelimiter(GetEnvironmentVariable('windir'));
  TempDir:=IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP'))+'MPUI\';
  HomeDir:=IncludeTrailingPathDelimiter(ExtractFileDir(ExpandFileName(ParamStr(0))));
  AppdataDir:=GetShellDirectory(CSIDL_COMMON_APPDATA);
  if AppdataDir='' then AppdataDir:=HomeDir else AppdataDir:=IncludeTrailingPathDelimiter(AppdataDir);
  ShotDir:=GetShellDirectory(CSIDL_MYPICTURES);
  if ShotDir='' then ShotDir:=HomeDir else ShotDir:=IncludeTrailingPathDelimiter(ShotDir);
  if DirectoryExists(ShotDir+'MPUISnap') then ShotDir:=ShotDir+'MPUISnap'
  else if CreateDir(ShotDir+'MPUISnap') then ShotDir:=ShotDir+'MPUISnap';
  // check for Win9x
  if Win32Platform<VER_PLATFORM_WIN32_NT then begin
    Win9xWarnLevel:=wlWarn; winos:='WIN9X';
  end
  else begin
    Win9xWarnLevel:=wlAccept; winos:='WINNT';
  end;

  if (Win32MajorVersion=5) and (Win32MinorVersion>0) then begin
     MainForm.Imagery.Clear; winos:='WINXP';
  end;

  MWC:=GetSystemMetrics(SM_CYCAPTION);
  GetLocaleFormatSettings(GetUserDefaultLCID,FormatSet);
  if Pos('ddd',FormatSet.ShortDateFormat)=0 then FormatSet.ShortDateFormat:='ddd '+FormatSet.ShortDateFormat;
  if Pos('ddd',FormatSet.LongDateFormat)=0 then FormatSet.LongDateFormat:='dddd '+FormatSet.LongDateFormat;
  SetThreadLocale(LOCALE_SYSTEM_DEFAULT);
  {//在user_def和sys_def不同时，为了使mpui能够正常播放sys_def的文件添加了这句，但菜单可能显示不正常。
  原因就是string和widestring在ansi环境下默认转化造成的。}
end;

procedure Start;
var DummyPipe1,DummyPipe2:THandle;
    si:TStartupInfo;
    pi:TProcessInformation;
    sec:TSecurityAttributes;
    CmdLine,s:string;
    Success:boolean; Error:DWORD;
    ErrorMessage:array[0..1023]of char;
    i,t:integer; UnRART:TUnRARThread;
begin
  if (ClientProcess<>0) or (length(MediaURL)=0) then exit;
  Status:=sOpening;
  if FirstOpen then begin
    MainForm.LTime.Caption:='';
    MainForm.LStatus.Caption:=LOCstr_Status_Opening;
  end;

  if Win9xWarnLevel=wlWarn then begin
    case MessageDlg(LOCstr_Win9x_Prompt,mtWarning,[mbYes,mbNo],0) of
      mrYes: Win9xWarnLevel:=wlAccept;
      mrNo:  Win9xWarnLevel:=wlReject;
    end;
  end;
  if Win9xWarnLevel=wlReject then begin
    LogForm.TheLog.Text:=LOCstr_NoSuport_OS_Prompt;
    Status:=sError;
    MainForm.UpdateStatus;
    MainForm.SetupStop;
    exit;
  end;

  FirstChance:=true; afCount:=0; afChain:='';
  ClientWaitThread:=TClientWaitThread.Create(true);
  Processor:=TProcessor.Create(true);
  if ML then CmdLine:=EscapeParam(MplayerLocation)
  else CmdLine:=EscapeParam(HomeDir+'mplayer.exe');
  if not GUI then CmdLine:=CmdLine+' -nogui -noconsolecontrols';
  CmdLine:=CmdLine+' -slave -identify -noquiet -nofs -term-osd-esc "[Fenny8248] "'
          +' -hr-mp3-seek -subalign 1 -spualign 1 -sub-fuzziness 1 -subfont-autoscale 2'
          +' -subfont-osd-scale 4.8 -subfont-text-scale '+FloatToStr(FSize)
          +' -subfont-outline '+FloatToStr(Fol)+' -subfont-blur '+FloatToStr(FB);

  if AudioFile<>'' then CmdLine:=CmdLine+' -audiofile '+EscapeParam(AudioFile);
  if Async then CmdLine:=CmdLine+' -autosync '+AsyncV;

  if Pri then begin
    CmdLine:=CmdLine+' -priority abovenormal';
    SetPriorityClass(GetCurrentProcess,HIGH_PRIORITY_CLASS);
  end
  else SetPriorityClass(GetCurrentProcess,ABOVE_NORMAL_PRIORITY_CLASS);
  s:=CheckSubfont(subfont);
  if uof then begin
    if FileExists(s) then CmdLine:=CmdLine+' -subfont '+EscapeParam(s);
    s:=CheckSubfont(osdfont);
  end;
  if FileExists(s) then CmdLine:=CmdLine+' -font '+EscapeParam(s);

  if MonitorID>0 then CmdLine:=CmdLine+' -adapter '+IntToStr(MonitorID);
  if UseUni then CmdLine:=CmdLine+' -msgcharset noconv';
  if Fd then CmdLine:=CmdLine+' -framedrop';
  if ni then CmdLine:=CmdLine+' -ni';
  if nobps then CmdLine:=CmdLine+' -nobps';
  if ReIndex then CmdLine:=CmdLine+' -idx';
  if SoftVol then CmdLine:=CmdLine+' -softvol -softvol-max 1000';
  if Uni then CmdLine:=CmdLine+' -unicode';
  if Utf then CmdLine:=CmdLine+' -utf8';
  if lavf then CmdLine:=CmdLine+' -demuxer lavf';
  if vsync then CmdLine:=CmdLine+' -vsync';
  if Wid and (winos<>'WIN9X') then
    CmdLine:=CmdLine+' -colorkey 0x101010 -nokeepaspect'+' -wid '+IntToStr(MainForm.IPanel.Handle)
  else if ontop>0 then CmdLine:=CmdLine+' -ontop';
  if OSDLevel<>1 then CmdLine:=CmdLine+' -osdlevel '+IntToStr(OSDLevel);
  if Dr then CmdLine:=CmdLine+' -dr';
  if dbbuf then CmdLine:=CmdLine+' -double';
  if Ass then begin
    CmdLine:=CmdLine+' -ass';
    if Efont then CmdLine:=CmdLine+' -embeddedfonts';
    CmdLine:=CmdLine+' -ass-color '+ColorToStr(TextColor)
            +' -ass-border-color '+ColorToStr(OutColor);
    if FSize<3.4 then CmdLine:=CmdLine+' -ass-font-scale 0.1'
    else CmdLine:=CmdLine+' -ass-font-scale '+FloatToStr(FSize-3.3);
    if ISub then CmdLine:=CmdLine+' -vf-pre ass';
  end;

  case Expand of
    0: if ISub and (not Ass) then CmdLine:=CmdLine+' -vf-pre expand=osd=1 -noslices';
    1: if ISub and (not Ass) then CmdLine:=CmdLine+' -vf-pre expand=:-80::40:1 -noslices'
       else CmdLine:=CmdLine+' -vf-pre expand=:-80::40';
    2: if ISub and (not Ass) then CmdLine:=CmdLine+' -vf-pre expand=::::1:4/3 -noslices'
       else CmdLine:=CmdLine+' -vf-pre expand=aspect=4/3';
  end;

  if Flip then CmdLine:=CmdLine+' -vf-add flip';
  if Mirror then CmdLine:=CmdLine+' -vf-add mirror';

  case Rot of
      1:CmdLine:=CmdLine+' -vf-add rotate=1';
      2:CmdLine:=CmdLine+' -vf-add rotate=2';
  end;
  
  s:=Trim(LowerCase(VideoOut));
  if s<>'' then begin
    if s='novideo' then CmdLine:=CmdLine+' -novideo'
    else if s<>'auto' then CmdLine:=CmdLine+' -vo '+s+',';
  end;

  if not Dda then begin
    if Yuy2 then CmdLine:=CmdLine+' -vf-add yuy2';
    if Eq2 then CmdLine:=CmdLine+' -vf-add eq2';
    case Deinterlace of
      1:CmdLine:=CmdLine+' -vf-add pp=fd';
      2:CmdLine:=CmdLine+' -vf-add kerndeint';
    end;
  end;

  if Speed<>1 then CmdLine:=CmdLine+' -speed '+FloatToStr(Speed);
  if Adelay<>0 then CmdLine:=CmdLine+' -delay '+FloatToStr(Adelay);
  if Sdelay<>0 then CmdLine:=CmdLine+' -subdelay '+FloatToStr(Sdelay);
  if SPDIF then CmdLine:=CmdLine+' -afm hwac3';

  case Postproc of
    1:CmdLine:=CmdLine+' -autoq 10 -vf-add pp';
    2:CmdLine:=CmdLine+' -vf-add pp=ac';
  end;

  case AudioOut of
    0:CmdLine:=CmdLine+' -nosound';
    1:CmdLine:=CmdLine+' -ao null';
    2:CmdLine:=CmdLine+' -ao win32,';
    3:CmdLine:=CmdLine+' -ao dsound:device='+IntToStr(AudioDev)+',';
  end;

  case Ch of
    1:CmdLine:=CmdLine+' -channels 4';
    2:CmdLine:=CmdLine+' -channels 6';
  end;

  if Firstrun then begin
    ClearTmpFiles(TempDir); Lyric.ClearLyric;
    if Defaultslang then CmdLine:=CmdLine+' -alang zh,ch,tw,en -slang zh,ch,tw,en';

    if FileExists(LyricURL) then begin //拖放的歌词或用户指定的歌词
      TmpURL:=ExtractFileName(MediaURL);
      TmpURL:=LowerCase(Copy(TmpURL,1,length(TmpURL)-length(ExtractFileExt(MediaURL))));
      s:=ExtractFileName(LyricURL);
      s:=LowerCase(Copy(s,1,length(s)-4));
      if TmpURL=s then HaveLyric:=Lyric.ParseLyric(LyricURL);
    end;
    s:=LowerCase(ExtractFileExt(MediaURL));
    if CheckInfo(ZipType,s)>-1 then begin
      i:=Pos(':',DisplayURL);
      if i>0 then ArcPW:=copy(DisplayURL,i+1,length(DisplayURL)-i)
      else ArcPW:='';
      i:=Pos(' <-- ',DisplayURL);
      if i>0 then ArcMovie:=copy(DisplayURL,1,i-1)
      else ArcMovie:=DisplayURL;
      if not HaveLyric then begin  //播放的Arc文件所在的目录下有包内当前播放文件同名的歌词
        TmpURL:=copy(ArcMovie,1,length(ArcMovie)-length(ExtractFileExt(ArcMovie)))+'.lrc';
        LyricURL:=ExtractFilePath(MediaURL)+TmpURL;
        if not FileExists(LyricURL) then
          LyricURL:=IncludeTrailingPathDelimiter(LyricDir)+TmpURL;
        if FileExists(LyricURL) then HaveLyric:=Lyric.ParseLyric(LyricURL);
      end;
    end
    else i:=-1;

    Vobfile:=copy(MediaURL,1,length(MediaURL)-length(ExtractFileExt(MediaURL)));
    if not HaveLyric then begin //当前播放文件所在的目录下有同名的歌词
      LyricURL:=Vobfile+'.lrc';
      if FileExists(LyricURL) then
        HaveLyric:=Lyric.ParseLyric(LyricURL)
      else begin
        LyricURL:=ExtractFileName(MediaURL);
        LyricURL:=IncludeTrailingPathDelimiter(LyricDir)
               +copy(LyricURL,1,length(LyricURL)-length(ExtractFileExt(MediaURL)))+'.lrc';
        if FileExists(LyricURL) then HaveLyric:=Lyric.ParseLyric(LyricURL);
      end;
    end;

    if FileExists(Vobfile+'.idx') then DirHIdx:=1;
    if FileExists(Vobfile+'.sub') then DirHSub:=1;
    if (DirHIdx+DirHSub)=2 then LoadVob:=1;
    for t:=Low(ZipType) to High(ZipType) do begin
      if FileExists(Vobfile+ZipType[t]) then begin
        if IsLoaded(ZipType[t]) then begin   //当前播放文件所在的目录下有同名Arc文件中的同名歌词
          if (not HaveLyric) and (i<>0) then ExtractLyric(Vobfile+ZipType[t],ArcPW,ZipType[t],i);
          if LoadVob<>1 then begin
            TmpURL:=ExtractSub(Vobfile+ZipType[t],ArcPW,ZipType[t]);
            if TmpURL<>'' then begin Vobfile:=TmpURL; LoadVob:=1; end;
          end;
        end;
      end;
    end;

    DirHIdx:=0; DirHSub:=0;

    if i>0 then begin
      TmpURL:=MediaURL; //避免系统调度UNRART线程的不确定性造成线程执行时获取的是已经变化的MediaURL
      tEnd:=false;
      UnRART:=TUnRARThread.Create(true);
      UnRART.FreeOnTerminate:=true;
      UnRART.Priority:=tpTimeCritical;
      if IsLoaded(s) then begin
        if ((s='.zip') and (IsZipLoaded<>0)) or ((s='.7z') and (Is7zLoaded=0)) then
          MediaURL:=TempDir+ArcMovie
        else MediaURL:=TempDir+'hcb428'+ExtractFileExt(ArcMovie);

        UNRART.Resume;
        SwitchToThread;

        while not tEnd do begin
          WaitForSingleObject(UNRART.Handle,100);
          if WideFileExists(MediaURL) then begin
            WaitForSingleObject(UNRART.Handle,1000);
            Application.ProcessMessages;
            break;
          end;
          Application.ProcessMessages;
        end;
        if not WideFileExists(MediaURL) then begin
         MainForm.LStatus.Caption:=''; exit;
        end;
      end;
    end;

  end;

   {   ____________________________________________________________
     |   vob (-vob vobfile)         | ID_VOBSUB_ID   |             |
     |______________________________|________________|             |
     |  inter (DVD/MKV/OGM)         | ID_SUBTITLE_ID |             |
     |______________________________|________________|___          |
     | lastsub (-sub substring)     |                |   |__       |
     |    (re)start                 |                |   |  |      |
     |______________________________|                |___|  |   CurrentSub
     | autoloaded Sub               |                |      |      |
     | (samedirSub)                 | ID_FILE_SUB_ID |    SubCount |
     |  (re)start                   |                |      |      |
     |______________________________|                |___ _ |______|
     | running (sub_load) loadsub=1 |                |   |__|
     |______________________________|________________|___|
  }

  if Loadsrt>0 then begin  //必须放到LoadVOB的判断前面，因为要考虑到VOB字幕加载失败时需要对SubID进行调整
    if Loadsrt=1 then begin
      if (SubID>=(VobAndInterSubCount+Lastsubcount)) and (SubID<CurrentSubCount) then
        SubID:=SubID+(subcount-Lastsubcount)   //Adjust location of subtitles autoloaded调整自动加载的外部字幕的位置
      else
        if SubID>=CurrentSubCount then  //Adjust location of subtitles recently loaded调整新近加载的外部字幕的位置
          SubID:=SubID-(CurrentSubCount-Lastsubcount-VobAndInterSubCount);
      Lastsubcount:=subcount;
      Loadsrt:=2;
    end;
    if substring<>'' then CmdLine:=CmdLine+' -sub '+substring;
  end;

  if (LoadVob>0) and (LoadVob<3)then begin //必须放到Loadsrt的判断后面，因为要考虑到VOB字幕加载失败时需要对SubID进行调整
    if LoadVob=1 then begin
      LoadVob:=3; SubID:=SubID-VobsubCount; //考虑到VOB字幕加载失败时需要对SubID进行调整
    end;
    if Vobfile<>'' then CmdLine:=CmdLine+' -vobsub '+EscapeParam(Vobfile);
  end;

  if (VideoID>=0) then CmdLine:=CmdLine+' -vid '+IntToStr(VideoID);
  if (AudioID>=0) AND (AudioOut>0) then CmdLine:=CmdLine+' -aid '+IntToStr(AudioID);
  if subcode<>'' then begin
    if Pos(' (',subcode)>0 then
      CmdLine:=CmdLine+' -subcp '+copy(subcode,1,Pos(' (',subcode)-1)
    else CmdLine:=CmdLine+' -subcp '+subcode;
  end;
  if MAspect<>'' then begin
    if Trim(LowerCase(MAspect))='default' then
      CmdLine:=CmdLine+' -monitoraspect '+IntTostr(Screen.Width)+':'+IntTostr(Screen.Height)
    else CmdLine:=CmdLine+' -monitoraspect '+MAspect;
  end;
  case Aspect of
    1: CmdLine:=CmdLine+' -aspect 4:3';
    2: CmdLine:=CmdLine+' -aspect 16:9';
    3: CmdLine:=CmdLine+' -aspect 2.35';
    4: CmdLine:=CmdLine+' -aspect 14:9';
    5: CmdLine:=CmdLine+' -aspect 5:4';
    6: CmdLine:=CmdLine+' -aspect 16:10';
    7: CmdLine:=CmdLine+' -aspect 2.21';
    8: CmdLine:=CmdLine+' -aspect 1';
    9: CmdLine:=CmdLine+' -aspect 1.22';
   10: begin if InterW>3*InterH then InterW:=3*InterH;
        CmdLine:=CmdLine+' -aspect '+IntToStr(InterW)+':'+IntToStr(InterH);
       end;  
  end;

  case AudiochannelsID of
    1: AddChain(afCount,afChain,'channels=2:2:0:1:0:0');
    2: AddChain(afCount,afChain,'channels=2:2:1:0:1:1');
    3: AddChain(afCount,afChain,'pan=2:0.65:0.35:0.35:0.65');
  end;
  if Wadsp and (WadspL<>'') then AddChain(afCount,afChain,'wadsp='+EscapeParam(WadspL));
  if Volnorm then AddChain(afCount,afChain,'volnorm');

  if afCount>0 then CmdLine:=CmdLine+' -af '+afChain;
  if length(Params)>0 then CmdLine:=CmdLine+#32+Params;
  CmdLine:=CmdLine+' -subpos '+IntToStr(SubPos)+' -vf-add screenshot';
  if FirstOpen and Mainform.MSIE.Checked and (Bp>0) then begin
    if Bp>15 then
      Bp:=Bp-15
    else
      Bp:=Bp-5;
    if Bp>LastPos then LastPos:=Bp;
  end;
  if Copy(MediaURL,1,12)=' -dvd-device' then begin
    if TotalTime>0 then begin
      i:=0;
      if HaveChapters then begin
        s:=MainForm.MDVDT.Items[TID+2].Items[0].Items[CID-1].Caption;
        s:=Copy(s,pos('(',s)+1,8);
        i:=TimeToSeconds(s);
      end;
      if Dreset then LastPos:=i else LastPos:=LastPos+i;
    end;
    if LastPos>0 then CmdLine:=CmdLine+' -ss '+SecondsToTime(LastPos);

    if Dnav then begin
      CmdLine:=CmdLine+' -nocache';
      CmdLine:=CmdLine+MediaURL+'nav://';
    end
    else begin
      if Cache then CmdLine:=CmdLine+' -cache '+CacheV;
      CmdLine:=CmdLine+MediaURL+'://';
    end;

    if Firstrun then TID:=StrToIntDef(copy(DisplayURL,5,Pos(' <-- ',DisplayURL)-5),TID);
    CmdLine:=CmdLine+IntToStr(TID);
    if CID>1 then CmdLine:=CmdLine+' -chapter '+IntToStr(CID);
    if AID>1 then CmdLine:=CmdLine+' -dvdangle '+IntToStr(AID);
  end
  else begin
    if LastPos>0 then CmdLine:=CmdLine+' -ss '+SecondsToTime(LastPos);
    if Cache then CmdLine:=CmdLine+' -cache '+CacheV;
    if Copy(MediaURL,1,14)=' -cdrom-device' then begin
      CmdLine:=CmdLine+MediaURL;
      if CDID>1 then CmdLine:=CmdLine+IntToStr(CDID);
    end
    else CmdLine:=CmdLine+#32+EscapeParam(MediaURL);
  end;

  with LogForm do begin
    TheLog.Clear;
    AddLine(LOCstr_CmdLine_Prompt);
    s:=CmdLine;
    while length(s)>0 do
      AddLine(SplitLine(s));
      if (winos='WINXP') and (Byte(GetUserDefaultLangID)=LANG_CHINESE) then
        AddLine(
'                   ╭= = = = = = = = = = = = = = = = ╮'^M^J+
'                    ║  ¤╭⌒╮ ╭⌒╮欢迎使用        ║'^M^J+
'                    ║  ╱◥████◣ ╭⌒╮  MPUI       ║'^M^J+
'    ╭= = = = = = = ┤ ︱田︱田田| ╰--------------   ├= = = = = = = ╮'^M^J+
'    ║               ║ ╬=╬=╬=╬=╬=╬=╬=╬=╬=╬=╬=╬=╬=╬=╬  ║               ║'^M^J+
'    ║               ║ http://mpui.sourceforge.net    ║               ║'^M^J+
'    ║              ╰= = = = = = = = = = = = = = = = ╯              ║'^M^J+
'    ║                                    zｚＺ ^﹋  ﹏               ║'^M^J+
'   ╱◥███◣^^╪   携起手来,共创美好未来      ●●╮                  ║'^M^J+
'  ︱田︱田 ︱                               /█∨█\                   ║'^M^J+
'   --------       我们会做得更好 ！          ∏  ∏                    ║'^M^J+
'    ║            ╔┯╗  ╔┯╗  ╔┯╗  ╔┯╗  ╔┯╗  ╔┯╗  ╔┯╗            ║'^M^J+
'    ╰= = = = = ┠似┨┠猪┨┠不┨┠怕┨┠开┨┠水┨┠烫┨= = = = = ╯'^M^J+
'                 ╚┷╝  ╚┷╝  ╚┷╝  ╚┷╝  ╚┷╝  ╚┷╝  ╚┷╝'^M^J+
'=========================================================================='^M^J+
'☆猪★猪☆猪★猪☆猪★猪☆猪★猪☆猪★猪☆猪★猪☆猪★猪☆猪★猪☆猪★猪☆'^M^J+
'=========================================================================='^M^J)
     else
       AddLine('');
  end;

  if Loadsub<>2 then Loadsub:=-1;
  ExplicitStop:=0; Dreset:=false;
  Firstrun:=false; LastMute:=true;
  ResetStreamInfo; LastCacheFill:='';
  ChkVideo:=true; ChkAudio:=true;
  ChkStartPlay:=true; HaveChapters:=false;
  StreamInfo.FileName:=MediaURL;
  LastLine:=''; LineRepeatCount:=0;
  VobsubCount:=0; IntersubCount:=0;
  with MainForm do begin
    for i:=MDVDT.Count-1 downto 3 do MDVDT.delete(i);
    MDVDT.Visible:= (Copy(MediaURL,1,12)=' -dvd-device');
    MVideo.Clear; MVideo.Visible:=false;
    MAudio.Clear; MAudio.Visible:=false;
    MSubtitle.Clear; MSubtitle.Visible:=false;
    MVCDT.Clear; MVCDT.Visible:=false;
  end;

  with sec do begin
    nLength:=sizeof(sec);
    lpSecurityDescriptor:=nil;
    bInheritHandle:=true;
  end;
  CreatePipe(ReadPipe,DummyPipe1,@sec,0);

  with sec do begin
    nLength:=sizeof(sec);
    lpSecurityDescriptor:=nil;
    bInheritHandle:=true;
  end;
  CreatePipe(DummyPipe2,WritePipe,@sec,0);

  FillChar(si,sizeof(si),0);
  si.cb:=sizeof(si);
  si.dwFlags:=STARTF_USESTDHANDLES;
  si.hStdInput:=DummyPipe2;
  si.hStdOutput:=DummyPipe1;
  si.hStdError:=DummyPipe1;
  Success:=CreateProcess(nil,PChar(CmdLine),nil,nil,true,DETACHED_PROCESS,nil,PChar(ShotDir),si,pi);
  Error:=GetLastError;

  CloseHandle(DummyPipe1);
  CloseHandle(DummyPipe2);

  if not Success then begin
    LogForm.AddLine(LOCstr_Error1_Prompt+IntToStr(Error)+LOCstr_Error2_Prompt);
    FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM,nil,Error,0,@ErrorMessage[0],1023,nil);
    LogForm.AddLine(ErrorMessage);
    if Error=2 then LogForm.AddLine(LOCstr_Check_Mplayer_Prompt);
    ClientWaitThread.ClientDone;  // this is a synchronized function, so I may
                                  // call it here from this thread as well
    exit;
  end;

  ClientProcess:=pi.hProcess;
  ClientWaitThread.hProcess:=ClientProcess;
  Processor.hPipe:=ReadPipe;

  ClientWaitThread.Resume;
  Processor.Resume;
  MainForm.SetupStart;

  if SoftVol then
    SendCommand('set_property volume '+IntToStr(Volume DIV 10))
  else
    SendCommand('set_property volume '+IntToStr(Volume));
  if mute then SendCommand('set_property mute 1');

end;

procedure TClientWaitThread.ClientDone;
begin
  ClientProcess:=0;
  CloseHandle(ReadPipe); ReadPipe:=0;
  CloseHandle(WritePipe); WritePipe:=0;
  ClientWaitThread.Terminate;
  if Assigned(Processor) then Processor.Terminate;
  FirstOpen:=false;
  if ExplicitStop>0 then ExitCode:=0;
  //if (winos='WIN9X') and (Status=sClosing) then ExitCode:=0;
  if (Status=sOpening) OR (ExitCode<>0) then begin
    Status:=sError; SetLastPos;
  end;

  if (ExplicitStop>0) OR (Status=sError) then begin
    if ExplicitStop=2 then exit;
    MainForm.UpdateCaption; MainForm.SetupStop;
    if Status<>sError then Status:=sStopped;
    MainForm.UpdateStatus;
  end
  else begin
    MainForm.UpdateParams; MainForm.NextFile(1,psPlayed);
    if not Running then begin
      if MainForm.BNext.Enabled then DisplayURL:=Playlist[0].DisplayURL;
      MainForm.UpdateCaption; MainForm.SetupStop;
      Status:=sStopped;  MainForm.UpdateStatus;
    end;
  end;
end;

procedure TClientWaitThread.Execute;
begin
  WaitForSingleObject(hProcess,INFINITE);
  GetExitCodeProcess(hProcess,ExitCode);
  Synchronize(ClientDone);
end;

procedure TProcessor.Process;
var LastEOL,EOL,Len:integer;
begin
  Len:=length(Data);
  LastEOL:=0;
  for EOL:=1 to Len do
    if (EOL>LastEOL) AND ((Data[EOL]=#13) OR (Data[EOL]=#10)) then begin
      HandleInputLine(Copy(Data,LastEOL+1,EOL-(LastEOL+1)));
      LastEOL:=EOL;
      if (LastEOL<Len) AND (Data[LastEOL+1]=#10) then inc(LastEOL);
    end;
  if LastEOL<>0 then Delete(Data,1,LastEOL);
end;

procedure TProcessor.Execute;
const BufSize=1024;
var Buffer:array[0..BufSize]of char;
    BytesRead:cardinal;
begin
  Data:='';
  repeat
    BytesRead:=0;
    if not ReadFile(hPipe,Buffer[0],BufSize,BytesRead,nil) then break;
    Buffer[BytesRead]:=#0;
    Data:=Data+Buffer;
    Synchronize(Process);
  until BytesRead=0;
end;

function Running:boolean;
begin
  Result:=(ClientProcess<>0);
end;

procedure Stop;
begin
  if not Running then exit;
  Status:=sClosing;
  MainForm.LStatus.Caption:=LOCstr_Status_Closing;
  ExplicitStop:=1;
  if winos='WIN9X' then FirstChance:=false;
  if FirstChance then begin
    SendCommand('quit');
    FirstChance:=false;
  end
  else
    Terminate;
end;

procedure Terminate;
begin
  if not Running then exit;
  TerminateProcess(ClientProcess,cardinal(-1));
end;

procedure ForceStop;
begin
  if not Running then exit;
  ExplicitStop:=2;
  if FirstChance then begin
    SendCommand('quit');
    FirstChance:=false;
    if WaitForSingleObject(ClientProcess,1000)<>WAIT_TIMEOUT then exit;
  end;
  Terminate;
end;

procedure SendCommand(Command:String);
var Dummy:cardinal;
begin
  if (ClientProcess=0) OR (WritePipe=0) OR (winos='WIN9X') then exit;
  Command:=Command+#10;
  WriteFile(WritePipe,Command[1],length(Command),Dummy,nil);
end;

procedure SendVolumeChangeCommand(Vol:integer);
begin
  if SoftVol then Vol:=Vol DIV 10;
  SendCommand('volume '+IntToStr(Vol)+' 1');
  if HaveVideo then SendCommand('osd_show_property_text "'+OSD_Volume_Prompt+':${volume}"');
end;

procedure Restart;
begin
  if not Running then exit;
  SetLastPos;
  ForceStop;
  Sleep(50); // wait for the processing threads to finish
  Application.ProcessMessages;
  CBHSA:=4;
  Start;
  MainForm.UpdateSeekBar;
end;

////////////////////////////////////////////////////////////////////////////////



procedure HandleInputLine(Line:string);
var r,i,j,p,len:integer; s:string; f:real; t:TTntMenuItem; key:word;

  function MenuItemIsExist(Menu:TMenuItem; ID:integer):boolean;
  var a:integer;
  begin
    for a:=0 to Menu.Count-1 do begin
      if Menu.Items[a].Tag=ID then begin
        Result:=true; exit;
      end;
    end;
    Result:=false;
  end;

  procedure SubMenu_Add(Menu:TMenuItem; ID,SelectedID:integer; Handler:TNotifyEvent);
  begin
    t:=TTntMenuItem.Create(Menu);
    with t do begin
      Caption:=IntToStr(ID);
      Tag:=ID;
      GroupIndex:=$0A;
      RadioItem:=true;
      if ID=SelectedID then Checked:=true
      else begin
        if SelectedID<0 then begin
          if (Menu=MainForm.MDVDT) AND (Menu.Count=3) then Checked:=true
          else if Menu.Count=0 then Checked:=true;
        end;
      end;
      OnClick:=Handler;
    end;
    Menu.Add(t);
    Menu.Visible:=true;
  end;

  procedure SubMenu_SetNameLang(Menu:TTntMenuItem; ID:integer; NameLang:string);
  var j:integer;
  begin
    for j:=0 to Menu.Count-1 do begin
      with Menu.Items[j] do begin
        if Tag=ID then begin
          Caption:=Caption+' ('+NameLang+')';
          exit;
        end;
      end;
    end;
  end;

  function CheckVobsubID:boolean;
  begin
    Result:=false;
    if (len>13) and (Copy(Line,1,13)='ID_VOBSUB_ID=') then begin
      Val(Copy(Line,14,9),i,r);
      if (r=0) AND (i>=0) AND (i<256) then begin
        if LoadVob=3 then begin
           LoadVob:=2; SubID:=0;
           Core.SendCommand('set_property sub 0');
           MainForm.MShowSub.Checked:=true;
        end;
        if not MenuItemIsExist(MainForm.MSubtitle,i) then begin
          SubMenu_Add(MainForm.MSubtitle,i,SubID,MainForm.MSubtitleClick);
          VobsubCount:=i+1;
        end;
        Result:=true;
      end;
    end;
  end;

  function CheckVobsubLang:boolean;
  begin
    Result:=false;
    if (len>8) and (Copy(Line,1,8)='ID_VSID_') then begin
      s:=Copy(Line,9,21);
      p:=Pos('_LANG=',s);
      if p<=0 then exit;
      Val(Copy(s,1,p-1),i,r);
      if (r=0) AND (i>=0) AND (i<256) then begin
        if not MenuItemIsExist(MainForm.MSubtitle,i) then begin
          SubMenu_Add(MainForm.MSubtitle,i,SubID,MainForm.MSubtitleClick);
          VobsubCount:=i+1;
        end;
        SubMenu_SetNameLang(MainForm.MSubtitle,i,copy(s,p+6,length(s)));
        Result:=true;
      end;
    end;
  end;

  function CheckDVDT:boolean;
  var j:integer; Entry:TPlaylistEntry;
  begin
    Result:=false;
    if (len>14) and (Copy(Line,1,14)='ID_DVD_TITLES=') then begin
      Val(Copy(Line,15,9),i,r);
      if (r=0) AND (i>0) AND (i<8191) then begin
        for j:=1 to i do begin
          if FirstOpen then begin
            s:='DVD-'+IntToStr(j)+Copy(DisplayURL,Pos(' <-- ',DisplayURL),length(DisplayURL));
            if not playlist.FindItem('',s) then begin
              with Entry do begin
                State:=psNotPlayed;
                FullURL:=MediaURL;
                DisplayURL:=s;
              end;
              playlist.Add(Entry);
              if j=i then Playlist.Changed;
            end;
          end;
          if not MenuItemIsExist(MainForm.MDVDT,j) then begin
            SubMenu_Add(MainForm.MDVDT,j,TID,nil);

            t:=TTntMenuItem.Create(MainForm.MDVDT.Items[j+2]);
            with t do begin
              Caption:=Ccap;
              Tag:=0;
              GroupIndex:=$0A;
            end;
            MainForm.MDVDT.Items[j+2].Add(t);

            t:=TTntMenuItem.Create(MainForm.MDVDT.Items[j+2]);
            with t do begin
              Caption:=Acap;
              Tag:=1;
              GroupIndex:=$0A;
            end;
            MainForm.MDVDT.Items[j+2].Add(t);
          end;
        end;
        Result:=true;
      end;
    end;
  end;

  function CheckDVDC:boolean;
  var k:integer;
  begin
    Result:=false;
    if (len>13) and (Copy(Line,1,13)='ID_DVD_TITLE_') then begin
      s:=Copy(Line,14,20);
      p:=Pos('_CHAPTERS=',s);
      if p<=0 then exit;
      Val(Copy(s,1,p-1),i,r);
      if (r=0) AND (i>0) AND (i<8191) then begin
        Val(Copy(s,p+10,8),j,r);
        if (r=0) AND (j>0) AND (j<8191) then begin
          for k:=1 to j do begin
            if not MenuItemIsExist(MainForm.MDVDT,i) then SubMenu_Add(MainForm.MDVDT,i,TID,nil);
            if not MenuItemIsExist(MainForm.MDVDT.Items[i+2],0) then begin
              t:=TTntMenuItem.Create(MainForm.MDVDT.Items[i+2]);
              with t do begin
                Caption:=Ccap;
                Tag:=0;
                GroupIndex:=$0A;
              end;
              MainForm.MDVDT.Items[i+2].Add(t);
            end;
            if not MenuItemIsExist(MainForm.MDVDT.Items[i+2].Items[0],k) then begin
              if i=TID then
                SubMenu_Add(MainForm.MDVDT.Items[i+2].Items[0],k,CID,MainForm.MDVDCClick)
              else
                SubMenu_Add(MainForm.MDVDT.Items[i+2].Items[0],k,1,MainForm.MDVDCClick);
            end;
          end;
          Result:=true;
        end;
      end;
    end;
  end;

  function CheckDVDA:boolean;
  var k:integer;
  begin
    Result:=false;
    if (len>13) and (Copy(Line,1,13)='ID_DVD_TITLE_') then begin
      s:=Copy(Line,14,20);
      p:=Pos('_ANGLES=',s);
      if p<=0 then exit;
      Val(Copy(s,1,p-1),i,r);
      if (r=0) AND (i>0) AND (i<8191) then begin
        Val(Copy(s,p+8,8),j,r);
        if (r=0) AND (j>0) AND (j<8191) then begin
          for k:=1 to j do begin
            if not MenuItemIsExist(MainForm.MDVDT,i) then SubMenu_Add(MainForm.MDVDT,i,TID,nil);
            if not MenuItemIsExist(MainForm.MDVDT.Items[i+2],1) then begin
              t:=TTntMenuItem.Create(MainForm.MDVDT.Items[i+2]);
              with t do begin
                Caption:=Ccap;
                Tag:=1;
                GroupIndex:=$0A;
              end;
              MainForm.MDVDT.Items[i+2].Add(t);
            end;
            if not MenuItemIsExist(MainForm.MDVDT.Items[i+2].Items[1],k) then begin
              if i=TID then
                SubMenu_Add(MainForm.MDVDT.Items[i+2].Items[1],k,AID,MainForm.MDVDAClick)
              else
                SubMenu_Add(MainForm.MDVDT.Items[i+2].Items[1],k,1,MainForm.MDVDAClick);
            end;
          end;
          Result:=true;
        end;
      end;
    end;
  end;

  function CheckDVDTL:boolean;
  begin
    Result:=false;
    if (len>13) and (Copy(Line,1,13)='ID_DVD_TITLE_') then begin
      s:=Copy(Line,14,20);
      p:=Pos('_LENGTH=',s);
      if p<=0 then exit;
      Val(Copy(s,1,p-1),i,r);
      if (r=0) AND (i>0) AND (i<8191) then begin
        Val(Copy(s,p+8,10),f,r);
        if (r=0) AND (f>0) then begin
          if not MenuItemIsExist(MainForm.MDVDT,i) then SubMenu_Add(MainForm.MDVDT,i,TID,nil);
          MainForm.MDVDT.Items[i+2].Caption:=MainForm.MDVDT.Items[i+2].Caption+' ('+SecondsToTime(round(f))+')';
          Result:=true;
        end;
      end;
    end;
  end;

  function CheckChapterLen:boolean;
  var e:boolean;
  begin
    Result:=false; j:=-1;
    if Dnav then begin
      i:=Pos(', CHAPTERS: ',Line);
      e:= (len>26) and (Copy(Line,1,6)='TITLE ') and (i>0);
      if e then s:=Copy(Line,i+12,Length(Line));
    end
    else begin
      e:= (len>10) and (Copy(Line,1,10)='CHAPTERS: ');
      s:=Copy(Line,11,length(Line));
    end;
    if e then begin
      i:=pos(',',s);
      while(i>0) do begin
        inc(j);
        if not MenuItemIsExist(MainForm.MDVDT,TID) then SubMenu_Add(MainForm.MDVDT,TID,TID,nil);
        if not MenuItemIsExist(MainForm.MDVDT.Items[TID+2],0) then begin
          t:=TTntMenuItem.Create(MainForm.MDVDT.Items[TID+2]);
          with t do begin
            Caption:=Ccap;
            Tag:=0;
            GroupIndex:=$0A;
          end;
          MainForm.MDVDT.Items[TID+2].Add(t);
        end;
        if not MenuItemIsExist(MainForm.MDVDT.Items[TID+2].Items[0],j+1) then
          SubMenu_Add(MainForm.MDVDT.Items[TID+2].Items[0],j+1,CID,MainForm.MDVDCClick);
        MainForm.MDVDT.Items[TID+2].Items[0].Items[j].Caption:=IntToStr(MainForm.MDVDT.Items[TID+2].Items[0].Items[j].Tag)+' ('+copy(s,1,i-1)+')';
        s:=copy(s,i+1,length(s)); i:=pos(',',s);
      end;
      Result:=true; HaveChapters:=true;
    end;
  end;

  function CheckDVDNavTL:boolean;
  begin
    if Dnav and (len>27) and (Copy(Line,1,27)='DVDNAV, switched to title: ') then begin
      Sendcommand('get_property chapter');
      SendCommand('get_time_length');
      Result:=true;
    end
    else Result:=false;
  end;

  function CheckVCDT:boolean;
  var k:integer;
  begin
    Result:=false;
    if (len>19) and (Copy(Line,1,19)='ID_VCD_START_TRACK=') then begin
      Val(Copy(Line,20,9),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        VCDST:=i;
        Result:=true;
      end;
    end;

    if (len>17) and (Copy(Line,1,17)='ID_VCD_END_TRACK=') then begin
      Val(Copy(Line,18,9),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        for k:=VCDST to i-1 do
        SubMenu_Add(MainForm.MVCDT,k,CDID,MainForm.MVCDTClick);
        Result:=true;
      end;
    end;
  end;

  function CheckVideoID:boolean;
  begin
    Result:=false;
    if (len>12) and (Copy(Line,1,12)='ID_VIDEO_ID=') then begin
      Val(Copy(Line,13,9),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        if not MenuItemIsExist(MainForm.MVideo,i) then
          SubMenu_Add(MainForm.MVideo,i,VideoID,MainForm.MVideoClick);
        Result:=true;
      end;
    end;
  end;

  function CheckVideoName:boolean;
  begin
    Result:=false;
    if (len>7) and (Copy(Line,1,7)='ID_VID_') then begin
      s:=Copy(Line,8,length(Line));
      p:=Pos('_NAME=',s);
      if p<=0 then exit;
      Val(Copy(s,1,p-1),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        if not MenuItemIsExist(MainForm.MVideo,i) then
          SubMenu_Add(MainForm.MVideo,i,VideoID,MainForm.MVideoClick);
        SubMenu_SetNameLang(MainForm.MVideo,i,copy(s,p+6,length(s)));
        Result:=true;
      end;
    end;
  end;

  function CheckAudioID:boolean;
  begin
    Result:=false;
    if (len>12) and (Copy(Line,1,12)='ID_AUDIO_ID=') then begin
      Val(Copy(Line,13,9),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        if not MenuItemIsExist(MainForm.MAudio,i) then
          SubMenu_Add(MainForm.MAudio,i,AudioID,MainForm.MAudioClick);
        Result:=true;
      end;
    end;
  end;

  function CheckAudioNameLang:boolean;
  begin
    Result:=false;
    if (len>7) and (Copy(Line,1,7)='ID_AID_') then begin
      s:=Copy(Line,8,length(Line));
      p:=Pos('_NAME=',s);
      if p<=0 then p:=Pos('_LANG=',s);
      if p<=0 then exit;
      Val(Copy(s,1,p-1),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        if not MenuItemIsExist(MainForm.MAudio,i) then
          SubMenu_Add(MainForm.MAudio,i,AudioID,MainForm.MAudioClick);
        SubMenu_SetNameLang(MainForm.MAudio,i,copy(s,p+6,length(s)));
        Result:=true;
      end;
    end;
  end;

  function CheckSubID:boolean;
  begin
    Result:=false;
    if (len>15) and (Copy(Line,1,15)='ID_SUBTITLE_ID=') then begin
      Val(Copy(Line,16,9),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        if not MenuItemIsExist(MainForm.MSubtitle,VobsubCount+i) then begin
          SubMenu_Add(MainForm.MSubtitle,VobsubCount+i,SubID,MainForm.MSubtitleClick);
          IntersubCount:=i+1;
        end;
        Result:=true;
      end;
    end;
  end;

  function CheckSubNameLang:boolean;
  begin
    Result:=false;
    if (len>7) and (Copy(Line,1,7)='ID_SID_') then begin
      s:=Copy(Line,8,length(Line));
      p:=Pos('_NAME=',s);
      if p<=0 then p:=Pos('_LANG=',s);
      if p<=0 then exit;
      Val(Copy(s,1,p-1),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        if not MenuItemIsExist(MainForm.MSubtitle,VobsubCount+i) then begin
          SubMenu_Add(MainForm.MSubtitle,VobsubCount+i,SubID,MainForm.MSubtitleClick);
          IntersubCount:=i+1;
        end;
        SubMenu_SetNameLang(MainForm.MSubtitle,VobsubCount+i,copy(s,p+6,length(s)));
        Result:=true;
      end;
    end;
  end;

  function CheckFilesubID:boolean;
  begin
    Result:=false;
    if (len>15) and (Copy(Line,1,15)='ID_FILE_SUB_ID=') then begin
      Val(Copy(Line,16,9),i,r);
      if (r=0) AND (i>=0) AND (i<8191) then begin
        VobAndInterSubCount:=IntersubCount+VobsubCount;
        if Loadsub=1 then begin
          SubID:=i+VobAndInterSubCount-1;
          MainForm.MShowSub.Checked:=true;
        end
        else
          CurrentSubCount:=VobAndInterSubCount+i+1;
        SubMenu_Add(MainForm.MSubtitle,i+VobAndInterSubCount,SubID,MainForm.MSubtitleClick);
        Result:=true;
      end;
    end;
    if (len>21) and (Copy(Line,1,21)='ID_FILE_SUB_FILENAME=') then begin
      s:=copy(Line,22,length(Line));
      SubMenu_SetNameLang(MainForm.MSubtitle,MainForm.MSubtitle.Count-1,s);
      case Loadsub of
        1: begin
             AddChain(subcount,substring,EscapeParam(s));
             Mainform.NextSub;
             Loadsrt:=1;
           end;
        2: begin
             if Pos(EscapePath(TempDir),s)>0 then begin
               AddChain(subcount,substring,EscapeParam(s));
               Lastsubcount:=subcount;
             end;
           end;
      end;
    end;
  end;

  function UpdateLen:integer;
  var k:string;
  begin
    Result:=TotalTime;
    s:=MainForm.MDVDT.Items[TID+2].Items[0].Items[CID-1].Caption;
    i:=pos('(',s);
    if CID=MainForm.MDVDT.Items[TID+2].Items[0].Count then begin
      if TTime>0 then Result:=TTime-TimeToSeconds(copy(s,i+1,8));
    end
    else begin
      k:=MainForm.MDVDT.Items[TID+2].Items[0].Items[CID].Caption;
      j:=pos('(',k);
      Result:=TimeToSeconds(copy(k,j+1,8))-TimeToSeconds(copy(s,i+1,8));
    end;
    Duration:=SecondsToTime(Result);
  end;

  function CheckLength:boolean;
  begin
    Result:=(len>10) and (Copy(Line,1,10)='ID_LENGTH=');
    if Result then begin
      Val(Copy(Line,11,10),f,r);
      if r=0 then begin
        TotalTime:=round(f); TTime:=TotalTime;
        Duration:=SecondsToTime(TotalTime);
      end;
      if HaveChapters then TotalTime:=UpdateLen;
    end;
  end;

  function CheckFileFormat:boolean;
  begin
  //Enlish version
    p:=len-21;
    Result:=(p>0) AND (Copy(Line,p,22)=' file format detected.');
    if Result then begin
      StreamInfo.FileFormat:=Copy(Line,1,p-1);
      exit;
     end;
  //Chinese version
    p:=len-9;
    Result:=(p>0) AND (Copy(Line,p,10)='文件格式。') AND (Copy(Line,1,6)='检测到');
    if Result then begin
      StreamInfo.FileFormat:=Copy(Line,7,p-7);
    end;
  end;

  function CheckDecoder:boolean;
  begin
  //Enlish version
    Result:=(len>24) and (Copy(Line,1,8)='Opening ') AND (Copy(Line,13,12)='o decoder: [');
    if Result then begin
      p:=Pos('] ',Line);
      Result:=(p>24);
      if Result then begin
        if Copy(Line,9,4)='vide' then
          StreamInfo.Video.Decoder:=Copy(Line,p+2,length(Line))
        else if Copy(Line,9,4)='audi' then
          StreamInfo.Audio.Decoder:=Copy(Line,p+2,length(Line))
          else Result:=false;
        end;
       exit;
    end;
  //Chinese version
    Result:=(len>17) and (Copy(Line,1,4)='打开') AND (Copy(Line,7,11)='频解码器: [');
    if Result then begin
      p:=Pos('] ',Line);
      Result:=(p>17);
      if Result then begin
        if Copy(Line,5,2)='视' then
          StreamInfo.Video.Decoder:=Copy(Line,p+2,length(Line))
        else if Copy(Line,5,2)='音' then
          StreamInfo.Audio.Decoder:=Copy(Line,p+2,length(Line))
          else Result:=false;
        end;
      end;
  end;

  function CheckCodec:boolean;
  begin
  //Enlish version
    Result:=(len>23) and (Copy(Line,1,9)='Selected ') AND (Copy(Line,14,10)='o codec: [');
    if Result then begin
      p:=Pos(' (',Line);
      Result:=(p>23);
      if Result then begin
        if Copy(Line,10,4)='vide' then
          StreamInfo.Video.Codec:=Copy(Line,p+2,length(Line)-p-2);
        if Copy(Line,10,4)='audi' then
          StreamInfo.Audio.Codec:=Copy(Line,p+2,length(Line)-p-2)
          else Result:=false;
        end;
      exit;
    end;
  //Chinese version
    Result:=(len>19) and (Copy(Line,1,4)='选定') AND (Copy(Line,7,13)='频编解码器: [');
    if Result then begin
      p:=Pos(' (',Line);
      Result:=(p>19);
      if Result then begin
        if Copy(Line,5,2)='视' then
          StreamInfo.Video.Codec:=Copy(Line,p+2,length(Line)-p-2);
        if Copy(Line,5,2)='音' then
          StreamInfo.Audio.Codec:=Copy(Line,p+2,length(Line)-p-2)
          else Result:=false;
       end;
     end;
  end;

  function CheckICYInfo:boolean;
  begin
    Result:=False;
    if (len<10) or (Copy(Line,1,10)<>'ICY Info: ') then exit;
    P:=Pos('StreamTitle=''',Line); if P<10 then exit;
    Delete(Line,1,P+12);
    P:=Pos(''';',Line); if P<1 then exit;
    SetLength(Line,P-1);
    if length(Line)=0 then exit;
    P:=0; while (P<9)
            AND (length(StreamInfo.ClipInfo[P].Key)>0)
            AND (StreamInfo.ClipInfo[P].Key<>'Title')
          do inc(P);
    StreamInfo.ClipInfo[P].Key:='Title';
    if StreamInfo.ClipInfo[P].Value<>Line then begin
      StreamInfo.ClipInfo[P].Value:=Line;
      InfoForm.UpdateInfo;
    end;
  end;

  {function CheckNoAudio:boolean;
  begin
    Result:=false;
    if CheckInfo(NoAudio,Line)=-1 then exit;
    HaveAudio:=false; MainForm.MAudios.Visible:=false;
    MainForm.BMute.Enabled:=false;
    Result:=true;
  end; }

  procedure CheckNoAudio;
  begin
    if ChkAudio and (StreamInfo.Audio.Codec='') then begin
      HaveAudio:=false; MainForm.MAudios.Visible:=false;
      MainForm.BMute.Enabled:=false; ChkAudio:=false;
    end;
  end;

  function CheckAudio:boolean;
  begin
    Result:=false;
    if (len<5) or (Copy(Line,1,5)<>'AO: [') then exit;
    if (Copy(Line,6,5)='win32') or (Copy(Line,6,6)='dsound') then begin
      HaveAudio:=true; MainForm.MAudios.Visible:=true;
      MainForm.BMute.Enabled:=true; ChkAudio:=false;
      if SoftVol then
        SendCommand('set_property volume '+IntToStr(Volume DIV 10))
      else
        SendCommand('set_property volume '+IntToStr(Volume));
      if mute then SendCommand('set_property mute 1');
      Result:=true;
    end
  end;

  {function CheckNoVideo:boolean;
  begin
    Result:=false;
    if CheckInfo(NoVideo,Line)=-1 then exit;
    if LastHaveVideo then begin
      if MainForm.MFullscreen.Checked then MainForm.SetFullscreen(false);
      if MainForm.MCompact.Checked  or MainForm.MMaxW.Checked then MainForm.SetCompact(false);
      MainForm.Mctrl.Checked:=false; MainForm.Hide_menu.Checked:=false; MainForm.MPCtrl.Checked:=true;
      MainForm.CPanel.Visible:=true; MainForm.MenuBar.Visible:=true;
      MainForm.UpdateMenuEV(false);
      SetWindowLong(MainForm.Handle,GWL_STYLE,DWORD(GetWindowLong(MainForm.Handle,GWL_STYLE)) AND (NOT WS_SIZEBOX) AND (NOT WS_MAXIMIZEBOX));
      MainForm.Left:=MainForm.Left+((MainForm.OPanel.ClientWidth-353) DIV 2);
      MainForm.Top:=MainForm.Top+(MainForm.OPanel.ClientHeight DIV 2);
      MainForm.Width:=MainForm.Constraints.MinWidth;
      MainForm.Height:=MainForm.Constraints.MinHeight;
      LastHaveVideo:=false; MFunc:=0;
    end;
    HaveVideo:=false;
    Result:=true;
  end; }

  procedure CheckNoVideo;
  begin
    with MainForm do begin
      if ChkVideo and (StreamInfo.Video.Codec='') then begin
        if LastHaveVideo then begin
          if not (OptionsForm.Visible or AboutForm.Visible or AddDirForm.Visible
            or EqualizerForm.Visible or HelpForm.Visible) then Enabled:=true;
          if MFullscreen.Checked then SetFullscreen(false);
          if MCompact.Checked  or MMaxW.Checked then SetCompact(false);
          Mctrl.Checked:=false; Hide_menu.Checked:=false; MPCtrl.Checked:=true;
          OPanel.Visible:=false; CPanel.Visible:=true; MenuBar.Visible:=true;
          UpdateMenuEV(false);
          SetWindowLong(Handle,GWL_STYLE,DWORD(GetWindowLong(Handle,GWL_STYLE)) AND (NOT WS_SIZEBOX) AND (NOT WS_MAXIMIZEBOX));
          r:=Left+((Width-Constraints.MinWidth) DIV 2);
          i:=Top+((Height-Constraints.MinHeight) DIV 2);
          SetBounds(r,i,Constraints.MinWidth,Constraints.MinHeight);
          LastHaveVideo:=false; MFunc:=0;
          MWheelControl.Items[0].Checked:=true;
          MPWheelControl.Items[0].Checked:=true;
        end;
        HaveVideo:=false; ChkVideo:=false;
      end;
    end;
  end;

  {function CheckStartPlayback:boolean;
  begin
    Result:=false;
    if CheckInfo(PlayBack,Line)=-1 then exit;
    if not(HaveVideo) then begin
      Status:=sPlaying; MainForm.UpdateStatus;
      MainForm.SetupPlay;
    end;
    Result:=true;
  end; }

  procedure CheckStartPlayback;
  begin
    if ChkStartPlay then begin
      ChkStartPlay:=false;
      if not(HaveVideo) then begin
        Status:=sPlaying; MainForm.UpdateStatus;
        MainForm.SetupPlay;
      end;
    end;
  end;

  function CheckNativeResolutionLine:boolean;
  begin
    Result:=false;
    if (len<5) or (Copy(Line,1,5)<>'VO: [') then exit;
    p:=Pos(' => ',Line); if p=0 then exit; Delete(Line,1,p+3);
    p:=Pos(#32,Line);    if p=0 then exit; SetLength(Line,p-1);
    p:=Pos('x',Line);    if p=0 then exit;
    Val(Copy(Line,1,p-1),i,r); if (r<>0) OR (i<16) OR (i>=4096) then exit;
    Val(Copy(Line,p+1,5),j,r); if (r<>0) OR (j<16) OR (j>=4096) then exit;
    ChkVideo:=false;
    with MainForm do begin
      if winos='WIN9X' then begin
        HaveVideo:=false; LastHaveVideo:=false;
        MVideos.Visible:=true; MSub.Visible:=true;
        Status:=sPlaying; UpdateStatus;
        SetupPlay;
        Result:=true;
        exit;
      end;
      NativeWidth:=i; NativeHeight:=j;
      if NativeWidth<(Constraints.MinWidth-6) then begin
        NativeWidth:=Constraints.MinWidth-6;
        NativeHeight:=NativeWidth*j DIV i;
      end;
      case CBHSA of
        3: begin VideoSizeChanged;
             Result:=true;
             exit;
           end;
        4: begin
             if (Eq2=LastEq2) AND (Dda=LastDda) then begin
               if (contr<>101) and (contr>contrD) then
                 SendCommand('set_property contrast '+IntToStr(contr));
               if (bri<>101) and (bri>briD) then
                 SendCommand('set_property brightness '+IntToStr(bri));
               if (hu<>101) and (hu>huD) then
                 SendCommand('set_property hue '+IntToStr(hu));
               if (sat<>101) and (sat>satD) then
                 SendCommand('set_property saturation '+IntToStr(sat));
               if Eq2 and (not Dda) and (gam<>101) and (gam>gamD) then
                 SendCommand('set_property gamma '+IntToStr(gam));
             end;
             if (Eq2<>LastEq2) OR (Dda<>LastDda) then begin
               bri:=101; contr:=101; hu:=101; sat:=101; CBHSA:=0;
               SendCommand('get_property contrast'); SendCommand('get_property saturation');
               SendCommand('get_property brightness'); SendCommand('get_property hue');
               if Eq2 and (not Dda) then begin
                 gam:=101; SendCommand('get_property gamma');
               end;
             end;
           end;
      end;

      if FirstOpen then begin
        if (Eq2<>LastEq2) OR (Dda<>LastDda) then begin
          bri:=101; contr:=101; hu:=101; sat:=101;
          if Eq2 and (not Dda) then gam:=101;
        end;
        SendCommand('get_property contrast'); SendCommand('get_property brightness');
        SendCommand('get_property hue'); SendCommand('get_property saturation');
        if Eq2 and (not Dda) then SendCommand('get_property gamma');
      end;

      if Wid then begin
        if not LastHaveVideo then begin
          OPanel.Visible:=true; j:=8+NativeWidth;
          p:=MWC+MenuBar.Height+CPanel.Height+8+NativeHeight;
          r:=Left-((j-Constraints.MinWidth) DIV 2);
          i:=Top-((p-Constraints.MinHeight) DIV 2);
          SetBounds(r,i,j,p); MSize100.Checked:=true;
          SetWindowLong(Handle,GWL_STYLE,DWORD(GetWindowLong(Handle,GWL_STYLE)) OR WS_SIZEBOX OR WS_MAXIMIZEBOX);
          if WantCompact then begin
            SetCompact(True); WantCompact:=false;
          end;
        end;
        LastHaveVideo:=true;
      end
      else begin
        if LastHaveVideo then begin
          if not (OptionsForm.Visible or AboutForm.Visible or AddDirForm.Visible
            or EqualizerForm.Visible or HelpForm.Visible) then Enabled:=true;
          if MFullscreen.Checked then SetFullscreen(false);
          if MCompact.Checked or MMaxW.Checked then SetCompact(false);
          Mctrl.Checked:=false; Hide_menu.Checked:=false; MPCtrl.Checked:=true;
          CPanel.Visible:=true; MenuBar.Visible:=true;
          SetWindowLong(Handle,GWL_STYLE,DWORD(GetWindowLong(Handle,GWL_STYLE)) AND (NOT WS_SIZEBOX) AND (NOT WS_MAXIMIZEBOX));
          r:=Left+((Width-Constraints.MinWidth) DIV 2);
          i:=screen.WorkAreaHeight-Constraints.MinHeight;
          SetBounds(r,i,Constraints.MinWidth,Constraints.MinHeight);
          PlaylistForm.Left:=Left-PlaylistForm.Width;
          PlaylistForm.Top:=Top+Height-PlaylistForm.Height;
          OPanel.Visible:=false; MFunc:=0;
          MWheelControl.Items[0].Checked:=true;
          MPWheelControl.Items[0].Checked:=true;
        end;
        LastHaveVideo:=false;
      end;
      UpdateMenuEV(true); MOsdfont.Visible:=uof;
      MRmMenu.Visible:=Dnav; MRnMenu.Visible:=Dnav;
      MDeinterlace.Enabled:=not Dda; MSEqualizer.Enabled:=not Dda;
      if MSubtitle.Count>0 then begin
        if SubID<0 then SubID:=0;
        SendCommand('set_property sub '+IntToStr(SubID));
        if not MShowSub.Checked then SendCommand('set_property sub_visibility 0');
      end;
      LastEq2:=Eq2; LastDda:=Dda; HaveVideo:=true;
      if (NativeWidth/NativeHeight)=(Screen.Width/Screen.Height) then begin
        LastScale:=100; Scale:=100;
      end;
      VideoSizeChanged; SetupPlay;
      Status:=sPlaying; UpdateStatus;
      Result:=true;
    end;
  end;

begin
  Line:=Trim(Line); len:=length(Line);
  // Time position indicators are "first-class citizens", because they
  // make up for 99.999% of all traffic. So we have to handle them *FAST*!
  if len>2 then begin
    if Line[1]=^J then j:=4 else j:=3;
    if ((Line[j-2]='A') OR (Line[j-2]='V')) AND (Line[j-1]=':') then begin
      i:=Pos('.',Line);
      if i<=j then exit;
      Val(Copy(Line,j,i-j),p,r);
      if (r<>0) or (p<0) then exit;
      CheckNOAudio; CheckNOVideo; CheckStartPlayback;

      if HaveLyric then begin
        i:=p*10+ord(Line[i+1])-48;
        if MSecPos<>i then begin
          MSecPos:=i;
          Lyric.GetCurrentLyric;
        end;
      end;

      if p<>SecondPos then begin
        if p=0 then begin
          if HaveChapters then Sendcommand('get_property chapter');
          SendCommand('get_time_length');
        end;
        SecondPos:=p; MainForm.UpdateTime;
        if HaveChapters and (SecondPos=TotalTime-1) and
          (CID<MainForm.MDVDT.Items[TID+2].Items[0].Count) then begin
          MainForm.MDVDT.Items[TID+2].Items[0].Items[CID].Checked:=true;
          inc(CID); TotalTime:=UpdateLen;
        end;
        if mute and LastMute then begin
          SendCommand('set_property mute 1');
          LastMute:=false;
        end;
       { if MainForm.MSIE.Checked and (EP>0) and (SecondPos>=Ep) then begin
          MainForm.UpdateParams; MainForm.NextFile(1,psPlayed);
        end; }
        if Mainform.MSIE.Checked then begin
          if (p=0) and (Bp>p) and (Bp<TotalTime) then SendCommand('seek '+IntToStr(Bp));
          if (EP>0) and (SecondPos=Ep) then begin
            if HaveChapters then begin
              key:=VK_HOME;
              MainForm.FormKeyDown(nil,key,[]);
            end
            else begin
              MainForm.UpdateParams; MainForm.NextFile(1,psPlayed);
            end
          end;
        end;
      end;
      exit;
    end;
  end;
  // normal line handling: check for "cache fill"
  if (len>=18) AND (Line[18]='%') AND (Copy(Line,1,11)='Cache fill:') then begin
    if Copy(Line,12,6)=LastCacheFill then exit;
    MainForm.LStatus.Caption:=Line;
    if (Copy(LogForm.TheLog.Lines[LogForm.TheLog.Lines.Count-1],1,11)='Cache fill:') then
      LogForm.TheLog.Lines[LogForm.TheLog.Lines.Count-1]:=Line;
    Sleep(0);  // "yield"
    exit;
  end;
  if (len>=16) AND (Line[16]='%') AND (CheckInfo(CacheFill,Copy(Line,1,9))>-1) then begin
    if Copy(Line,10,6)=LastCacheFill then exit;
    MainForm.LStatus.Caption:=Line;
    if (CheckInfo(CacheFill,Copy(LogForm.TheLog.Lines[LogForm.TheLog.Lines.Count-1],1,9))>-1) then
      LogForm.TheLog.Lines[LogForm.TheLog.Lines.Count-1]:=Line;
    Sleep(0);  // "yield"
    exit;
  end;

  // check "Generating Index"  正在生成索引:  14 %  Generating Index:  99 %
  if (len>=23) AND (Line[23]='%') AND (Copy(Line,1,17)='Generating Index:') then begin
    if Copy(Line,18,6)=LastCacheFill then exit;
    MainForm.LStatus.Caption:=Line;
    if (Copy(LogForm.TheLog.Lines[LogForm.TheLog.Lines.Count-1],1,17)='Generating Index:') then
      LogForm.TheLog.Lines[LogForm.TheLog.Lines.Count-1]:=Line;
    Sleep(0);  // "yield"
    exit;
  end;
  if (len>=19) AND (Line[19]='%') AND (CheckInfo(GenIndex,Copy(Line,1,13))>-1) then begin
    if Copy(Line,14,6)=LastCacheFill then exit;
    MainForm.LStatus.Caption:=Line;
    if (CheckInfo(GenIndex,Copy(LogForm.TheLog.Lines[LogForm.TheLog.Lines.Count-1],1,13))>-1) then
      LogForm.TheLog.Lines[LogForm.TheLog.Lines.Count-1]:=Line;
    Sleep(0);  // "yield"
    exit;
  end;

  // check contrast (hidden from log)
  if (len>13) and (Copy(Line,1,13)='ANS_contrast=') then begin
    Val(Copy(Line,14,4),i,r);
    if (r=0) AND (i>=-100) AND (i<=100) then begin
      case CBHSA of
        0: begin contrD:=i;
             if contr=101 then contr:=i
             else begin
               if contr>contrD then
                 SendCommand('set_property contrast '+IntToStr(contr));
             end;
           end;
      1,5: contr:=i;
      end;
      EqualizerForm.SCon.Enabled:=true; EqualizerForm.TCon.Enabled:=true;
      EqualizerForm.TCon.Position:=i;
    end;
    exit;
  end;
  // check brightness (hidden from log)
  if (len>15) and (Copy(Line,1,15)='ANS_brightness=') then begin
    Val(Copy(Line,16,4),i,r);
    if (r=0) AND (i>=-100) AND (i<=100) then begin
      case CBHSA of
        0: begin briD:=i;
             if bri=101 then bri:=i
             else begin
               if bri>briD then
                 SendCommand('set_property brightness '+IntToStr(bri));
             end;
           end;
      1,5: bri:=i;
      end;
      EqualizerForm.Sbri.Enabled:=true; EqualizerForm.TBri.Enabled:=true;
      EqualizerForm.TBri.Position:=i;
    end;
    exit;
  end;
  // check hue (hidden from log)
  if (len>8) and (Copy(Line,1,8)='ANS_hue=') then begin
    Val(Copy(Line,9,4),i,r);
    if (r=0) AND (i>=-100) AND (i<=100) then begin
      case CBHSA of
        0: begin huD:=i;
             if hu=101 then hu:=i
             else begin
               if hu>huD then
                 SendCommand('set_property hue '+IntToStr(hu));
             end;
           end;
      1,5: hu:=i;
      end;
      EqualizerForm.Shue.Enabled:=true; EqualizerForm.Thue.Enabled:=true;
      EqualizerForm.THue.Position:=i;
    end;
    exit;
  end;
  // check saturation (hidden from log)
  if (len>15) and (Copy(Line,1,15)='ANS_saturation=') then begin
    Val(Copy(Line,16,4),i,r);
    if (r=0) AND (i>=-100) AND (i<=100) then begin
      case CBHSA of
        0: begin satD:=i;
             if sat=101 then sat:=i
             else begin
               if sat>satD then
                 SendCommand('set_property saturation '+IntToStr(sat));
             end;
           end;
      1,5: sat:=i;
      end;
      EqualizerForm.SSat.Enabled:=true; EqualizerForm.TSat.Enabled:=true;
      EqualizerForm.TSat.Position:=i;
    end;
    exit;
  end;
  // check gamma (hidden from log)
  if (len>10) and (Copy(Line,1,10)='ANS_gamma=') then begin
    Val(Copy(Line,11,4),i,r);
    if (r=0) AND (i>=-100) AND (i<=100) then begin
      case CBHSA of
        0: begin gamD:=i;
             if gam=101 then gam:=i
             else begin
               if gam>gamD then
                 SendCommand('set_property gamma '+IntToStr(gam));
             end;
           end;
      1,5: gam:=i;
      end;
      EqualizerForm.SGam.Enabled:=true; EqualizerForm.TGam.Enabled:=true;
      EqualizerForm.TGam.Position:=i;
    end;
    exit;
  end;
  // check Failed to get value of property (hidden from log)
  if (len>31) and (Copy(Line,1,31)='Failed to get value of property') then begin
    if Copy(Line,34,8)='contrast' then begin
      EqualizerForm.SCon.Enabled:=false; EqualizerForm.TCon.Enabled:=false;
      exit;
    end;
    if Copy(Line,34,10)='brightness' then begin
      EqualizerForm.Sbri.Enabled:=false; EqualizerForm.TBri.Enabled:=false;
      exit;
    end;
    if Copy(Line,34,3)='hue' then begin
      EqualizerForm.Shue.Enabled:=false; EqualizerForm.Thue.Enabled:=false;
      exit;
    end;
    if Copy(Line,34,10)='saturation' then begin
      EqualizerForm.SSat.Enabled:=false; EqualizerForm.TSat.Enabled:=false;
      exit;
    end;
    if Copy(Line,34,5)='gamma' then begin
      EqualizerForm.SGam.Enabled:=false; EqualizerForm.TGam.Enabled:=false;
      exit;
    end;
    exit;
  end;
  //check ScreenshotName
  if (len>15) and (Copy(Line,1,15)='*** screenshot ') then begin
    if not Isub then SendCommand('osd_show_text "'+OSD_ScreenShot_Prompt+Copy(Line,17,length(Line)-25)+'"');
    exit;
  end;
  // check Chapter ID
  if (len>12) and (Copy(Line,1,12)='ANS_chapter=') then begin
    Val(Copy(Line,13,length(Line)),i,r);
    if (r=0) and (i>=0) then begin
      CID:=i+1;
      if MenuItemIsExist(MainForm.MDVDT,TID) then
      if MenuItemIsExist(MainForm.MDVDT.Items[TID+2],0) then
      if MenuItemIsExist(MainForm.MDVDT.Items[TID+2].Items[0],CID) then
        MainForm.MDVDT.Items[TID+2].Items[0].Items[i].Checked:=true;
    end;
    exit;
  end;
  //check time length
  if (len>11) and (Copy(Line,1,11)='ANS_LENGTH=') then begin
    Val(Copy(Line,12,length(Line)),f,r);
    if r=0 then begin
      TotalTime:=round(f); TTime:=TotalTime;
      Duration:=SecondsToTime(TotalTime);
    end;
    if CID+AID>2 then begin MainForm.LTime.Font.Size:=12; MainForm.LTime.Top:=0; end;
    if HaveChapters then TotalTime:=UpdateLen;
    exit;
  end;
  //suppress repetitive lines
  if (len>0) AND (Line=LastLine) then begin
    inc(LineRepeatCount);
    exit;
  end;
  if LineRepeatCount>0 then
    LogForm.AddLine('(last message repeated '+IntToStr(LineRepeatCount)+' times)');
  LastLine:=Line;
  LineRepeatCount:=0;
  // add line to log and check for special patterns
  if UseUni then LogForm.AddLine(UTF8Decode(Line))
  else LogForm.AddLine(Line);

  if not CheckVobsubID then
  if not CheckVobsubLang then
  if not CheckDVDT then
  if not CheckDVDC then
  if not CheckDVDA then
  if not CheckDVDTL then
  if not CheckVCDT then
  if not CheckChapterLen then
  if not CheckVideoID then
  if not CheckVideoName then
  if not CheckAudioID then
  if not CheckAudioNameLang then
  if not CheckSubID then
  if not CheckSubNameLang then
  if not CheckFilesubID then
  if not CheckLength then
  if not CheckFileFormat then
  if not CheckDecoder then
  if not CheckCodec then
  if not CheckICYInfo then
  //if not CheckNOAudio then
  if not CheckAudio then
  //if not CheckNoVideo then
  //if not CheckStartPlayback then
  if not CheckNativeResolutionLine then    // modifies Line, should be last
  if not CheckDVDNavTL then
  ;
  // check for generic ID_ pattern
  if (len>3) and (Copy(Line,1,3)='ID_') then begin
    p:=Pos('=',Line);
    HandleIDLine(Copy(Line,4,p-4), Trim(Copy(Line,p+1,length(Line))));
  end;

end;


////////////////////////////////////////////////////////////////////////////////

procedure HandleIDLine(ID, Content: string);
var AsInt,r:integer; AsFloat:real;
begin
  with StreamInfo do begin
  // convert to int and float
    val(Content,AsInt,r);
    if r<>0 then begin
      val(Content,AsFloat,r);
      if r<>0 then begin
        AsInt:=0; AsFloat:=0;
      end
      else AsInt:=trunc(AsFloat);
    end
    else AsFloat:=AsInt;

  // handle some common ID fields
       if ID='FILENAME'      then FileName:=Content
  else if ID='VIDEO_BITRATE' then Video.Bitrate:=AsInt
  else if ID='VIDEO_WIDTH'   then Video.Width:=AsInt
  else if ID='VIDEO_HEIGHT'  then Video.Height:=AsInt
  else if ID='VIDEO_FPS'     then Video.FPS:=AsFloat
  else if ID='VIDEO_ASPECT'  then Video.Aspect:=AsFloat
  else if ID='AUDIO_BITRATE' then Audio.Bitrate:=AsInt
  else if ID='AUDIO_RATE'    then Audio.Rate:=AsInt
  else if ID='AUDIO_NCH'     then Audio.Channels:=AsInt
  else if (ID='DEMUXER') then begin
         DemuxerName:=Content;
         if (length(FileFormat)=0) then FileFormat:=Content;
       end
  else if (ID='VIDEO_FORMAT') AND (length(Video.Decoder)=0) then Video.Decoder:=Content
  else if (ID='VIDEO_CODEC') AND (length(Video.Codec)=0) then Video.Codec:=Content
  else if (ID='AUDIO_FORMAT') AND (length(Audio.Decoder)=0) then Audio.Decoder:=Content
  else if (ID='AUDIO_CODEC') AND (length(Audio.Codec)=0) then Audio.Codec:=Content
  else if (ID='LENGTH') AND (AsFloat>0.001) then begin
    AsFloat:=Frac(AsFloat);
    if (AsFloat>0.0009) then begin
      str(AsFloat:0:3, PlaybackTime);
      PlaybackTime:=SecondsToTime(AsInt) + Copy(PlaybackTime,2,20);
    end else
      PlaybackTime:=SecondsToTime(AsInt);
  end else if (Copy(ID,1,14)='CLIP_INFO_NAME') AND (length(ID)=15) then begin
    r:=Ord(ID[15])-Ord('0');
    if (r>=0) AND (r<=9) then ClipInfo[r].Key:=Content;
  end else if (Copy(ID,1,15)='CLIP_INFO_VALUE') AND (length(ID)=16) then begin
    r:=Ord(ID[16])-Ord('0');
    if (r>=0) AND (r<=9) then ClipInfo[r].Value:=Content;
  end;
end; end;


procedure ResetStreamInfo;
var i:integer;
begin
  with StreamInfo do begin
    FileName:='';
    FileFormat:='';
    PlaybackTime:='';
  with Video do begin
    Decoder:=''; Codec:='';
    Bitrate:=0; Width:=0; Height:=0; FPS:=0.0; Aspect:=0.0;
  end;
  with Audio do begin
    Decoder:=''; Codec:='';
    Bitrate:=0; Rate:=0; Channels:=0;
  end;
  for i:=0 to 9 do
    with ClipInfo[i] do begin
      Key:=''; Value:='';
    end;
  end;
end;

begin
  DecimalSeparator:='.'; Wadsp:=false; OpenM:=0; GUI:=false; HaveMsg:=false;
  MFunc:=0; ETime:=false; InSubDir:=true; ML:=false; InterW:=4; InterH:=3;
  AudiochannelsID:=0; OSDLevel:=1; Ch:=0; Wid:=true; Fd:=false; DragM:=false;
  Deinterlace:=0; Aspect:=0; Postproc:=0; VobsubCount:=0; IntersubCount:=0;
  AudioOut:=3; AudioDev:=0; Expand:=0; SPDIF:=false; DirHIdx:=0; DirHSub:=0;
  ReIndex:=false; SoftVol:=false; RFScr:=false; ni:=false; Dnav:=false; Fol:=2;
  dbbuf:=true; Dr:=false; Volnorm:=false; Defaultslang:=false; Pri:=true;
  Params:=''; OnTop:=0; MAspect:='Default'; empty:=true; lavf:=false; vsync:=false;
  Status:=sNone; Shuffle:=false; Loop:=false; OneLoop:=false; Uni:=false;
  Volume:=100; Mute:=False; Duration:=''; MouseMode:=0; SubPos:=96; FSize:=4.5;
  Flip:=false; Mirror:=false; Yuy2:=false; Eq2:=false; LastEq2:=false; Rot:=0;
  Bp:=0; Ep:=0; FB:=2; UpdateSkipBar:=false; Async:=false; AsyncV:='100';
  Cache:=false; CacheV:='2048'; bri:=101; contr:=101; hu:=101; sat:=101;
  gam:=101; briD:=101; contrD:=101; huD:=101; satD:=101; gamD:=101; uof:=false;
  Dda:=false; LastDda:=false; Utf:=false; TextColor:=$00ffff; OutColor:=0;
  Ass:=false; Efont:=true; ISub:=false; speed:=1; LastScale:=100; Scale:=100;
  LastHaveVideo:=false; AutoNext:=true; FilterDrop:=false; PScroll:=true;
  nobps:=false; Ccap:='Chapter'; Acap:='Angle'; CurPlay:=-1; Status:=sNone;
  LTextColor:=clWindowText; LBGColor:=clWindow; LHGColor:=$93; ClientProcess:=0;
  ReadPipe:=0; WritePipe:=0; ExitCode:=0; UseUni:=false; UseekC:=true; CP:=0;
  LyricF:='Tahoma'; LyricS:=8; MaxLenLyric:=''; UpdatePW:=false; VideoOut:='Auto';
  ResetStreamInfo;
end.

