{*******************************************************}
{   单 元 名：GDILyrics.pas                             }
{   GDI+歌词绘制                                        }
{                                                       }
{   作者：ying32                                        }
{   QQ：396506155                                       }
{   E-mail：yuanfen3287@vip.qq.com                      }
{   http://www.ying32.tk                                }
{   版权所有 (C) 2011-2012 ying32                       }
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

    // 首行\第二行字符
    FFirstStr,
      FNextStr: widestring;
    // 首行\第二行字符宽度
    FFirstStrWidth,
      FNextStrWidth: Integer;


    procedure SetSingleOrDoubleLine(Value: TGDIShowFlags);
    procedure UpdateDisplay;
    procedure DrawStrToImage(var DestBitmap: TGPBitmap; AStr, FontName: widestring; AWidth: Integer;
      StartColor, EndColor: TGPColor; FontHeight: Integer; ForeColor: Boolean;
      Alignment: TStringAlignment = StringAlignmentCenter);
  public
    constructor Create(Handle: HWND);
    destructor Destroy; override;
    procedure DrawLyricBitmapFirst;
    procedure DrawLyricBitmapNext;

    procedure SetFont(FontName: string);
    procedure SetPositionAndFlags(Position: Single = 0.0; DrawMod: Integer = 0);
    procedure SetWidthAndHeight(AWidth, AHeight: Integer);

    property ShowFlags: TGDIShowFlags read FShowFlags write SetSingleOrDoubleLine;
    property FirstString: widestring read FFirstStr write FFirstStr;
    property NextString: widestring read FNextStr write FNextStr;
    property FirstStrWidth: Integer read FFirstStrWidth write FFirstStrWidth;
    property NextStrWidth: Integer read FNextStrWidth write FNextStrWidth;
  end;


implementation

uses Types, LyricShow, core, Main;

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

procedure TGDIDrawLyric.DrawStrToImage(var DestBitmap: TGPBitmap; AStr,
  FontName: widestring; AWidth: Integer;
  StartColor, EndColor: TGPColor; FontHeight: Integer; ForeColor: Boolean;
  Alignment: TStringAlignment);

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
  strFormat.SetAlignment(Alignment);
  Path := TGPGraphicsPath.Create();
  Path.AddString(AStr, -1, FontFamily, 1, FontHeight,
    MakeRect(0.0, 0.0, AWidth, 0.0), strFormat);
  Pen := TGPPen.Create(MakeColor(155, 215, 215, 215), 3);
  Pen.SetColor(MakeColor(65, 1, 3, 3));
  Pen.SetLineJoin(LineJoinRound);
  Graphics.DrawPath(Pen, Path);

  Brush := TGPLinearGradientBrush.Create(MakePoint(0.0, 0.0),
    MakePoint(0.0, FontHeight + 4.5), StartColor, EndColor);
  case ForeColor of
    True:
      begin
        for I := 0 to 3 do
        begin
          Pen.SetWidth(I);
          Graphics.DrawPath(Pen, Path);
        end;
      end;

    False:
      begin
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
  FStrWidth1 := Round(FFirstStrWidth + FFontHeight * 0.75);
  if Assigned(FBackImage) then FBackImage.Free;
  FBackImage := TGPBitmap.Create(FStrWidth1, FFontHeight + 6);
  DrawStrToImage(FBackImage, FFirstStr, FFontName, FStrWidth1, FBackColor1, FBackColor2,
    FFontHeight, True, StringAlignmentNear);

  if Assigned(FForeImage) then FForeImage.Free;
  FForeImage := TGPBitmap.Create(FStrWidth1, FFontHeight + 6);
  DrawStrToImage(FForeImage, FFirstStr, FFontName, FStrWidth1, FForeColor1, FForeColor2,
    FFontHeight, False, StringAlignmentNear);
  UpdateDisplay;
end;

procedure TGDIDrawLyric.DrawLyricBitmapNext;
begin
  FStrWidth2 := Round(FNextStrWidth + FFontHeight * 0.75);

  if Assigned(FBackImage2) then FBackImage2.Free;
  FBackImage2 := TGPBitmap.Create(FStrWidth2, FFontHeight + 6);
  DrawStrToImage(FBackImage2, FNextStr, FFontName, FStrWidth2, FBackColor1, FBackColor2,
    FFontHeight, True, StringAlignmentNear);

  if Assigned(FForeImage2) then FForeImage2.Free;
  FForeImage2 := TGPBitmap.Create(FStrWidth2, FFontHeight + 6);
  DrawStrToImage(FForeImage2, FNextStr, FFontName, FStrWidth2, FForeColor1, FForeColor2,
    FFontHeight, False, StringAlignmentNear);
  UpdateDisplay;
end;

procedure TGDIDrawLyric.SetFont(FontName: string);
begin
  FFontName := FontName;
  if HaveLyric = 0 then exit;
  FFontHeight := LyricShowForm.GetFontHeight(FontName);
  FirstStrWidth := LyricShowForm.LyricTextW(FirstString);
  DrawLyricBitmapFirst();
  if FShowFlags = sfDouble then begin
    NextStrWidth := LyricShowForm.LyricTextW(NextString);
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

  TmpLeft, TmpHeight: Integer;
  TmpLeft2, TmpTop2: Single;
begin
  FormHDC := GetDC(FHandle);
  MemHDC := CreateCompatibleDC(FormHDC);
  hBitMap := CreateCompatibleBitmap(FormHDC, FWidth, FHeight);
  SelectObject(MemHDC, hBitMap);

  gBack := TGPGraphics.Create(MemHDC);
  gFore := TGPGraphics.Create(MemHDC);
  TmpHeight := FFontHeight + 1;


  case FShowFlags of
    sfSingle:
      begin
        TmpLeft2 := FWidth / 2 - FStrWidth1 / 2;
        TmpTop2 := FHeight / 2 - TmpHeight / 2;
        gBack.DrawImage(FBackImage, MakeRect(TmpLeft2, TmpTop2, FStrWidth1, TmpHeight));
        gFore.SetClip(MakeRect(TmpLeft2, TmpTop2, FPosition, TmpHeight));
        gFore.DrawImage(FForeImage, MakeRect(TmpLeft2, TmpTop2, FStrWidth1, TmpHeight));
      end;
    sfDouble:
      begin
        gBack2 := TGPGraphics.Create(MemHDC);
        gBack.DrawImage(FBackImage, MakeRect(0.0, 11, FStrWidth1, TmpHeight));

        TmpLeft := FWidth - FStrWidth2 + Trunc(FFontHeight * 0.75) - 10;
        if TmpLeft <= 0 then TmpLeft := 0;
        gBack2.DrawImage(FBackImage2, MakeRect(TmpLeft,
          FHeight - FFontHeight - 10, FStrWidth2, TmpHeight));
        case FDrawMod of
          0:
            begin
              gFore.SetClip(MakeRect(0.0, 10, FPosition, FFontHeight));
              gFore.DrawImage(FForeImage, MakeRect(0.0, 10, FStrWidth1, TmpHeight));
            end;
          1:
            begin
              gFore.SetClip(MakeRect(TmpLeft, FHeight - TmpHeight - 10,
                FPosition, TmpHeight));
              gFore.DrawImage(FForeImage2, MakeRect(TmpLeft,
                FHeight - TmpHeight - 10,
                FStrWidth2, TmpHeight));
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
  with blend do
  begin
    BlendOp := AC_SRC_OVER;
    BlendFlags := 0;
    AlphaFormat := AC_SRC_ALPHA;
    SourceConstantAlpha := 255;
  end;
  UpdateLyricShowForm(FHandle, FormHDC, nil, @Winsize, MemHDC, @SrcPoint,
    0, @blend, ULW_ALPHA);

  ReleaseDC(FHandle, FormHDC);
  DeleteObject(hBitMap);
  DeleteDC(MemHDC);
end;


end.

