unit Equalizer;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, TntForms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, TntStdCtrls;

type
  TEqualizerForm = class(TTntForm)
    BReset: TTntButton;
    BClose: TTntButton;
    Sbri: TTntStaticText;
    TBri: TTrackBar;
    SCon: TTntStaticText;
    TCon: TTrackBar;
    SSat: TTntStaticText;
    TSat: TTrackBar;
    Shue: TTntStaticText;
    THue: TTrackBar;
    Bevel1: TBevel;
    SGam: TTntStaticText;
    TGam: TTrackBar;
    procedure BCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TBriChange(Sender: TObject);
    procedure TConChange(Sender: TObject);
    procedure THueChange(Sender: TObject);
    procedure TSatChange(Sender: TObject);
    procedure BResetClick(Sender: TObject);
    procedure TGamChange(Sender: TObject);
  private
    { Private declarations }
    Changed:boolean;
  public
    { Public declarations }
  end;

var
  EqualizerForm: TEqualizerForm;

implementation

uses Main, Core, Locale;

{$R *.dfm}

procedure TEqualizerForm.BCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TEqualizerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Changed then begin
    CBHSA:=1;
    SendCommand('get_property contrast');
    SendCommand('get_property brightness');
    SendCommand('get_property hue');
    SendCommand('get_property saturation');
    SendCommand('get_property gamma');
  end;
end;

procedure TEqualizerForm.FormShow(Sender: TObject);
begin
  CBHSA:=5; Changed:=false;
  BReset.Enabled:=TCon.Enabled OR TGam.Enabled OR
                  TBri.Enabled OR THue.Enabled OR TSat.Enabled;
  if (left+width)>=Screen.Width then left:=Screen.Width-width;
  if left<0 then left:=0; if top<0 then top:=0;
  if (top+height)>=Screen.WorkAreaHeight then top:=Screen.WorkAreaHeight-height;
end;

procedure TEqualizerForm.TBriChange(Sender: TObject);
begin
  if CBHSA<>5 then exit
  else begin
    Changed:=true;
    SendCommand('set_property brightness '+IntToStr(TBri.Position));
  end;
end;

procedure TEqualizerForm.TConChange(Sender: TObject);
begin
  if CBHSA<>5 then exit
  else begin
    Changed:=true;
    SendCommand('set_property contrast '+IntToStr(TCon.Position));
  end;
end;

procedure TEqualizerForm.THueChange(Sender: TObject);
begin
  if CBHSA<>5 then exit
  else begin
    Changed:=true;
    SendCommand('set_property hue '+IntToStr(THue.Position));
  end;
end;

procedure TEqualizerForm.TSatChange(Sender: TObject);
begin
  if CBHSA<>5 then exit
  else begin
    Changed:=true;
    SendCommand('set_property saturation '+IntToStr(TSat.Position));
  end;
end;

procedure TEqualizerForm.TGamChange(Sender: TObject);
begin
  if CBHSA<>5 then exit
  else begin
    Changed:=true;
    SendCommand('set_property gamma '+IntToStr(TGam.Position));
  end;
end;

procedure TEqualizerForm.BResetClick(Sender: TObject);
begin
  if contrD<>101 then begin
    Changed:=true; contr:=contrD; TCon.Position:=contrD;
    SendCommand('set_property contrast '+IntToStr(contrD));
  end;
  if briD<>101 then begin
    Changed:=true; bri:=briD; TBri.Position:=briD;
    SendCommand('set_property brightness '+IntToStr(briD));
  end;
  if huD<>101 then begin
    Changed:=true; hu:=huD; THue.Position:=huD;
    SendCommand('set_property hue '+IntToStr(huD));
  end;
  if satD<>101 then begin
    Changed:=true; sat:=satD; TSat.Position:=satD;
    SendCommand('set_property saturation '+IntToStr(satD)+' 1');
  end;
  if (gamD<>101) and Eq2 then begin
    Changed:=true; gam:=gamD; TGam.Position:=gamD;
    SendCommand('set_property gamma '+IntToStr(gamD)+' 1');
  end;
  SendCommand('osd_show_text "'+OSD_Reset_Prompt+' C/B/H/S/G"');
end;

end.
