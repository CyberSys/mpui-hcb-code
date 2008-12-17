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
    function Execute(SubDirV:boolean):boolean;
  private
    { Private declarations }
     IsExecute:boolean;
  public
    { Public declarations }
  end;

var
  AddDirForm: TAddDirForm;

implementation

uses Core;

{$R *.dfm}

function TAddDirForm.Execute(SubDirV:boolean):boolean;
begin
  CInSubDir.Visible:=SubDirV;
  if not Visible then Showmodal;
  Result:=IsExecute;
end;

procedure TAddDirForm.BOKClick(Sender: TObject);
begin
  IsExecute:=true;
  InSubDir:=CInSubDir.Checked;
  Close;
end;

procedure TAddDirForm.BCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAddDirForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CInSubDir.Visible:=true;
end;

procedure TAddDirForm.FormShow(Sender: TObject);
begin
  CInSubDir.Checked:=Core.InSubDir; IsExecute:=false; 
  if (left+width)>=Screen.Width then left:=Screen.Width-width;
  if left<0 then left:=0; if top<0 then top:=0;
  if (top+height)>=Screen.WorkAreaHeight then top:=Screen.WorkAreaHeight-height;
end;

end.
