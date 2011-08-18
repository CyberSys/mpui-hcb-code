unit TV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TntComCtrls, StdCtrls, TntStdCtrls;

type
  TTVForm = class(TForm)
    CCountryCode: TTntComboBox;
    LCountryCode: TTntStaticText;
    BOK: TTntButton;
    BApply: TTntButton;
    BSave: TTntButton;
    BClose: TTntButton;
    TBa: TTntButton;
    TBn: TTntButton;
    TFadd: TTntButton;
    TFdel: TTntButton;
    TFSet: TTntButton;
    RHK: TTntButton;
    TntComboBox1: TTntComboBox;
    TntStaticText1: TTntStaticText;
    TEAss: TTntEdit;
    HK: TTntListView;
    TStop: TTntButton;
    procedure TFaddClick(Sender: TObject);
    procedure TBaClick(Sender: TObject);
    procedure TBnClick(Sender: TObject);
    procedure TStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TVForm: TTVForm;

implementation
uses Main, Core,Plist;
{$R *.dfm}

procedure TTVForm.TFaddClick(Sender: TObject);
var i:integer;
begin
  with HK.Items.Add do begin
    i:=pos('(',TEAss.Text);
    Caption:=copy(TEAss.Text,1,i-2);
    SubItems.add(Copy(TEAss.Text, i+1,length(TEAss.Text)-2));
  end;
end;

procedure TTVForm.TBaClick(Sender: TObject);
begin
   SendCommand('tv_start_scan');
end;

procedure TTVForm.TBnClick(Sender: TObject);
var Entry:TPlaylistEntry;
begin
  with Entry do begin
    State:=psNotPlayed;
    FullURL:='-tv automute=100:audioid='
            //+IntToStr(CAudioDevices.ItemIndex)
          //  +':input '+IntToStr(CVideoDevices.ItemIndex)
            +' tv://'+IntToStr(HK.ItemIndex+1);
    DisplayURL:='TV-'+HK.Selected.Caption;
  end;
  Playlist.Add(Entry);
  Playlist.Changed; MainForm.UpdateParams;
  MainForm.NextFile(0,psPlaying);
end;

procedure TTVForm.TStopClick(Sender: TObject);
begin
  SendCommand('stop');
end;

end.
