{*******************************************************}
{   �� Ԫ ����GDILyrics.pas                             }
{   GDI+��ʻ���                                        }
{                                                       }
{   ���ߣ�ying32                                        }
{   QQ��396506155                                       }
{   E-mail��yuanfen3287@vip.qq.com                      }
{   http://www.ying32.tk                                }
{   ��Ȩ���� (C) 2011-2012 ying32                       }
{*******************************************************}

unit GDILyrics;

interface

uses
  Windows, GDIPAPI, GDIPOBJ;

type
  TGDIShowFlags = (sfSingle, sfDouble);
  TGDILyricFontColor = (lfcBlue, lfcRed, lfcGreen);
  TGDIDrawLyric = class(TObject)
  private
    FHandle: HWND;
    FFontHeight: Integer;
    FFontName: string;
    FBackColor1,
      FBackColor2,
      FForeColor1,
      FForeColor2: TGPColor;
    FBackImage,
      FForeImage,
      FBackImage2,
      FForeImage2: TGPBitmap;

    FLyricBackImage: TGPImage;

    FWidth, FHeight: Integer;
    FStrWidth1,
      FStrWidth2: Integer;

    FShowFlags: TGDIShowFlags;

    FPosition: Single;
    FDrawMod: Integer;

    // ����\�ڶ����ַ�
    FFirstStr,
      FNextStr: widestring;

    procedure SetSingleOrDoubleLine(Value: TGDIShowFlags);
    procedure UpdateDisplay;
    procedure DrawStrToImage(var DestBitmap: TGPBitmap; AStr, FontName: widestring;
      StartColor, EndColor: TGPColor; FontHeight: Integer; ForeColor: Boolean);
  public
    constructor Create(Handle: HWND);
    destructor Destroy; override;
    procedure DrawLyricBitmapFirst;
    procedure DrawLyricBitmapNext;

    procedure SetFont(FontName: string);
    procedure SetPositionAndFlags(Position: Single = 0.0; DrawMod: Integer = 0);
    procedure SetWidthAndHeight(AWidth, AHeight: Integer);
    function GetTextWidth(Str: WideString):Integer;
    procedure DisplayLyricS(fs: WideString);
    procedure DisplayLyricD(fs, ns: WideString);
    procedure GetFontHeight;

    property ShowFlags: TGDIShowFlags read FShowFlags write SetSingleOrDoubleLine;
    property FirstString: widestring read FFirstStr write FFirstStr;
    property NextString: widestring read FNextStr write FNextStr;
    property FirstStrWidth: Integer read FStrWidth1 write FStrWidth1;
    property NextStrWidth: Integer read FStrWidth2 write FStrWidth2;
    property Position: Single read FPosition write FPosition;
    property FontName: String read FFontName write FFontName;
    property FontHeight: Integer read FFontHeight write FFontHeight;
  end;


implementation

uses Types, core, Main, plist;

constructor TGDIDrawLyric.Create(Handle: HWND);
begin
  FHandle := Handle;
  FBackColor1 := $FF0B6300;
  FBackColor2 := $FF8AF622;
  FForeColor1 := $FFE4FE04;
  FForeColor2 := $FFE7FEC9;
  FShowFlags := sfDouble;
  FPosition := 0;
  FDrawMod := 0;
  SetWindowLong(FHandle, GWL_EXSTYLE, GetWindowLong(FHandle, GWL_EXSTYLE) or
    WS_EX_LAYERED or WS_EX_TOOLWINDOW);
  SetWindowPos(FHandle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;


destructor TGDIDrawLyric.Destroy;
begin
  if Assigned(FBackImage) then FBackImage.Free;
  if Assigned(FForeImage) then FForeImage.Free;
  if Assigned(FBackImage2) then FBackImage2.Free;
  if Assigned(FForeImage2) then FForeImage2.Free;
  if Assigned(FLyricBackImage) then FLyricBackImage.Free;
  inherited;
end;

procedure TGDIDrawLyric.DrawStrToImage(var DestBitmap: TGPBitmap; AStr,FontName: widestring;
  StartColor, EndColor: TGPColor; FontHeight: Integer; ForeColor: Boolean);

var
  Graphics: TGPGraphics;
  FontFamily: TGPFontFamily;
  Path: TGPGraphicsPath;
  strFormat: TGPStringFormat;
  Pen: TGPPen;
  Brush: TGPLinearGradientBrush;
  I: Integer;

begin
  Graphics := TGPGraphics.Create(DestBitmap);
  Graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  Graphics.SetInterpolationMode(InterpolationModeHighQualityBicubic);
  FontFamily := TGPFontFamily.Create(FontName);
  strFormat := TGPStringFormat.Create();
  strFormat.SetFormatFlags(StringFormatFlagsNoWrap);
  strFormat.SetAlignment(StringAlignmentNear);
  Path := TGPGraphicsPath.Create();
  Path.AddString(AStr, -1, FontFamily, 1, FontHeight-1, MakePoint(3.0, 3.0), strFormat);
  Pen := TGPPen.Create(MakeColor(155, 215, 215, 215), 3);
  Pen.SetColor(MakeColor(65, 1, 3, 3));
  Pen.SetLineJoin(LineJoinRound);
  Graphics.DrawPath(Pen, Path);

  Brush := TGPLinearGradientBrush.Create(MakePoint(0.0, 0.0), MakePoint(0.0, FontHeight + 9), StartColor, EndColor);
  case ForeColor of
    True: begin
            for I := 0 to 3 do begin
              Pen.SetWidth(I);
              Graphics.DrawPath(Pen, Path);
            end;
          end;
   False: begin
            Pen.SetWidth(0);
            Graphics.DrawPath(Pen, Path);
          end;
  end;

  Graphics.FillPath(Brush, Path);
  Brush.Free;
  Pen.Free;
  Path.Free;
  strFormat.Free;
  FontFamily.Free;
  Graphics.Free;
end;


procedure TGDIDrawLyric.DrawLyricBitmapFirst;
begin
  if Assigned(FBackImage) then FBackImage.Free;
  FBackImage := TGPBitmap.Create(FWidth, FHeight);
  DrawStrToImage(FBackImage, FFirstStr, FFontName, FBackColor1, FBackColor2,
    FFontHeight, True);

  if Assigned(FForeImage) then FForeImage.Free;
  FForeImage := TGPBitmap.Create(FWidth, FHeight);
  DrawStrToImage(FForeImage, FFirstStr, FFontName, FForeColor1, FForeColor2,
    FFontHeight, False);
  UpdateDisplay;
end;

procedure TGDIDrawLyric.DrawLyricBitmapNext;
begin
  if Assigned(FBackImage2) then FBackImage2.Free;
  FBackImage2 := TGPBitmap.Create(FWidth, FHeight);
  DrawStrToImage(FBackImage2, FNextStr, FFontName, FBackColor1, FBackColor2,
    FFontHeight, True);

  if Assigned(FForeImage2) then FForeImage2.Free;
  FForeImage2 := TGPBitmap.Create(FWidth, FHeight);
  DrawStrToImage(FForeImage2, FNextStr, FFontName, FForeColor1, FForeColor2,
    FFontHeight, False);
  UpdateDisplay;
end;

procedure TGDIDrawLyric.SetFont(FontName: string);
begin
  FFontName := FontName;
  if HaveLyric = 0 then exit;
  GetFontHeight;
  FirstStrWidth := GetTextWidth(FirstString);
  DrawLyricBitmapFirst();
  if FShowFlags = sfDouble then begin
    NextStrWidth := GetTextWidth(NextString);
    DrawLyricBitmapNext();
  end;
end;

procedure TGDIDrawLyric.SetWidthAndHeight(AWidth, AHeight: Integer);
begin
  FWidth := AWidth;
  FHeight := AHeight;
  SetFont(LyricF);
end;

procedure TGDIDrawLyric.SetSingleOrDoubleLine(Value: TGDIShowFlags);
begin
  if FShowFlags <> Value then
  begin
    FShowFlags := Value;
    UpdateDisplay();
  end;
end;

procedure TGDIDrawLyric.SetPositionAndFlags(Position: Single; DrawMod: Integer);
begin
  FPosition := Position;
  FDrawMod := DrawMod;
  UpdateDisplay;
end;

procedure TGDIDrawLyric.UpdateDisplay;
var
  gBack, gBack2, gFore: TGPGraphics;
  Winsize: TSize;
  SrcPoint: TPoint;
  blend: TBlendFunction;
  FormHDC, MemHDC: HDC;
  hBitMap: Windows.HBITMAP;
  TmpLeft, TmpLeft2, TmpTop: Single;
begin
  FormHDC := GetDC(FHandle);
  MemHDC := CreateCompatibleDC(FormHDC);
  hBitMap := CreateCompatibleBitmap(FormHDC, FWidth, FHeight);
  SelectObject(MemHDC, hBitMap);

  gBack := TGPGraphics.Create(MemHDC);
  gFore := TGPGraphics.Create(MemHDC);

  case FShowFlags of
    sfSingle:
      begin
        TmpLeft := (FWidth - FStrWidth1) / 2;
        TmpTop := (FHeight - FFontHeight) / 2;
        gBack.DrawImage(FBackImage, MakeRect(TmpLeft, TmpTop, FWidth, FHeight));
        gFore.SetClip(MakeRect(TmpLeft, TmpTop, FPosition, FHeight));
        gFore.DrawImage(FForeImage, MakeRect(TmpLeft, TmpTop, FWidth, FHeight));
      end;
    sfDouble:
      begin
        TmpLeft2 := FWidth / 2;
        TmpLeft := TmpLeft2 - FStrWidth1;
        if TmpLeft < 0 then TmpLeft := 0;
        gBack.DrawImage(FBackImage, MakeRect(TmpLeft, 0, FWidth, FHeight));

        if (TmpLeft2 + FStrWidth2) > FWidth then TmpLeft2 := FWidth - FStrWidth2;
        gBack2 := TGPGraphics.Create(MemHDC);
        gBack2.DrawImage(FBackImage2, MakeRect(TmpLeft2, FHeight - FFontHeight - 10, FWidth, FHeight));
        case FDrawMod of
         0: begin
              gFore.SetClip(MakeRect(TmpLeft, 0, FPosition, FHeight));
              gFore.DrawImage(FForeImage, MakeRect(TmpLeft, 0, FWidth, FHeight));
            end;
         1: begin
              gFore.SetClip(MakeRect(TmpLeft2, FHeight - FFontHeight - 10,FPosition, FHeight));
              gFore.DrawImage(FForeImage2, MakeRect(TmpLeft2,FHeight - FFontHeight - 10, FWidth, FHeight));
            end;
        end;
        gBack2.Free;
      end;
  end;

  gFore.Free;
  gBack.Free;

  Winsize.cx := FWidth;
  Winsize.cy := FHeight;
  SrcPoint := Point(0, 0);
  with blend do begin
    BlendOp := AC_SRC_OVER;
    BlendFlags := 0;
    AlphaFormat := AC_SRC_ALPHA;
    SourceConstantAlpha := 255;
  end;
  UpdateLyricShowForm(FHandle, FormHDC, nil, @Winsize, MemHDC, @SrcPoint, 0, @blend, ULW_ALPHA);
  ReleaseDC(FHandle, FormHDC);
  DeleteObject(hBitMap);
  DeleteDC(MemHDC);
end;

function TGDIDrawLyric.GetTextWidth(Str: WideString):Integer;
var
  Path: TGPGraphicsPath; FontFamily:TGPFontFamily ;  strFormat:TGPStringFormat;
  rcBound:TGPRectF;   Pen: TGPPen;
begin
  FontFamily := TGPFontFamily.Create(FFontName);
  strFormat := TGPStringFormat.Create();
  strFormat.SetFormatFlags(StringFormatFlagsNoWrap);
  strFormat.SetAlignment(StringAlignmentNear);
  Path := TGPGraphicsPath.Create();
  Pen := TGPPen.Create();
  Pen.SetWidth(3);

  Path.AddString(Str, -1, FontFamily, 1, FFontHeight , MakePoint(0.0, 0.0), strFormat);

  Path.GetBounds(rcBound,nil,Pen);
  Result := Round(rcBound.Width);

  FontFamily.Free;
  strFormat.Free;
  Pen.Free;
  Path.Free;
end;

procedure TGDIDrawLyric.DisplayLyricS(fs: WideString);
begin
  ShowFlags := sfSingle; Position:=0;
  FirstString := fs;
  FirstStrWidth := GetTextWidth(fs);
  DrawLyricBitmapFirst();
end;

procedure TGDIDrawLyric.DisplayLyricD(fs, ns: WideString);
begin
  ShowFlags := sfDouble; Position:=0;
  FirstString := fs;
  FirstStrWidth := GetTextWidth(fs);
  DrawLyricBitmapFirst();
  NextString := ns;
  NextStrWidth := GetTextWidth(ns);
  DrawLyricBitmapNext();
end;


procedure TGDIDrawLyric.GetFontHeight;
var s: WideString; w:Integer;
begin
  s := Lyric.GetLyricString(MaxLenLyric);
  w:=GetTextWidth(s);
  if w > Fwidth then
    repeat
      dec(FFontHeight);
    until (GetTextWidth(s) <= Fwidth) or (FontHeight<=2)
  else if w < Fwidth then begin
    repeat
      inc(FFontHeight); w:=GetTextWidth(s);
    until (w >= Fwidth) or (FontHeight>=45);
    if w > Fwidth then dec(FFontHeight);
  end;
  if FFontHeight<2 then FFontHeight:=2
  else if FFontHeight>45 then FFontHeight:=45;
end;

end.

