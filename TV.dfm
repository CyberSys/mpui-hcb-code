object TVForm: TTVForm
  Left = 330
  Top = 68
  Width = 458
  Height = 656
  Caption = 'TVForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    442
    618)
  PixelsPerInch = 96
  TextHeight = 13
  object CCountryCode: TTntComboBox
    Left = 96
    Top = 80
    Width = 136
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
  end
  object LCountryCode: TTntStaticText
    Left = 12
    Top = 82
    Width = 65
    Height = 17
    Caption = 'CountryCode'
    TabOrder = 1
  end
  object BOK: TTntButton
    Left = 17
    Top = 553
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 2
  end
  object BApply: TTntButton
    Left = 107
    Top = 553
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Apply'
    TabOrder = 3
  end
  object BSave: TTntButton
    Left = 194
    Top = 553
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Save'
    TabOrder = 4
  end
  object BClose: TTntButton
    Left = 282
    Top = 553
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 5
  end
  object TBa: TTntButton
    Left = 267
    Top = 145
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Scan'
    TabOrder = 6
    OnClick = TBaClick
  end
  object TBn: TTntButton
    Left = 355
    Top = 145
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'View'
    TabOrder = 8
    OnClick = TBnClick
  end
  object TFadd: TTntButton
    Left = 267
    Top = 203
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Add'
    TabOrder = 9
    OnClick = TFaddClick
  end
  object TFdel: TTntButton
    Left = 355
    Top = 203
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'delete'
    TabOrder = 10
  end
  object TFSet: TTntButton
    Left = 267
    Top = 235
    Width = 164
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    TabOrder = 11
  end
  object RHK: TTntButton
    Left = 296
    Top = 283
    Width = 94
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Save List'
    TabOrder = 12
  end
  object TntComboBox1: TTntComboBox
    Left = 296
    Top = 80
    Width = 129
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 13
    Items.Strings = (
      'PAL'
      'NTSC'
      'SEM')
  end
  object TntStaticText1: TTntStaticText
    Left = 252
    Top = 82
    Width = 27
    Height = 17
    Caption = 'norm'
    TabOrder = 14
  end
  object TEAss: TTntEdit
    Left = 268
    Top = 175
    Width = 163
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 15
  end
  object HK: TTntListView
    Left = 14
    Top = 124
    Width = 235
    Height = 300
    Columns = <
      item
        Caption = 'Shortcut'
        Width = 152
      end
      item
        Caption = 'Action'
        Width = 196
      end>
    ColumnClick = False
    GridLines = True
    HideSelection = False
    RowSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    ViewStyle = vsReport
  end
  object TStop: TTntButton
    Left = 283
    Top = 353
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Stop'
    TabOrder = 16
    OnClick = TStopClick
  end
end
