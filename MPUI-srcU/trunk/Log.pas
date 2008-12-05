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
unit Log;

interface

uses
  Windows, Messages, SysUtils, TntSysUtils, Variants, Classes, 
  Graphics, Controls, Forms,TntForms, Buttons, ExtCtrls, TntExtCtrls,
  Dialogs, StdCtrls, TntStdCtrls, SevenZipVCL;

type
  TLogForm = class(TTntForm)
    TheLog: TTntMemo;
    ControlPanel: TTntPanel;
    BClose: TTntButton;
    Command: TTntEdit;
    procedure BCloseClick(Sender: TObject);
    procedure CommandKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure CommandKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    History:TWideStringList_;
    HistoryPos:Longword;
  public
    { Public declarations }
    procedure AddLine(const Line:Widestring);
  end;

var
  LogForm: TLogForm;

implementation
uses Main,Core;

{$R *.dfm}

procedure TLogForm.BCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TLogForm.CommandKeyPress(Sender: TObject; var Key: Char);
var s:WideString;
begin
  if not Core.Running then exit;
  if Key=^M then begin
    TheLog.Lines.Add(WideString('> ')+Command.Text);
    s:=Tnt_WideLowerCase(Command.Text);
    if (s<>'pause') and (s<>'frame_step') then begin
      MainForm.Unpaused;
      Core.SendCommand(UTF8Decode(Command.Text));
    end
    else begin
        if s='pause' then begin
          SendCommand('pause');
          if Core.Status=sPlaying then begin
            Core.Status:=sPaused; MainForm.BPause.Down:=true;
            MainForm.BPlay.Down:=false;
          end
          else begin
            Core.Status:=sPlaying; MainForm.BPlay.Down:=true;
            MainForm.BPause.Down:=false;
          end;
          MainForm.UpdateStatus;
        end
        else MainForm.BPauseClick(nil);
    end;
    History.AddString(Command.Text);
    HistoryPos:=History.Count;
    Command.Text:='';
  end;
end;

procedure TLogForm.FormCreate(Sender: TObject);
begin
  History:=TWideStringList_.Create;
end;

procedure TLogForm.CommandKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_UP) AND (HistoryPos>0) then begin
    dec(HistoryPos);
    Command.Text:=History.wstrings[HistoryPos];
  end;
  if (Key=VK_DOWN) AND (HistoryPos<History.Count) then begin
    inc(HistoryPos);
    if HistoryPos>=History.Count
      then Command.Text:=''
      else Command.Text:=History.wstrings[HistoryPos];
  end;
  if Key=VK_F12 then Close;
end;

procedure TLogForm.FormShow(Sender: TObject);
begin
  TheLog.Perform(EM_LINESCROLL,0,32767); Command.Focused;
  if (left+width)>=Screen.Width then left:=Screen.Width-width;
  if left<0 then left:=0; if top<0 then top:=0;
  if (top+height)>=Screen.WorkAreaHeight then top:=Screen.WorkAreaHeight-height;
end;

procedure TLogForm.AddLine(const Line:Widestring);
begin
  TheLog.Lines.Add(Line);
  if Visible then TheLog.Perform(EM_LINESCROLL,0,32767);
end;

end.
