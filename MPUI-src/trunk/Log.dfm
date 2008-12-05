object LogForm: TLogForm
  Left = 230
  Top = 138
  Width = 550
  Height = 440
  ActiveControl = Command
  Caption = 'LogForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TheLog: TTntMemo
    Left = 0
    Top = 0
    Width = 542
    Height = 388
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ControlPanel: TPanel
    Left = 0
    Top = 388
    Width = 542
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      542
      25)
    object BClose: TTntButton
      Left = 480
      Top = 2
      Width = 62
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 0
      OnClick = BCloseClick
    end
    object Command: TTntEdit
      Left = 2
      Top = 2
      Width = 477
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnKeyDown = CommandKeyDown
      OnKeyPress = CommandKeyPress
    end
  end
end
