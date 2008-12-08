object AddDirForm: TAddDirForm
  Left = 269
  Top = 152
  Width = 395
  Height = 346
  Caption = 'Select a Folder'
  Color = clBtnFace
  Constraints.MinHeight = 164
  Constraints.MinWidth = 350
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    387
    312)
  PixelsPerInch = 96
  TextHeight = 13
  object BOK: TTntButton
    Left = 190
    Top = 281
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = BOKClick
  end
  object BCancel: TTntButton
    Left = 307
    Top = 281
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = BCancelClick
  end
  object CInSubDir: TTntCheckBox
    Left = 16
    Top = 286
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Include SubDir'
    TabOrder = 2
  end
  object DirView: TShellTreeView
    Left = 4
    Top = 4
    Width = 380
    Height = 266
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 3
  end
end
