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
unit Options;

interface

uses
  Windows, TntWindows, Messages, SysUtils, TntSysUtils, Variants, Classes, Graphics, Controls,
  Forms,TntForms, Dialogs, StdCtrls, ShellAPI, ComCtrls, Tabs, TabNotBk, ExtCtrls, TntSystem,
  TntExtCtrls, TntComCtrls, TntStdCtrls, TntFileCtrl, ImgList, TntRegistry, TntClasses,
  jpeg;

type
  TOptionsForm = class(TTntForm)
    BOK: TTntButton;
    BApply: TTntButton;
    BSave: TTntButton;
    BClose: TTntButton;
    EParams: TTntEdit;
    LParams: TTntLabel;
    LHelp: TTntLabel;
    Tab: TTntPageControl;
    TSystem: TTntTabSheet;
    TVideo: TTntTabSheet;
    TAudio: TTntTabSheet;
    TSub: TTntTabSheet;
    LAudioOut: TTntLabel;
    CAudioOut: TTntComboBox;
    LPostproc: TTntLabel;
    CPostproc: TTntComboBox;
    LAspect: TTntLabel;
    CAspect: TTntComboBox;
    LDeinterlace: TTntLabel;
    CDeinterlace: TTntComboBox;
    LLanguage: TTntLabel;
    CLanguage: TTntComboBox;
    LAudioDev: TTntLabel;
    CAudioDev: TComboBox;
    CSoftVol: TTntCheckBox;
    CVolnorm: TTntCheckBox;
    double: TTntCheckBox;
    CDr: TTntCheckBox;
    nfconf: TTntCheckBox;
    EMplayerLocation: TTntEdit;
    BSubfont: TTntButton;
    BMplayer: TTntButton;
    CSubcp: TComboBox;
    CMAspect: TComboBox;
    LMAspect: TTntLabel;
    CSPDIF: TTntCheckBox;
    CCh: TComboBox;
    CWid: TTntCheckBox;
    CFlip: TTntCheckBox;
    CYuy2: TTntCheckBox;
    CEq2: TTntCheckBox;
    CIndex: TTntCheckBox;
    CMir: TTntCheckBox;
    CNi: TTntCheckBox;
    CDnav: TTntCheckBox;
    CUtf: TTntCheckBox;
    CUni: TTntCheckBox;
    TFsize: TTrackBar;
    TFol: TTrackBar;
    EWadsp: TTntEdit;
    BWadsp: TTntButton;
    CWadsp: TTntCheckBox;
    CLavf: TTntCheckBox;
    RCMplayer: TTntRadioButton;
    RMplayer: TTntRadioButton;
    TFB: TTrackBar;
    SSubcode: TTntStaticText;
    SSubfont: TTntStaticText;
    SFsize: TTntStaticText;
    SFB: TTntStaticText;
    SFol: TTntStaticText;
    SFsP: TTntStaticText;
    SFBl: TTntStaticText;
    SFo: TTntStaticText;
    CFd: TTntCheckBox;
    CAsync: TTntCheckBox;
    EAsync: TTntEdit;
    UAsync: TTntUpDown;
    CCache: TTntCheckBox;
    ECache: TTntEdit;
    UCache: TTntUpDown;
    CPriorityBoost: TTntCheckBox;
    CRFScr: TTntCheckBox;
    CSubfont: TTntComboBox;
    PShow: TTntPanel;
    COsdfont: TTntComboBox;
    BOsdfont: TButton;
    SFontColor: TTntStaticText;
    SOutline: TTntStaticText;
    PTc: TPanel;
    POc: TPanel;
    ColorDialog1: TColorDialog;
    CAss: TTntCheckBox;
    CEfont: TTntCheckBox;
    CRot: TComboBox;
    CISub: TTntCheckBox;
    SSF: TTntStaticText;
    BSsf: TTntButton;
    ESsf: TTntEdit;
    SOsdfont: TTntCheckBox;
    LCh: TTntStaticText;
    LRot: TTntStaticText;
    Cone: TTntCheckBox;
    CGUI: TTntCheckBox;
    CNobps: TTntCheckBox;
    CFilter: TTntCheckBox;
    ImageList1: TImageList;
    TLyric: TTntGroupBox;
    LTCL: TTntLabel;
    PLTC: TPanel;
    LHCL: TTntLabel;
    PLBC: TPanel;
    LBCL: TTntLabel;
    PLHC: TPanel;
    SLyric: TTntLabel;
    ELyric: TTntEdit;
    BLyric: TTntButton;
    LScroll: TTntCheckBox;
    CUseekC: TTntCheckBox;
    CVSync: TTntCheckBox;
    BFont: TButton;
    FontDialog1: TFontDialog;
    LVideoout: TTntLabel;
    CVideoOut: TComboBox;
    THelp: TTntTabSheet;
    TAbout: TTntTabSheet;
    LURL: TLabel;
    MCredits: TMemo;
    HelpText: TTntMemo;
    PLogo: TPanel;
    ILogo: TImage;
    MTitle: TTntLabel;
    LVersionMPUI: TTntLabel;
    VersionMPUI: TTntLabel;
    LVersionMPlayer: TTntLabel;
    VersionMPlayer: TTntLabel;
    FY: TTntLabel;
    CRS: TTntCheckBox;
    CRP: TTntCheckBox;
    HCB: TTntLabel;
    procedure BCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LHelpClick(Sender: TObject);
    procedure BApplyClick(Sender: TObject);
    procedure BOKClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CAudioOutChange(Sender: TObject);
    procedure BSubfontClick(Sender: TObject);
    procedure BMplayerClick(Sender: TObject);
    procedure CDDXAClick(Sender: TObject);
    procedure TFsizeChange(Sender: TObject);
    procedure TFolChange(Sender: TObject);
    procedure CWadspClick(Sender: TObject);
    procedure BWadspClick(Sender: TObject);
    procedure RMplayerClick(Sender: TObject);
    procedure RCMplayerClick(Sender: TObject);
    procedure TFBChange(Sender: TObject);
    procedure CAsyncClick(Sender: TObject);
    procedure CCacheClick(Sender: TObject);
    procedure FontChange(Sender: TObject);
    procedure BOsdfontClick(Sender: TObject);
    procedure SetColor(Sender: TObject);
    procedure CAssClick(Sender: TObject);
    procedure SOsdfontClick(Sender: TObject);
    procedure BSsfClick(Sender: TObject);
    procedure BFontClick(Sender: TObject);
    procedure TAboutShow(Sender: TObject);
  private
    { Private declarations }
    HelpFile:WideString;
    Changed,oML:boolean;
  public
    { Public declarations }
    procedure Localize;
    procedure ApplyValues;
    procedure LoadValues;
  end;
  
  PDSEnumCallback = function(lpGuid:PGUID; lpcstrDescription,lpcstrModule:PChar; lpContext:pointer):LongBool; stdcall;

procedure LoadDsLibrary;
procedure UnLoadDsLibrary;

var
  OptionsForm: TOptionsForm; IsDsLoaded:THandle=0;

implementation
uses Core, Config, Main, Locale, plist;

{$R *.dfm}
var DirectSoundEnumerate: function (lpDSEnumCallback:PDSEnumCallback; lpContext:pointer):HRESULT; stdcall;

procedure LoadDsLibrary;
begin
  if IsDsLoaded <> 0 then exit;   
  IsDsLoaded := LoadLibrary('dsound.dll');
  if IsDsLoaded <> 0 then
    @DirectSoundEnumerate:= GetProcAddress(IsDsLoaded, 'DirectSoundEnumerateA');
end;

procedure UnLoadDsLibrary;
begin
  if IsDsLoaded <> 0 then begin
    FreeLibrary(IsDsLoaded);
    IsDsLoaded := 0;
    DirectSoundEnumerate:= nil;
  end;
end;

procedure TOptionsForm.BCloseClick(Sender: TObject);
begin
  Close;
end;

function GetProductVersion(const FileName:WideString):WideString;
var BufSize,cbSize,VerLen:Cardinal;
    VerOut:PWideChar; Buf:array of WideChar;
begin
  Result:='?';
  BufSize:=Tnt_GetFileVersionInfoSizeW(PWideChar(FileName),cbSize);
  if BufSize=0 then exit;
  SetLength(Buf,BufSize);
  if not Tnt_GetFileVersionInfoW(PWideChar(FileName),0,BufSize,Buf) then exit;
  if not Tnt_VerQueryValueW(Buf,'\StringFileInfo\000004B0\ProductVersion',Pointer(VerOut),VerLen) then exit;
  Result:=VerOut;
end;

function GetFileVersion(const FileName:WideString):WideString;
var BufSize,cbSize,VerLen:Cardinal;
    Info:^VS_FIXEDFILEINFO; Buf:array of WideChar;
begin
  Result:='?';
  BufSize:=Tnt_GetFileVersionInfoSizeW(PWideChar(FileName),cbSize);
  if BufSize=0 then exit;
  SetLength(Buf,BufSize);
  if not Tnt_GetFileVersionInfoW(PWideChar(FileName),0,BufSize,Buf) then exit;
  if not Tnt_VerQueryValueW(Buf,'\',Pointer(Info),VerLen) then exit;
  Result:=IntToStr(Info.dwFileVersionMS SHR 16)+'.'+
          IntToStr(Info.dwFileVersionMS AND $FFFF)+'.'+
          IntToStr(Info.dwFileVersionLS SHR 16)+' build '+
          IntToStr(Info.dwFileVersionLS AND $FFFF);
  if (Info.dwFileFlags AND VS_FF_DEBUG<>0) then Result:=Result+' (debug)';
  if (Info.dwFileFlags AND VS_FF_PRERELEASE<>0) then Result:=Result+' (pre-release)';
end;

procedure TOptionsForm.Localize;
var i:integer;
begin
  with MainForm do begin
    LAspect.Caption:=MAspect.Caption;
    CAspect.Items[0]:=MAutoAspect.Caption;
    LDeinterlace.Caption:=MDeinterlace.Caption;
    CDeinterlace.Items[0]:=MNoDeint.Caption;
    CDeinterlace.Items[1]:=MSimpleDeint.Caption;
    CDeinterlace.Items[2]:=MAdaptiveDeint.Caption;
    CAudioOut.Items[2]:=LOCstr_AutoLocale;
    LLanguage.Caption:=MLanguage.Caption;
    PlaylistForm.PLTC.Hint:=LTCL.Caption;
    PlaylistForm.PLHC.Hint:=LHCL.Caption;
    PlaylistForm.PLBC.Hint:=LBCL.Caption;
    PlaylistForm.LScroll.Caption:=LScroll.Caption;
    CLanguage.Clear;
    CLanguage.Items.Add(LOCstr_AutoLocale);
    for i:=0 to High(Locales) do
      CLanguage.Items.Add(Locales[i].Name);
  end;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
begin
  LoadValues; Changed:=false;
  if ML then HelpFile:=WideExtractFileDir(MplayerLocation)+'\man_page.html'
  else HelpFile:=HomeDir+'man_page.html';
  if not WideFileExists(HelpFile) then begin
    HelpFile:=WideExtractFileDir(HelpFile)+'\MPlayer.html';
    if not WideFileExists(HelpFile) then HelpFile:='';
  end;
  if length(HelpFile)>0 then begin
    LHelp.Visible:=true;
    HelpFile:=#34+HelpFile+#34;
  end
  else
    LHelp.Visible:=false;
  if (left+width)>=Screen.Width then left:=Screen.Width-width;
  if left<0 then left:=0; if top<0 then top:=0;
  if (top+height)>=Screen.WorkAreaHeight then top:=Screen.WorkAreaHeight-height;
end;

procedure TOptionsForm.LHelpClick(Sender: TObject);
begin
  if length(HelpFile)>0 then begin
    if Win32PlatformIsUnicode then
      ShellExecuteW(Handle,'open',PWideChar(HelpFile),nil,nil,SW_SHOW)
    else ShellExecute(Handle,'open',PAnsiChar(AnsiString(HelpFile)),nil,nil,SW_SHOW);
  end;
end;

procedure TOptionsForm.LoadValues;
var i:integer; s,h,j,k:Widestring;
begin
  Load(HomeDir+DefaultFileName,1);
  CAudioOut.ItemIndex:=AudioOut;
  CAudioDev.ItemIndex:=AudioDev;
  LScroll.Checked:=PScroll;
  CIndex.Checked:=ReIndex;
  CSoftVol.Checked:=SoftVol;
  CRFScr.Checked:=RFScr;
  CDr.Checked:=Dr;
  Double.Checked:=dbbuf;
  CVolnorm.Checked:=Volnorm;
  nfconf.Checked:=nfc;
  CSubcp.Text:=subcode;
  oML:=ML;
  RMplayer.Checked:=ML;
  RCMplayer.Checked:=not ML;
  EMplayerLocation.Enabled:=ML;
  BMplayer.Enabled:=ML;
  CWid.Checked:=Wid;
  CRS.Checked:=RS;
  CRP.Checked:=RP;
  EMplayerLocation.Text:=MplayerLocation;
  CMAspect.Text:=MAspect;
  CVideoOut.Text:=VideoOut;
  CCh.ItemIndex:=Ch;
  CRot.ItemIndex:=Rot;
  CSPDIF.Checked:=SPDIF;
  CFlip.Checked:=Flip;
  CMir.Checked:=Mirror;
  CEq2.Checked:=Eq2;
  CYuy2.Checked:=Yuy2;
  CUseekC.Checked:=UseekC;
  CVSync.Checked:=vsync;
  CEq2.Enabled:=not Dda;
    CYuy2.Enabled:=CEq2.Enabled;
    LDeinterlace.Enabled:=CEq2.Enabled;
    CDeinterlace.Enabled:=CEq2.Enabled;
  CNi.Checked:=ni;
  CNobps.Checked:=nobps;
  CFilter.Checked:=FilterDrop;
  CDnav.Checked:=Dnav;
  CUni.Checked:=Uni;
  CUtf.Checked:=Utf;

  CWadsp.Checked:=Wadsp;
    EWadsp.Enabled:=Wadsp;
    BWadsp.Enabled:=Wadsp;
  EWadsp.Text:=WadspL;
  Clavf.Checked:=lavf;
  CFd.Checked:=Fd;
  CAsync.Checked:=Async;
    EAsync.Enabled:=Async;
    UAsync.Enabled:=Async;
  EAsync.Text:=AsyncV;
  CCache.Checked:=Cache;
    ECache.Enabled:=Cache;
    UCache.Enabled:=Cache;
  ECache.Text:=CacheV;
  CPriorityBoost.Checked:=Pri;
  EParams.Text:=Params;
  CAudioOutChange(nil);

  TFsize.Position:=round(FSize*10);
  TFol.Position:=round(Fol*10);
  TFB.Position:=round(FB*10);
  CAspect.Items[10]:=MainForm.MCustomAspect.Caption;
  CAspect.ItemIndex:=Aspect;
  CDeinterlace.ItemIndex:=Deinterlace;
  CLanguage.ItemIndex:=DefaultLocale+1;
  CPostproc.ItemIndex:=Postproc;
  COsdfont.Text:=osdfont;
  CSubfont.Text:=subfont;
  PLTC.Color:=LTextColor;
  PLBC.Color:=LbgColor;
  PLHC.Color:=LhgColor;
  BFont.Caption:=PlayListForm.TMLyric.Font.Name;
  PTc.color:=TextColor;
  PTc.Enabled:=Ass;
  POc.color:=OutColor;
  POc.Enabled:=Ass;
  CAss.Checked:=Ass;
  CEfont.Checked:=Efont;
  CEfont.Enabled:=Ass;
  SfontColor.Enabled:=Ass;
  SOutline.Enabled:=Ass;
  CISub.Checked:=ISub;
  ESsf.Text:=ShotDir;
  ELyric.Text:=LyricDir;
  SOsdfont.Checked:=uof;
  COsdfont.Enabled:=uof;
  BOsdfont.Enabled:=uof;
  Cone.Checked:=oneM;
  CGUI.Checked:=GUI;

  if (CSubfont.ItemIndex<0) and (COsdfont.ItemIndex<0) then begin
    PShow.Caption:='';
    s:= Trim(Tnt_WideLowerCase(CSubfont.Text)); j:= Trim(Tnt_WideLowerCase(COsdfont.Text));
    for i:=0 to FontPaths.Count-1 do begin
      k:=Tnt_WideLowerCase(CSubfont.Items[i]); h:= Tnt_WideLowerCase(FontPaths[i]);
      if (s=k) or (s=h) then begin
        PShow.Font.Name:=CSubfont.Items[i];
        PShow.Caption:=CSubfont.Items[i];
        CSubfont.ItemIndex:=i;
        break;
      end;
      if (j=k) or (j=h) then begin
        PShow.Font.Name:=COsdfont.Items[i];
        PShow.Caption:=COsdfont.Items[i];
        COsdfont.ItemIndex:=i;
        break;
      end;
    end;
  end
  else if CSubfont.ItemIndex>-1 then PShow.Caption:=CSubfont.Text
  else if COsdfont.ItemIndex>-1 then PShow.Caption:=COsdfont.Text;
  
end;

procedure TOptionsForm.ApplyValues;
var s:string; ws:WideString; i:integer; f:real; b:boolean;
begin
  if AudioOut<>CAudioOut.ItemIndex then begin
    AudioOut:=CAudioOut.ItemIndex; changed:=true;
  end;

  if AudioDev<>CAudioDev.ItemIndex then begin
    AudioDev:=CAudioDev.ItemIndex; changed:=true;
  end;

  if Postproc<>CPostproc.ItemIndex then begin
    Postproc:=CPostproc.ItemIndex; changed:=true;
  end;

  if Aspect<>CAspect.ItemIndex then begin
    Aspect:=CAspect.ItemIndex; changed:=true;
  end;

  if Deinterlace<>CDeinterlace.ItemIndex then begin
    Deinterlace:=CDeinterlace.ItemIndex; changed:=true;
  end;

  if ReIndex<>CIndex.Checked then begin
    ReIndex:=CIndex.Checked; changed:=true;
  end;

  if SoftVol<>CSoftVol.Checked then begin
    SoftVol:=CSoftVol.Checked; changed:=true;
  end;
  
  if (Volume>100) AND (not SoftVol) then begin
    Volume:=100; MainForm.VolBoost.Visible:=False;
    MainForm.VolSlider.Left:=Volume*(MainForm.VolFrame.ClientWidth-MainForm.VolSlider.Width) DIV 100;
  end;

  if Dr<>CDr.Checked then begin
    Dr:=CDr.Checked; changed:=true;
  end;

  if dbbuf<>double.Checked then begin
    dbbuf:=double.Checked; changed:=true;
  end;

  if Volnorm<>CVolnorm.Checked then begin
    Volnorm:=CVolnorm.Checked; changed:=true;
  end;

  if nfc<>nfconf.Checked then begin
    nfc:=nfconf.Checked; changed:=true;
  end;

  if subcode<>CSubcp.Text then begin
    subcode:=CSubcp.Text; changed:=true;
  end;
  
  if uof<>SOsdfont.Checked then begin
    uof:=SOsdfont.Checked; changed:=true;
  end;

  if osdfont<>COsdfont.Text then begin
    osdfont:=COsdfont.Text;
    if COsdfont.Enabled then changed:=true;
  end;

  if subfont<>CSubfont.Text then begin
    subfont:=CSubfont.Text; changed:=true;
  end;

  if oML<>ML then begin
    ML:=oML; changed:=true;
  end;

  if MplayerLocation<>EMplayerLocation.Text then begin
    MplayerLocation:=EMplayerLocation.Text;
    if EMplayerLocation.Enabled then changed:=true;
  end;

  s:=Trim(CMAspect.Text);
  if MAspect<>s then begin
    MAspect:=s; changed:=true;
  end;

  s:=Trim(CVideoOut.Text);
  if VideoOut<>s then begin
    VideoOut:=s; changed:=true;
  end;

  b:=Trim(LowerCase(VideoOut))='directx:noaccel';
  if Dda<>b then begin
    Dda:=b; changed:=true;
  end;

  if Ch<>CCh.ItemIndex then begin
    Ch:=CCh.ItemIndex; changed:=true;
  end;

  if Rot<>CRot.ItemIndex then begin
    Rot:=CRot.ItemIndex; changed:=true;
  end;

  if SPDIF<>CSPDIF.Checked then begin
    SPDIF:=CSPDIF.Checked; changed:=true;
  end;
  
  if Wid<>CWid.Checked then begin
    Wid:=CWid.Checked; changed:=true;
  end;

  if Flip<>CFlip.Checked then begin
    Flip:=CFlip.Checked; changed:=true;
  end;

  if Mirror<>CMir.Checked then begin
    Mirror:=CMir.Checked; changed:=true;
  end;

  if Eq2<>CEq2.Checked then begin
    Eq2:=CEq2.Checked; changed:=true;
  end;

  if Yuy2<>CYuy2.Checked then begin
    Yuy2:=CYuy2.Checked; changed:=true;
  end;

  if ni<>CNi.Checked then begin
    ni:=CNi.Checked; changed:=true;
  end;
  
  if nobps<>CNobps.Checked then begin
    nobps:=CNobps.Checked; changed:=true;
  end;

  if FilterDrop<>CFilter.Checked then begin
    FilterDrop:=CFilter.Checked; changed:=true;
  end;

  if Dnav<>CDnav.Checked then begin
    Dnav:=CDnav.Checked; changed:=true;
  end;

  if Uni<>CUni.Checked then begin
    Uni:=CUni.Checked; changed:=true;
  end;
  
  if Utf<>CUtf.Checked then begin
    Utf:=CUtf.Checked; changed:=true;
  end;

  f:=TFsize.Position/10;
  if FSize<>f then begin
    FSize:=f; changed:=true;
  end;

  f:=TFol.Position/10;
  if Fol<>f then begin
    Fol:=f; changed:=true;
  end;

  f:=TFB.Position/10;
  if FB<>f then begin
    FB:=f; changed:=true;
  end;
  
  if Wadsp<>CWadsp.Checked then begin
    Wadsp:=CWadsp.Checked; changed:=true;
  end;

  if WadspL<>EWadsp.Text then begin
    WadspL:=EWadsp.Text;
    if EWadsp.Enabled then changed:=true;
  end;

  if lavf<>Clavf.Checked then begin
    lavf:=Clavf.Checked; changed:=true;
  end;
  
  if Fd<>CFd.Checked then begin
    Fd:=CFd.Checked; changed:=true;
  end;

  if Async<>CAsync.Checked then begin
    Async:=CAsync.Checked; changed:=true;
  end;

  if AsyncV<>EAsync.Text then begin
    AsyncV:=EAsync.Text;
    if EAsync.Enabled then changed:=true;
  end;

  if Cache<>CCache.Checked then begin
    Cache:=CCache.Checked; changed:=true;
  end;

  if CacheV<>ECache.Text then begin
    CacheV:=ECache.Text;
    if ECache.Enabled then changed:=true;
  end;

  if Pri<>CPriorityBoost.Checked then begin
    Pri:=CPriorityBoost.Checked; changed:=true;
  end;

  ws:=Trim(EParams.Text);
  if Params<>ws then begin
    Params:=ws; changed:=true;
  end;

  i:=ColorToRGB(PTc.color);
  if TextColor<>i then begin
    TextColor:=i; changed:=true;
  end;

  i:=ColorToRGB(POc.color);
  if OutColor<>i then begin
    OutColor:=i; changed:=true;
  end;

  if Ass<>CAss.Checked then begin
    Ass:=CAss.Checked; changed:=true;
  end;
  
  if Efont<>CEfont.Checked then begin
    Efont:=CEfont.Checked;
    if CEfont.Enabled then changed:=true;
  end;

  if ISub<>CISub.Checked then begin
    ISub:=CISub.Checked; changed:=true;
  end;

  if GUI<>CGUI.Checked then begin
    GUI:=CGUI.Checked; changed:=true;
  end;

  if WideDirectoryExists(ESsf.Text) then begin
    if ShotDir<>ESsf.Text then begin
      ShotDir:=ESsf.Text; changed:=true;
    end;
  end
  else if WideCreateDir(ESsf.Text) then begin
    if ShotDir<>ESsf.Text then begin
      ShotDir:=ESsf.Text; changed:=true;
    end;
  end;
  
  RFScr:=CRFScr.Checked;
  with MainForm do begin
    if RFScr then begin
      OPanel.PopupMenu:=nil; IPanel.PopupMenu:=nil;
    end
    else begin
      OPanel.PopupMenu:=MPopup; IPanel.PopupMenu:=MPopup;
    end;
  end;

  if Running and (vsync<>CVSync.Checked) then begin
    if CVSync.Checked then SendCommand('set_property vsync 1')
    else SendCommand('set_property vsync 0');
  end;
  if DefaultLocale<>(CLanguage.ItemIndex-1) then begin
    DefaultLocale:=CLanguage.ItemIndex-1;
    ActivateLocale(DefaultLocale);
  end;
  if WideDirectoryExists(ELyric.Text) then LyricDir:=ELyric.Text;
  RP:=CRP.Checked;
  RS:=CRS.Checked;
  vsync:=CVSync.Checked;
  UseekC:=CUseekC.Checked;
  oneM:=Cone.Checked;
  PScroll:=LScroll.Checked;
  LTextColor:=ColorToRGB(PLTC.Color);
  LbgColor:=ColorToRGB(PLBC.Color);
  LhgColor:=ColorToRGB(PLHC.Color);
  LyricF:=Bfont.Caption;
  LyricS:=PlaylistForm.TMLyric.Font.Size;
  PlaylistForm.TMLyric.Color:=PLBC.Color;
  PlaylistForm.TMLyric.Font.Color:=PLTC.Color;
  PlaylistForm.PLTC.Color:=LTextColor;
  PlaylistForm.PLBC.Color:=LbgColor;
  PlaylistForm.PLHC.Color:=LhgColor;
  PlaylistForm.LScroll.Checked:=PScroll;
  if PlaylistForm.Visible then PlaylistForm.TMLyric.Invalidate;
  MainForm.UpdateMenuCheck;
  Save(HomeDir+DefaultFileName,2);
end;

procedure TOptionsForm.BApplyClick(Sender: TObject);
begin
  ApplyValues;
  if Changed then begin
    Changed:=false;
    Restart;
  end;
  CLanguage.ItemIndex:=DefaultLocale+1;
  CAspect.Items[10]:=MainForm.MCustomAspect.Caption;
  CAspect.ItemIndex:=Aspect;
  CDeinterlace.ItemIndex:=Deinterlace;
  CPostproc.ItemIndex:=Postproc;
  CAudioOut.ItemIndex:=AudioOut;
  CAudioDev.ItemIndex:=AudioDev;
  CSubcp.Text:=subcode;
  COsdfont.Text:=osdfont;
  CSubfont.Text:=subfont;
  EMplayerLocation.Text:=MplayerLocation;
  CMAspect.Text:=MAspect;
  CCh.ItemIndex:=Ch;
  CRot.ItemIndex:=Rot;
  ESsf.Text:=ShotDir;
end;

procedure TOptionsForm.BSaveClick(Sender: TObject);
begin
  BApplyClick(nil);
  Config.Save(HomeDir+Config.DefaultFileName,0);
end;

procedure TOptionsForm.BOKClick(Sender: TObject);
begin
  Close;
  ApplyValues;
  if Changed then Restart;
end;

function EnumFunc(lpGuid:PGUID; lpcstrDescription,lpcstrModule:PChar; lpContext:pointer):LongBool; stdcall;
begin
  TComboBox(lpContext^).Items.Add(lpcstrDescription);
  Result:=True;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
procedure initFontList;
var i,j:integer; s:string; sn,sp:widestring; DefaultFont:TFont;
    reg: TTntRegistry; a:TTntStringList;
begin
  DefaultFont:=TFont.Create; DefaultFont.Handle:=GetStockObject(DEFAULT_GUI_FONT);
  FontPaths:=TTntStringList.Create; a:=TTntStringList.Create;
  reg:=TTntRegistry.Create;  DefaultFontIndex:=-1;
  if Win32PlatformIsUnicode then s:='SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts'
  else s:='SOFTWARE\Microsoft\Windows\CurrentVersion\Fonts';
  with reg do begin
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKeyReadOnly(s) then begin
        GetValueNames(a); a.Sort;
        for i:=0 to a.Count-1 do begin
          j:=pos(' (TrueType)',a.Strings[i]);
          if j>0 then begin
            sn:=a.Strings[i]; sp:=ReadString(sn);
            sn:=copy(sn,1,j-1);
            j:=pos(' & ',sn);
            while(j>1) do begin
              CSubfont.Items.Add(copy(sn,1,j-1)); FontPaths.Add(SystemDir+'Fonts\'+sp);
              if CSubfont.Items[CSubfont.Items.Count-1]=DefaultFont.Name then DefaultFontIndex:=CSubfont.Items.Count-1;
              sn:=copy(sn,j+3,length(sn));
              j:=pos(' & ',sn);
            end;
            CSubfont.Items.Add(sn); FontPaths.Add(SystemDir+'Fonts\'+sp);
            if sn=DefaultFont.Name then DefaultFontIndex:=CSubfont.Items.Count-1;
          end;
        end;
        CloseKey;
      end;
    finally
      Free; a.free;
    end;
  end;
  COsdfont.Items:=CSubfont.Items;
  if subfont='' then begin
    if DefaultFontIndex=-1 then subfont:='Arial'
    else subfont:=CSubfont.Items[DefaultFontIndex];
  end;
  if osdfont='' then osdfont:=subfont;
  if not FileExists(CheckSubfont(subfont)) then subfont:=HomeDir+'mplayer\subfont.ttf';
  if not FileExists(CheckSubfont(osdfont)) then osdfont:=HomeDir+'mplayer\subfont.ttf'; 
end;
begin
  initFontList;
  Tab.TabIndex:=0;
  if IsDsLoaded=0 then LoadDsLibrary;
  if IsDsLoaded<>0 then DirectSoundEnumerate(EnumFunc,@CAudioDev);
  {$IFDEF VER150}
  // some fixes for Delphi>=7 VCLs
    PTc.ParentBackground:=False; POc.ParentBackground:=False;
    PLogo.ParentBackground:=False;
  {$ENDIF}
end;

procedure TOptionsForm.CAudioOutChange(Sender: TObject);
var e:boolean;
begin
  e:=(CAudioOut.ItemIndex=4);
  LAudioDev.Enabled:=e;
  CAudioDev.Enabled:=e;
end;

procedure TOptionsForm.BSubfontClick(Sender: TObject);
var CurPath:WideString;
begin
  CurPath:=WideGetCurrentDir;
  with MainForm.OpenDialog do begin
    Title:=MainForm.MSubfont.Caption;
    Options:=Options-[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:=FontFilter+'(*.ttf)|*.ttf|'+AnyFilter+'(*.*)|*.*';
    if Execute then begin
      if CSubfont.Text<>fileName then begin
        CSubfont.Text:=fileName; FontChange(CSubfont);
      end;
    end;
  end;
  WideSetCurrentDir(CurPath);
end;

procedure TOptionsForm.BOsdfontClick(Sender: TObject);
var CurPath:WideString;
begin
  CurPath:=WideGetCurrentDir;
  with MainForm.OpenDialog do begin
    Title:=MainForm.MOsdfont.Caption;
    Options:=Options-[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:=FontFilter+'(*.ttf)|*.ttf|'+AnyFilter+'(*.*)|*.*';
    if Execute then begin
      if COsdfont.Text<>fileName then begin
        COsdfont.Text:=fileName; FontChange(COsdfont);
      end;
    end;
  end;
  WideSetCurrentDir(CurPath);
end;

procedure TOptionsForm.BMplayerClick(Sender: TObject);
begin
  with MainForm.OpenDialog do begin
    Title:=RMplayer.Caption;
    Options:=Options-[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:='*.exe|*.exe|'+AnyFilter+'(*.*)|*.*';
    if Execute then EMplayerLocation.Text:=fileName;
  end;
end;

procedure TOptionsForm.CDDXAClick(Sender: TObject);
begin
  CEq2.Enabled:=Trim(LowerCase(CVideoOut.Text))<>'directx:noaccel';
  LDeinterlace.Enabled:=CEq2.Enabled;
  CDeinterlace.Enabled:=CEq2.Enabled;
  CYuy2.Enabled:=CEq2.Enabled;
end;

procedure TOptionsForm.TFsizeChange(Sender: TObject);
begin
  SFsP.Caption:=Tnt_WideFormat('%.1f%%',[TFsize.Position/10]);
end;

procedure TOptionsForm.TFolChange(Sender: TObject);
begin
  SFo.Caption:=Tnt_WideFormat('%.1f',[TFol.Position/10]);
end;

procedure TOptionsForm.TFBChange(Sender: TObject);
begin
  SFBl.Caption:=Tnt_WideFormat('%.1f',[TFB.Position/10]);
end;

procedure TOptionsForm.CWadspClick(Sender: TObject);
begin
  EWadsp.Enabled:=CWadsp.Checked;
  BWadsp.Enabled:=CWadsp.Checked;
end;

procedure TOptionsForm.BWadspClick(Sender: TObject);
begin
  with MainForm.OpenDialog do begin
    Title:=CWadsp.Caption;
    Options:=Options-[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:='*.dll|*.Dll|'+AnyFilter+'(*.*)|*.*';
    if Execute then EWadsp.Text:=fileName;
  end;
end;

procedure TOptionsForm.RMplayerClick(Sender: TObject);
begin
  if oML<>RMplayer.Checked then begin
    oML:=RMplayer.Checked;
    EMplayerLocation.Enabled:=oML;
    BMplayer.Enabled:=oML;
  end;
end;

procedure TOptionsForm.RCMplayerClick(Sender: TObject);
begin
  if oML=RCMplayer.Checked then begin
    oML:=not RCMplayer.Checked;
    EMplayerLocation.Enabled:=oML;
    BMplayer.Enabled:=oML;
  end;
end;

procedure TOptionsForm.CAsyncClick(Sender: TObject);
begin
  EAsync.Enabled:=CAsync.Checked;
  UAsync.Enabled:=CAsync.Checked;
end;

procedure TOptionsForm.CCacheClick(Sender: TObject);
begin
  ECache.Enabled:=CCache.Checked;
  UCache.Enabled:=CCache.Checked;
end;

procedure TOptionsForm.FontChange(Sender: TObject);
var i:integer; s,k,h:WideString;
begin
  PShow.Caption:='';
  s:=Trim(Tnt_WideLowerCase((Sender as TTntComboBox).Text));
  for i:=0 to FontPaths.Count-1 do begin
    k:=Tnt_WideLowerCase((Sender as TTntComboBox).Items[i]); h:= Tnt_WideLowerCase(FontPaths[i]);
    if (s=k) or (s=h) then begin
      PShow.Font.Name:=(Sender as TTntComboBox).Items[i];
      PShow.Caption:=(Sender as TTntComboBox).Items[i];
      (Sender as TTntComboBox).ItemIndex:=i;
      break;
    end;
  end;
end;

procedure TOptionsForm.SetColor(Sender: TObject);
begin
  ColorDialog1.Color:=(Sender as TPanel).Color;
  if ColorDialog1.Execute then (Sender as TPanel).Color:=ColorDialog1.Color;
end;

procedure TOptionsForm.CAssClick(Sender: TObject);
begin
  PTc.Enabled:=CAss.Checked; POc.Enabled:=CAss.Checked;
  CEfont.Enabled:=CAss.Checked; SfontColor.Enabled:=CAss.Checked;
  SOutline.Enabled:=CAss.Checked; 
end;

procedure TOptionsForm.SOsdfontClick(Sender: TObject);
begin
  COsdfont.Enabled:=SOsdfont.Checked;
  BOsdfont.Enabled:=SOsdfont.Checked;
end;

procedure TOptionsForm.BSsfClick(Sender: TObject);
var s:widestring;
begin
  if WideSelectDirectory(AddDirCp,'',s) then begin
    case (Sender as TComponent).Tag of
      0: ESsf.Text:=s;
      1: ELyric.Text:=s;
    end;
  end;
  {  if AddDirForm.Execute(false) then begin
    case (Sender as TComponent).Tag of
      0: ESsf.Text:=AddDirForm.DirView.SelectedFolder.PathName;
      1: ELyric.Text:=AddDirForm.DirView.SelectedFolder.PathName;
    end;
  end;}
end;

procedure TOptionsForm.BFontClick(Sender: TObject);
begin
  with PlaylistForm do begin
    FontDialog1.Font.Name:=BFont.Caption;
    FontDialog1.Font.Size:=TMLyric.Font.Size;
    if FontDialog1.Execute then begin
      BFont.Caption:=FontDialog1.Font.Name;
      TMLyric.Font.Name:=FontDialog1.Font.Name;
      TMLyric.Font.Size:=FontDialog1.Font.Size;
      TMLyric.ItemHeight:=FontDialog1.Font.Size*2;
      TMLyric.Count:=round(TMLyric.Height/TMLyric.ItemHeight)-1;
      UpdatePW:=True;
    end;
  end;
end;

procedure TOptionsForm.TAboutShow(Sender: TObject);
begin
  MTitle.Caption:=LOCstr_Title;
  if ML then VersionMPlayer.Caption:=GetProductVersion(MplayerLocation)
  else VersionMPlayer.Caption:=GetProductVersion(HomeDir+'mplayer.exe');
  VersionMPUI.Caption:=GetFileVersion(WideParamStr(0));
end;

end.
