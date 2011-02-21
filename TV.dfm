object OpenDevicesForm: TOpenDevicesForm
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 210
  ClientWidth = 382
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    382
    210)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 369
    Height = 161
    Shape = bsFrame
  end
  object OKBtn: TButton
    Left = 39
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 271
    Top = 180
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object CVideoDevices: TTntComboBox
    Left = 96
    Top = 16
    Width = 273
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 2
  end
  object CAudioDevices: TTntComboBox
    Left = 96
    Top = 48
    Width = 273
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 3
  end
  object CCountryCode: TTntComboBox
    Left = 96
    Top = 80
    Width = 273
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 4
  end
  object LVideoDevices: TTntStaticText
    Left = 12
    Top = 18
    Width = 70
    Height = 17
    Caption = 'VideoDevices'
    TabOrder = 5
  end
  object LCountryCode: TTntStaticText
    Left = 12
    Top = 82
    Width = 65
    Height = 17
    Caption = 'CountryCode'
    TabOrder = 6
  end
  object LAudioDevices: TTntStaticText
    Left = 12
    Top = 50
    Width = 70
    Height = 17
    Caption = 'AudioDevices'
    TabOrder = 7
  end
end
