object HelpForm: THelpForm
  Left = 310
  Top = 287
  ActiveControl = BClose
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'HelpForm'
  ClientHeight = 85
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    380
    85)
  PixelsPerInch = 96
  TextHeight = 13
  object HelpText: TTntMemo
    Left = 4
    Top = 4
    Width = 373
    Height = 45
    Cursor = crArrow
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    ParentColor = True
    ReadOnly = True
    TabOrder = 0
    WantReturns = False
    WordWrap = False
    OnEnter = HelpTextEnter
  end
  object BClose: TTntButton
    Left = 300
    Top = 56
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'BClose'
    ModalResult = 1
    TabOrder = 1
    OnClick = BCloseClick
  end
end
