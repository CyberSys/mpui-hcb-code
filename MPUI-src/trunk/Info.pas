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
unit Info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, TntGraphics, Controls, Forms,
  Dialogs, TntStdCtrls,TntForms, StdCtrls, Graphics, TntClipBrd;

type
  TInfoForm = class(TTntForm)
    InfoBox: TTntListBox;
    BClose: TTntButton;
    TCB: TTntButton;
    procedure BCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InfoBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure TCBClick(Sender: TObject);
    procedure TntFormResize(Sender: TObject);
  private
    { Private declarations }
    TabOffset,MW:integer;
    ClipText:WideString;
    procedure FormMove(var msg:TMessage); message WM_MOVE;
  public
    { Public declarations }
    ControlledMove:boolean;
    procedure UpdateInfo;
  end;

var
  InfoForm: TInfoForm;
  Docked:boolean;

implementation
uses Core, Locale, Main;

{$R *.dfm}

function FormatAspectRatio(const Aspect:real):wideString;
var Numerator,Denominator:integer;
begin
  for Denominator:=1 to 50 do begin
    Numerator:=round(Aspect*Denominator);
    if abs(Numerator/Denominator-Aspect)<0.001 then begin
      Result:=IntToStr(Numerator)+':'+IntToStr(Denominator);
      exit;
    end;
  end;
  str(Aspect:0:3,Result); Result:=Result+':1';
end;


procedure TInfoForm.FormCreate(Sender: TObject);
begin
  UpdateInfo;
  ControlledMove:=True; Docked:=true;
  if Core.RP then begin Left:=Core.IL; Top:=Core.IT; end;
end;

procedure TInfoForm.BCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TInfoForm.UpdateInfo;
var HaveTagHeader,HaveVideoHeader,HaveAudioHeader:boolean;
    W,i,j:integer; s:WideString;
  procedure calcOffset;
  var a:integer;
  begin TabOffset:=0;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoFileName);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoFileFormat);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoPlaybackTime);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoDecoder);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoCodec);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoBitrate);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoVideoSize);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoVideoFPS);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoVideoAspect);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoAudioRate);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoVideoAspect);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoAudioChannels);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoVideo);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoAudio);
    if W>TabOffset then TabOffset:=W;
    W:=WideCanvasTextWidth(InfoBox.Canvas,LOCstr_InfoTags);
    if W>TabOffset then TabOffset:=W;
    for a:=0 to 9 do begin
      W:=WideCanvasTextWidth(InfoBox.Canvas,StreamInfo.ClipInfo[a].key);
      if W>TabOffset then TabOffset:=W;
    end;
  end;

  procedure AddItem(Key,Value:WideString);
  var d,k:integer;
  begin
    Key:=Key+':'; k:=InfoBox.Width-TabOffset-20;
    ClipText:=ClipText+Key+^I+Value+^M^J;
    repeat
      for d:=1 to length(Value) do begin
        j:=WideCanvasTextWidth(InfoBox.Canvas,copy(Value,1,d));
        if j>k then begin
          InfoBox.Items.Add(Key+^I+copy(Value,1,d-1));
          Value:=copy(Value,d,length(Value));
          Key:=''; break;
        end;
      end;
      if d>length(Value) then begin
        InfoBox.Items.Add(Key+^I+Value);break;
      end;
    until False;
  end;

  procedure AddHeader(var Flag:boolean; const Caption:WideString);
  begin
    if Flag then exit;
    InfoBox.Items.Add(WideString('!')+Caption);
    ClipText:=ClipText+Caption+^M^J;
    Flag:=true;
  end;

  procedure T(const Key,Value:WideString);
  begin
    AddHeader(HaveTagHeader,LOCstr_InfoTags);
    AddItem(Key,Value);
  end;

  procedure V(const Key,Value:WideString);
  begin
    AddHeader(HaveVideoHeader,LOCstr_InfoVideo);
    AddItem(Key,Value);
  end;

  procedure A(const Key,Value:WideString);
  begin
    AddHeader(HaveAudioHeader,LOCstr_InfoAudio);
    AddItem(Key,Value);
  end;
  
begin
  with StreamInfo do begin
    if not Visible then exit;
    InfoBox.Items.Clear;
    ClipText:=''; calcOffset; MW:=0;
    if length(FileName)=0 then begin
      InfoBox.Items.Add(LOCstr_NoInfo);
      exit;
    end;
    HaveTagHeader:=false; HaveVideoHeader:=false; HaveAudioHeader:=false;
    AddItem(LOCstr_InfoFileName,FileName);
    if length(FileFormat)>0 then
      AddItem(LOCstr_InfoFileFormat,FileFormat);
    if length(PlaybackTime)>0 then
      AddItem(LOCstr_InfoPlaybackTime,PlaybackTime);
    for i:=0 to 9 do
      with ClipInfo[i] do
        if (length(Key)>0) AND (length(Value)>0) then T(Key, Value);
    if length(Video.Decoder)>0 then
      V(LOCstr_InfoDecoder, Video.Decoder);
    if length(Video.Codec)>0 then
      V(LOCstr_InfoCodec, Video.Codec);
    if Video.Bitrate<>0 then
      V(LOCstr_InfoBitrate, IntToStr(Video.Bitrate DIV 1000)+' kbps');
    if (Video.Width<>0) AND (Video.Height<>0) then
      V(LOCstr_InfoVideoSize, IntToStr(Video.Width)+' x '+IntToStr(Video.Height));
    if (Video.FPS>0.01) then begin
      str(Video.FPS:0:3,s); V(LOCstr_InfoVideoFPS, s+' fps');
    end;
    if (Video.Aspect>0.01) then begin
      V(LOCstr_InfoVideoAspect, FormatAspectRatio(Video.Aspect));
    end;
    if length(Audio.Decoder)>0 then
      A(LOCstr_InfoDecoder, Audio.Decoder);
    if length(Audio.Codec)>0 then
      A(LOCstr_InfoCodec, Audio.Codec);
    if Audio.Bitrate<>0 then
      A(LOCstr_InfoBitrate, IntToStr(Audio.Bitrate DIV 1000)+' kbps');
    if Audio.Rate<>0 then  
      A(LOCstr_InfoAudioRate, IntToStr(Audio.Rate)+' Hz');
    if Audio.Channels<>0 then
      A(LOCstr_InfoAudioChannels, IntToStr(Audio.Channels));
  end;
end;

procedure TInfoForm.FormShow(Sender: TObject);
begin
  UpdateInfo; ControlledMove:=true;
  MainForm.MStreamInfo.Checked:=True;
  MainForm.BStreamInfo.Down:=True;
  if (left+width)>=Screen.Width then begin ControlledMove:=true; left:=Screen.Width-width; end;
  if left<0 then begin ControlledMove:=true; left:=0; end;
  if top<0 then begin ControlledMove:=true; top:=0; end;
  if (top+height)>=Screen.WorkAreaHeight then begin ControlledMove:=true; top:=Screen.WorkAreaHeight-height; end;
  if (MainForm.Width>=Screen.Width) OR (MainForm.Height>=Screen.WorkAreaHeight) then MainForm.Enabled:=false;
  if (OnTop>0) OR MainForm.MFullScreen.Checked then SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
end;

procedure TInfoForm.FormHide(Sender: TObject);
begin
  MainForm.MStreamInfo.Checked:=False;
  MainForm.BStreamInfo.Down:=False;
  MainForm.Enabled:=true;
  if (OnTop=1) OR ((OnTop=2) AND (Status=sPlaying)) OR MainForm.MFullScreen.Checked then
    SetWindowPos(MainForm.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE OR SWP_NOSIZE);
end;

procedure TInfoForm.InfoBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var s,t:WideString; p:integer;
begin
  with InfoBox.Canvas do begin
    s:=InfoBox.Items[Index];
    if (length(s)>0) AND (s[1]='!') then begin
      Brush.Color:=clBtnFace;
      Font.Color:=clBtnText;
      Font.Style:=Font.Style+[fsBold];
      FillRect(Rect); t:=copy(s,2,length(s));
      WideCanvasTextOut(InfoBox.Canvas,Rect.Left+2,Rect.Top+1,t);
      exit;
    end;
    p:=Pos(^I,s);
    FillRect(Rect);
    if p>0 then begin
      t:=copy(s,1,p-1);
      WideCanvasTextOut(InfoBox.Canvas,Rect.Left+2,Rect.Top+1,t);
      t:=copy(s,p+1,length(s));
      WideCanvasTextOut(InfoBox.Canvas,Rect.Left+TabOffset+10,Rect.Top+1,t);
    end
    else WideCanvasTextOut(InfoBox.Canvas,Rect.Left+2,Rect.Top+1,s);
    p:=InfoBox.Count*InfoBox.ItemHeight+5;
    if p>InfoBox.Height then begin
      Height:=Height-InfoBox.Height+p;
      Constraints.MinHeight:=Height;
    end;
  end;
end;

procedure TInfoForm.FormDestroy(Sender: TObject);
begin
  Docked:=False;
end;

procedure TInfoForm.FormMove(var msg:TMessage);
begin
  msg.Result:=0;
  if ControlledMove then ControlledMove:=False else Docked:=False;
end;

procedure TInfoForm.FormDblClick(Sender: TObject);
begin
  Docked:=True; MainForm.UpdateDockedWindows;
end;

procedure TInfoForm.TCBClick(Sender: TObject);
begin
  TntClipboard.AsWideText:=ClipText;
end;

procedure TInfoForm.TntFormResize(Sender: TObject);
begin
  UpdateInfo;
end;

end.
