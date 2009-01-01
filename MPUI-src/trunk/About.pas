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
unit About;

interface

uses
  Windows, TntWindows, Messages, SysUtils, TntSysutils, Variants, Classes, Graphics, Controls, TntForms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI, jpeg, TntStdCtrls,Forms,TntSystem;

type
  TAboutForm = class(TTntForm)
    PLogo: TPanel;
    ILogo: TImage;
    VersionMPUI: TTntLabel;
    VersionMPlayer: TTntLabel;
    BClose: TTntButton;
    MCredits: TMemo;
    LVersionMPlayer: TTntLabel;
    LVersionMPUI: TTntLabel;
    MTitle: TTntMemo;
    LURL: TLabel;
    FY: TTntLabel;
    FYI: TImage;
    HCB: TImage;
    procedure FormShow(Sender: TObject);
    procedure BCloseClick(Sender: TObject);
    procedure URLClick(Sender: TObject);
    procedure ReadOnlyItemEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;
  
function GetProductVersion(const FileName:WideString):WideString;

implementation
                
uses Main, Core, Locale;

{$R *.dfm}

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



procedure TAboutForm.FormShow(Sender: TObject);
begin
  MTitle.Text:=LOCstr_Title;
  if ML then VersionMPlayer.Caption:=GetProductVersion(MplayerLocation)
  else VersionMPlayer.Caption:=GetProductVersion(HomeDir+'mplayer.exe');
  VersionMPUI.Caption:=GetFileVersion(WideParamStr(0));
  ActiveControl:=BClose;
  if (left+width)>=Screen.Width then left:=Screen.Width-width;
  if left<0 then left:=0; if top<0 then top:=0;
  if (top+height)>=Screen.WorkAreaHeight then top:=Screen.WorkAreaHeight-height;
end;

procedure TAboutForm.BCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutForm.URLClick(Sender: TObject);
begin
  ShellExecute(Handle,'open','http://sourceforge.net/projects/mpui-hcb/',nil,nil,SW_SHOW);
end;

procedure TAboutForm.ReadOnlyItemEnter(Sender: TObject);
begin
  ActiveControl:=BClose;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
begin
{$IFDEF VER150}
  // some fixes for Delphi>=7 VCLs
  PLogo.ParentBackground:=False;
{$ENDIF}
end;

end.
