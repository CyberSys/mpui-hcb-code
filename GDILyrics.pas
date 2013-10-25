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
    FDrawMod : Integer;

    // ����\�ڶ����ַ�
    FFirstStr,
    FNextStr : widestring;
    // ����\�ڶ����ַ����
    FFirstStrWidth,
    FNextStrWidth : Integer;

    FTmpTest:Boolean;

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

    procedure SetFont(FontName: string; FontSize: Integer);
    procedure SetFontColor(ColorStyle: TGDILyricFontColor = lfcGreen);
    procedure SetPositionAndFlags(Position: Single = 0.0; DrawMod: Integer = 0);
    procedure SetWidthAndHeight(AWidth, AHeight: Integer);
    function  GetTextWidth(Str: WideString; Alignment: TStringAlignment = StringAlignmentNear):Integer;

    property ShowFlags: TGDIShowFlags read FShowFlags write SetSingleOrDoubleLine;
    property FirstString: widestring read FFirstStr write FFirstStr;
    property NextString : widestring read FNextStr  write FNextStr;
    property FirstStrWidth: Integer read FFirstStrWidth write FFirstStrWidth;
    property NextStrWidth : Integer read FNextStrWidth  write FNextStrWidth;
  end;


implementation

uses Types, LyricShow;

constructor TGDIDrawLyric.Create(Handle: HWND);
var
  Style: Cardinal;
begin
  FHandle := Handle;
  FFontName := 'Tahoma';
  FFontHeight := 46;
  FBackColor1 := $FF0B6300;
  FBackColor2 := $FF8AF622;
  FForeColor1 := $FFE4FE04;
  FForeColor2 := $FFE7FEC9;

  FPosition := 0;
  FDrawMod  := 0;
  FTmpTest := False;
  Style := GetWindowLong(FHandle,GWL_EXSTYLE);
  SetWindowLong(FHandle, GWL_EXSTYLE, Style or
                WS_EX_LAYERED or WS_EX_TOOLWINDOW);
  SetWindowPos(FHandle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE);
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
  I:Integer;

begin
  FTmpTest := False;

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
                              MakePoint(0.0, FontHeight), StartColor, EndColor);
  case ForeColor of
    True :
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
       //Path.GetBounds(rb, nil, Pen);
       //OutputDebugString(PWideChar(Format('W=%f, H=%f', [rb.Width, rb.Height])));
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
//var
// GUIDi:TGUID;
begin
   FStrWidth1 := Round(FFirstStrWidth + FFontHeight * 0.75);
   //FStrWidth1 := GetTextWidth(AStr);

  // OutputDebugString(PChar(Format('AStrWidth=%f,  StrWidth=%d', [AStrwidth+ FFontHeight * 0.75, FStrWidth1])));

   if Assigned(FBackImage) then FBackImage.Free;
   FBackImage := TGPBitmap.Create(FStrWidth1, FFontHeight+6);
   DrawStrToImage(FBackImage , FFirstStr,  FFontName, FStrWidth1, FBackColor1, FBackColor2,
                  FFontHeight, True,  StringAlignmentNear);

   if Assigned(FForeImage) then FForeImage.Free;
   FForeImage := TGPBitmap.Create(FStrWidth1, FFontHeight+6);
   DrawStrToImage(FForeImage , FFirstStr,  FFontName, FStrWidth1, FForeColor1, FForeColor2,
                  FFontHeight, False, StringAlignmentNear);


 //  GetEncoderClsid('image/png', GUIDi);
 //  FBackImage.Save('12.png', GUIDi);

  // if not FDrawing then
     UpdateDisplay;
end;

procedure TGDIDrawLyric.DrawLyricBitmapNext;
//var
// GUIDi:TGUID;
begin
   FStrWidth2 := Round(FNextStrWidth + FFontHeight * 0.75);
   //FStrWidth2 := GetTextWidth(AStr, StringAlignmentFar);

   if Assigned(FBackImage2) then FBackImage2.Free;
   FBackImage2 := TGPBitmap.Create(FStrWidth2, FFontHeight+6);
   DrawStrToImage(FBackImage2 , FNextStr,  FFontName, FStrWidth2, FBackColor1, FBackColor2,
                  FFontHeight, True,  StringAlignmentNear);

   if Assigned(FForeImage2) then FForeImage2.Free;
   FForeImage2 := TGPBitmap.Create(FStrWidth2, FFontHeight+6);
   DrawStrToImage(FForeImage2 , FNextStr,  FFontName, FStrWidth2, FForeColor1, FForeColor2,
                  FFontHeight, False, StringAlignmentNear);

   // GetEncoderClsid('image/png', GUIDi);
   //FBackImage2.Save('12.png', GUIDi);
  // if not FDrawing then
    UpdateDisplay;
end;

procedure TGDIDrawLyric.SetFont(FontName: string; FontSize: Integer);
begin
  FFontName   := FontName;
  FFontHeight := Round(FontSize / 0.75);
  UpdateDisplay;
end;

procedure TGDIDrawLyric.SetFontColor(ColorStyle: TGDILyricFontColor);
begin
  {
    ��ɫ: $FF004393, $FF02B4EA;    $FF35ECFB, $FF9AF7FC
    ��ɫ: $FFB30000, $FFFE9500;    $FFFE7D15, $FFFEFE87
    ��ɫ: $FF0B6300, $FF8AF622;    $FFE4FE04, $FFE7FEC9
  }
  case ColorStyle of
    lfcBlue :
       begin
          FBackColor1 := $FF004393;
          FBackColor2 := $FF02B4EA;
          FForeColor1 := $FF35ECFB;
          FForeColor2 := $FF9AF7FC;
       end;
    lfcRed  :
       begin
          FBackColor1 := $FFB30000;
          FBackColor2 := $FFFE9500;
          FForeColor1 := $FFFE7D15;
          FForeColor2 := $FFFEFE87;
       end;
    lfcGreen:
       begin
          FBackColor1 := $FF0B6300;
          FBackColor2 := $FF8AF622;
          FForeColor1 := $FFE4FE04;
          FForeColor2 := $FFE7FEC9;
       end;
  end;

  DrawLyricBitmapFirst;
  DrawLyricBitmapNext;
  UpdateDisplay;
end;

procedure TGDIDrawLyric.SetWidthAndHeight(AWidth, AHeight: Integer);
begin
   FWidth  := AWidth;
   FHeight := AHeight;
   UpdateDisplay;
end;

function  TGDIDrawLyric.GetTextWidth(Str: WideString; Alignment: TStringAlignment):Integer;
var
  Path: TGPGraphicsPath;
  FontFamily:TGPFontFamily ;
  strFormat:TGPStringFormat;
  rcBound:TGPRectF;
  Pen: TGPPen;
begin
  FontFamily := TGPFontFamily.Create(FFontName);
  strFormat := TGPStringFormat.Create();
  strFormat.SetFormatFlags(StringFormatFlagsNoWrap);
  strFormat.SetAlignment(Alignment);
  Path := TGPGraphicsPath.Create();
  Pen := TGPPen.Create();
  Pen.SetWidth(3);

  Path.AddString(Str, -1, FontFamily, 1, 43.1 , MakePoint(0.0, 0.0), strFormat);

  Path.GetBounds(rcBound, nil, Pen);
  Result := Round(rcBound.Width);

  FontFamily.Free;
  strFormat.Free;
  Pen.Free;
  Path.Free;
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
  FDrawMod  := DrawMod;
  UpdateDisplay;
end;

procedure TGDIDrawLyric.UpdateDisplay;
var
  gBack, gBack2, gFore:TGPGraphics;
  Winsize:TSize;
  SrcPoint:TPoint;
  blend: TBlendFunction;

  FormHDC, MemHDC: HDC;

  hBitMap: Windows.HBITMAP;

  TmpLeft, TmpWidth, TmpHeight : Integer;
  TmpLeft2, TmpTop2: Single;
begin
    FormHDC  := GetDC(FHandle);
    MemHDC   := CreateCompatibleDC(FormHDC);
    hBitMap  := CreateCompatibleBitmap(FormHDC, FWidth, FHeight);
    SelectObject(MemHDC, hBitMap);

    gBack := TGPGraphics.Create(MemHDC);
    gFore := TGPGraphics.Create(MemHDC);
    TmpHeight := FFontHeight + 1;


    case FShowFlags of
      sfSingle :
        begin
          if FStrWidth1 > 0 then
          begin

            if not FTmpTest then
            begin
              if FStrWidth1 > FWidth then
              begin
                if FPosition > FWidth / 2 then
                begin
                   TmpWidth := FStrWidth1 - FWidth;
                   gBack.TranslateTransform(-TmpWidth, 0.0);
                   gFore.TranslateTransform(-TmpWidth, 0.0);
                end;
              end;
            end;

            TmpLeft2 := FWidth  / 2 - FStrWidth1  / 2;
            TmpTop2  := FHeight / 2 - TmpHeight   / 2;
            gBack.DrawImage(FBackImage, MakeRect(TmpLeft2, TmpTop2, FStrWidth1, TmpHeight));
            gFore.SetClip(MakeRect(TmpLeft2, TmpTop2, FPosition, TmpHeight)) ;
            gFore.DrawImage(FForeImage, MakeRect(TmpLeft2, TmpTop2, FStrWidth1, TmpHeight));
          end;
        end;
      sfDouble :
        begin

          if (FStrWidth1 >0) and (FStrWidth2 > 0) then
          begin
            gBack2 := TGPGraphics.Create(MemHDC);


              if FStrWidth1 > FWidth then
              begin
                if FPosition > FWidth / 2 then
                begin
                   TmpWidth := FStrWidth1 - FWidth;
                   case FDrawMod of
                     0 : gBack.TranslateTransform(-TmpWidth, 0.0);
                     1 : gBack2.TranslateTransform(-TmpWidth, 0.0);
                   end;
                   gFore.TranslateTransform(-TmpWidth, 0.0);
                end;
              end;



              if FStrWidth2 > FWidth then
              begin
                if FPosition > FWidth / 2 then
                begin
                   TmpWidth := FStrWidth2 - FWidth;
                   case FDrawMod of
                     0 : gBack.TranslateTransform(-TmpWidth, 0.0);
                     1 : gBack2.TranslateTransform(-TmpWidth, 0.0);
                   end;
                   gFore.TranslateTransform(-TmpWidth, 0.0);
                   FTmpTest := True;
                end;
              end;


            gBack.DrawImage(FBackImage, MakeRect(0.0, 11, FStrWidth1, TmpHeight));

            TmpLeft := FWidth - FStrWidth2 + Trunc(FFontHeight * 0.75) - 10;
            if TmpLeft <= 0 then TmpLeft := 0;
            gBack2.DrawImage(FBackImage2, MakeRect(TmpLeft,
                                FHeight - FFontHeight - 10, FStrWidth2, TmpHeight));
            case FDrawMod of
               0 :
                 begin
                   gFore.SetClip(MakeRect(0.0, 10, FPosition, FFontHeight)) ;
                   gFore.DrawImage(FForeImage, MakeRect(0.0, 10, FStrWidth1, TmpHeight));
                 end;
               1 :
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
    UpdateLayeredWindow(FHandle, FormHDC, nil, @Winsize, MemHDC , @SrcPoint,
                        0, @blend, ULW_ALPHA);

    ReleaseDC(FHandle, FormHDC);
    DeleteObject(hBitMap);
    DeleteDC(MemHDC);
    //FPosition := 0;
end;  


end.
