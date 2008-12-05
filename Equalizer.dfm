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
  ParentFont = True
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
  object BReset: TTntButton
    Left = 7
    Top = 142
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Reset'
    Default = True
    TabOrder = 0
    OnClick = BResetClick
  end
  object BClose: TTntButton
    Left = 150
    Top = 142
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    TabOrder = 1
    OnClick = BCloseClick
  end
  object Sbri: TTntStaticText
    Left = 14
    Top = 15
    Width = 52
    Height = 17
    Caption = 'brightness'
    TabOrder = 2
  end
  object TBri: TTrackBar
    Left = 88
    Top = 12
    Width = 137
    Height = 20
    Anchors = [akLeft, akTop, akRight]
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    Position = -85
    TabOrder = 3
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TBriChange
  end
  object SCon: TTntStaticText
    Left = 14
    Top = 39
    Width = 42
    Height = 17
    Caption = 'contrast'
    TabOrder = 4
  end
  object TCon: TTrackBar
    Left = 88
    Top = 36
    Width = 137
    Height = 20
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
    OnChange = TConChange
  end
  object SSat: TTntStaticText
    Left = 14
    Top = 63
    Width = 50
    Height = 17
    Caption = 'saturation'
    TabOrder = 6
  end
  object TSat: TTrackBar
    Left = 88
    Top = 60
    Width = 137
    Height = 20
    Anchors = [akLeft, akTop, akRight]
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    TabOrder = 7
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TSatChange
  end
  object Shue: TTntStaticText
    Left = 14
    Top = 87
    Width = 22
    Height = 17
    Caption = 'hue'
    TabOrder = 8
  end
  object THue: TTrackBar
    Left = 88
    Top = 84
    Width = 137
    Height = 20
    Anchors = [akLeft, akTop, akRight]
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    TabOrder = 9
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = THueChange
  end
  object SGam: TTntStaticText
    Left = 14
    Top = 111
    Width = 38
    Height = 17
    Caption = 'gamma'
    Enabled = False
    TabOrder = 10
  end
  object TGam: TTrackBar
    Left = 88
    Top = 108
    Width = 137
    Height = 20
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    LineSize = 3
    Max = 100
    Min = -100
    PageSize = 6
    Frequency = 3
    TabOrder = 11
    ThumbLength = 15
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TGamChange
  end
end
