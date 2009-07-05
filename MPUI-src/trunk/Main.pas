{   MPUI-hcb, an MPlayer frontend for Windows
    Copyright (C) 2006-2009 Huang Chen Bin <hcb428@foxmail.com>
    based on work by Martin J. Fiedler <martin.fiedler@gmx.net>

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
unit Main;

interface

uses
  Windows, TntWindows, SysUtils, TntSysutils, Variants, Classes, Graphics, Messages,
  Forms, TntForms, Dialogs, TntDialogs, ComCtrls, TntComCtrls, Buttons, TntButtons,
  ExtCtrls,TntExtCtrls, Menus,TntMenus, StdCtrls, TntStdCtrls,ShellAPI, AppEvnts,
  Math, ImgList, TntClipBrd, ToolWin, jpeg, Controls, MultiMon, TntSystem,
  TntFileCtrl, Core, plist;

const
    ES_SYSTEM_REQUIRED  = $01;
    ES_DISPLAY_REQUIRED = $02;
const
    VK_MEDIA_NEXT_TRACK = $B0;
    VK_MEDIA_PREV_TRACK = $B1;
    VK_MEDIA_STOP       = $B2;
    VK_MEDIA_PLAY_PAUSE = $B3;
    VK_VOLUME_MUTE      = $AD;
    VK_VOLUME_DOWN      = $AE;
    VK_VOLUME_UP        = $AF;
    
type
  TMainForm = class(TTntForm)
    MainMenu: TTntMainMenu;
    OMFile: TTntMenuItem;
    CPanel: TTntPanel;
    BPlay: TTntSpeedButton;
    BPause: TTntSpeedButton;
    UpdateTimer: TTimer;
    SeekBarFrame: TTntPanel;
    SeekBarSlider: TTntPanel;
    MOpenFile: TTntMenuItem;
    MClose: TTntMenuItem;
    N1: TTntMenuItem;
    MQuit: TTntMenuItem;
    OMView: TTntMenuItem;
    MSize50: TTntMenuItem;
    MSize100: TTntMenuItem;
    MSize200: TTntMenuItem;
    MFullscreen: TTntMenuItem;
    OMSeek: TTntMenuItem;
    MSeekF10: TTntMenuItem;
    MSeekR10: TTntMenuItem;
    MSeekF60: TTntMenuItem;
    MSeekR60: TTntMenuItem;
    MSeekF600: TTntMenuItem;
    MSeekR600: TTntMenuItem;
    N2: TTntMenuItem;
    MPause: TTntMenuItem;
    MPlay: TTntMenuItem;
    N3: TTntMenuItem;
    MOptions: TTntMenuItem;
    MOSD: TTntMenuItem;
    MSizeAny: TTntMenuItem;
    MOpenURL: TTntMenuItem;
    MOnTop: TTntMenuItem;
    MShowOutput: TTntMenuItem;
    OMExtra: TTntMenuItem;
    N4: TTntMenuItem;
    MLanguage: TTntMenuItem;
    BFullscreen: TTntSpeedButton;
    BStreamInfo: TTntSpeedButton;
    MAudio: TTntMenuItem;
    N5: TTntMenuItem;
    MSubtitle: TTntMenuItem;
    MDeinterlace: TTntMenuItem;
    MOpenDrive: TTntMenuItem;
    MNoDeint: TTntMenuItem;
    MSimpleDeint: TTntMenuItem;
    MAdaptiveDeint: TTntMenuItem;
    OpenDialog: TTntOpenDialog;
    MAspect: TTntMenuItem;
    MAutoAspect: TTntMenuItem;
    MForce43: TTntMenuItem;
    MForce169: TTntMenuItem;
    MForceCinemascope: TTntMenuItem;
    OPanel: TTntPanel;
    Logo: TTntImage;
    IPanel: TTntPanel;
    LEscape: TTntLabel;
    BPrev: TTntSpeedButton;
    BNext: TTntSpeedButton;
    MPrev: TTntMenuItem;
    MNext: TTntMenuItem;
    MShowPlaylist: TTntMenuItem;
    N6: TTntMenuItem;
    BStop: TTntSpeedButton;
    BPlaylist: TTntSpeedButton;
    PStatus: TTntPanel;
    LTime: TTntLabel;
    SeekBar: TTntPanel;
    VolFrame: TTntPanel;
    VolSlider: TTntPanel;
    BMute: TTntSpeedButton;
    VolImage: TTntImage;
    MAudiochannels: TTntMenuItem;
    N7: TTntMenuItem;
    MMute: TTntMenuItem;
    MStreamInfo: TTntMenuItem;
    VolBoost: TTntPanel;
    BCompact: TTntSpeedButton;
    MCompact: TTntMenuItem;
    MStop: TTntMenuItem;
    LStatus: TTntLabel;
    MenuBar: TTntToolBar;
    MFile: TTntToolButton;
    MView: TTntToolButton;
    MSeek: TTntToolButton;
    MVideos: TTntToolButton;
    MAudios: TTntToolButton;
    MSub: TTntToolButton;
    MExtra: TTntToolButton;
    MVideo: TTntMenuItem;
    N11: TTntMenuItem;
    Hide_menu: TTntMenuItem;
    Mctrl: TTntMenuItem;
    MExpand: TTntMenuItem;
    MNoExpand: TTntMenuItem;
    MSrtExpand: TTntMenuItem;
    MSubExpand: TTntMenuItem;
    N12: TTntMenuItem;
    MSpeed: TTntMenuItem;
    MN8X: TTntMenuItem;
    MN4X: TTntMenuItem;
    MN2X: TTntMenuItem;
    M1X: TTntMenuItem;
    M2X: TTntMenuItem;
    M4X: TTntMenuItem;
    M8X: TTntMenuItem;
    MStereo: TTntMenuItem;
    MLchannels: TTntMenuItem;
    MRchannels: TTntMenuItem;
    N14: TTntMenuItem;
    MForce85: TTntMenuItem;
    MForce54: TTntMenuItem;
    MForce221: TTntMenuItem;
    MLoadSub: TTntMenuItem;
    MSubfont: TTntMenuItem;
    N16: TTntMenuItem;
    MCustomAspect: TTntMenuItem;
    MKaspect: TTntMenuItem;
    MNoOnTop: TTntMenuItem;
    MAOnTop: TTntMenuItem;
    MWOnTop: TTntMenuItem;
    BOpen: TTntSpeedButton;
    MMix: TTntMenuItem;
    MForce11: TTntMenuItem;
    MForce122: TTntMenuItem;
    MPopup: TTntPopupMenu;
    MPPlay: TTntMenuItem;
    MPPause: TTntMenuItem;
    MPStop: TTntMenuItem;
    N10: TTntMenuItem;
    MPPrev: TTntMenuItem;
    MPNext: TTntMenuItem;
    N8: TTntMenuItem;
    MPOpenFile: TTntMenuItem;
    MPExpand: TTntMenuItem;
    MPNoExpand: TTntMenuItem;
    MPSrtExpand: TTntMenuItem;
    MPSubExpand: TTntMenuItem;
    N13: TTntMenuItem;
    MPFullscreen: TTntMenuItem;
    MPCtrl: TTntMenuItem;
    MPCompact: TTntMenuItem;
    OSDMenu: TTntMenuItem;
    MPNoOSD: TTntMenuItem;
    MPDefaultOSD: TTntMenuItem;
    MPTimeOSD: TTntMenuItem;
    MPFullOSD: TTntMenuItem;
    N9: TTntMenuItem;
    MPQuit: TTntMenuItem;
    MWheelControl: TTntMenuItem;
    MVol: TTntMenuItem;
    MDVDT: TTntMenuItem;
    SkipBar: TTntPanel;
    MSkip: TTntMenuItem;
    MIntro: TTntMenuItem;
    MEnd: TTntMenuItem;
    MSIE: TTntMenuItem;
    BSkip: TTntSpeedButton;
    BackBar: TTntPanel;
    Imagery: TImageList;
    MPWheelControl: TTntMenuItem;
    MPVol: TTntMenuItem;
    MPSize: TTntMenuItem;
    MSize: TTntMenuItem;
    MNoOSD: TTntMenuItem;
    MDefaultOSD: TTntMenuItem;
    MTimeOSD: TTntMenuItem;
    MFullOSD: TTntMenuItem;
    MOpenDir: TTntMenuItem;
    MMaxW: TTntMenuItem;
    MPMaxW: TTntMenuItem;
    MEqualizer: TTntMenuItem;
    MOsdfont: TTntMenuItem;
    MVCDT: TTntMenuItem;
    MShowSub: TTntMenuItem;
    MRmMenu: TTntMenuItem;
    MRnMenu: TTntMenuItem;
    N17: TTntMenuItem;
    N18: TTntMenuItem;
    OMAudio: TTntMenuItem;
    OMVideo: TTntMenuItem;
    OMSub: TTntMenuItem;
    MFlip: TTntMenuItem;
    MMirror: TTntMenuItem;
    MRotate: TTntMenuItem;
    MChannels: TTntMenuItem;
    M2ch: TTntMenuItem;
    M4ch: TTntMenuItem;
    M6ch: TTntMenuItem;
    MSpdif: TTntMenuItem;
    MRotate0: TTntMenuItem;
    MRotate9: TTntMenuItem;
    MRotateN9: TTntMenuItem;
    N19: TTntMenuItem;
    MShot: TTntMenuItem;
    N20: TTntMenuItem;
    MSEqualizer: TTntMenuItem;
    MLoadAudio: TTntMenuItem;
    N22: TTntMenuItem;
    MSoftVol: TTntMenuItem;
    N23: TTntMenuItem;
    MUloadAudio: TTntMenuItem;
    MScale: TTntMenuItem;
    MScale0: TTntMenuItem;
    MScale1: TTntMenuItem;
    MScale2: TTntMenuItem;
    MPan: TTntMenuItem;
    N24: TTntMenuItem;
    MPan0: TTntMenuItem;
    MPan1: TTntMenuItem;
    MCX: TTntMenuItem;
    MPostproc: TTntMenuItem;
    MPostOff: TTntMenuItem;
    MPostAuto: TTntMenuItem;
    MPostquality: TTntMenuItem;
    N25: TTntMenuItem;
    N26: TTntMenuItem;
    N27: TTntMenuItem;
    MUseASS: TTntMenuItem;
    N15: TTntMenuItem;
    MLoopAll: TTntMenuItem;
    MOneLoop: TTntMenuItem;
    MShuffle: TTntMenuItem;
    N28: TTntMenuItem;
    MAudioDelay: TTntMenuItem;
    MAudiodelay0: TTntMenuItem;
    MAudioDelay1: TTntMenuItem;
    MAudioDelay2: TTntMenuItem;
    N29: TTntMenuItem;
    MSubDelay: TTntMenuItem;
    N30: TTntMenuItem;
    MSubDelay0: TTntMenuItem;
    MSubDelay1: TTntMenuItem;
    N31: TTntMenuItem;
    MSubDelay2: TTntMenuItem;
    MSubStep: TTntMenuItem;
    MSubStep0: TTntMenuItem;
    MSubStep1: TTntMenuItem;
    N32: TTntMenuItem;
    MForce155: TTntMenuItem;
    MLoadlyric: TTntMenuItem;
    N33: TTntMenuItem;
    N34: TTntMenuItem;
    MUUni: TTntMenuItem;
    MSubScale: TTntMenuItem;
    MSubScale0: TTntMenuItem;
    MSubScale1: TTntMenuItem;
    N21: TTntMenuItem;
    MSubScale2: TTntMenuItem;
    MSCS: TTntMenuItem;
    N35: TTntMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BPlayClick(Sender: TObject);
    procedure BPauseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure SeekBarSliderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SeekBarSliderMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SeekBarSliderMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure SeekBarFrameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SimulateKey(Sender: TObject);
    procedure MSizeClick(Sender: TObject);
    procedure MShowOutputClick(Sender: TObject);
    procedure MOSDClick(Sender: TObject);
    procedure MCloseClick(Sender: TObject);
    procedure MAudioClick(Sender: TObject);
    procedure MSubtitleClick(Sender: TObject);
    procedure MDVDCClick(Sender: TObject);
    procedure MDVDAClick(Sender: TObject);
    procedure MVCDTClick(Sender: TObject);
    procedure MAudiochannelsClick(Sender: TObject);
    procedure MSpeedClick(Sender: TObject);
    procedure MVideoClick(Sender: TObject);
    procedure UpdateMenus(Sender: TObject);
    procedure MDeinterlaceClick(Sender: TObject);
    procedure MOpenFileClick(Sender: TObject);
    procedure MOpenURLClick(Sender: TObject);
    procedure MOpenDriveClick(Sender: TObject);
    procedure MLanguageClick(Sender: TObject);
    procedure MAspectClick(Sender: TObject);
    procedure MOptionsClick(Sender: TObject);
    procedure BPrevNextClick(Sender: TObject);
    procedure MShowPlaylistClick(Sender: TObject);
    procedure BStopClick(Sender: TObject);
    procedure SeekBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VolSliderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VolSliderMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure VolSliderMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BMuteClick(Sender: TObject);
    procedure MStreamInfoClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
     WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure DisplayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DisplayClick(Sender: TObject);
    procedure DisplayDblClick(Sender: TObject);
    procedure DisplayMouseMove(Sender: TObject;
      Shift: TShiftState; X,Y: Integer);
    procedure DisplayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MPopupPopup(Sender: TObject);
    procedure MPCtrlClick(Sender: TObject);
    procedure LStatusClick(Sender: TObject);
    procedure VolBoostClick(Sender: TObject);
    procedure MExpandClick(Sender: TObject);
    procedure MctrlClick(Sender: TObject);
    procedure Hide_menuClick(Sender: TObject);
    procedure ToggleAlwaysOnTop(Sender: TObject);
    procedure MLoadsubClick(Sender: TObject);
    procedure MSubfontClick(Sender: TObject);
    procedure MKaspectClick(Sender: TObject);
    procedure LTimeClick(Sender: TObject);
    procedure MWheelControlClick(Sender: TObject);
    procedure MIntroClick(Sender: TObject);
    procedure MEndClick(Sender: TObject);
    procedure MSIEClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MOpenDirClick(Sender: TObject);
    procedure MEqualizerClick(Sender: TObject);
    procedure MOsdfontClick(Sender: TObject);
    procedure MQuitClick(Sender: TObject);
    procedure MChannelsClick(Sender: TObject);
    procedure MFlipClick(Sender: TObject);
    procedure MMirrorClick(Sender: TObject);
    procedure MRotateClick(Sender: TObject);
    procedure MSpdifClick(Sender: TObject);
    procedure MSEqualizerClick(Sender: TObject);
    procedure MLoadAudioClick(Sender: TObject);
    procedure MSoftVolClick(Sender: TObject);
    procedure MUloadAudioClick(Sender: TObject);
    procedure VolImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MScale0Click(Sender: TObject);
    procedure MPanClick(Sender: TObject);
    procedure MPostprocClick(Sender: TObject);
    procedure MUseASSClick(Sender: TObject);
    procedure MOneLoopClick(Sender: TObject);
    procedure MLoopAllClick(Sender: TObject);
    procedure MShuffleClick(Sender: TObject);
    procedure MAudioDelay2Click(Sender: TObject);
    procedure MSubDelay2Click(Sender: TObject);
    procedure MLoadlyricClick(Sender: TObject);
    procedure MUUniClick(Sender: TObject);
    procedure MSubScale2Click(Sender: TObject);
    procedure MSCSClick(Sender: TObject);

  private
    { Private declarations }
    FirstShow,Seeking,CV,MV,DragD,FirstDrag:boolean;
    WStyle:longint; WheelRolled:boolean;
    FS_PX,FS_PY,FS_SX,FS_SY,SeekMouseX,ViewMode:integer;
    HideMouseAt,UpdateSeekBarAt,PlayMsgAt:Cardinal; //,ScreenSaverActive:Cardinal;
    procedure OpenDroppedFile(Sender: TObject; var Done: Boolean);
    procedure FormDropFiles(var msg:TMessage); message WM_DROPFILES;
    procedure Init_MOpenDrive;
    procedure Init_MLanguage;
    procedure FormGetMinMaxInfo(var msg:TMessage); message WM_GETMINMAXINFO;
    procedure FormMove(var msg:TMessage); message WM_MOVE;
    procedure FormWantSpecialKey(var msg:TCMWantSpecialKey); message CM_WANTSPECIALKEY;
  public
    { Public declarations }
    procedure FixSize;
    procedure SetupStart;
    procedure SetupPlay;
    procedure SetupStop;
    procedure UpdateSeekBar;
    procedure Unpaused;
    procedure VideoSizeChanged;
    procedure DoOpen(const URL,DisplayName:widestring);
    procedure SetFullscreen(Mode:boolean);
    procedure SetCompact(Mode:boolean);
    procedure NextAudio;
    procedure NextVideo;
    procedure NextSub;
    procedure NextAspect;
    procedure NextAngle;
    procedure NextOnTop;
    procedure NextFile(Direction:integer; ExitState:TPlaybackState);
    procedure UpdateStatus;
    procedure UpdateParams;
    procedure UpdateTime;
    procedure UpdateCaption;
    procedure UpdateVolSlider;
    procedure SetVolumeRel(Increment:integer);
    procedure UpdateDockedWindows;
    procedure Localize;
    procedure SetCtrlV(Mode:boolean);
    procedure SetMenuBarV(Mode:boolean);
    procedure SetMouseV(Mode:boolean);
    procedure UpdateMenuEV(Mode:boolean);
    procedure UpdateMenuCheck;
    procedure CreateParams(var Params: TCreateParams); override;
    Procedure PassMsg(var msg: Tmessage); message $0401;
  end;

  PDDEnumCallbackEx=function(lpGuid:PGUID; lpDriverDescription,lpDriverName:PChar; lpContext:pointer; hm:HMONITOR):LongBool; stdcall;

var
  MainForm: TMainForm;

implementation
uses Locale, Config, Log, Help, About, Options, Info,
     UnRAR, Equalizer, SevenZip;

{$R *.dfm}
var IsDrLoaded:THandle = 0;
    DirectDrawEnumerateEx: function(lpDDEnumCallbackEx:PDDEnumCallbackEx; lpContelxt:pointer; dwFlags:DWORD):HRESULT; stdcall;

function SetThreadExecutionState(esFlags:Cardinal):Cardinal; stdcall; external kernel32;

procedure LoadDrLibrary;
begin
  if IsDrLoaded <> 0 then exit;   
  IsDrLoaded := LoadLibrary('ddraw.dll');
  if IsDrLoaded <> 0 then
    @DirectDrawEnumerateEx:= GetProcAddress(IsDrLoaded, 'DirectDrawEnumerateExA');
end;

procedure UnLoadDrLibrary;
begin
  if IsDrLoaded <> 0 then begin
    FreeLibrary(IsDrLoaded);
    IsDrLoaded := 0;
    DirectDrawEnumerateEx:= nil;
  end;
end;

function DDrawEnumCallbackEx(lpGUID:PGUID; lpDriverDescription,lpDriverName:PChar; lpContext:pointer; hm:HMONITOR):LongBool; stdcall;
var len:integer;
begin
  len:=length(HMonitorList);
  SetLength(HMonitorList,len+1);
  HMonitorList[len]:=hm;
  if hm=CurMonitor.Handle then MonitorID:=len;
  Result:=True;
end;

procedure TMainForm.FormCreate(Sender: TObject);
//var Buf: array[0..6] of AnsiChar; i,e:integer;
begin
//AllocConsole;
  randomize;
{$IFDEF VER150}
  // some fixes for Delphi>=7 VCLs
  OPanel.ParentBackground:=False; IPanel.ParentBackground:=False;
  PStatus.ParentBackground:=False; SeekBar.ParentBackground:=False;
  SkipBar.ParentBackground:=False; BackBar.ParentBackground:=False;
  VolSlider.ParentBackground:=False; SeekBarSlider.ParentBackground:=False;
{$ENDIF}
  FirstShow:=true; AutoQuit:=false; ViewMode:=0;
  HideMouseAt:=0; UpdateSeekBarAt:=0; PlayMsgAt:=0;
  WantFullscreen:=false; WantCompact:=false;
  Constraints.MinWidth:=Width; Constraints.MinHeight:=Height;
  if Win32PlatformIsXP then MainForm.Imagery.Clear;
  Load(HomeDir+'autorun.inf',0); Load(HomeDir+DefaultFileName,0);
  if not WideFileExists(MplayerLocation) then MplayerLocation:=HomeDir+'mplayer.exe';
  if subcode='' then subcode:='CP'+IntToStr(LCIDToCodePage(LOCALE_USER_DEFAULT)); //AnsiCodePage
  //OEM CodePage
  {if subcode='' then begin   
    GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_IDEFAULTCODEPAGE,Buf,6);
    Val(Buf,i,e);
    if e <> 0 then i:=GetOEMCP;
    subcode:='CP'+IntToStr(i);
  end; }
  UpdateVolSlider;
  if RP and (EL<>-1) then Left:=EL
  else Left:=(screen.Width-Width) DIV 2;
  if RP and (ET<>-1) then Top:=ET
  else begin
    if Wid and Win32PlatformIsUnicode then
      Top:=(screen.Height-Height) Div 2
    else Top:=screen.WorkAreaHeight-Constraints.MinHeight;
  end;

  if RFScr then begin
      OPanel.PopupMenu:=nil; IPanel.PopupMenu:=nil;
  end
  else begin
      OPanel.PopupMenu:=MPopup; IPanel.PopupMenu:=MPopup;
  end;
  Init_MOpenDrive; Init_MLanguage; 
  with Logo do ControlStyle:=ControlStyle+[csOpaque];
  with IPanel do ControlStyle:=ControlStyle+[csOpaque];

  if OnTop=1 then SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
//  SystemParametersInfo(SPI_GETSCREENSAVEACTIVE,0,@ScreenSaverActive, 0);
//  SystemParametersInfo(SPI_SETSCREENSAVEACTIVE,0,nil, 0);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ForceStop; ClearTmpFiles(TempDir); 
//  SystemParametersInfo(SPI_SETSCREENSAVEACTIVE, ScreenSaverActive, nil, 0);
  Config.Save(HomeDir+DefaultFileName,1);
  UnLoadRarLibrary; UnLoadZipLibrary; UnLoad7zLibrary;
  UnLoadShell32Library; UnLoadDsLibrary; UnLoadDrLibrary;
  FontPaths.Free; SetErrorMode(0);
end;

procedure TMainForm.FormShow(Sender: TObject);
var i,PCount:integer; FileName:WideString; IsFirst:boolean;
begin
  UpdateDockedWindows;
  if FirstShow then begin
    FirstShow:=false; MonitorID:=0;
    CurMonitor:=Screen.MonitorFromWindow(Handle);
    if Win32PlatformIsUnicode then begin
      if IsDrLoaded=0 then LoadDrLibrary;
      if IsDrLoaded<>0 then DirectDrawEnumerateEx(DDrawEnumCallbackEx,nil,1);
    end
    else begin
      MPause.Visible:=false; MPPause.Visible:=false;
      BPause.Enabled:=false;
    end;
    MonitorW:=CurMonitor.Width; MonitorH:=CurMonitor.Height;
    ActivateLocale(DefaultLocale);
    Application.ProcessMessages;

    if WideParamStr(1)<>'' then begin
      PCount:=WideParamCount; IsFirst:=true;
      for i:=1 to PCount do begin
        FileName:=WideParamStr(i);
        if not CheckOption(FileName) then begin
          if IsFirst then begin PClear:=true; IsFirst:=false; end;
          if WideDirectoryExists(FileName) then begin
            Playlist.AddDirectory(FileName);
            empty:=true;
          end
          else Playlist.AddFiles(FileName);
        end;
      end;
    end
    else begin
      if AutoPlay then begin
        PClear:=true;
        Playlist.AddDirectory('.');
        empty:=true;
      end;
    end;
    Playlist.Changed;
    if Playlist.Count>0 then Application.OnIdle:=OpenDroppedFile;
  end;
  DragAcceptFiles(Handle,true);
end;

procedure TMainForm.FormHide(Sender: TObject);
begin
  DragAcceptFiles(Handle,false);
end;

procedure TMainForm.FormDropFiles(var msg:TMessage);
var hDrop:THandle; fnbuf,j,t:widestring; k:boolean;
    i,h,DropCount,s:integer; Entry:TPlaylistEntry;
    tw:array[0..1024]of wideChar; ta:array[0..1024]of Char;
begin
  hDrop:=msg.wParam;
  if Win32PlatformIsUnicode then DropCount:=DragQueryFileW(hDrop,cardinal(-1),nil,0)
  else DropCount:=DragQueryFile(hDrop,cardinal(-1),nil,0);
  VobFileCount:=0; s:=0;
  for i:=0 to DropCount-1 do begin
    if Win32PlatformIsUnicode then begin
      DragQueryFileW(hDrop,i,tw,1024); fnbuf:=tw;
    end
    else begin
      DragQueryFile(hDrop,i,ta,1024); fnbuf:=WideString(ta);
    end;
    if WideDirectoryExists(fnbuf) then begin
      if i=0 then PClear:=true;
      Playlist.AddDirectory(fnbuf);
      empty:=true;
      Loadsub:=0;
    end
    else begin
      j:=Tnt_WideLowerCase(WideExtractFileExt(fnbuf));
      if FilterDrop then k:=CheckInfo(MediaType,j)>ZipTypeCount
      else k:=CheckInfo(SubType,j)=-1;
      if k then begin
        if i=0 then PClear:=true;
        Playlist.AddFiles(fnbuf);
        Loadsub:=0;
      end
      else begin
        if j='.idx' then begin
          inc(VobFileCount);
          if VobFileCount=1 then begin
            j:=WideExtractFileName(fnbuf);
            Vobfile:=WideExtractFilePath(fnbuf)+copy(j,1,length(j)-4);
            Loadsub:=1; LoadVob:=1; Restart;
          end;
        end
        else begin
          if CheckInfo(ZipType,j)>-1 then begin
            if IsLoaded(j) then begin
              Loadsub:=1; TmpPW:='';
              t:=ExtractSub(fnbuf,playlist.FindPW(fnbuf),j);
              if HaveLyric=0 then ExtractLyric(fnbuf,TmpPW,j,-1);
              if t<>'' then begin
                Vobfile:=t;
                inc(VobFileCount);
                if VobFileCount=1 then begin
                  LoadVob:=1; Restart;
                end;
              end;
              h:=AddMovies(fnbuf,TmpPW,false,j);
              if h<>0 then begin
                Loadsub:=0;
                if i=0 then PClear:=true;
              end;
              if h>0 then AddMovies(fnbuf,TmpPW,true,j);
              if h<0 then begin
                Entry.State:=psNotPlayed;
                Entry.FullURL:=fnbuf;
                if Pos('://',fnbuf)>1 then Entry.DisplayURL:=fnbuf
                else Entry.DisplayURL:=WideExtractFileName(fnbuf);
                playlist.Add(Entry);
              end;
            end;
          end
          else begin
            if Running and (j='.lrc') and (HaveLyric=0) then begin
              j:=WideExtractFileName(MediaURL);
              j:=Tnt_WideLowerCase(Copy(j,1,length(j)-length(WideExtractFileExt(MediaURL))));
              t:=WideExtractFileName(fnbuf);
              t:=Tnt_WideLowerCase(Copy(t,1,length(t)-4));
              if j=t then Lyric.ParseLyric(fnbuf);
            end
            else begin
              Loadsub:=1;
              t:=fnbuf;
              if (not IsWideStringMappableToAnsi(t)) or (pos(',',t)>0) then t:=WideExtractShortPathName(t);
              if not Win32PlatformIsUnicode then begin
                Loadsub:=2; Loadsrt:=2;
                AddChain(s,substring,EscapePath(EscapeParam(t)));
              end
              else
                SendCommand('sub_load '+EscapePath(EscapeParam(t)));
            end;
          end;
        end;
      end;
    end;
  end;
  DragFinish(hDrop);
  Playlist.Changed;
  if (not Win32PlatformIsUnicode) and (s>0) then Restart;
  if Loadsub=0 then Application.OnIdle:=OpenDroppedFile;
  msg.Result:=0;
end;

procedure TMainForm.OpenDroppedFile(Sender: TObject; var Done: Boolean);
begin
  Done:=true; 
  Application.OnIdle:=nil;
  UpdateParams;
  NextFile(0,psPlaying);
end;

procedure TMainForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WinClassName:='fengying';
end;

procedure TMainForm.PassMsg(var msg:Tmessage);
var OpenFileName:WideString; t:string;
begin
  if not Win32PlatformIsUnicode then begin
    SetLength(t,msg.LParam);
    GlobalGetAtomName(msg.WParam,@t[1],msg.LParam+1);
    OpenFileName:=WideString(t);
  end
  else begin
    SetLength(OpenFileName,msg.LParam);
    GlobalGetAtomNameW(msg.WParam,@OpenFileName[1],msg.LParam+1);
  end;
  GlobalDeleteAtom(msg.WParam);
  if not CheckOption(OpenFileName) then begin
    if not HaveMsg then begin PClear:=true; HaveMsg:=true; end;
    if WideDirectoryExists(OpenFileName) then begin
      Playlist.AddDirectory(OpenFileName);
      empty:=true;
    end
    else Playlist.AddFiles(OpenFileName);
    Playlist.Changed;
  end;
  PlayMsgAt:=GetTickCount()+500;
end;

procedure TMainForm.DoOpen(const URL,DisplayName:widestring);
begin
  ForceStop;
  Sleep(50); // wait for the processing threads to finish
  Application.ProcessMessages;  // let the VCL process the finish messages
  if Firstrun then MediaURL:=URL;  //MakeURL(URL,DisplayURL);
  if DisplayURL<>DisplayName then begin
    LyricURL:=''; DisplayURL:=DisplayName;
  end;
  UpdateCaption;
  FirstOpen:=true;
  Start;
end;

procedure TMainForm.BPlayClick(Sender: TObject);
begin
  if BPause.Down then SendCommand('pause')
  else if not Running then NextFile(0,psPlaying);
  BPlay.Down:=Running;
end;

procedure TMainForm.BPauseClick(Sender: TObject);
begin
  BPause.Down:=True;
  if Status=sPaused then SendCommand('frame_step')
  else SendCommand('pause');
end;

procedure TMainForm.Unpaused;
begin
  if Status=sPaused then begin
    BPause.Down:=false; BPlay.Down:=true;
    Status:=sPlaying; UpdateStatus;
  end;
end;

procedure TMainForm.UpdateVolSlider;
begin
  if Volume<0 then Volume:=0;
  if (Volume>100) AND (not SoftVol) then Volume:=100;
  if Volume>1000 then Volume:=1000;
  if Volume>100 then begin
    VolBoost.Visible:=True;
    VolBoost.Caption:=IntToStr(Volume)+'%';
  end
  else begin
    VolBoost.Visible:=False;
    VolSlider.Left:=Volume*(VolFrame.ClientWidth-VolSlider.Width) DIV 100;
  end;
end;

procedure TMainForm.SetVolumeRel(Increment:integer);
begin
  if mute then exit;
  if (Volume>100) OR ((Volume=100) AND (Increment>0))
    then Increment:=Increment*10 DIV 3;  // bigger volume change steps if >100%
  inc(Volume, Increment);
  UpdateVolSlider;
  SendVolumeChangeCommand(Volume);
end;


procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var i,j:integer;
  procedure HandleCommand(const Command:string); begin
    if not Win32PlatformIsUnicode then exit;
    SendCommand(Command);
  end;
  procedure HandleSeekCommand(const Command:string); begin
    if not Win32PlatformIsUnicode then exit;
    SendCommand(Command);
    if HaveChapters then Sendcommand('get_property chapter');
    SendCommand('get_time_length');
  end;
begin
if MVideos.Visible then begin
  if Key=VK_ESCAPE then begin
    if MFullscreen.Checked then Key:=Ord('F')
    else if MCompact.Checked then Key:=VK_F5;
  end;
  if ssCtrl in Shift then begin
    case Key of
      VK_RIGHT:   if Wid then begin
                    IPanel.Left:=IPanel.Left-3; IPanel.Width:=IPanel.Width+6;
                    CBHSA:=2;
                  end;
       VK_LEFT:   if Wid then begin
                    if IPanel.Width<=6 then exit;
                    IPanel.Left:=IPanel.Left+3; IPanel.Width:=IPanel.Width-6;
                    CBHSA:=2;
                  end;
         VK_UP:   if Wid then begin
                    IPanel.Top:=IPanel.Top-3; IPanel.Height:=IPanel.Height+6;
                    CBHSA:=2;
                  end;
       VK_DOWN:   if Wid then begin
                    if IPanel.Height<=6 then exit;
                    IPanel.Top:=IPanel.Top+3; IPanel.Height:=IPanel.Height-6;
                    CBHSA:=2;
                  end;
      {+=} 187:   begin HandleCommand('sub_scale +0.1'); FSize:=FSize+0.1;
                    if FSize>10 then FSize:=10;
                  end;
      {-_} 189:   begin HandleCommand('sub_scale -0.1'); FSize:=FSize-0.1;
                    if FSize<0.1 then FSize:=0.1;
                  end;
    end;
  end
  else begin
    if Wid and (ssAlt in Shift) then begin
      case Key of
        Ord('3'):   MSizeClick(MSizeAny);
        {`~} 192:   MSizeClick(MSize50);
        Ord('1'):   MSizeClick(MSize100);
        Ord('2'):   MSizeClick(MSize200);
      end;
    end
    else begin
      if ssShift in Shift then begin
        case Key of
          Ord('A'):   NextAngle;
          Ord('E'):   MEqualizerClick(nil);
          {`~} 192:   if Wid then MScale0Click(nil);
          Ord('S'):   HandleCommand('screenshot 1');
          Ord('Z'):   MSubDelay2Click(nil);
        end;
      end
      else begin
        case Key of
          VK_SUBTRACT: if HaveVideo and HaveAudio and (Adelay>-99.9)then begin
                         Adelay:=Adelay-0.1; HandleCommand('audio_delay -0.100');
                       end;
          VK_ADD:      if HaveVideo and HaveAudio and (Adelay<99.9)then begin
                         Adelay:=Adelay+0.1; HandleCommand('audio_delay +0.100');
                       end;
          Ord('O'):   begin OSDLevel:=(OSDLevel+1) MOD 4;
                        HandleCommand('osd');
                        MOSD.Items[OSDLevel].Checked:=true;
                        OSDMenu.Items[OSDLevel].Checked:=true;
                      end;
          {`~} 192:  EqualizerForm.BResetClick(nil);
          {'"} 222:  if Deinterlace=2 then HandleCommand('step_property deinterlace');
          Ord('E'):  if Wid then begin Scale:=Scale+1; LastScale:=Scale;
                       MKaspect.Checked:=true; FixSize;
                     end;
          Ord('W'):  if Wid and (Scale>100) then begin Scale:=Scale-1; LastScale:=Scale;
                       MKaspect.Checked:=true; FixSize;
                     end;
          Ord('1'),VK_NUMPAD1:   begin HandleCommand('contrast -3');
                                   SendCommand('osd_show_property_text "'+OSD_Contrast_Prompt+':${contrast}"');
                                 end;
          Ord('2'),VK_NUMPAD2:   begin HandleCommand('contrast +3');
                                   SendCommand('osd_show_property_text "'+OSD_Contrast_Prompt+':${contrast}"');
                                 end;
          Ord('3'),VK_NUMPAD3:   begin HandleCommand('brightness -3');
                                   SendCommand('osd_show_property_text "'+OSD_Brightness_Prompt+':${brightness}"');
                                 end;
          Ord('4'),VK_NUMPAD4:   begin HandleCommand('brightness +3');
                                   SendCommand('osd_show_property_text "'+OSD_Brightness_Prompt+':${brightness}"');
                                 end;
          Ord('5'),VK_NUMPAD5:   begin HandleCommand('hue -3');
                                   SendCommand('osd_show_property_text "'+OSD_Hue_Prompt+':${hue}"');
                                 end;
          Ord('6'),VK_NUMPAD6:   begin HandleCommand('hue +3');
                                   SendCommand('osd_show_property_text "'+OSD_Hue_Prompt+':${hue}"');
                                 end;
          Ord('7'),VK_NUMPAD7:   begin HandleCommand('saturation -3');
                                   SendCommand('osd_show_property_text "'+OSD_Saturation_Prompt+':${saturation}"');
                                 end;
          Ord('8'),VK_NUMPAD8:   begin HandleCommand('saturation +3');
                                   SendCommand('osd_show_property_text "'+OSD_Saturation_Prompt+':${saturation}"');
                                 end;
          VK_INSERT: begin HandleCommand('gamma +3');
                       SendCommand('osd_show_property_text "'+OSD_Gamma_Prompt+':${gamma}"');
                     end;
          VK_DELETE: begin HandleCommand('gamma -3');
                       SendCommand('osd_show_property_text "'+OSD_Gamma_Prompt+':${gamma}"');
                     end;
          Ord('D'):   HandleCommand('frame_drop');
          Ord('F'):   if Wid then begin
                        case ViewMode of
                          0: SetFullscreen(not(MFullscreen.Checked));
                          1: SimulateKey(MCompact);
                          2: SimulateKey(MMaxW);
                        end;
                      end
                      else HandleCommand('vo_fullscreen');
          Ord('C'):   if MSubtitle.Count>0 then HandleCommand('sub_alignment');
          Ord('T'):   if (MSubtitle.Count>0) and (not Ass) then begin
                        HandleCommand('sub_pos +2'); subpos:=subpos+2;
                        if SubPos>100 then SubPos:=100;
                      end;
          Ord('R'):   if (MSubtitle.Count>0) and (not Ass) then begin
                        HandleCommand('sub_pos -2'); subpos:=subpos-2;
                        if SubPos<0 then SubPos:=0;
                      end;
          Ord('V'):   if MSubtitle.Count>0 then begin
                        MShowSub.Checked:=not MShowSub.Checked;
                        HandleCommand('sub_visibility');
                      end;
          Ord('S'):   HandleCommand('screenshot 0');
          Ord('Y'):   if MSubtitle.Count>0 then HandleCommand('sub_step -1');
          Ord('U'):   if MSubtitle.Count>0 then HandleCommand('sub_step +1');
          Ord('Z'):   if MSubtitle.Count>0 then begin
                        Sdelay:=Sdelay-0.1; HandleCommand('sub_delay -0.1');
                      end;
          Ord('X'):   if MSubtitle.Count>0 then begin
                        Sdelay:=Sdelay+0.1; HandleCommand('sub_delay +0.1');
                      end;
          Ord('G'):   if Dnav then HandleCommand('dvdnav 5'); {menu}
          Ord('H'):   if Dnav then HandleCommand('dvdnav 6'); {selset}
          Ord('I'):   if Dnav then HandleCommand('dvdnav 1'); {up}
          Ord('K'):   if Dnav then HandleCommand('dvdnav 2'); {down}
          Ord('J'):   if Dnav then HandleCommand('dvdnav 3'); {left}
          Ord('L'):   if Dnav then HandleCommand('dvdnav 4'); {right}
          {;:} 186:   if Dnav then HandleCommand('dvdnav prev');
          Ord('N'):   NextAspect;
          Ord('B'):   NextSub;
          Ord('Q'):   NextVideo;
          Ord('P'):   if (DemuxerName='mpegts') or (DemuxerName='lavf') or (DemuxerName='lavfpref') then
                        HandleCommand('step_property switch_program');
          VK_F2:      if Wid then MKaspectClick(nil);
          VK_F3:      if Wid then Hide_menuClick(nil);
          VK_F4:      if Wid then MctrlClick(nil);
          VK_F5:      if Wid then begin
                        MCompact.Checked:=not MCompact.Checked;
                        BCompact.Down:=MCompact.Checked;
                        MPCompact.Checked:=MCompact.Checked;
                        if MCompact.Checked and MMaxW.Checked then begin
                          MMaxW.Checked:=false; MPMaxW.Checked:=false;
                          SetWindowLong(Handle,GWL_STYLE,(WS_THICKFRAME OR WS_VISIBLE) AND (NOT WS_DLGFRAME));
                          SetBounds(Left-3,Top-3,Width+6,Height+6); MFunc:=1;
                          MWheelControl.Items[1].Checked:=true;
                          MPWheelControl.Items[1].Checked:=true;
                        end
                        else
                          SetCompact(MCompact.Checked);
                      end;
             VK_TAB:  if Wid then MPCtrlClick(nil);
          VK_RETURN:  if Wid then begin
                        if MCompact.Checked then begin
                          SetCompact(false); BCompact.Down:=false;
                          MCompact.Checked:=false; MPCompact.Checked:=false;
                        end;
                        MMaxW.Checked:=not MMaxW.Checked;
                        SetCompact(MMaxW.Checked);
                        MPMaxW.Checked:=MMaxW.Checked;
                      end;
        end;
      end;
    end;
  end;
end;
if ssCtrl in Shift then begin
  case Key of
    Ord('O'):   MOpenFileClick(nil);
    Ord('L'):   MOpenURLClick(nil);
    Ord('W'):   MCloseClick(nil);
    Ord('S'):   BStopClick(nil);
    {`~} 192:   MPanClick(nil);
    Ord('Q'):   Close;
    Ord('D'):   MOpenDirClick(nil);
     VK_BACK:   MAudioDelay2Click(nil);
  end;
end
else begin
  if ssAlt in Shift then begin
    case Key of
      VK_F4:      Close;
    end;
  end
  else begin
    if ssShift in Shift then begin
      case Key of
        Ord('D'):   MAudiochannelsClick(MStereo);
        Ord('L'):   MAudiochannelsClick(MLchannels);
        Ord('R'):   MAudiochannelsClick(MRchannels);
        Ord('M'):   MAudiochannelsClick(MMix);
      end;
    end
    else begin
      case Key of
        VK_RIGHT:   HandleSeekCommand('seek +10');
        VK_LEFT:    HandleSeekCommand('seek -10');
        VK_UP:      HandleSeekCommand('seek +60');
        VK_DOWN:    HandleSeekCommand('seek -60');
        VK_PRIOR:   HandleSeekCommand('seek +600');
        VK_NEXT:    HandleSeekCommand('seek -600');
        VK_HOME:    if UseekC then begin HandleSeekCommand('seek_chapter +1');
                      i:=CheckMenu(MDVDT,TID);
                      if (i>2) and HaveChapters then begin
                        j:=CheckMenu(MDVDT.Items[i].Items[0],CID);
                        if j<MDVDT.Items[i].Items[0].Count-1 then begin
                          MDVDT.Items[i].Items[0].Items[j+1].Checked:=true;
                          inc(CID);
                        end;
                      end;
                    end;
        VK_END:     if UseekC then begin HandleSeekCommand('seek_chapter -1');
                      i:=CheckMenu(MDVDT,TID);
                      if (i>2) and HaveChapters then begin
                        j:=CheckMenu(MDVDT.Items[i].Items[0],CID);
                        if j>0 then begin
                          MDVDT.Items[i].Items[0].Items[j-1].Checked:=true;
                          dec(CID);
                        end;
                      end;
                    end;
        VK_BACK:    MSpeedClick(M1X);
       {-_} 189:    if Speed>0.01 then begin HandleCommand('speed_mult 0.9090909');
                      Speed:=Speed*0.9090909; MCX.Checked:=true;
                      if Speed<0.01 then Speed:=0.01
                    end;
       {+=} 187:    if Speed<100 then begin HandleCommand('speed_mult 1.1');
                      Speed:=Speed*1.1; MCX.Checked:=true;
                      if Speed>100 then Speed:=100;
                    end;
        Ord('M'),VK_VOLUME_MUTE:   BMuteClick(nil);
        Ord('9'),VK_NUMPAD9,VK_DIVIDE,VK_VOLUME_DOWN:     SetVolumeRel(-3);
        Ord('0'),VK_NUMPAD0,VK_MULTIPLY,VK_VOLUME_UP:     SetVolumeRel(+3);
        {,<} 188:   HandleSeekCommand('balance -0.1');
        {.>} 190:   HandleSeekCommand('balance +0.1');
        Ord('A'):   NextAudio;
        VK_F1:      NextOnTop;
        VK_F9:      MShowPlaylistClick(nil);
        VK_F10:     MOptionsClick(nil);
        VK_F11:     MStreamInfoClick(nil);
        VK_F12:     MShowOutputClick(nil);
         {[} 219:   MIntroClick(nil);
         {]} 221:   MEndClick(nil);
        {\|} 220:   MSIEClick(nil);
        {/?} 191:   BPauseClick(nil);
        VK_SPACE,VK_MEDIA_PLAY_PAUSE:  if Running then SendCommand('pause')
                                       else if BPlay.Enabled then NextFile(0,psPlaying);
        VK_MEDIA_STOP:  if BStop.Enabled then BStopClick(nil);
        VK_MEDIA_PREV_TRACK,VK_F7: if BPrev.Enabled then BPrevNextClick(BPrev);
        VK_MEDIA_NEXT_TRACK,VK_F8: if BNext.Enabled then BPrevNextClick(BNext);
      end;
    end;
  end;
end;
Key:=0;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if HaveVideo then begin
    case Key of
      Ord('1'),VK_NUMPAD1,Ord('2'),VK_NUMPAD2:   begin CBHSA:=1; SendCommand('get_property contrast'); end;
      Ord('3'),VK_NUMPAD3,Ord('4'),VK_NUMPAD4:   begin CBHSA:=1; SendCommand('get_property brightness'); end;
      Ord('5'),VK_NUMPAD5,Ord('6'),VK_NUMPAD6:   begin CBHSA:=1; SendCommand('get_property hue'); end;
      Ord('7'),VK_NUMPAD7,Ord('8'),VK_NUMPAD8:   begin CBHSA:=1; SendCommand('get_property saturation'); end;
                          VK_INSERT,VK_DELETE:   begin CBHSA:=1; SendCommand('get_property gamma'); end;
    end;
    if CBHSA=2 then begin
      InterW:=IPanel.Width; InterH:=IPanel.Height;
      MKaspect.Checked:=true; CBHSA:=0;
      Aspect:=MCustomAspect.Tag; MCustomAspect.Checked:=true;
      if InterW<>0 then NativeHeight:=InterH*NativeWidth DIV InterW;
      FixSize;
    end;
  end;
  Key:=0;
end;

procedure TMainForm.UpdateTimerTimer(Sender: TObject);
var P:Tpoint; TickCount:Cardinal; i:integer;
begin
  TickCount:=GetTickCount;
  if (CPanel.Visible OR MenuBar.Visible) AND (not seeking)
    AND (not MPCtrl.Checked) then begin
    GetCursorPos(p);
    if (P.X<Left) OR (P.X>(Left+Width)) OR
      (P.Y<Top) OR (P.Y>(Top+Height)) then begin
      SetCtrlV(false); SetMenuBarV(false);
    end;
  end;
  
  if (TickCount>=PlayMsgAt) and HaveMsg then begin
    HaveMsg:=false;
    if Playlist.Count>0 then begin
      UpdateParams;
      NextFile(0,psPlaying);
      if IsIconic(Application.Handle) then Application.Restore
      else Application.BringToFront;
      SetForegroundWindow(Application.Handle);
    end;
  end;

  if Running then begin
    if Status=sPlaying then begin
      if TickCount>=UpdateSeekBarAt then UpdateSeekBar;
      if MVideos.Visible then begin
        CurMonitor:=Screen.MonitorFromWindow(Handle);
        if Win32PlatformIsUnicode then begin
          for i:=low(HMonitorList) to high(HMonitorList) do begin
            if HMonitorList[i]=CurMonitor.Handle then begin
              if MonitorID<>i then begin
                MonitorID:=i; MonitorW:=CurMonitor.Width; MonitorH:=CurMonitor.Height;
                if IsDx then Restart;
              end;
              break;
            end;
          end;
        end;
        if (CurMonitor.Width<>MonitorW) or (CurMonitor.Height<>MonitorH) then begin
          MonitorW:=CurMonitor.Width; MonitorH:=CurMonitor.Height;
          if IsDx then Restart;
        end;
      end;
      if HaveVideo OR (HaveLyric<>0) then SetThreadExecutionState(ES_DISPLAY_REQUIRED)
      else SetThreadExecutionState(ES_SYSTEM_REQUIRED);
    end; {//Allow OS into "Stand by" or "Hibernate" state when player in "pause" state
    else SetThreadExecutionState(ES_SYSTEM_REQUIRED); }
    
    if (TotalTime>0) and UpdateSkipBar then begin
      UpdateSkipBar:=false;
      if (Bp>0) and (Bp<TotalTime) then
        SkipBar.Left:=SeekBar.Left+SeekBar.Width*Bp DIV TotalTime
      else SkipBar.Left:=SeekBar.Left;
      if (Ep>0) and (Ep<TotalTime) then
        SkipBar.Width:=(SeekBar.Width*Ep DIV TotalTime)-SkipBar.Left+SeekBar.Left
      else SkipBar.Width:=SeekBar.Width-SkipBar.Left+SeekBar.Left;
    end;
    //鼠标为手形时，不隐藏鼠标
   { if (MouseMode=0) and (OuterPanel.Cursor<>-1) and (InnerPanel.Cursor=crDefault)
      and (GetTickCount>=HideMouseAt) then SetMousV(false);
    ///////////////////// }
    //无论鼠标为何种形状，当鼠标不是隐藏状态时都会去执行鼠标隐藏。当鼠标隐藏时不会执行拖曳字幕功能
    if (MouseMode=0) and (OPanel.Cursor<>-1) and (IPanel.Cursor<>-1)
      and (TickCount>=HideMouseAt) then SetMouseV(false);
    ///////////////////
  end
  else begin
    if (Status=sNone) OR (Status=sStopped) then
      LTime.Caption:=FormatDateTime(DTFormat,Now,FormatSet);
  end;
end;

procedure TMainForm.FixSize;
var SX,SY,NX,NY:integer;
begin
  if (NativeWidth=0) OR (NativeHeight=0)
    OR (not MKaspect.Checked) then exit;

  SX:=OPanel.Width; SY:=OPanel.Height;
  NY:=SY; NX:=NativeWidth*SY DIV NativeHeight;
  if NX>SX then begin NX:=SX; NY:=NativeHeight*SX DIV NativeWidth; end;
  with IPanel do begin
    Width:=NX*LastScale DIV 100;
    Height:=NY*LastScale DIV 100;
    Left:=(SX-Width) DIV 2;
    Top:=(SY-Height) DIV 2;
  end;
end;

procedure TMainForm.FormResize(Sender: TObject);
var CX,CY:integer;
begin
  if SeekBarSlider.Visible then UpdateSeekBar;
  if (TotalTime>0) and SkipBar.Visible then begin
    if (Bp>0) and (Bp<TotalTime) then
      SkipBar.Left:=SeekBar.Left+SeekBar.Width*Bp DIV TotalTime
    else SkipBar.Left:=SeekBar.Left;
    if (Ep>0) and (Ep<TotalTime) then
      SkipBar.Width:=(SeekBar.Width*Ep DIV TotalTime)-SkipBar.Left+SeekBar.Left
    else SkipBar.Width:=SeekBar.Width-SkipBar.Left+SeekBar.Left;
  end;
  if (Width>=(Screen.Width-20)) OR (Height>=(Screen.WorkAreaHeight-20))
    OR MMaxW.Checked then LastScale:=Scale;
  FixSize;
  CX:=OPanel.ClientWidth;
  CY:=OPanel.ClientHeight;
  Logo.Left:=(CX-Logo.Width) DIV 2;
  Logo.Top:=(CY-Logo.Height) DIV 2;
  LEscape.Left:=(CX-LEscape.Width) DIV 2;
  LEscape.Top:=Max(Logo.Top+Logo.Height,CY*3 DIV 4);
  UpdateDockedWindows;
  if ControlledResize then
    ControlledResize:=false
  else begin
    MSizeAny.Checked:=true; MSizeAny.Checked:=false;
  end;
end;

procedure TMainForm.SetupStart;
begin
  BPlay.Enabled:=true;
  BPlay.Down:=true;
  BStop.Enabled:=true;
  SeekBarSlider.Visible:=true;
  //SeekBarSlider.Left:=0;
  BPause.Enabled:=true;
  BPause.Down:=false;
 // BStreamInfo.Enabled:=true;
end;

procedure TMainForm.SetupPlay;
begin
  Logo.Visible:=false;
  LEscape.Visible:=not(HaveVideo) AND MFullscreen.Checked;
  IPanel.Visible:=HaveVideo and Wid;
  Seeking:=false; LTime.Cursor:=crHandPoint;
  LTime.Font.Size:=14; LTime.Top:=-2;
  //if HaveVideo then FixSize;
  //UpdateTime;
  InfoForm.UpdateInfo;
end;

procedure TMainForm.SetupStop;
begin
  BPlay.Down:=false;
  BPlay.Enabled:=(Playlist.Count>0);
  BStop.Enabled:=false;
  SeekBarSlider.Visible:=false;
  IPanel.Visible:=false;
  BPause.Enabled:=false;
  BPause.Down:=false;
  //BStreamInfo.Enabled:=false;
  Logo.Visible:=not Running;
  LEscape.Visible:=MFullscreen.Checked;
  SetMouseV(true);
  MLoadSub.Visible:=false;
  MShowSub.Visible:=false; N17.Visible:=MShowSub.Visible;
  LTime.Cursor:=crDefault; LTime.Caption:='';
  LTime.Font.Size:=12; LTime.Top:=0;
  TntApplication.Title:=Caption;
end;

procedure TMainForm.UpdateSeekBar;
var MaxPos:integer;
begin
  if Seeking or (TotalTime=0) then exit;
  MaxPos:=SeekBarFrame.ClientWidth-SeekBarSlider.Width;
  SeekBarSlider.Left:=MaxPos*SecondPos DIV TotalTime;
  if SeekBarSlider.Left>MaxPos then SeekBarSlider.Left:=MaxPos;
end;

procedure TMainForm.SeekBarSliderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button=mbLeft) AND (TotalTime>0) then begin
    Seeking:=true; SeekBarSlider.ShowHint:=false;
    SeekBarSlider.BevelInner:=bvRaised;
    SeekMouseX:=X;
  end;
  if Button=mbmiddle then MIntroClick(nil);
  if Button=mbright then MEndClick(nil);
end;

procedure TMainForm.SeekBarSliderMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var NewX,MaxX:integer;
begin
  if not(ssLeft in Shift) OR (not Seeking) OR (TotalTime=0) then exit;
  NewX:=X-SeekMouseX+SeekBarSlider.Left;
  MaxX:=SeekBarFrame.ClientWidth-SeekBarSlider.Width;
  if MaxX=0 then exit;
  if NewX<0 then NewX:=0;
  if NewX>MaxX then NewX:=MaxX;
  SeekBarSlider.Left:=NewX;
  LastPos:=TotalTime*NewX DIV MaxX;
  if ETime then
    LTime.Caption:='-'+SecondsToTime(TotalTime-LastPos)+'/'+Duration
  else
    LTime.Caption:=SecondsToTime(LastPos)+'/'+Duration;
  TntApplication.Title:=DisplayURL+' ['+LTime.Caption+']';
  if Mctrl.Checked then
    Caption:=DisplayURL+' ['+LTime.Caption+']'+' - '+LOCstr_Title;
end;

procedure TMainForm.SeekBarSliderMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button<>mbLeft) or (TotalTime=0) then exit;
  SeekBarSlider.BevelInner:=bvLowered;
  {if (CID>1) and HaveChapters then SendCommand('seek '+IntToStr(LastPos-SecondPos))
  else SendCommand('seek '+IntToStr(LastPos)+' 2');}
  SendCommand('seek '+IntToStr(LastPos-SecondPos));
  if HaveVideo then SendCommand('osd_show_text '+IntToStr(100*LastPos DIV TotalTime)+'%');
  Seeking:=false; SeekBarSlider.ShowHint:=true;
  UpdateSeekBarAt:=GetTickCount()+1000;
  if not Win32PlatformIsUnicode then Restart;
end;

procedure TMainForm.SeekBarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var P:TPoint;
begin
  P:=SeekBarFrame.ScreenToClient(SeekBar.ClientToScreen(Point(X,Y)));
  SeekBarFrameMouseDown(Sender,Button,Shift,P.X,P.Y);
end;

procedure TMainForm.SeekBarFrameMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var MaxPos:integer;
begin
  if (not SeekBarSlider.Visible) or (Button<>mbLeft) or (TotalTime=0) then exit;
  dec(X,SeekBarSlider.Width DIV 2);
  MaxPos:=SeekBarFrame.ClientWidth-SeekBarSlider.Width;
  if MaxPos=0 then exit;
  {if (CID>1) and HaveChapters then SendCommand('seek '+IntToStr((TotalTime*X DIV MaxPos)-SecondPos))
  else SendCommand('seek '+IntToStr(TotalTime*X DIV MaxPos)+' 2'); }
  SendCommand('seek '+IntToStr((TotalTime*X DIV MaxPos)-SecondPos));
  if HaveVideo then SendCommand('osd_show_text '+IntToStr(100*X DIV MaxPos)+'%');
  SeekBarSlider.Left:=X; UpdateSeekBarAt:=GetTickCount()+1000;
  if not Win32PlatformIsUnicode then Restart;
end;

procedure TMainForm.SimulateKey(Sender: TObject);
var Key:word; Shift:TShiftState;
begin
  Shift:=[];
  if Sender=MRnMenu then Key:=186  //;
  else if Sender=MRmMenu then Key:=81 //g
  else if Sender=MSubScale0 then begin Key:=187; Shift:=[ssCtrl]; end //-_
  else if Sender=MSubScale1 then begin Key:=189; Shift:=[ssCtrl]; end //+=
  else Key:=(Sender as TComponent).Tag;
  FormKeyDown(Sender,Key,Shift);
end;

procedure TMainForm.VideoSizeChanged;
var SX,SY,PX,PY:integer;
begin
  if (not Wid) OR (not Win32PlatformIsUnicode) OR
    (NativeWidth=0) OR (NativeHeight=0) then exit;
  if (not (MSize50.Checked or MSize100.Checked or MSize200.Checked or MSizeAny.Checked))
    OR MFullscreen.Checked then begin
    FixSize;
    exit;
  end;
  SX:=NativeWidth; SY:=NativeHeight;
  if MSize50.Checked then begin
    SX:=SX DIV 2; SY:=SY DIV 2;
    if SX<Constraints.MinWidth then begin
      SX:=Constraints.MinWidth;
      if NativeWidth<>0 then SY:=SX*NativeHeight DIV NativeWidth;
    end;
  end;
  if MSize200.Checked then begin SX:=SX*2; SY:=SY*2; end;
  if MSizeAny.Checked then begin if NW<>0 then SX:=NW; if NH<>0 then SY:=NH; end;
  PX:=Left+((OPanel.Width-SX) DIV 2);
  PY:=Top+((OPanel.Height-SY) DIV 2);
  SX:=Width-(OPanel.Width-SX);
  SY:=Height-(OPanel.Height-SY);
  if PX<0 then PX:=0; if PY<0 then PY:=0;
  if SX>Screen.Width then begin SX:=Screen.Width; MSizeAny.Checked:=True; MSizeAny.Checked:=false; end;
  if SY>Screen.WorkAreaHeight then begin SY:=Screen.WorkAreaHeight; MSizeAny.Checked:=True; MSizeAny.Checked:=false; end;
  if (PX+SX)>Screen.Width then PX:=Screen.Width-SX;
  if (PY+SY)>Screen.WorkAreaHeight then PY:=Screen.WorkAreaHeight-SY;
  SetWindowLong(Handle,GWL_STYLE,DWORD(GetWindowLong(Handle,GWL_STYLE)) AND (NOT WS_MAXIMIZE));
  ControlledResize:=true; LastScale:=100; SetBounds(PX,PY,SX,SY);
  if WantCompact then begin
    SimulateKey(MCompact); WantCompact:=false;
  end;
  if WantFullscreen then begin
    SimulateKey(MFullscreen); WantFullscreen:=False;
  end;
  ControlledResize:=false;
end;

procedure TMainForm.MSizeClick(Sender: TObject);
begin
  if MFullscreen.Checked then SimulateKey(MFullscreen)
  else if (Sender as TMenuItem).Checked then exit;
  (Sender as TMenuItem).Checked:=True;
  VideoSizeChanged; 
end;

procedure TMainForm.MShowOutputClick(Sender: TObject);
begin
  if not LogForm.Visible then LogForm.Showmodal;
end;

procedure TMainForm.MOSDClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  OSDLevel:=(Sender as TMenuItem).Tag;
  case OSDLevel of
    0: SendCommand('osd_show_text "OSD: '+OSD_Disable_Prompt+'"');
    1: SendCommand('osd_show_text "OSD: '+OSD_Enable_Prompt+'"');
  end;
  SendCommand('osd '+IntToStr(OSDLevel));
  if not Win32PlatformIsUnicode then Restart;
  MOSD.Items[OSDLevel].Checked:=true;
  OSDMenu.Items[OSDLevel].Checked:=true;
end;

procedure TMainForm.ToggleAlwaysOnTop(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  OnTop:=(Sender as TMenuItem).Tag;
  case OnTop of
    0:  begin
          if not MFullscreen.Checked then begin
            if HaveVideo and (not Wid) then SendCommand('vo_ontop 0')
            else SetWindowPos(Handle,HWND_NOTOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
          end;
          if HaveVideo and Wid then SendCommand('osd_show_text "'+OSD_OnTop0_Prompt+'"');
        end;
    1:  begin
          if not MFullscreen.Checked then begin
            if HaveVideo and (not Wid) then SendCommand('vo_ontop 1')
            else SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
          end;
          if HaveVideo and Wid then SendCommand('osd_show_text "'+OSD_OnTop1_Prompt+'"');
        end;
    2:  if Running then begin
          if (Status=sPlaying) and (not MFullscreen.Checked) then begin
            if HaveVideo and (not Wid) then SendCommand('set_property ontop 1')
            else SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
          end;
          if HaveVideo then SendCommand('osd_show_text "'+OSD_OnTop2_Prompt+'"');
        end
        else SetWindowPos(Handle,HWND_NOTOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
  end;
  (Sender as TMenuItem).Checked:=true;
end;

procedure TMainForm.MCloseClick(Sender: TObject);
begin
  MediaURL:=''; DisplayURL:='';
  Stop;
  BPlay.Enabled:=false;
end;

procedure TMainForm.MSpeedClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  case (Sender as TMenuItem).Tag of
    0: begin Speed:= 0.125; SendCommand('speed_set 0.125'); end;
    1: begin Speed:= 0.25; SendCommand('speed_set 0.25'); end;
    2: begin Speed:= 0.5; SendCommand('speed_set 0.5'); end;
    3: begin Speed:= 1; SendCommand('speed_set 1'); end;
    4: begin Speed:= 2; SendCommand('speed_set 2'); end;
    5: begin Speed:= 4; SendCommand('speed_set 4'); end;
    6: begin Speed:= 8; SendCommand('speed_set 8'); end;
    7: SendCommand('speed_set '+FloatToStr(Speed));
  end;
  if not Win32PlatformIsUnicode then Restart;
  (Sender as TMenuItem).Checked:=True;
end;

procedure TMainForm.MVideoClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  VideoID:=(Sender as TMenuItem).Tag;
  if (CheckInfo(VideoDemuxer,DemuxerName)<0) OR (not Win32PlatformIsUnicode) then
    Restart
  else begin
    SendCommand('set_property switch_video '+IntToStr(VideoID));
    SendCommand('osd_show_text "'+OSD_VideoTrack_Prompt+': '+IntToStr(VideoID)+#34);
  end;
  (Sender as TMenuItem).Checked:=True;
end;

procedure TMainForm.MAudioClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  AudioID:=(Sender as TMenuItem).Tag;
  if (CheckInfo(AudioDemuxer,DemuxerName)<0) OR (not Win32PlatformIsUnicode) then
    Restart
  else begin
    SendCommand('switch_audio '+IntToStr(AudioID));
    if HaveVideo then
      SendCommand('osd_show_text "'+OSD_AudioTrack_Prompt+': '+IntToStr(AudioID)+#34);
  end;
  (Sender as TMenuItem).Checked:=True;
end;

procedure TMainForm.MAudiochannelsClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  AudiochannelsID:=(Sender as TMenuItem).Tag;
  Restart;
  (Sender as TMenuItem).Checked:=True;
end;

procedure TMainForm.MSubtitleClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  SubID:=(Sender as TMenuItem).Tag;
  SendCommand('sub_select '+IntToStr(SubID));
  (Sender as TMenuItem).Checked:=True;
end;

procedure TMainForm.MDVDCClick(Sender: TObject);
var index:integer;
begin
  index:=CheckMenu((Sender as TMenuItem).Parent,CID);
  (Sender as TMenuItem).Parent.Items[index].Checked:=false;
  CID:=(Sender as TMenuItem).Tag;
  index:=(Sender as TMenuItem).Parent.Parent.Tag;
  (Sender as TMenuItem).Checked:=True;
  if UseekC and (TID=index) then
    SendCommand('seek_chapter '+IntToStr(CID)+' 1')
  else begin
    TID:=index; Dreset:=true;
    Restart;
  end;
end;

procedure TMainForm.MDVDAClick(Sender: TObject);
var index:integer;
begin
  if (Sender as TMenuItem).Checked then exit;
  index:=CheckMenu((Sender as TMenuItem).Parent,AID);
  (Sender as TMenuItem).Parent.Items[index].Checked:=false;
  AID:=(Sender as TMenuItem).Tag;
  TID:=(Sender as TMenuItem).Parent.Parent.Tag;
  (Sender as TMenuItem).Checked:=True;
  if UseekC then
    SendCommand('switch_angle '+IntToStr(AID))
  else begin
    Dreset:=true; Restart;
  end;
end;

procedure TMainForm.MVCDTClick(Sender: TObject);
begin
  CDID:=(Sender as TMenuItem).Tag;
  Dreset:=true;
  Restart;
  (Sender as TMenuItem).Checked:=True;
end;

procedure TMainForm.UpdateMenus(Sender: TObject);
begin
  MCX.Caption:=Copy(MCustomAspect.Caption,1,Pos(' ',MCustomAspect.Caption))+FloatToStr(Speed);
  MCustomAspect.Caption:=Copy(MCustomAspect.Caption,1,Pos(' ',MCustomAspect.Caption))+IntToStr(InterW)+':'+IntToStr(InterH);
  if (NW=0) or (NH=0) then
    MSizeAny.Caption:=Copy(MSizeAny.Caption,1,Pos(' (',MSizeAny.Caption))+'(100%)'
  else
    MSizeAny.Caption:=Copy(MSizeAny.Caption,1,Pos(' (',MSizeAny.Caption))+'('+IntToStr(NW)+':'+IntToStr(NH)+')';
  MIntro.Caption:=Copy(MIntro.Caption,1,Pos(' ',MIntro.Caption))+SecondsToTime(Bp);
  MEnd.Caption:=Copy(MEnd.Caption,1,Pos(' ',MEnd.Caption))+SecondsToTime(Ep);
  MNext.Enabled:=BNext.Enabled;
  MPlay.Enabled:=BPlay.Enabled; MPlay.Checked:=BPlay.Down;
  MPause.Enabled:=BPause.Enabled; MPause.Checked:=BPause.Down;;
  MStop.Enabled:=BStop.Enabled; MPrev.Enabled:=BPrev.Enabled;
  MAudioDelay.Visible:=MVideo.Visible and Running;
  MShowSub.Visible:=(MSubtitle.Count>0) and Running;
  MSubScale.Visible:=MShowSub.Visible; N30.Visible:=MShowSub.Visible;
  MSubDelay.Visible:=MShowSub.Visible; MLoadSub.Visible:=Running;
  MSubStep.Visible:=MShowSub.Visible; N15.Visible:=MShowSub.Visible;
  N17.Visible:=MShowSub.Visible;
end;

procedure TMainForm.MPopupPopup(Sender: TObject);
begin
  MPPlay.Enabled:=BPlay.Enabled; MPPlay.Checked:=BPlay.Down;
  MPPause.Enabled:=BPause.Enabled; MPPause.Checked:=BPause.Down;
  MPStop.Enabled:=BStop.Enabled; MPPrev.Enabled:=BPrev.Enabled;
  MPNext.Enabled:=BNext.Enabled;
end;

procedure TMainForm.MDeinterlaceClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  Deinterlace:=(Sender as TMenuItem).Tag;
  Restart;
  (Sender as TMenuItem).Checked:=true;
end;

procedure TMainForm.MAspectClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  MKaspect.Checked:=true;
  Aspect:=(Sender as TMenuItem).Tag;
  if (Expand=2) OR (not Win32PlatformIsUnicode) then Restart
  else begin
    CBHSA:=3;
    case Aspect of
      0: begin SendCommand('switch_ratio -1'); SendCommand('osd_show_text "'+OSD_Auto_Prompt+'"'); end;
      1: begin SendCommand('switch_ratio 1.3333'); SendCommand('osd_show_text 4:3'); end;
      2: begin SendCommand('switch_ratio 1.7777'); SendCommand('osd_show_text 16:9'); end;
      3: begin SendCommand('switch_ratio 2.35'); SendCommand('osd_show_text 2.35:1'); end;
      4: begin SendCommand('switch_ratio 1.5555'); SendCommand('osd_show_text 14:9'); end;
      5: begin SendCommand('switch_ratio 1.25'); SendCommand('osd_show_text 1.25:1'); end;
      6: begin SendCommand('switch_ratio 1.6'); SendCommand('osd_show_text 16:10'); end;
      7: begin SendCommand('switch_ratio 2.21'); SendCommand('osd_show_text 2.21:1'); end;
      8: begin SendCommand('switch_ratio 1'); SendCommand('osd_show_text 1:1'); end;
      9: begin SendCommand('switch_ratio 1.22'); SendCommand('osd_show_text 1.22:1'); end;
     10: begin if (InterW<>0) and (InterW>3*InterH) then InterW:=3*InterH;
           NativeHeight:=InterH*NativeWidth DIV InterW; VideoSizeChanged;
           SendCommand('osd_show_text "'+OSD_Custom_Prompt+' '+IntToStr(InterW)+':'+IntToStr(InterH)+#34);
         end;
    end;
  end;
  (Sender as TMenuItem).Checked:=true;
end;

procedure TMainForm.MOpenFileClick(Sender: TObject);
begin
  PlaylistForm.BAddClick(Sender);
end;

procedure TMainForm.MOpenDirClick(Sender: TObject);
var s:widestring;
begin
  if WideSelectDirectory(AddDirCp,'',s) then begin
    PClear:=true;
    Playlist.AddDirectory(s);
    empty:=true; Playlist.Changed;
    PlaylistForm.BPlayClick(Sender);
  end;
  {  if AddDirForm.Execute(true) then begin
    PClear:=true;
    Playlist.AddDirectory(AddDirForm.DirView.SelectedFolder.PathName);
    empty:=true; Playlist.Changed;
    PlaylistForm.BPlayClick(Sender);
  end;}
end;

procedure TMainForm.MOpenURLClick(Sender: TObject);
var s:WideString;
begin
  s:=Trim(TntClipboard.AsWideText);
  if (Pos(^M,s)>0) OR (Pos(^J,s)>0) OR (Pos(^I,s)>0) OR
     ((Pos('//',s)=0) AND (Pos('\\',s)=0) AND (Pos(':',s)=0))
     then s:='';
  if (WideInputQuery(LOCstr_OpenURL_Caption,LOCstr_OpenURL_Prompt,s)) and (s<>'') then begin
    PClear:=true;
    if WideDirectoryExists(s) then begin
      Playlist.AddDirectory(s);
      empty:=true;
    end
    else Playlist.AddFiles(s);
    Playlist.Changed;
    UpdateParams;
    NextFile(0,psPlaying);
  end;
end;

procedure TMainForm.Init_MOpenDrive;
var Mask:cardinal; Name:array[0..3]of char; Drive:char;
    Item:TTntMenuItem; MDrive,s:WideString;
begin
  NoAccess:=0; MDrive:=HomeDir+DefaultFileName;
  repeat
    if WideFileIsReadOnly(MDrive) then begin
      NoAccess:=1; break;
    end;
    s:=WideExtractFileDir(MDrive);
    if s<>MDrive then MDrive:=s else break;
  until False;
  MDrive:=Tnt_WideLowerCase(WideExtractFileDrive(HomeDir));
  if length(MDrive)<>2 then NoAccess:=2;
  Name:='@:\';
  Mask:=GetLogicalDrives;
  for Drive:='A' to 'Z' do
    if (Mask AND (1 SHL (Ord(Drive)-65)))<>0 then begin
      Name[0]:=Drive;
      if GetDriveType(Name)=DRIVE_CDROM then begin
        Item:=TTntMenuItem.Create(MOpenDrive);
        with Item do begin
          Caption:=Drive+':';
          Tag:=Ord(Drive);
          RadioItem:=true;
          OnClick:=MOpenDriveClick;
          if MDrive=Tnt_WideLowerCase(Caption) then NoAccess:=3;
        end;
        MOpenDrive.Add(Item);
        MOpenDrive.Enabled:=true;
      end;
    end;
end;

procedure TMainForm.MOpenDriveClick(Sender: TObject);
begin
  PClear:=true;
  Playlist.AddDirectory(char((Sender as TMenuItem).Tag)+':');
  empty:=true;
  Playlist.Changed;
  UpdateParams; 
  NextFile(0,psPlaying);
end;

procedure TMainForm.Init_MLanguage;
var i:integer; Item:TTntMenuItem;
begin
  MLanguage.Clear;
  for i:=0 to High(Locales) do begin
    Item:=TTntMenuItem.Create(MLanguage);
    with Item do begin
      Caption:=Locales[i].Name;
      GroupIndex:=$70;
      RadioItem:=true;
      AutoCheck:=true;
      Tag:=i;
      OnClick:=MLanguageClick;
    end;
    MLanguage.Add(Item);
  end;
end;

procedure TMainForm.MLanguageClick(Sender: TObject);
begin
  ActivateLocale((Sender as TMenuItem).Tag);
end;

procedure TMainForm.MOptionsClick(Sender: TObject);
begin
  if not OptionsForm.Visible then OptionsForm.Showmodal;
end;

procedure TMainForm.SetCtrlV(Mode:boolean);
begin
  if Mctrl.Checked then begin
    Cpanel.Visible:=Mode;
    fixsize;
  end;
end;

procedure TMainForm.SetMenuBarV(Mode:boolean);
begin
  if Hide_menu.Checked then begin
    MenuBar.Visible:=Mode;
    fixsize;
  end;
end;

procedure TMainForm.MPCtrlClick(Sender: TObject);
begin
  MPCtrl.Checked:=not MPCtrl.Checked;
  CPanel.Visible:=MPCtrl.Checked;
  Mctrl.Checked:=not MPCtrl.Checked;
  MenuBar.Visible:=MPCtrl.Checked;
  Hide_menu.Checked:=not MPCtrl.Checked;
  if CPanel.Visible then UpdateCaption;
  VideoSizeChanged;
end;

procedure TMainForm.SetFullscreen(Mode:boolean);
var Pivot:TPoint; PX,PY,SX,SY:integer;
begin
  MFullscreen.Checked:=Mode; BFullscreen.Down:=Mode;
  MPFullscreen.Checked:=Mode;
  if not ControlledResize then begin
    if MCompact.Checked then begin
      ControlledResize:=True; SetCompact(False);
      MCompact.Checked:=false; BCompact.Down:=false;
      MPCompact.Checked:=false; ViewMode:=1;
    end;
    if MMaxW.Checked then begin
      ControlledResize:=True; SetCompact(False);
      MMaxW.Checked:=false; MPMaxW.Checked:=false;
      ViewMode:=2;
    end;
  end;
  
  if MFullscreen.Checked then begin
    FS_PX:=Left; FS_PY:=Top; FS_SX:=Width; FS_SY:=Height;
    CV:=CPanel.Visible; MV:=MenuBar.Visible;
    CPanel.Visible:=false; MenuBar.Visible:=false;
    mctrl.Checked:=true; hide_menu.Checked:=true;
    MPCtrl.Checked:=false;
    Pivot:=OPanel.ClientToScreen(Point(0,0));
    PX:=FS_PX-Pivot.X; PY:=FS_PY-Pivot.Y;
    SX:=Screen.Width +FS_SX-OPanel.ClientWidth;
    SY:=Screen.Height+FS_SY-OPanel.ClientHeight;
    ControlledResize:=true; 
    SetWindowPos(Handle,HWND_TOPMOST,PX,PY,SX,SY,0);
    LEscape.Visible:=not Running;
  end
  else begin
    LEscape.Visible:=false;
    ControlledResize:=true;
    case OnTop of
      0:  SetWindowPos(Handle,HWND_NOTOPMOST,FS_PX,FS_PY,FS_SX,FS_SY,0);
      1:  SetWindowPos(Handle,HWND_TOPMOST,FS_PX,FS_PY,FS_SX,FS_SY,0);
      2:  if Status=sPlaying then
            SetWindowPos(Handle,HWND_TOPMOST,FS_PX,FS_PY,FS_SX,FS_SY,0)
          else
            SetWindowPos(Handle,HWND_NOTOPMOST,FS_PX,FS_PY,FS_SX,FS_SY,0);
    end;
    CPanel.Visible:=CV; MenuBar.Visible:=MV; ViewMode:=0;
    Mctrl.Checked:=not CV; Hide_Menu.Checked:=not MV;
    MPCtrl.Checked:=CV and MV;
    if MSize50.Checked or MSize100.Checked or MSize200.Checked or MSizeAny.Checked then LastScale:=100;
    ControlledResize:=true; FormResize(nil);
    if CV then UpdateCaption;  
  end;
end;

procedure TMainForm.SetCompact(Mode:boolean);
var MenuAndCaption,L,T,W,H:integer;
begin
  if MFullscreen.Checked AND not(ControlledResize) then begin
    ControlledResize:=True; SetFullscreen(False);
  end;

  if Mode then begin
    FS_PX:=Left; FS_PY:=Top; FS_SX:=Width; FS_SY:=Height;
    WheelRolled:=false; WStyle:=GetWindowLong(Handle,GWL_STYLE);
    //SetWindowLong(Handle,GWL_STYLE,(DWORD(GetWindowLong(Handle,GWL_STYLE)) OR WS_POPUP) AND (NOT WS_DLGFRAME));
    if (Width>=(Screen.Width-20)) OR (Height>=(Screen.WorkAreaHeight-20)) OR MMaxW.Checked then begin
      SetWindowLong(Handle,GWL_STYLE,WS_VISIBLE AND (NOT WS_DLGFRAME));
      L:=-2; T:=-2; W:=Screen.Width+4; H:=Screen.WorkAreaHeight+4;
      MFunc:=0; MWheelControl.Items[0].Checked:=true;
      MPWheelControl.Items[0].Checked:=true;
    end
    else begin
      if MenuBar.Visible then
        MenuAndCaption:=MWC+MenuBar.Height
      else
        MenuAndCaption:=MWC;
      L:=Left+IPanel.Left; T:=Top+MenuAndCaption+IPanel.Top;
      W:=Width-2*IPanel.Left;
      if CPanel.Visible then
        H:=Height-MenuAndCaption-2*IPanel.Top-CPanel.Height
      else
        H:=Height-MenuAndCaption-2*IPanel.Top;

      if (W<Constraints.MinWidth) and (NativeWidth<>0) then begin
        W:=Constraints.MinWidth;
        L:=Left+(Width-W) DIV 2;
        H:=Constraints.MinWidth*NativeHeight DIV NativeWidth;
        T:=Top+(Height-H) DIV 2;
      end;
      //SetWindowLong(Handle,GWL_STYLE,(WS_THICKFRAME OR WS_VISIBLE) AND (NOT WS_DLGFRAME));
      SetWindowLong(Handle,GWL_STYLE,WStyle AND (NOT WS_CAPTION));
      ControlledResize:=true; MFunc:=1;
      MWheelControl.Items[1].Checked:=true;
      MPWheelControl.Items[1].Checked:=true;
    end;
    CPanel.Visible:=False; MenuBar.Visible:=False;
    Mctrl.Checked:=true; Hide_menu.Checked:=true;
    MPCtrl.Checked:=false;
    SetBounds(L,T,W,H);
  end
  else begin
    SetWindowLong(Handle,GWL_STYLE,WStyle AND (NOT WS_MAXIMIZE));
    //SetWindowLong(Handle,GWL_STYLE,(DWORD(GetWindowLong(Handle,GWL_STYLE)) OR WS_DLGFRAME) AND (NOT WS_POPUP));
    
    if MPMaxW.Checked and (not WheelRolled) then begin
      L:=FS_PX; T:=FS_PY; W:=FS_SX; H:=FS_SY; 
    end
    else begin
      if MenuBar.Visible then
        MenuAndCaption:=MWC
      else
        MenuAndCaption:=MWC+MenuBar.Height;
      L:=Left; W:=Width; T:=Top-MenuAndCaption;
      
      if not Mctrl.Checked then H:=Height+MenuAndCaption
      else if not Hide_menu.Checked then H:=Height+MenuAndCaption+CPanel.Height
      else H:=Height+MWC+MenuBar.Height+CPanel.Height;

      if L<0 then L:=0; if T<0 then T:=0;
      if W>Screen.Width then W:=Screen.Width;
      if H>Screen.WorkAreaHeight then H:=Screen.WorkAreaHeight;
      if (L+W)>Screen.Width then L:=Screen.Width-W;
      if (T+H)>Screen.WorkAreaHeight then T:=Screen.WorkAreaHeight-H;
    end;
    CPanel.Visible:=true; MenuBar.Visible:=true;
    Mctrl.Checked:=false; Hide_menu.Checked:=false;
    MPCtrl.Checked:=true;
    ControlledResize:=true; SetBounds(L,T,W,H);
    UpdateCaption; MFunc:=0;
    MWheelControl.Items[0].Checked:=true;
    MPWheelControl.Items[0].Checked:=true;
  end;
end;

procedure TMainForm.FormGetMinMaxInfo(var msg:TMessage);
begin
  if MFullscreen.Checked then
    with PMinMaxInfo(msg.lParam)^.ptMaxTrackSize do begin
      X:=4095;
      Y:=4095;
    end;
  msg.Result:=0;
end;

procedure TMainForm.NextAudio;
var i,AudioIndex:integer;
begin
  if MAudio.Count<2 then exit;
  AudioIndex:=-1;
  for i:=0 to MAudio.Count-1 do begin
    if MAudio.Items[i].Checked then begin
      AudioIndex:=(i+1) MOD MAudio.Count;
    end;
  end;
  if AudioIndex<0 then exit;
  with MAudio.Items[AudioIndex] do begin
    Checked:=True;
    AudioID:=Tag;
  end;
  if (CheckInfo(AudioDemuxer,DemuxerName)<0) OR (not Win32PlatformIsUnicode) then
    Restart
  else begin
     SendCommand('switch_audio '+IntToStr(AudioID));
     if HaveVideo then
       SendCommand('osd_show_text "'+OSD_AudioTrack_Prompt+': '+IntToStr(AudioID)+#34);
  end;
end;

procedure TMainForm.NextVideo;
var i,VideoIndex:integer;
begin
  if MVideo.Count<2 then exit;
  VideoIndex:=-1;
  for i:=0 to MVideo.Count-1 do begin
    if MVideo.Items[i].Checked then begin
      VideoIndex:=(i+1) MOD MVideo.Count;
    end;
  end;
  if VideoIndex<0 then exit;
  with MVideo.Items[VideoIndex] do begin
    Checked:=True;
    VideoID:=Tag;
  end;
  if (CheckInfo(VideoDemuxer,DemuxerName)<0) OR (not Win32PlatformIsUnicode) then
    Restart
  else begin
     SendCommand('set_property switch_video '+IntToStr(VideoID));
     SendCommand('osd_show_text "'+OSD_VideoTrack_Prompt+': '+IntToStr(VideoID)+#34);
  end;
end;

procedure TMainForm.NextAspect;
begin
  MKaspect.Checked:=true;
  Aspect:=(Aspect+1) MOD MAspect.Count;
  MAspect.Items[Aspect].Checked:=True;
  if (Expand=2) OR (not Win32PlatformIsUnicode) then Restart
  else begin
    CBHSA:=3;
    case Aspect of
      0: begin SendCommand('switch_ratio -1'); SendCommand('osd_show_text "'+OSD_Auto_Prompt+'"'); end;
      1: begin SendCommand('switch_ratio 1.3333'); SendCommand('osd_show_text 4:3'); end;
      2: begin SendCommand('switch_ratio 1.7777'); SendCommand('osd_show_text 16:9'); end;
      3: begin SendCommand('switch_ratio 2.35'); SendCommand('osd_show_text 2.35:1'); end;
      4: begin SendCommand('switch_ratio 1.5555'); SendCommand('osd_show_text 14:9'); end;
      5: begin SendCommand('switch_ratio 1.25'); SendCommand('osd_show_text 1.25:1'); end;
      6: begin SendCommand('switch_ratio 1.6'); SendCommand('osd_show_text 16:10'); end;
      7: begin SendCommand('switch_ratio 2.21');SendCommand('osd_show_text 2.21:1'); end;
      8: begin SendCommand('switch_ratio 1'); SendCommand('osd_show_text 1:1'); end;
      9: begin SendCommand('switch_ratio 1.22'); SendCommand('osd_show_text 1.22:1'); end;
     10: begin if (InterW<>0) and (InterW>3*InterH) then InterW:=3*InterH;
           NativeHeight:=InterH*NativeWidth DIV InterW; VideoSizeChanged;
           SendCommand('osd_show_text "'+OSD_Custom_Prompt+' '+IntToStr(InterW)+':'+IntToStr(InterH)+#34);
         end;
    end;
  end;
end;

procedure TMainForm.NextAngle;
begin
  if MDVDT.Count=3 then exit;
  if MDVDT.Items[TID+2].Items[1].Count<2 then exit;
  if AID<1 then AID:=1;
  AID:=AID MOD MDVDT.Items[TID+2].Items[1].Count + 1;
  MDVDT.Items[TID+2].Items[1].Items[AID-1].Checked:=True;
  SendCommand('switch_angle '+IntToStr(AID));
end;

procedure TMainForm.NextSub;
begin
  if MSubtitle.Count<1 then exit;
  if SubID<0 then SubID:=0;
  SubID:=(SubID+1) MOD MSubtitle.Count;
  MSubtitle.Items[SubID].Checked:=True;
  SendCommand('sub_select '+IntToStr(SubID));
end;

procedure TMainForm.NextFile(Direction:integer; ExitState:TPlaybackState);
var Index:integer;
begin
  //ForceStop;
  Index:=Playlist.GetNext(ExitState,Direction);
  if Index<0 then begin
    if AutoQuit then Close;
    if not Win32PlatformIsUnicode then Terminate else Stop;
    exit;
  end;
  Playlist.NowPlaying(Index);
  DoOpen(Playlist[Index].FullURL,Playlist[Index].DisplayURL);
end;

procedure TMainForm.NextOnTop;
begin
  OnTop:=(OnTop+1) MOD MOnTop.Count;
  MOnTop.Items[OnTop].Checked:=True;
  case OnTop of
    0:  begin
          if not MFullscreen.Checked then begin
            if HaveVideo and (not Wid) then SendCommand('vo_ontop 0')
            else SetWindowPos(Handle,HWND_NOTOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
          end;
          if HaveVideo and Wid then SendCommand('osd_show_text "'+OSD_OnTop0_Prompt+'"');
        end;
    1:  begin
          if not MFullscreen.Checked then begin
            if HaveVideo and (not Wid) then SendCommand('vo_ontop 1')
            else SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
          end;
          if HaveVideo and Wid then SendCommand('osd_show_text "'+OSD_OnTop1_Prompt+'"');
        end;
    2:  begin
          if (Status=sPlaying) and (not MFullscreen.Checked) then begin
            if HaveVideo and (not Wid) then SendCommand('set_property ontop 1')
            else SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
          end;
          if HaveVideo then SendCommand('osd_show_text "'+OSD_OnTop2_Prompt+'"');
        end;
  end;
end;

procedure TMainForm.BPrevNextClick(Sender: TObject);
begin
  UpdateParams; AutoNext:=false;
  NextFile((Sender as TComponent).Tag,psSkipped);
end;

procedure TMainForm.MShowPlaylistClick(Sender: TObject);
begin
  if PlaylistForm.Visible then
    PlaylistForm.Hide
  else
    PlaylistForm.Show;
end;

procedure TMainForm.MStreamInfoClick(Sender: TObject);
begin
  if MStreamInfo.Checked then
    InfoForm.Hide
  else
    InfoForm.Show;
end;

procedure TMainForm.BStopClick(Sender: TObject);
begin
  BMute.Enabled:=false; CBHSA:=0;
  SetLastPos;
  Stop;
  //Playlist.GetNext(psSkipped,0);
end;

procedure TMainForm.UpdateStatus;
begin
  case Status of
    sPlaying: LStatus.Caption:=LOCstr_Status_Playing;
    sPaused:  LStatus.Caption:=LOCstr_Status_Paused;
    sStopped: LStatus.Caption:=LOCstr_Status_Stopped;
    sError:   LStatus.Caption:=LOCstr_Status_Error;
  end;
  if Status=sError then LStatus.Cursor:=crHandPoint
  else LStatus.Cursor:=crDefault;
  if (OnTop=2) and (not MFullscreen.Checked) then begin
    if Status=sPlaying then begin
      if HaveVideo and (not Wid) then SendCommand('set_property ontop 1')
      else SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
    end
    else begin
      if HaveVideo and (not Wid) then SendCommand('pausing_keep set_property ontop 0')
      else SetWindowPos(Handle,HWND_NOTOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
    end;
    if Plist.PlaylistForm.Visible then SetWindowPos(Plist.PlaylistForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
    if InfoForm.Visible then SetWindowPos(InfoForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
    if AboutForm.Visible then SetWindowPos(AboutForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
    if LogForm.Visible then SetWindowPos(LogForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
    if OptionsForm.Visible then SetWindowPos(OptionsForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
    if EqualizerForm.Visible then SetWindowPos(EqualizerForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
    if HelpForm.Visible then SetWindowPos(HelpForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
  end;
end;

procedure TMainForm.UpdateParams;
begin
  Loadsrt:=0; LoadVob:=0; MSecPos:=-1; Adelay:=0; Sdelay:=0; HaveChapters:=false;
  ETime:=false; CBHSA:=0; Firstrun:=true; HaveAudio:=false; HaveVideo:=false;
  DirHIdx:=0; DirHSub:=0; Vobfile:=''; substring:=''; MShowSub.Checked:=true;
  AudioID:=-1; SubID:=-1; VideoID:=-1; CID:=1; AID:=1; CDID:=1; Dreset:=false;
  subcount:=0; Lastsubcount:=0; VobsubCount:=0;
  LastPos:=0; SecondPos:=-1; TotalTime:=0; Duration:='0:00:00';
  SeekBarSlider.Left:=0; UpdateSkipBar:=SkipBar.Visible;
  if AudioFile<>''then begin AudioFile:=''; MUloadAudio.Visible:=false; end;
end;

procedure TMainForm.UpdateTime;
var s:string;
begin
  if Seeking then exit;
  if ETime then
    LTime.Caption:='-'+SecondsToTime(TotalTime-SecondPos)+'/'+Duration
  else
    LTime.Caption:=SecondsToTime(SecondPos)+'/'+Duration;
  s:='';
  if CID>1 then s:=Ccap+IntToStr(CID);
  if AID>1 then begin
    if s<>'' then s:=Acap+IntToStr(AID)+'@'+s else s:=Acap+IntToStr(AID);
  end;
  if s<>'' then LTime.Caption:='<'+s+'> '+LTime.Caption;
  TntApplication.Title:=DisplayURL+' ['+LTime.Caption+']';
  if Mctrl.Checked then
    Caption:=TntApplication.Title+' - '+LOCstr_Title;
end;

procedure TMainForm.UpdateCaption;
begin
  if length(DisplayURL)<>0
    then Caption:=DisplayURL+' - '+LOCstr_Title
    else Caption:=LOCstr_Title;
end;


procedure TMainForm.VolSliderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button<>mbLeft then exit;
  VolSlider.BevelInner:=bvLowered;
  SeekMouseX:=X;
end;

procedure TMainForm.VolSliderMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var NewX,MaxX,NewVolume:integer;
begin
  if not(ssLeft in Shift) then exit;
  NewX:=X-SeekMouseX+VolSlider.Left;
  MaxX:=VolFrame.ClientWidth-VolSlider.Width;
  if MaxX=0 then exit;
  if NewX<0 then NewX:=0;
  if NewX>MaxX then NewX:=MaxX;
  VolSlider.Left:=NewX;
  NewVolume:=(NewX*100+(MaxX SHR 1)) DIV MaxX;
  if NewVolume=Volume then exit;
  Volume:=NewVolume;
  SendVolumeChangeCommand(Volume);
end;

procedure TMainForm.VolSliderMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  VolSlider.BevelInner:=bvRaised;
end;

procedure TMainForm.BMuteClick(Sender: TObject);
begin
  VolFrame.Enabled:=Mute; Mute:=not(Mute);
  BMute.Down:=Mute; MMute.Checked:=BMute.Down;
  if mute then SendCommand('set_property volume 0')
  else begin
    if SoftVol then SendCommand('set_property volume '+IntToStr(Volume div 10))
    else SendCommand('set_property volume '+IntToStr(Volume));
  end;
end;

procedure TMainForm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var i,j:integer;
begin
  if ssCtrl in Shift then SendCommand('seek '+IntToStr(WheelDelta DIV 20))
  else begin
    case MFunc of
      0: SetVolumeRel(WheelDelta DIV 40);
      1: if MFullscreen.Checked then SetVolumeRel(WheelDelta DIV 40)
         else if (NativeWidth<>0) then begin
           if ((Width=Screen.Width+10) AND (Height=Screen.WorkAreaHeight+10) AND (WheelDelta>0)) OR
              ((Height=Constraints.MinWidth*NativeHeight DIV NativeWidth) AND (WheelDelta<0)) OR
              MFullscreen.Checked then exit;
           if WindowState=wsMaximized then
             SetWindowLong(Handle,GWL_STYLE,DWORD(GetWindowLong(Handle,GWL_STYLE)) AND (NOT WS_MAXIMIZE));
           i:=Width; j:=Height; WheelRolled:=true;
           Height:=j+WheelDelta DIV 2; if j<>0 then Width:=Height*i DIV j;
           if Width=Constraints.MinWidth then Height:=Constraints.MinWidth*NativeHeight DIV NativeWidth;
           Left:=Left-(Width-i) DIV 2; Top:=Top-(Height-j) DIV 2;
           if Left<-5 then Left:=-5; if Top<-5 then Top:=-5;
           if Width>(Screen.Width+10) then Width:=Screen.Width+10;
           if Height>(Screen.WorkAreaHeight+10) then Height:=Screen.WorkAreaHeight+10;
           if (Left+Width)>(Screen.Width+5) then Left:=Screen.Width+5-Width;
           if (Top+Height)>(Screen.WorkAreaHeight+5) then Top:=Screen.WorkAreaHeight+5-Height;
         end;
    end;
  end;
end;

procedure TMainForm.UpdateDockedWindows;
begin
//PlaylistForm Docked
  if plist.LDocked and ((Left+Width)<=(Screen.Width-100)) then begin
    PlaylistForm.ControlledMove:=false;
    PlaylistForm.Left:=Left+Width;
    PlaylistForm.top:=Top-Plist.TT;
  end;

  if plist.RDocked and (Left>=100) then begin
    PlaylistForm.ControlledMove:=false;
    PlaylistForm.Left:=Left-PlaylistForm.Width;
    PlaylistForm.top:=Top-Plist.TT;
  end;

  if plist.TDocked and ((Top+Height)<=(Screen.Height-100)) then begin
    PlaylistForm.ControlledMove:=false;
    PlaylistForm.Top:=Top+Height;
    PlaylistForm.left:=left-Plist.LL;
  end;

  if plist.BDocked and (Top>=PlaylistForm.Height) then begin
    PlaylistForm.ControlledMove:=false;
    PlaylistForm.Top:=Top-PlaylistForm.Height;
    PlaylistForm.left:=left-Plist.LL;
  end;

//InfoForm Docked
  if Info.Docked and ((Left+Width)<=(Screen.Width-100)) then begin
    InfoForm.ControlledMove:=True;
    InfoForm.Left:=Left+Width;
    InfoForm.ControlledMove:=True;
    InfoForm.Top:=Top;
  end;
end;

procedure TMainForm.FormMove(var msg:TMessage);
begin
  msg.Result:=0;   
  UpdateDockedWindows;
end;

procedure TMainForm.Localize;
begin
  MPPlay.Caption:=MPlay.Caption;
  MPPause.Caption:=MPause.Caption;
  MPStop.Caption:=MStop.Caption;
  MPPrev.Caption:=MPrev.Caption;
  MPNext.Caption:=MNext.Caption;
  MPOpenFile.Caption:=MOpenFile.Caption;
  MPostproc.Caption:=OptionsForm.LPostproc.Caption;
    MPostOff.Caption:=OptionsForm.CPostproc.Items[0];
    MPostAuto.Caption:=OptionsForm.CPostproc.Items[1];
    MPostquality.Caption:=OptionsForm.CPostproc.Items[2];
  MPExpand.Caption:=MExpand.Caption;
    MPNoExpand.Caption:=MNoExpand.Caption;
    MPSrtExpand.Caption:=MSrtExpand.Caption;
    MPSubExpand.Caption:=MSubExpand.Caption;
  MPWheelcontrol.Caption:=MWheelcontrol.Caption;
  MPVol.Caption:=MVol.Caption; MPSize.Caption:=MSize.Caption;
  MOSD.Caption:=OSDMenu.Caption;
    MPNoOSD.Caption:=MNoOSD.Caption; MPDefaultOSD.Caption:=MDefaultOSD.Caption;
    MPTimeOSD.Caption:=MTimeOSD.Caption; MPFullOSD.Caption:=MFullOSD.Caption;
  MPFullscreen.Caption:=MFullscreen.Caption; MSEqualizer.Caption:=OptionsForm.CEq2.Caption;
  MPCompact.Caption:=MCompact.Caption; MFlip.Caption:=OptionsForm.CFlip.Caption;
  MPMaxW.Caption:=MMaxW.Caption; MMirror.Caption:=OptionsForm.CMir.Caption;
  MPQuit.Caption:=MQuit.Caption; MRotate.Caption:=OptionsForm.LRot.Caption;
  MChannels.Caption:=OptionsForm.LCh.Caption; MSoftVol.Caption:=OptionsForm.CSoftVol.Caption;
  MSpdif.Caption:=OptionsForm.CSPDIF.Caption; MUseASS.Caption:=OptionsForm.CAss.Caption;
  MShuffle.Caption:=Playlistform.CShuffle.Hint; MLoopAll.Caption:=Playlistform.CLoop.Hint;
  MOneLoop.Caption:=PlaylistForm.COneLoop.Hint; 
end;

procedure TMainForm.DisplayClick(Sender: TObject);
begin
  if Running and (MouseMode>-1) then begin
    if Dnav and (SecondPos=0) then begin
      SendCommand('dvdnav mouse');
      exit;
    end;
    SendCommand('pause');
  end;
end;

procedure TMainForm.DisplayDblClick(Sender: TObject);
begin
  if Running and (not (Dnav and (SecondPos=0))) and (MouseMode>-1) then SendCommand('pause');
  SimulateKey(MFullscreen);
end;

procedure TMainForm.DisplayMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var p:TPoint;
begin

  if Button=mbLeft then begin
    FirstDrag:=true;
    if IPanel.Cursor=crHandPoint then MouseMode:=2 //Drag Subtitle
    else if ssShift in Shift then MouseMode:=3 //Scale video
    else if ssCtrl in Shift then MouseMode:=4 //Adjust aspect ratio
    else if ssAlt in Shift then MouseMode:=5 //Adjust bright,contrast
    else if ((Width<Screen.Width) OR (Height<Screen.WorkAreaHeight))
        AND (WindowState=wsNormal) then begin
      GetCursorPos(p); OldX:=p.X; OldY:=p.Y;
      MouseMode:=1; //Drag window
    end;
  end;

  if Button=mbmiddle then begin
    MFunc:=(MFunc+1) MOD 2;
    case MFunc of
      0:SendCommand('osd_show_text "0:'+OSD_Volume_Prompt+'"');
      1:SendCommand('osd_show_text "1:'+OSD_Size_Prompt+'"');
    end;
    MWheelControl.Items[MFunc].Checked:=true;
    MPWheelControl.Items[MFunc].Checked:=true;
  end;

  if (Button=mbright) and RFScr then SimulateKey(MFullscreen);

end;

procedure TMainForm.DisplayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var p:TPoint; OY,NOY,i:integer;
procedure CheckDragD;
begin
  if FirstDrag then begin
    if abs(p.X-OldX)>abs(p.Y-OldY) then begin
      DragD:=true; SetCursor(Screen.Cursors[crSizeWE]);
    end
    else begin
      DragD:=false; SetCursor(Screen.Cursors[crSizeNS]);
    end;
    FirstDrag:=false;
  end;
end;

begin
  GetCursorPos(p);
  if MCompact.Checked then begin
    OY:=p.Y-(Top+2+OPanel.Top+1);
    NOY:=(Top+2+OPanel.Top+OPanel.Height-1)-p.Y;
  end
  else begin
    if MMaxW.Checked then begin
      OY:=p.Y-(Top+OPanel.Top+1);
      NOY:=(Top+OPanel.Top+OPanel.Height-1)-p.Y;
    end
    else begin
      OY:=p.Y-(Top+3+MWC+OPanel.Top+1);
      NOY:=(Top+3+MWC+OPanel.Top+OPanel.Height-1)-p.Y;
    end;
  end;
  if (not MPCtrl.Checked) and (MouseMode=0) then begin
    if (MSubtitle.Count>0) and Running then begin
      if (not CPanel.Visible) AND (OY>=(OPanel.ClientHeight-25)) then SetCtrlV(True);
      if (not MenuBar.Visible) AND (NOY>=OPanel.ClientHeight-10) then SetMenuBarV(True);
    end
    else begin
      if (not CPanel.Visible) AND (OY>=(OPanel.ClientHeight-CPanel.Height)) then SetCtrlV(True);
      if (not MenuBar.Visible) AND (NOY>=(OPanel.ClientHeight-MenuBar.Height)) then SetMenuBarV(True);
    end;
    if CPanel.Visible AND (OY<OPanel.ClientHeight) then SetCtrlV(false);
    if MenuBar.Visible AND (NOY<OPanel.ClientHeight) then SetMenuBarV(false);
  end;

  if abs(MouseMode)=1 then begin
    SetCursor(Screen.Cursors[crSizeAll]);
    {ReleaseCapture;
    SendMessage(Handle, WM_SYSCOMMAND, SC_MOVE+2, 0);
    //Perform(WM_SYSCOMMAND,$F012,0);
    //SC_MOVE = 61456; $F012 = 61458 =SC_MOVE+2
    MouseMode:=0;}
    MouseMode:=-1; //在拖动时不进行单击、双击事件
    left:=left+p.X-OldX; Top:=Top+p.Y-OldY;
    OldX:=p.X; OldY:=p.Y;
  end;

  if (not Running) then exit;
  if IPanel.Width<1 then IPanel.Width:=1;
  if IPanel.Height<1 then IPanel.Height:=1;
  i:=(OY-IPanel.Top)*100 DIV IPanel.Height;

  if (MouseMode=0) and ((p.X<>OldX) or (p.Y<>OldY)) then begin
    OldX:=p.X; OldY:=p.Y;    //Hide Cursor
    if Dnav and (Sender=IPanel) then SendCommand('set_mouse_pos '+IntToStr(X*NativeWidth div IPanel.Width)+' '+IntToStr(Y*NativeHeight div IPanel.Height));
    if (abs(i-SubPos)<=10) and (MSubtitle.Count>0) then begin
      IPanel.Cursor:=crHandPoint; OPanel.Cursor:=crHandPoint;
      HideMouseAt:=GetTickCount+2000;
    end
    else SetMouseV(true);
  end;

  if abs(MouseMode)=2 then begin
    MouseMode:=-2; //在拖动时不进行单击、双击事件
    if ssCtrl in shift then begin   //Scale Subtitle
      FSize:=FSize+(p.X-OldX)/60;
      OldX:=p.X; OldY:=p.Y;
      if FSize>10 then FSize:=10; if FSize<0.1 then FSize:=0.1;
      if ass then SendCommand('sub_scale '+FloatToStr(FSize/3.2)+' 1')
      else SendCommand('sub_scale '+FloatToStr(FSize)+' 1');
    end
    else if not Ass then begin       //Move Subtitle
      SubPos:=i;
      if SubPos<0 then SubPos:=0; if SubPos>100 then SubPos:=100;
      SendCommand('sub_pos '+IntToStr(SubPos)+' 1');
    end;
  end;

  if abs(MouseMode)=3 then begin
    MouseMode:=-3; //在拖动时不进行单击、双击事件
    CheckDragD;
    if DragD then begin   //Change Volumn
      if MFunc=0 then FormMouseWheel(nil,Shift,20*(p.X-OldX),p,DragD)
      else FormMouseWheel(nil,Shift,4*(p.X-OldX),p,DragD);
    end
    else begin  //Scale Video
      Scale:=Scale+(OldY-p.Y);
      if Scale<100 then Scale:=100;
      LastScale:=Scale; MKaspect.Checked:=true;
      FixSize;
    end;
    OldX:=p.X; OldY:=p.Y;
  end;

  if abs(MouseMode)=4 then begin  //Ajust Aspect ratio
    MouseMode:=-4; //在拖动时不进行单击、双击事件
    SetCursor(Screen.Cursors[crCross]);
    {CheckDragD;
    if DragD then begin }
      if IPanel.Width>=32 then begin
        IPanel.Left:=IPanel.Left-(p.X-OldX);
        IPanel.Width:=IPanel.Width+(p.X-OldX)*2;
      end;
   // end
   // else begin
      if IPanel.Height>=32 then begin
        IPanel.Top:=IPanel.Top+(p.Y-OldY);
        IPanel.Height:=IPanel.Height-(p.Y-OldY)*2;
      end;
   // end;
    OldX:=p.X; OldY:=p.Y;
  end;

  if abs(MouseMode)=5 then begin  //Ajust C/B/S/H/G
    MouseMode:=-5; //在拖动时不进行单击、双击事件
    CheckDragD;
    if ssAlt in shift then begin
      if DragD then begin
        SendCommand('brightness '+IntToStr(p.X-OldX));
        SendCommand('osd_show_property_text "'+OSD_Brightness_Prompt+':${brightness}"');
      end
      else begin
        SendCommand('contrast '+IntToStr(OldY-p.Y));
        SendCommand('osd_show_property_text "'+OSD_Contrast_Prompt+':${contrast}"');
      end;
    end
    else if ssCtrl in shift then begin
      SendCommand('gamma '+IntToStr(p.X-OldX));
      SendCommand('osd_show_property_text "'+OSD_Gamma_Prompt+':${gamma}"');
    end
    else begin
      if DragD then begin
        SendCommand('saturation '+IntToStr(p.X-OldX));
        SendCommand('osd_show_property_text "'+OSD_Saturation_Prompt+':${saturation}"');
      end
      else begin
        SendCommand('hue '+IntToStr(OldY-p.Y));
        SendCommand('osd_show_property_text "'+OSD_Hue_Prompt+':${hue}"');
      end;
    end;
    OldX:=p.X; OldY:=p.Y;
  end;
  
{//鼠标为手形时，不隐藏鼠标
  if MouseMode=0 then begin
    if (MSubtitle.Count>0) and (abs(Y*100 DIV IPanel.Height-SubPos)<=10) then begin
      IPanel.Cursor:=crHandPoint;
    else begin
      if (X<>OldX) or (Y<>OldY) then begin
        OldX:=X; OldY:=Y;
        SetMouseV(true);
      end;
    end;
  end;

//无论鼠标为何种形状，当鼠标不是隐藏状态时都会去执行鼠标隐藏。当鼠标隐藏时不会执行拖曳字幕功能
if (MouseMode=0) and ((X<>OldX) or (Y<>OldY)) then begin
    OldX:=X; OldY:=Y;
    if (MSubtitle.Count>0) and (abs(Y*100 DIV IPanel.Height-SubPos)<=10) then begin
      IPanel.Cursor:=crHandPoint;
      OPanel.Cursor:=crDefault;
      HideMouseAt:=GetTickCount+500;
    end
    else SetMouseV(true);
  end;
//////////////////////}

end;

procedure TMainForm.DisplayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if MouseMode=-4 then begin
    InterW:=IPanel.Width; InterH:=IPanel.Height;
    MKaspect.Checked:=true;
    Aspect:=MCustomAspect.Tag; MCustomAspect.Checked:=true; 
    if InterW<>0 then NativeHeight:=InterH*NativeWidth DIV InterW;
    FixSize;
  end;
  if MouseMode=-5 then begin
    CBHSA:=1;
    SendCommand('get_property contrast');
    SendCommand('get_property brightness');
    SendCommand('get_property hue');
    SendCommand('get_property saturation');
    SendCommand('get_property gamma');
  end;
  MouseMode:=0; 
end;

procedure TMainForm.SetMouseV(Mode:boolean);
begin
  if Mode then begin
    Logo.Cursor:=crDefault;
    IPanel.Cursor:=crDefault;
    OPanel.Cursor:=crDefault;
    HideMouseAt:=GetTickCount+500;
    //ShowCursor(true);
  end
  else begin
    OPanel.Cursor:=-1;
    IPanel.Cursor:=-1;
    Logo.Cursor:=-1;
    //ShowCursor(false);
  end;
end;

procedure TMainForm.UpdateMenuCheck;
begin
  MAudiochannels.Items[AudiochannelsID].Checked:=true;
  MChannels.Items[Ch].Checked:=true;
  MRotate.Items[Rot].Checked:=true;
  MDeinterlace.Items[Deinterlace].Checked:=true;
  MAspect.Items[Aspect].Checked:=true;
  MPostproc.Items[Postproc].Checked:=true;
  MSEqualizer.Checked:=Eq2;
  MFlip.Checked:=Flip;
  MMirror.Checked:=Mirror;
  MSpdif.Checked:=SPDIF;
  MSoftVol.Checked:=SoftVol;
  MUseASS.Checked:=Ass;
end;

procedure TMainForm.UpdateMenuEV(Mode:boolean);
begin
  MVideos.Visible:=Mode; MSub.Visible:=Mode; MPWheelControl.Visible:=Mode;
  N12.Visible:=Mode and Wid; MPFullscreen.Visible:=Mode; N3.Visible:=Mode;
  MPExpand.Visible:=Mode; OSDMenu.Visible:=Mode; MWheelControl.Visible:=Mode and Wid;
  MOSD.Visible:=Mode; MFullscreen.Visible:=Mode and Wid; MSCS.Visible:=Mode and Wid;
  N35.Visible:=Mode and Wid; MSizeAny.Visible:=Mode and Wid; MSize50.Visible:=Mode and Wid;
  MSize200.Visible:=Mode and Wid; MSize100.Visible:=Mode and Wid;
  MCompact.Visible:=Mode and Wid; Hide_menu.Visible:=Mode and Wid;
  Mctrl.Visible:=Mode and Wid; MKaspect.Visible:=Mode and Wid;
  MPCtrl.Visible:=Mode; MPCompact.Visible:=Mode; MPQuit.Visible:=Mode;
  MMaxW.Visible:=Mode and Wid; MPMaxW.Visible:=Mode;

  BFullscreen.Enabled:=Mode and Wid; BCompact.Enabled:=Mode and Wid;
end;

procedure TMainForm.FormWantSpecialKey(var msg:TCMWantSpecialKey);
begin
  msg.Result:=1;
end;

procedure TMainForm.LStatusClick(Sender: TObject);
begin
  if Status=sError then begin
    if not LogForm.Visible then LogForm.ShowModal;
    LogForm.TheLog.ScrollBy(0,32767);
  end;
end;

procedure TMainForm.VolBoostClick(Sender: TObject);
begin
  if Volume>100 then begin
    SendVolumeChangeCommand(100);
    Volume:=100;
    VolBoost.Visible:=false;
  end;
end;

procedure TMainForm.MExpandClick(Sender: TObject);
begin
 if (Sender as TMenuItem).Checked then exit;
 Expand:=(Sender as TMenuItem).Tag;
 Restart;
 MExpand.Items[Expand].Checked:=true;
 MPExpand.Items[Expand].Checked:=true;
end;

procedure TMainForm.MctrlClick(Sender: TObject);
begin
 Mctrl.Checked:=not Mctrl.Checked;
 CPanel.Visible:=not Mctrl.Checked;
 MPCtrl.Checked:=not (Mctrl.Checked or Hide_menu.Checked);
 if CPanel.Visible then UpdateCaption;
 VideoSizeChanged;
end;

procedure TMainForm.Hide_menuClick(Sender: TObject);
begin
 Hide_menu.Checked:=not Hide_menu.Checked;
 MenuBar.Visible:=not Hide_menu.Checked;
 MPCtrl.Checked:=not (Mctrl.Checked or Hide_menu.Checked);
 VideoSizeChanged;
end;

procedure TMainForm.MLoadsubClick(Sender: TObject);
var i,s:integer; j:WideString;
begin
  with OpenDialog do begin
    Title:=MLoadSub.Caption;
    Options:=Options+[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:=SubFilter+'|*.utf*;*.idx;*.sub;*.srt;*.smi;*.rt;*.txt;*.ssa;*.aqt;*.jss;*.js;*.ass;*.ifo;*.mpsub;*.rar;*.7z;*.zip|'+AnyFilter+'(*.*)|*.*';
    if Execute then begin
      VobFileCount:=0; s:=0;
      for i:=0 to Files.Count-1 do begin
        Loadsub:=1; j:=Tnt_WideLowerCase(WideExtractFileExt(Files[i]));
        if j='.idx' then begin
          inc(VobFileCount);
          if VobFileCount=1 then begin
            Vobfile:=copy(Files[i],1,length(Files[i])-4);
            LoadVob:=1; Restart;
          end;
        end
        else begin
          if CheckInfo(ZipType,j)>-1 then begin
            if IsLoaded(j) then begin
              j:=ExtractSub(Files[i],'',j);
              if j<>'' then begin
                Vobfile:=j;
                inc(VobFileCount);
                if VobFileCount=1 then begin
                  LoadVob:=1; Restart;
                end;
              end;
            end;
          end
          else begin
            j:=Files[i];
            if (not IsWideStringMappableToAnsi(j)) or (pos(',',j)>0) then j:=WideExtractShortPathName(j);
            if not Win32PlatformIsUnicode then begin
              Loadsub:=2; Loadsrt:=2;
              AddChain(s,substring,EscapePath(EscapeParam(j)));
            end
            else
              SendCommand('sub_load '+EscapePath(EscapeParam(j)));
          end;
        end;
      end;
      if (not Win32PlatformIsUnicode) and (s>0) then Restart;
    end;
  end;
end;

procedure TMainForm.MSubfontClick(Sender: TObject);
var CurPath:WideString;
begin
  CurPath:=WideGetCurrentDir;
  with OpenDialog do begin
    Title:=MSubfont.Caption;
    Options:=Options-[ofAllowMultiSelect]+[ofoldstyledialog];
    InitialDir:=EscapeParam(SystemDir+'Fonts\');
    filter:=FontFilter+'(*.ttf)|*.ttf|'+AnyFilter+'(*.*)|*.*';
    if Execute then begin
      subfont:=fileName;
      restart;
    end;
  end;
  WideSetCurrentDir(CurPath);
end;

procedure TMainForm.MOsdfontClick(Sender: TObject);
var CurPath:WideString;
begin
  CurPath:=WideGetCurrentDir;
  with OpenDialog do begin
    Title:=MOsdfont.Caption;
    Options:=Options-[ofAllowMultiSelect]+[ofoldstyledialog];
    InitialDir:=EscapeParam(SystemDir+'Fonts\');
    filter:=FontFilter+'(*.ttf)|*.ttf|'+AnyFilter+'(*.*)|*.*';
    if Execute then begin
      osdfont:=fileName;
      restart;
    end;
  end;
  WideSetCurrentDir(CurPath);
end;

procedure TMainForm.MKaspectClick(Sender: TObject);
begin
  MKaspect.Checked:=not MKaspect.Checked;
  if MKaspect.Checked then IPanel.Align:=alNone
  else IPanel.Align:=alClient;
  FixSize;
end;

procedure TMainForm.LTimeClick(Sender: TObject);
begin
  if Running then ETime:=not ETime;
end;

procedure TMainForm.MWheelControlClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  MFunc:=(Sender as TMenuItem).Tag;
  MWheelControl.Items[MFunc].Checked:=true;
  MPWheelControl.Items[MFunc].Checked:=true;
  case MFunc of
    0:SendCommand('osd_show_text "0:'+OSD_Volume_Prompt+'"');
    1:SendCommand('osd_show_text "1:'+OSD_Size_Prompt+'"');
  end;
end;

procedure TMainForm.MIntroClick(Sender: TObject);
begin
  Bp:=SecondPos;
  if Bp>0 then begin
    if TotalTime>0 then SkipBar.Left:=SeekBar.Left+SeekBar.Width*Bp DIV TotalTime;
    SkipBar.Visible:=true; BackBar.Visible:=true;
  end
  else SkipBar.Left:=SeekBar.Left;
  if Bp>=Ep then Ep:=0;
  if Ep>0 then begin
    if TotalTime>0 then SkipBar.Width:=(SeekBar.Width*Ep DIV TotalTime)-SkipBar.Left+SeekBar.Left
  end
  else SkipBar.Width:=SeekBar.Width-SkipBar.Left+SeekBar.Left;
end;

procedure TMainForm.MEndClick(Sender: TObject);
begin
  Ep:=SecondPos;
  if Ep<=Bp then begin
    Bp:=0; SkipBar.Left:=SeekBar.Left;
  end;
  if Ep>0 then begin
    if TotalTime>0 then SkipBar.Width:=(SeekBar.Width*Ep DIV TotalTime)-SkipBar.Left+SeekBar.Left;
    SkipBar.Visible:=true; BackBar.Visible:=true;
  end
  else SkipBar.Width:=SeekBar.Width-SkipBar.Left+SeekBar.Left;
end;

procedure TMainForm.MSIEClick(Sender: TObject);
var key:word;
begin
  MSIE.Checked:=not MSIE.Checked;
  BSkip.Down:=MSIE.Checked;
  UpdateSkipBar:=MSIE.Checked;
  SkipBar.Visible:=MSIE.Checked;
  BackBar.Visible:=MSIE.Checked;
  if MSIE.Checked then begin
    SkipBar.Color:=$0051AEE6;
    if TotalTime>0 then begin
      UpdateSkipBar:=false;
      if (Bp>0) and (Bp<TotalTime) then begin
        if Bp>SecondPos then SendCommand('seek '+IntToStr(Bp-SecondPos));
        SkipBar.Left:=SeekBar.Left+SeekBar.Width*Bp DIV TotalTime;
      end
      else SkipBar.Left:=SeekBar.Left;

      if (Ep>0) and (Ep<TotalTime) then begin
        if SecondPos>=Ep then begin
          if HaveChapters then begin
            key:=VK_HOME;
            FormKeyDown(nil,key,[]);
          end
          else begin
            UpdateParams; NextFile(1,psPlayed);
          end
        end;
        SkipBar.Width:=(SeekBar.Width*Ep DIV TotalTime)-SkipBar.Left+SeekBar.Left;
      end
      else SkipBar.Width:=SeekBar.Width-SkipBar.Left+SeekBar.Left;
    end;
  end
  else SkipBar.Color:=$0078DD73;
end;

procedure TMainForm.MEqualizerClick(Sender: TObject);
begin
  if not EqualizerForm.Visible then EqualizerForm.Showmodal;
end;

procedure TMainForm.MQuitClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.MChannelsClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  Ch:=(Sender as TMenuItem).Tag;
  Restart; MChannels.Items[Ch].Checked:=true;
end;

procedure TMainForm.MFlipClick(Sender: TObject);
begin
  Flip:=not Flip;
  Restart; MFlip.Checked:=Flip;
end;

procedure TMainForm.MMirrorClick(Sender: TObject);
begin
  Mirror:=not Mirror;
  Restart; MMirror.Checked:=Mirror;
end;

procedure TMainForm.MRotateClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then exit;
  Rot:=(Sender as TMenuItem).Tag;
  Restart; MRotate.Items[Rot].Checked:=true;
end;

procedure TMainForm.MSpdifClick(Sender: TObject);
begin
  SPDIF:=not SPDIF; MSpdif.Checked:=SPDIF;
  Restart;
end;

procedure TMainForm.MSEqualizerClick(Sender: TObject);
begin
  Eq2:=not Eq2; MSEqualizer.Checked:=Eq2;
  Restart;
end;

procedure TMainForm.MLoadAudioClick(Sender: TObject);
begin
  with OpenDialog do begin
    Title:=MLoadAudio.Caption;
    Options:=Options-[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:=AudioFilter+'|*.aa;*.a52;*.aif*;*.au*;*.mp2;*.snd;*.cda;*.ac3;*.dts;'
           +'*.mp3;*.ogg;*.mp4;*.wma;*.mka;*.mid*;*.rmi;*.rm;*.wav;*.dtswav;'
           +'*.ra;*.mpa;*.m4a;*.aac;*.m1a;*.mod;*.fla*;*.m2a;*.far;*.it;'
           +'*.s3m;*.stm;*.mtm;*.umx;*.asf;*.ram;*.mpc;*.mp+;*.tta;*.ape;*.mac;'
           +'*.mp1;*.mp3pro;*.xm;*.xmz|'+AnyFilter+'(*.*)|*.*';
    if Execute then begin
      if IsWideStringMappableToAnsi(fileName) then AudioFile:=fileName
      else AudioFile:=WideExtractShortPathName(fileName);
      restart;
      MUloadAudio.Visible:=true;
    end;
  end;
end;

procedure TMainForm.MSoftVolClick(Sender: TObject);
begin
  SoftVol:=not SoftVol; MSoftVol.Checked:=SoftVol;
  Restart;
end;

procedure TMainForm.MUloadAudioClick(Sender: TObject);
begin
  AudioFile:='';
  restart;
  MUloadAudio.Visible:=false;
end;

procedure TMainForm.VolImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var MaxPos:integer;
begin
  if VolBoost.Visible or (Button<>mbLeft) then exit;
  dec(X,VolSlider.Width DIV 2);
  MaxPos:=VolImage.Width-VolSlider.Width;
  if MaxPos=0 then exit;
  if X<0 then X:=0; if X>MaxPos then X:=MaxPos;
  Volume:=100*X DIV MaxPos;
  SendVolumeChangeCommand(Volume);
  VolSlider.Left:=X;
end;

procedure TMainForm.MScale0Click(Sender: TObject);
begin
  LastScale:=100; Scale:=100; FixSize;
  SendCommand('osd_show_text "'+OSD_Reset_Prompt+' '+OSD_Scale_Prompt+'"')
end;

procedure TMainForm.MPanClick(Sender: TObject);
begin
  SendCommand('set_property balance 0');
  if HaveVideo then SendCommand('osd_show_text "'+OSD_Reset_Prompt+' '+OSD_Balance_Prompt+'"');
end;

procedure TMainForm.MPostprocClick(Sender: TObject);
begin
 if (Sender as TMenuItem).Checked then exit;
 Postproc:=(Sender as TMenuItem).Tag;
 MPostproc.Items[Postproc].Checked:=true;
 Restart;
end;

procedure TMainForm.MUseASSClick(Sender: TObject);
begin
  Ass:=not Ass; MUseASS.Checked:=Ass;
  Restart;
end;

procedure TMainForm.MOneLoopClick(Sender: TObject);
begin
  PlaylistForm.COneLoopClick(nil);
end;

procedure TMainForm.MLoopAllClick(Sender: TObject);
begin
  PlaylistForm.CLoopClick(nil);
end;

procedure TMainForm.MShuffleClick(Sender: TObject);
begin
  PlaylistForm.CShuffleClick(nil);
end;

procedure TMainForm.MAudioDelay2Click(Sender: TObject);
begin
  SendCommand('audio_delay 0 1'); Adelay:=0;
  SendCommand('osd_show_text "'+OSD_Reset_Prompt+' '+OSD_AudioDelay_Prompt+'"');
end;

procedure TMainForm.MSubDelay2Click(Sender: TObject);
begin
  SendCommand('sub_delay 0 1'); Sdelay:=0;
  SendCommand('osd_show_text "'+OSD_Reset_Prompt+' '+OSD_SubDelay_Prompt+'"');
end;

procedure TMainForm.MLoadlyricClick(Sender: TObject);
begin
  with OpenDialog do begin
    Title:=MLoadlyric.Caption;
    Options:=Options-[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:=LyricFilter+'|*.lrc|'+AnyFilter+'(*.*)|*.*';
    if Execute then begin
      LyricURL:=fileName;
      Lyric.ParseLyric(LyricURL);
    end;
  end;
end;

procedure TMainForm.MUUniClick(Sender: TObject);
begin
  MUUni.Checked:=not UseUni;
  UseUni:=MUUni.Checked;
  Restart;
end;

procedure TMainForm.MSubScale2Click(Sender: TObject);
begin
  if ass then SendCommand('set_property sub_scale 1.4')
  else SendCommand('set_property sub_scale 4.5');
  FSize:=4.5;
  SendCommand('osd_show_text "'+OSD_Reset_Prompt+' '+OSD_Scale_Prompt+'"');
end;

procedure TMainForm.MSCSClick(Sender: TObject);
begin
  NW:=OPanel.Width; NH:=OPanel.Height;
  Config.Save(HomeDir+DefaultFileName,3);
end;

end.

