{*******************************************************}
{   单 元 名：ULyricShow.pas                            }
{                                                       }
{   作者：ying32                                        }
{   QQ：396506155                                       }
{   E-mail：yuanfen3287@vip.qq.com                      }
{   http://www.ying32.tk                                }
{   版权所有 (C) 2011-2012 ying32                       }
{*******************************************************}
unit LyricShow;

interface

uses
  Windows, Classes, ExtCtrls, Forms, GDILyrics, TntGraphics;
type
  TLyricShowForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DisplayLyricS(fs:WideString);
    procedure DisplayLyricD(fs,ns:WideString);
    function LyricTextW(s:WideString):Integer;
    function LyricTextH:Integer;
    function GetFontHeight(f:String):Integer;
  private
    { Private declarations }
  public

  protected

  end;

var
  LyricShowForm: TLyricShowForm;  GDILyric : TGDIDrawLyric;

implementation

uses plist, core;

{$R *.dfm}

function TLyricShowForm.LyricTextW(s:WideString):Integer;
begin
  Result := WideCanvasTextWidth(Canvas,s) + 3 * Height;
end;

function TLyricShowForm.LyricTextH:Integer;
begin
  Result := WideCanvasTextHeight(Canvas,'S') + 4;
end;

function TLyricShowForm.GetFontHeight(f:String):Integer;
var s:WideString; len:integer;
begin
  Canvas.Font.Name:= f;
  s:=Lyric.GetLyricString(MaxLenLyric);
  len:= LyricTextW(s);
  if len>width then
    repeat
      Canvas.Font.Size:=Canvas.Font.Size - 1;
    until LyricTextW(s)<=width
  else if len<width then
    repeat
      Canvas.Font.Size:=Canvas.Font.Size + 1;
    until (LyricTextW(s)>=width) or (Canvas.Font.Size>=35);
  Result:= LyricTextH;
end;

procedure TLyricShowForm.FormCreate(Sender: TObject);
begin
  ParentWindow := GetDesktopWindow;
  SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE);
  GDILyric := TGDIDrawLyric.Create(Handle);
  Width := CurMonitor.Width;
  Height := 140;
  Left := CurMonitor.Left;
  Top := CurMonitor.Top + CurMonitor.WorkareaRect.Bottom
       - CurMonitor.WorkareaRect.Top - Height;
  GDILyric.SetWidthAndHeight(Width, Height);
end;

procedure TLyricShowForm.FormDestroy(Sender: TObject);
begin
  GDILyric.Free;
end;

procedure TLyricShowForm.DisplayLyricS(fs:WideString);
begin
  GDILyric.ShowFlags := sfSingle;
  GDILyric.FirstString := fs;
  GDILyric.FirstStrWidth := LyricTextW(fs);
  GDILyric.DrawLyricBitmapFirst();
end;

procedure TLyricShowForm.DisplayLyricD(fs,ns:WideString);
begin
  GDILyric.ShowFlags := sfDouble;
  GDILyric.FirstString := fs;
  GDILyric.FirstStrWidth := LyricTextW(fs);
  GDILyric.DrawLyricBitmapFirst();
  GDILyric.NextString := ns;
  GDILyric.NextStrWidth := LyricTextW(ns);
  GDILyric.DrawLyricBitmapNext();
end;

end.
