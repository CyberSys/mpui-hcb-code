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
unit Options;

interface

uses
  Windows, TntWindows, Messages, SysUtils, TntSysUtils, Variants, Classes, Graphics, Controls, Forms,TntForms,
  Dialogs, StdCtrls, ShellAPI, ComCtrls, Tabs, TabNotBk, ExtCtrls,
  TntExtCtrls, TntComCtrls, TntStdCtrls, ImgList;

type PDSEnumCallback=function(lpGuid:PGUID; lpcstrDescription,lpcstrModule:PChar; lpContext:pointer):LongBool; stdcall;
function DirectSoundEnumerate(lpDSEnumCallback:PDSEnumCallback; lpContext:pointer):HRESULT;
         stdcall; external 'dsound.dll' name 'DirectSoundEnumerateA';

type
  TOptionsForm = class(TTntForm)
    BOK: TTntButton;
    BApply: TTntButton;
    BSave: TTntButton;
    BClose: TTntButton;
    EParams: TEdit;
    LParams: TTntLabel;
    LHelp: TTntLabel;
    Tab: TTntPageControl;
    TabSheet1: TTntTabSheet;
    TabSheet2: TTntTabSheet;
    TabSheet3: TTntTabSheet;
    TabSheet4: TTntTabSheet;
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
    Defaultslang: TTntCheckBox;
    EMplayerLocation: TEdit;
    BSubfont: TButton;
    BMplayer: TButton;
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
    EWadsp: TEdit;
    BWadsp: TButton;
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
    SFsP: TStaticText;
    SFBl: TStaticText;
    SFo: TStaticText;
    CFd: TTntCheckBox;
    CAsync: TTntCheckBox;
    EAsync: TEdit;
    UAsync: TUpDown;
    CCache: TTntCheckBox;
    ECache: TEdit;
    UCache: TUpDown;
    CPriorityBoost: TTntCheckBox;
    CRFScr: TTntCheckBox;
    CSubfont: TComboBox;
    PShow: TPanel;
    COsdfont: TComboBox;
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
    BSsf: TButton;
    ESsf: TEdit;
    SOsdfont: TTntCheckBox;
    LCh: TTntStaticText;
    LRot: TTntStaticText;
    CDrag: TTntCheckBox;
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
    ELyric: TEdit;
    BLyric: TButton;
    LScroll: TTntCheckBox;
    CUseekC: TTntCheckBox;
    CVSync: TTntCheckBox;
    BFont: TButton;
    FontDialog1: TFontDialog;
    LVideoout: TTntLabel;
    CVideoOut: TComboBox;
    procedure BCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LHelpClick(Sender: TObject);
    procedure BApplyClick(Sender: TObject);
    procedure BOKClick(Sender: TObject);
    procedure SomethingChanged(Sender: TObject);
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
  private
    { Private declarations }
    HelpFile:string;
    procedure ApplyNCValues;
  public
    { Public declarations }
    Changed:boolean;
    procedure Localize;
    procedure ApplyValues;
    procedure LoadValues;
  end;

var
  OptionsForm: TOptionsForm;

implementation
uses Core, Config, Main, Locale, About, AddDir,plist;

{$R *.dfm}

procedure TOptionsForm.BCloseClick(Sender: TObject);
begin
  Close;
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

procedure TOptionsForm.ApplyNCValues;
begin
  Core.RFScr:=CRFScr.Checked;
  with MainForm do begin
    if Core.RFScr then begin
      OPanel.PopupMenu:=nil; IPanel.PopupMenu:=nil;
    end
    else begin
      OPanel.PopupMenu:=MPopup; IPanel.PopupMenu:=MPopup;
    end;
  end;

  if Core.Running and (vsync<>CVSync.Checked) then begin
    MainForm.Unpaused;
    if CVSync.Checked then SendCommand('set_property vsync 1')
    else SendCommand('set_property vsync 0');
  end;
  Core.vsync:=CVSync.Checked;
  Core.UseekC:=CUseekC.Checked;
  Core.DragM:=CDrag.Checked;
  Core.PScroll:=LScroll.Checked;
  Core.LTextColor:=ColorToRGB(PLTC.Color);
  Core.LbgColor:=ColorToRGB(PLBC.Color);
  Core.LhgColor:=ColorToRGB(PLHC.Color);
  Core.LyricF:=Bfont.Caption;
  Core.LyricS:=PlaylistForm.TMLyric.Font.Size;
  PlaylistForm.TMLyric.Color:=PLBC.Color;
  PlaylistForm.TMLyric.Font.Color:=PLTC.Color;
  PlaylistForm.PLTC.Color:=Core.LTextColor;
  PlaylistForm.PLBC.Color:=Core.LbgColor;
  PlaylistForm.PLHC.Color:=Core.LhgColor;
  PlaylistForm.LScroll.Checked:=Core.PScroll;
  if PlaylistForm.Visible then PlaylistForm.TMLyric.Invalidate;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
begin
  LoadValues; Changed:=false;
  if ML then HelpFile:=ExtractFileDir(MplayerLocation)+'\man_page.html'
  else HelpFile:=HomeDir+'man_page.html';
  if not FileExists(HelpFile) then begin
    HelpFile:=ExtractFileDir(HelpFile)+'\MPlayer.html';
    if not FileExists(HelpFile) then HelpFile:='';
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
  if length(HelpFile)>0 then
    ShellExecute(Handle,'open',PChar(HelpFile),nil,nil,SW_SHOW);
end;

procedure TOptionsForm.LoadValues;
var i:integer; s:string;
begin
  CAudioOut.ItemIndex:=Core.AudioOut;
  CAudioDev.ItemIndex:=Core.AudioDev;
  LScroll.Checked:=Core.PScroll;
  CIndex.Checked:=Core.ReIndex;
  CSoftVol.Checked:=Core.SoftVol;
  CRFScr.Checked:=Core.RFScr;
  CDr.Checked:=Core.Dr;
  Double.Checked:=Core.dbbuf;
  CVolnorm.Checked:=Core.Volnorm;
  Defaultslang.Checked:=Core.Defaultslang;
  CSubcp.Text:=core.subcode;

  RMplayer.Checked:=Core.ML;
  RCMplayer.Checked:=not Core.ML;
  EMplayerLocation.Enabled:=Core.ML;
  BMplayer.Enabled:=Core.ML;
  CWid.Checked:=Core.Wid;

  EMplayerLocation.Text:=Core.MplayerLocation;
  CMAspect.Text:=Core.MAspect;
  CVideoOut.Text:=Core.VideoOut;
  CCh.ItemIndex:=Core.Ch;
  CRot.ItemIndex:=Core.Rot;
  CSPDIF.Checked:=Core.SPDIF;
  CFlip.Checked:=Core.Flip;
  CMir.Checked:=Core.Mirror;
  CEq2.Checked:=Core.Eq2;
  CYuy2.Checked:=Core.Yuy2;
  CUseekC.Checked:=Core.UseekC;
  CVSync.Checked:=Core.vsync;
  CEq2.Enabled:=not Core.Dda;
    CYuy2.Enabled:=CEq2.Enabled;
    LDeinterlace.Enabled:=CEq2.Enabled;
    CDeinterlace.Enabled:=CEq2.Enabled;
  CNi.Checked:=Core.ni;
  CNobps.Checked:=Core.nobps;
  CFilter.Checked:=Core.FilterDrop;
  CDnav.Checked:=Core.Dnav;
  CUni.Checked:=Core.Uni;
  CUtf.Checked:=Core.Utf;

  CWadsp.Checked:=Core.Wadsp;
    EWadsp.Enabled:=Core.Wadsp;
    BWadsp.Enabled:=Core.Wadsp;
  EWadsp.Text:=Core.WadspL;
  Clavf.Checked:=Core.lavf;
  CFd.Checked:=Core.Fd;
  CAsync.Checked:=Core.Async;
    EAsync.Enabled:=Core.Async;
    UAsync.Enabled:=Core.Async;
  EAsync.Text:=Core.AsyncV;
  CCache.Checked:=Core.Cache;
    ECache.Enabled:=Core.Cache;
    UCache.Enabled:=Core.Cache;
  ECache.Text:=Core.CacheV;
  CPriorityBoost.Checked:=Core.Pri;
  EParams.Text:=Core.Params;
  CAudioOutChange(nil);

  TFsize.Position:=round(Core.FSize*10);
  TFol.Position:=round(Core.Fol*10);
  TFB.Position:=round(Core.FB*10);
  CAspect.Items[10]:=MainForm.MCustomAspect.Caption;
  CAspect.ItemIndex:=Core.Aspect;
  CDeinterlace.ItemIndex:=Core.Deinterlace;
  CLanguage.ItemIndex:=DefaultLocale+1;
  CPostproc.ItemIndex:=Core.Postproc;
  COsdfont.Text:=Core.osdfont;
  CSubfont.Text:=Core.subfont;
  PLTC.Color:=Core.LTextColor;
  PLBC.Color:=Core.LbgColor;
  PLHC.Color:=Core.LhgColor;
  BFont.Caption:=PlayListForm.TMLyric.Font.Name;
  PTc.color:=Core.TextColor;
  PTc.Enabled:=Core.Ass;
  POc.color:=Core.OutColor;
  POc.Enabled:=Core.Ass;
  CAss.Checked:=Core.Ass;
  CEfont.Checked:=Core.Efont;
  CEfont.Enabled:=Core.Ass;
  SfontColor.Enabled:=Core.Ass;
  SOutline.Enabled:=Core.Ass;
  CISub.Checked:=Core.ISub;
  ESsf.Text:=Core.ShotDir;
  ELyric.Text:=Core.LyricDir;
  SOsdfont.Checked:=Core.uof;
  COsdfont.Enabled:=Core.uof;
  BOsdfont.Enabled:=Core.uof;
  CDrag.Checked:=Core.DragM;
  CGUI.Checked:=core.GUI;
  
  PShow.Caption:='';
  for i:=0 to FontPaths.Count-1 do begin
    s:= Trim(LowerCase(CSubfont.Text));
    if (LowerCase(FontNames[i])=s) or
       (LowerCase(FontPaths[i])=s) then begin
      PShow.Font.Name:=FontNames[i];
      PShow.Caption:=FontNames[i];
      break;
    end;
  end;
  
end;

procedure TOptionsForm.ApplyValues;
begin
  Core.AudioOut:=CAudioOut.ItemIndex;
  Core.AudioDev:=CAudioDev.ItemIndex;
  Core.Postproc:=CPostproc.ItemIndex;
  Core.Aspect:=CAspect.ItemIndex;
  Core.Deinterlace:=CDeinterlace.ItemIndex;
  Core.ReIndex:=CIndex.Checked;
  Core.SoftVol:=CSoftVol.Checked;
  if (Core.Volume>100) AND (not Core.SoftVol) then begin
    Core.Volume:=100; MainForm.VolBoost.Visible:=False;
    MainForm.VolSlider.Left:=Core.Volume*(MainForm.VolFrame.ClientWidth-MainForm.VolSlider.Width) DIV 100;
  end;
  Core.Dr:=CDr.Checked;
  Core.dbbuf:=double.Checked;
  Core.Volnorm:=CVolnorm.Checked;
  Core.Defaultslang:=Defaultslang.Checked;
  core.subcode:=CSubcp.Text;
  Core.osdfont:=COsdfont.Text;
  Core.subfont:=CSubfont.Text;
  Core.MplayerLocation:=EMplayerLocation.Text;
  Core.MAspect:=CMAspect.Text;
  Core.VideoOut:=CVideoOut.Text;
  Core.Dda:=Trim(LowerCase(VideoOut))='directx:noaccel';
  Core.Ch:=CCh.ItemIndex;
  Core.Rot:=CRot.ItemIndex;
  Core.SPDIF:=CSPDIF.Checked;
  Core.Wid:=CWid.Checked;
  Core.Flip:=CFlip.Checked;
  Core.Mirror:=CMir.Checked;
  Core.Eq2:=CEq2.Checked;
  Core.Yuy2:=CYuy2.Checked;
  Core.ni:=CNi.Checked;
  Core.nobps:=CNobps.Checked;
  Core.FilterDrop:=CFilter.Checked;
  Core.Dnav:=CDnav.Checked;
  Core.Uni:=CUni.Checked;
  Core.Utf:=CUtf.Checked;
  Core.FSize:=TFsize.Position/10;
  Core.Fol:=TFol.Position/10;
  Core.FB:=TFB.Position/10;
  Core.Wadsp:=CWadsp.Checked;
  Core.WadspL:=EWadsp.Text;
  Core.lavf:=Clavf.Checked;
  Core.Fd:=CFd.Checked;
  Core.Async:=CAsync.Checked;
  Core.AsyncV:=EAsync.Text;
  Core.Cache:=CCache.Checked;
  Core.CacheV:=ECache.Text;
  Core.Pri:=CPriorityBoost.Checked;
  Core.Params:=Trim(EParams.Text);
  Core.TextColor:=ColorToRGB(PTc.color);
  Core.OutColor:=ColorToRGB(POc.color);
  Core.Ass:=CAss.Checked;
  Core.Efont:=CEfont.Checked;
  Core.ISub:=CISub.Checked;
  Core.uof:=SOsdfont.Checked;
  Core.GUI:=CGUI.Checked;
  if DirectoryExists(ELyric.Text) then Core.LyricDir:=ELyric.Text;
  if DirectoryExists(ESsf.Text) then Core.ShotDir:=ESsf.Text
  else if CreateDir(ESsf.Text) then Core.ShotDir:=ESsf.Text;

  if DefaultLocale<>(CLanguage.ItemIndex-1) then begin
    DefaultLocale:=CLanguage.ItemIndex-1;
    ActivateLocale(DefaultLocale);
  end;
  MainForm.UpdateMenuCheck;
end;

procedure TOptionsForm.BApplyClick(Sender: TObject);
begin
  ApplyNCValues;
  if Changed then begin
    ApplyValues; Changed:=false;
    Core.Restart;
    CLanguage.ItemIndex:=DefaultLocale+1;
    CAspect.Items[10]:=MainForm.MCustomAspect.Caption;
    CAspect.ItemIndex:=Core.Aspect;
    CDeinterlace.ItemIndex:=Core.Deinterlace;
    CPostproc.ItemIndex:=Core.Postproc;
    CAudioOut.ItemIndex:=Core.AudioOut;
    CAudioDev.ItemIndex:=Core.AudioDev;
    CSubcp.Text:=core.subcode;
    COsdfont.Text:=Core.osdfont;
    CSubfont.Text:=Core.subfont;
    EMplayerLocation.Text:=Core.MplayerLocation;
    CMAspect.Text:=Core.MAspect;
    CCh.ItemIndex:=Core.Ch;
    CRot.ItemIndex:=Core.Rot;
    ESsf.Text:=Core.ShotDir;
  end;
end;

procedure TOptionsForm.BOKClick(Sender: TObject);
begin
  Close;
  ApplyNCValues;
  if Changed then begin
    ApplyValues;
    Core.Restart;
  end;
end;

procedure TOptionsForm.SomethingChanged(Sender: TObject);
begin
  Changed:=true; 
end;

procedure TOptionsForm.BSaveClick(Sender: TObject);
begin
  ApplyNCValues;
  if Changed then begin
    ApplyValues;
    CLanguage.ItemIndex:=DefaultLocale+1;
    CAspect.Items[10]:=MainForm.MCustomAspect.Caption;
    CAspect.ItemIndex:=Core.Aspect;
    CDeinterlace.ItemIndex:=Core.Deinterlace;
    CPostproc.ItemIndex:=Core.Postproc;
    CAudioOut.ItemIndex:=Core.AudioOut;
    CAudioDev.ItemIndex:=Core.AudioDev;
    CSubcp.Text:=core.subcode;
    COsdfont.Text:=Core.osdfont;
    CSubfont.Text:=Core.subfont;
    EMplayerLocation.Text:=Core.MplayerLocation;
    CMAspect.Text:=Core.MAspect;
    CCh.ItemIndex:=Core.Ch;
    CRot.ItemIndex:=Core.Rot;
    ESsf.Text:=Core.ShotDir;
  end;
  Config.Save(HomeDir+Config.DefaultFileName,0);
end;

function EnumFunc(lpGuid:PGUID; lpcstrDescription,lpcstrModule:PChar; lpContext:pointer):LongBool; stdcall;
begin
  TComboBox(lpContext^).Items.Add(lpcstrDescription);
  Result:=True;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  CSubfont.Items:=FontNames; COsdfont.Items:=CSubfont.Items; Tab.TabIndex:=0;
  DirectSoundEnumerate(EnumFunc,@CAudioDev);
  {$IFDEF VER150}
  // some fixes for Delphi>=7 VCLs
    PTc.ParentBackground:=False; POc.ParentBackground:=False;
  {$ENDIF}
end;

procedure TOptionsForm.CAudioOutChange(Sender: TObject);
var e:boolean;
begin
  e:=(CAudioOut.ItemIndex=3);
  LAudioDev.Enabled:=e;
  CAudioDev.Enabled:=e;
  if Assigned(Sender) then SomethingChanged(Sender);
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
      if CSubfont.Text<>fileName then FontChange(CSubfont);
      CSubfont.Text:=fileName;
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
      if COsdfont.Text<>fileName then FontChange(COsdfont);
      COsdfont.Text:=fileName;
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
    if Execute then begin
      if EMplayerLocation.Text<>fileName then changed:=true;
      EMplayerLocation.Text:=fileName;
    end;
  end;
end;

procedure TOptionsForm.CDDXAClick(Sender: TObject);
begin
  Changed:=true;
  CEq2.Enabled:=Trim(LowerCase(CVideoOut.Text))<>'directx:noaccel';
  LDeinterlace.Enabled:=CEq2.Enabled;
  CDeinterlace.Enabled:=CEq2.Enabled;
  CYuy2.Enabled:=CEq2.Enabled;
end;

procedure TOptionsForm.TFsizeChange(Sender: TObject);
begin
  Changed:=true;
  SFsP.Caption:=Format('%.1f%%',[TFsize.Position/10]);
end;

procedure TOptionsForm.TFolChange(Sender: TObject);
begin
  Changed:=true;
  SFo.Caption:=Format('%.1f',[TFol.Position/10]);
end;

procedure TOptionsForm.TFBChange(Sender: TObject);
begin
  Changed:=true;
  SFBl.Caption:=Format('%.1f',[TFB.Position/10]);
end;

procedure TOptionsForm.CWadspClick(Sender: TObject);
begin
  Changed:=true;
  EWadsp.Enabled:=CWadsp.Checked;
  BWadsp.Enabled:=CWadsp.Checked;
end;

procedure TOptionsForm.BWadspClick(Sender: TObject);
begin
  with MainForm.OpenDialog do begin
    Title:=CWadsp.Caption;
    Options:=Options-[ofAllowMultiSelect]-[ofoldstyledialog];
    filter:='*.dll|*.Dll|'+AnyFilter+'(*.*)|*.*';
    if Execute then begin
      if EWadsp.Text<>fileName then changed:=true;
      EWadsp.Text:=fileName;
    end;
  end;
end;

procedure TOptionsForm.RMplayerClick(Sender: TObject);
begin
  if Core.ML<>RMplayer.Checked then begin
    Changed:=true;
    Core.ML:=RMplayer.Checked;
    EMplayerLocation.Enabled:=Core.ML;
    BMplayer.Enabled:=Core.ML;
  end;
end;

procedure TOptionsForm.RCMplayerClick(Sender: TObject);
begin
  if Core.ML=RCMplayer.Checked then begin
    Changed:=true;
    Core.ML:=not RCMplayer.Checked;
    EMplayerLocation.Enabled:=Core.ML;
    BMplayer.Enabled:=Core.ML;
  end;
end;

procedure TOptionsForm.CAsyncClick(Sender: TObject);
begin
  Changed:=true;
  EAsync.Enabled:=CAsync.Checked;
  UAsync.Enabled:=CAsync.Checked;
end;

procedure TOptionsForm.CCacheClick(Sender: TObject);
begin
  Changed:=true;
  ECache.Enabled:=CCache.Checked;
  UCache.Enabled:=CCache.Checked;
end;

procedure TOptionsForm.FontChange(Sender: TObject);
var i:integer;
begin
  changed:=true;
  if (Sender as TComboBox).ItemIndex>-1 then begin
    PShow.Font.Name:=(Sender as TComboBox).Text;
    PShow.Caption:=(Sender as TComboBox).Text;
  end
  else begin
    for i:=0 to FontPaths.Count-1 do begin
      if LowerCase(FontPaths[i])=Trim(LowerCase((Sender as TComboBox).Text)) then begin
        PShow.Font.Name:=FontNames[i];
        PShow.Caption:=FontNames[i];
        exit;
      end;
    end;
    PShow.Caption:='';
  end;
end;

procedure TOptionsForm.SetColor(Sender: TObject);
begin
  ColorDialog1.Color:=(Sender as TPanel).Color;
  if ColorDialog1.Execute then begin
    changed:=true;
    (Sender as TPanel).Color := ColorDialog1.Color;
  end;
end;

procedure TOptionsForm.CAssClick(Sender: TObject);
begin
  changed:=true;
  PTc.Enabled:=CAss.Checked; POc.Enabled:=CAss.Checked;
  CEfont.Enabled:=CAss.Checked; SfontColor.Enabled:=CAss.Checked;
  SOutline.Enabled:=CAss.Checked; 
end;

procedure TOptionsForm.SOsdfontClick(Sender: TObject);
begin
  changed:=true;
  COsdfont.Enabled:=SOsdfont.Checked;
  BOsdfont.Enabled:=SOsdfont.Checked;
end;

procedure TOptionsForm.BSsfClick(Sender: TObject);
begin
  if AddDirForm.Execute(false) then begin
    case (Sender as TComponent).Tag of
      0: if ESsf.Text<>AddDirForm.DirView.SelectedFolder.PathName then begin
           Changed:=true; ESsf.Text:=AddDirForm.DirView.SelectedFolder.PathName;
         end;
      1: if ELyric.Text<>AddDirForm.DirView.SelectedFolder.PathName then begin
           Changed:=true; ELyric.Text:=AddDirForm.DirView.SelectedFolder.PathName;
         end;
    end;
  end;
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
      Core.UpdatePW:=True;
    end;
  end;
end;

end.
