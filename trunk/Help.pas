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
unit Help;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, TntForms, TntGraphics;

type
  THelpForm = class(TTntForm)
    HelpText: TTntMemo;
    BClose: TTntButton;
    procedure BCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HelpTextEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Format;
  end;

var
  HelpForm: THelpForm;

implementation

uses Core, Main;

{$R *.dfm}

procedure THelpForm.BCloseClick(Sender: TObject);
begin
  Close;
end;

procedure THelpForm.Format;
var NeededWidth,i,w:integer;
begin
  NeededWidth:=0;
  for i:=0 to HelpText.Lines.Count-1 do begin
    w:=WideCanvasTextWidth(HelpForm.Canvas,HelpText.Lines[i]+'@@');
    if w>NeededWidth then NeededWidth:=w;
  end;
  Width:=Width-HelpText.Width+NeededWidth;
  Height:=Height-HelpText.Height+HelpText.Lines.Count*WideCanvasTextHeight(HelpForm.Canvas,HelpText.Lines[0]);
end;

procedure THelpForm.FormShow(Sender: TObject);
begin
  if (left+width)>=Screen.Width then left:=Screen.Width-width;
  if left<0 then left:=0; if top<0 then top:=0;
  if (top+height)>=Screen.WorkAreaHeight then top:=Screen.WorkAreaHeight-height;
end;

procedure THelpForm.HelpTextEnter(Sender: TObject);
begin
  ActiveControl:=BClose;
end;

end.
