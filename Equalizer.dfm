object EqualizerForm: TEqualizerForm
  Left = 347
  Top = 236
  ActiveControl = BClose
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 172
  ClientWidth = 232
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  ParentFont = True
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    232
    172)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 5
    Width = 224
    Height = 130
    Shape = bsFrame
  end
  object Sbri: TTntSpeedButton
    Tag = 1
    Left = 10
    Top = 11
    Width = 77
    Height = 20
    Caption = 'brightness'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = SbriClick
  end
  object SCon: TTntSpeedButton
    Tag = 1
    Left = 10
    Top = 35
    Width = 77
    Height = 20
    Caption = 'contrast'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = SConClick
  end
  object SSat: TTntSpeedButton
    Tag = 1
    Left = 10
    Top = 59
    Width = 77
    Height = 20
    Caption = 'saturation'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = SSatClick
  end
  object SHue: TTntSpeedButton
    Tag = 1
    Left = 10
    Top = 83
    Width = 77
    Height = 20
    Caption = 'hue'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = SHueClick
  end
  object SGam: TTntSpeedButton
    Tag = 1
    Left = 10
    Top = 107
    Width = 77
    Height = 20
    Caption = 'gamma'
    Enabled = False
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = SGamClick
  end
  object BReset: TTntButton
    Left = 5
    Top = 142
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Reset'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BResetClick
  end
  object BClose: TTntButton
    Left = 148
    Top = 142
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BCloseClick
  end
  object TBri: TTrackBar
    Left = 88
    Top = 12
    Width = 137
    Height = 20
    Hint = 'brightness'
    Anchors = [akLeft, akTop, akRight]
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    Position = -85
    TabOrder = 2
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TbChange
  end
  object TCon: TTrackBar
    Left = 88
    Top = 36
    Width = 137
    Height = 20
    Hint = 'contrast'
    Anchors = [akLeft, akTop, akRight]
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    TabOrder = 3
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TbChange
  end
  object TSat: TTrackBar
    Left = 88
    Top = 60
    Width = 137
    Height = 20
    Hint = 'saturation'
    Anchors = [akLeft, akTop, akRight]
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    TabOrder = 4
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TbChange
  end
  object THue: TTrackBar
    Left = 88
    Top = 84
    Width = 137
    Height = 20
    Hint = 'hue'
    Anchors = [akLeft, akTop, akRight]
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    TabOrder = 5
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TbChange
  end
  object TGam: TTrackBar
    Left = 88
    Top = 108
    Width = 137
    Height = 20
    Hint = 'gamma'
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    TabOrder = 6
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TbChange
  end
end
