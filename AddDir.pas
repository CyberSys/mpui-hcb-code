unit AddDir;

interface

uses Windows, SysUtils, Classes, Graphics, Forms,TntForms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ShellCtrls, TntStdCtrls;

type
  TAddDirForm = class(TTntForm)
    BOK: TTntButton;
    BCancel: TTntButton;
    DirView: TShellTreeView;
    CInSubDir: TTntCheckBox;
    procedure BCancelClick(Sender: TObject);
    procedure BOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddDirForm: TAddDirForm;

implementation

uses plist, Core, Options;

{$R *.dfm}

procedure TAddDirForm.BOKClick(Sender: TObject);
begin
  Core.InSubDir:=CInSubDir.Checked;
  if DirView.SelectedFolder.PathName<>'' then begin
    case OpenM of
      0: begin
           Playlist.AddDirectory(DirView.SelectedFolder.PathName);
           empty:=true; Playlist.Changed;
         end;
      1: begin Playlist.Clear;
           Playlist.AddDirectory(DirView.SelectedFolder.PathName);
           empty:=true; Playlist.Changed;
           PlaylistForm.BPlayClick(nil);
         end;
      2: OptionsForm.ESsf.Text:=DirView.SelectedFolder.PathName;
      3: OptionsForm.ELyric.Text:=DirView.SelectedFolder.PathName;
    end;
  end;
  Close;
end;

procedure TAddDirForm.BCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TAddDirForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OpenM:=0; CInSubDir.Visible:=true;
end;

procedure TAddDirForm.FormShow(Sender: TObject);
begin
  CInSubDir.Checked:=Core.InSubDir;
  if (left+width)>=Screen.Width then left:=Screen.Width-width;
  if left<0 then left:=0; if top<0 then top:=0;
  if (top+height)>=Screen.WorkAreaHeight then top:=Screen.WorkAreaHeight-height;
end;

end.
