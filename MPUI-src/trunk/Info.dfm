object InfoForm: TInfoForm
  Left = 588
  Top = 239
  ActiveControl = BClose
  AutoScroll = False
  BorderIcons = []
  Caption = 'InfoForm'
  ClientHeight = 317
  ClientWidth = 300
  Color = clBtnFace
  Constraints.MinHeight = 90
  Constraints.MinWidth = 308
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  DesignSize = (
    300
    317)
  PixelsPerInch = 96
  TextHeight = 13
  object InfoBox: TTntListBox
    Left = 4
    Top = 4
    Width = 292
    Height = 279
    Style = lbOwnerDrawFixed
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 16
    TabOrder = 0
    OnDrawItem = InfoBoxDrawItem
  end
  object BClose: TTntButton
    Left = 221
    Top = 288
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    Default = True
    TabOrder = 1
    OnClick = BCloseClick
  end
end
