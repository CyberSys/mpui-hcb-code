object OptionsForm: TOptionsForm
  Left = 283
  Top = 166
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'OptionsForm'
  ClientHeight = 370
  ClientWidth = 547
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
  DesignSize = (
    547
    370)
  PixelsPerInch = 96
  TextHeight = 13
  object LParams: TTntLabel
    Left = 6
    Top = 296
    Width = 55
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Parameters'
  end
  object LHelp: TTntLabel
    Left = 519
    Top = 296
    Width = 21
    Height = 13
    Cursor = crHandPoint
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = LHelpClick
  end
  object BOK: TTntButton
    Left = 4
    Top = 340
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = BOKClick
  end
  object BApply: TTntButton
    Left = 158
    Top = 340
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Apply'
    TabOrder = 1
    OnClick = BApplyClick
  end
  object BSave: TTntButton
    Left = 312
    Top = 340
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Save'
    TabOrder = 2
    OnClick = BSaveClick
  end
  object BClose: TTntButton
    Left = 467
    Top = 340
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 4
    OnClick = BCloseClick
  end
  object EParams: TTntEdit
    Left = 6
    Top = 312
    Width = 537
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
  end
  object Tab: TTntPageControl
    Left = 5
    Top = 6
    Width = 537
    Height = 288
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    Images = ImageList1
    TabOrder = 5
    object TabSheet1: TTntTabSheet
      Caption = 'System'
      DesignSize = (
        529
        259)
      object LLanguage: TTntLabel
        Left = 8
        Top = 9
        Width = 47
        Height = 13
        Caption = 'Language'
      end
      object CLanguage: TTntComboBox
        Left = 256
        Top = 5
        Width = 269
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          ''
          ''
          '')
      end
      object CRFScr: TTntCheckBox
        Left = 12
        Top = 56
        Width = 261
        Height = 17
        Caption = 'Click MBR to FullScreen'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object nfconf: TTntCheckBox
        Left = 12
        Top = 32
        Width = 253
        Height = 17
        Caption = 'Use nofontconfig option'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object EMplayerLocation: TTntEdit
        Left = 192
        Top = 219
        Width = 304
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object BMplayer: TTntButton
        Left = 497
        Top = 219
        Width = 28
        Height = 21
        Anchors = [akTop, akRight]
        Caption = '...'
        TabOrder = 3
        OnClick = BMplayerClick
      end
      object CWid: TTntCheckBox
        Left = 283
        Top = 242
        Width = 312
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Use WID'
        TabOrder = 5
      end
      object CNi: TTntCheckBox
        Left = 12
        Top = 104
        Width = 261
        Height = 17
        Caption = 'Use non-interleaved AVI parser'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
      end
      object CDnav: TTntCheckBox
        Left = 300
        Top = 128
        Width = 229
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Use DVDNav'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
      end
      object CLavf: TTntCheckBox
        Left = 12
        Top = 80
        Width = 261
        Height = 17
        Caption = 'Use lavf Demuxer'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
      end
      object RCMplayer: TTntRadioButton
        Left = 4
        Top = 242
        Width = 269
        Height = 17
        Caption = 'Current Directory'
        TabOrder = 9
        OnClick = RCMplayerClick
      end
      object RMplayer: TTntRadioButton
        Left = 4
        Top = 221
        Width = 181
        Height = 17
        Caption = 'Mplayer location'
        TabOrder = 10
        OnClick = RMplayerClick
      end
      object CFd: TTntCheckBox
        Left = 300
        Top = 32
        Width = 229
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Framedrop'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object CAsync: TTntCheckBox
        Left = 300
        Top = 80
        Width = 173
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Autosync'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = CAsyncClick
      end
      object EAsync: TTntEdit
        Left = 477
        Top = 78
        Width = 34
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 13
        Text = '100'
      end
      object UAsync: TTntUpDown
        Left = 511
        Top = 78
        Width = 17
        Height = 21
        Anchors = [akTop, akRight]
        Associate = EAsync
        Max = 1000
        Position = 100
        TabOrder = 14
        Thousands = False
      end
      object CCache: TTntCheckBox
        Left = 300
        Top = 104
        Width = 173
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Cache'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = CCacheClick
      end
      object ECache: TTntEdit
        Left = 477
        Top = 102
        Width = 34
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 7
        Text = '512'
      end
      object UCache: TTntUpDown
        Left = 511
        Top = 102
        Width = 17
        Height = 21
        Anchors = [akTop, akRight]
        Associate = ECache
        Max = 10000
        Position = 512
        TabOrder = 8
        Thousands = False
      end
      object CPriorityBoost: TTntCheckBox
        Left = 300
        Top = 56
        Width = 229
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Priority boost'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
      end
      object CISub: TTntCheckBox
        Left = 12
        Top = 176
        Width = 290
        Height = 17
        Caption = 'Include Subtitles on Screenshot'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 19
      end
      object SSF: TTntStaticText
        Left = 8
        Top = 199
        Width = 92
        Height = 17
        Caption = 'ScreenShot Folder'
        TabOrder = 20
      end
      object BSsf: TTntButton
        Left = 497
        Top = 194
        Width = 28
        Height = 21
        Anchors = [akTop, akRight]
        Caption = '...'
        TabOrder = 21
        OnClick = BSsfClick
      end
      object ESsf: TTntEdit
        Left = 192
        Top = 195
        Width = 304
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 22
      end
      object Cone: TTntCheckBox
        Left = 12
        Top = 152
        Width = 261
        Height = 17
        Caption = 'Use only one instance of MPUI'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 23
      end
      object CGUI: TTntCheckBox
        Left = 300
        Top = 152
        Width = 229
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'No GUI of Mplayer'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
      end
      object CNobps: TTntCheckBox
        Left = 12
        Top = 128
        Width = 261
        Height = 17
        Caption = 'Don'#39't use avg b/s for A-V sync'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
      end
      object CFilter: TTntCheckBox
        Left = 300
        Top = 176
        Width = 229
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Filter DropFiles'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 26
      end
    end
    object TabSheet2: TTntTabSheet
      Caption = 'Video'
      ImageIndex = 1
      DesignSize = (
        529
        259)
      object LPostproc: TTntLabel
        Left = 10
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Postprocessing'
      end
      object LAspect: TTntLabel
        Left = 10
        Top = 32
        Width = 58
        Height = 13
        Caption = 'Aspect ratio'
      end
      object LDeinterlace: TTntLabel
        Left = 10
        Top = 80
        Width = 54
        Height = 13
        Caption = 'Deinterlace'
      end
      object LMAspect: TTntLabel
        Left = 10
        Top = 56
        Width = 97
        Height = 13
        Caption = 'Monitor Aspect ratio'
      end
      object LVideoout: TTntLabel
        Left = 10
        Top = 8
        Width = 61
        Height = 13
        Caption = 'Video output'
      end
      object CIndex: TTntCheckBox
        Left = 8
        Top = 130
        Width = 305
        Height = 17
        Caption = 'Re-Index file if needed'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object CYuy2: TTntCheckBox
        Left = 350
        Top = 174
        Width = 179
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Use YUY2 colorspace'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object CPostproc: TTntComboBox
        Left = 256
        Top = 100
        Width = 270
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 8
        Items.Strings = (
          'off'
          'auto'
          'max')
      end
      object CAspect: TTntComboBox
        Left = 256
        Top = 28
        Width = 270
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'auto'
          '4:3'
          '16:9'
          '2.35:1'
          '14:9'
          '5:4'
          '16:10'
          '2.21:1'
          '1:1'
          '1.22:1'
          'custom')
      end
      object CDeinterlace: TTntComboBox
        Left = 256
        Top = 76
        Width = 270
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'off'
          'simple'
          'adaptive')
      end
      object CDr: TTntCheckBox
        Left = 350
        Top = 152
        Width = 179
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Direct rendering'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object CMAspect: TComboBox
        Tag = -1
        Left = 256
        Top = 52
        Width = 270
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 4
        Items.Strings = (
          'Default'
          '4:3'
          '16:9'
          '2.35:1'
          '5:4'
          '16:10'
          '2.21:1')
      end
      object double: TTntCheckBox
        Left = 8
        Top = 152
        Width = 307
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Double buffer'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object CFlip: TTntCheckBox
        Left = 8
        Top = 196
        Width = 305
        Height = 17
        Caption = 'Flip Video'
        TabOrder = 3
      end
      object CEq2: TTntCheckBox
        Left = 8
        Top = 174
        Width = 305
        Height = 17
        Caption = 'Use Software video Equalizer'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object CMir: TTntCheckBox
        Left = 350
        Top = 196
        Width = 179
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Mirror Video'
        TabOrder = 10
      end
      object LRot: TTntStaticText
        Left = 338
        Top = 220
        Width = 37
        Height = 17
        Alignment = taCenter
        Anchors = [akTop, akRight]
        BevelInner = bvNone
        BevelOuter = bvNone
        Caption = 'Rotate'
        TabOrder = 12
      end
      object CUseekC: TTntCheckBox
        Left = 8
        Top = 218
        Width = 297
        Height = 17
        Caption = 'Fast DVD Chapter Switching'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
      end
      object CVSync: TTntCheckBox
        Left = 350
        Top = 130
        Width = 179
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'VSync'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
      end
      object CRot: TComboBox
        Left = 467
        Top = 216
        Width = 54
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        ItemHeight = 13
        TabOrder = 11
        Items.Strings = (
          '0'
          '90'
          '-90')
      end
      object CVideoOut: TComboBox
        Tag = -1
        Left = 256
        Top = 4
        Width = 270
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 15
        OnChange = CDDXAClick
        Items.Strings = (
          'novideo'
          'null'
          'Auto'
          'directx'
          'directx:noaccel'
          'direct3d'
          'gl'
          'gl:yuv=2:force-pbo'
          'gl:yuv=2:force-pbo:ati-hack'
          'gl:yuv=3'
          'gl2'
          'gl2:yuv=3'
          'matrixview')
      end
    end
    object TabSheet3: TTntTabSheet
      Caption = 'Audio'
      ImageIndex = 2
      DesignSize = (
        529
        259)
      object LAudioOut: TTntLabel
        Left = 10
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Audio output'
      end
      object LAudioDev: TTntLabel
        Left = 10
        Top = 32
        Width = 61
        Height = 13
        Caption = 'Audio device'
      end
      object LCh: TTntStaticText
        Left = 336
        Top = 84
        Width = 65
        Height = 17
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        BevelInner = bvNone
        Caption = 'Stereo Mode'
        TabOrder = 9
      end
      object CAudioOut: TTntComboBox
        Left = 256
        Top = 4
        Width = 270
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 4
        OnChange = CAudioOutChange
        Items.Strings = (
          'don'#39't decode'
          'dont'#39'play'
          'Auto'
          'Win32'
          'DirectSound')
      end
      object CVolnorm: TTntCheckBox
        Left = 337
        Top = 58
        Width = 184
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'CVolnorm'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object CAudioDev: TComboBox
        Left = 256
        Top = 28
        Width = 270
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 0
        TabOrder = 1
      end
      object CSPDIF: TTntCheckBox
        Left = 12
        Top = 82
        Width = 245
        Height = 17
        Caption = 'Passthrough S/PDIF'
        TabOrder = 3
      end
      object CCh: TComboBox
        Left = 475
        Top = 80
        Width = 51
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        ItemHeight = 13
        TabOrder = 5
        Items.Strings = (
          '2'
          '4'
          '5.1')
      end
      object CSoftVol: TTntCheckBox
        Left = 12
        Top = 58
        Width = 245
        Height = 17
        Caption = 'Software volume control'
        TabOrder = 2
      end
      object EWadsp: TTntEdit
        Left = 4
        Top = 234
        Width = 492
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object BWadsp: TTntButton
        Left = 497
        Top = 234
        Width = 28
        Height = 21
        Anchors = [akTop, akRight]
        Caption = '...'
        TabOrder = 7
        OnClick = BWadspClick
      end
      object CWadsp: TTntCheckBox
        Left = 4
        Top = 214
        Width = 528
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Use Winamp DSP plugin'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
        OnClick = CWadspClick
      end
      object TLyric: TTntGroupBox
        Left = 1
        Top = 102
        Width = 526
        Height = 107
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Lyric'
        TabOrder = 10
        DesignSize = (
          526
          107)
        object LTCL: TTntLabel
          Left = 46
          Top = 51
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Text color'
        end
        object LHCL: TTntLabel
          Left = 202
          Top = 51
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hg color'
        end
        object LBCL: TTntLabel
          Left = 399
          Top = 51
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'bg color'
        end
        object SLyric: TTntLabel
          Left = 8
          Top = 84
          Width = 55
          Height = 13
          Caption = 'Lyric Folder'
        end
        object PLTC: TPanel
          Left = 96
          Top = 46
          Width = 36
          Height = 25
          Cursor = crHandPoint
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Color = clWindowText
          ParentBackground = False
          TabOrder = 0
          OnClick = SetColor
        end
        object PLBC: TPanel
          Left = 482
          Top = 46
          Width = 36
          Height = 25
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Color = clWindow
          ParentBackground = False
          TabOrder = 3
          OnClick = SetColor
        end
        object PLHC: TPanel
          Left = 246
          Top = 46
          Width = 36
          Height = 25
          Cursor = crHandPoint
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Color = clRed
          ParentBackground = False
          TabOrder = 1
          OnClick = SetColor
        end
        object ELyric: TTntEdit
          Left = 176
          Top = 80
          Width = 316
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object BLyric: TTntButton
          Tag = 1
          Left = 493
          Top = 80
          Width = 28
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '...'
          TabOrder = 4
          OnClick = BSsfClick
        end
        object LScroll: TTntCheckBox
          Left = 8
          Top = 20
          Width = 350
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Smooth scroll'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
        end
        object BFont: TButton
          Left = 360
          Top = 15
          Width = 161
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'font'
          TabOrder = 6
          OnClick = BFontClick
        end
      end
    end
    object TabSheet4: TTntTabSheet
      Caption = 'Subtitle'
      ImageIndex = 3
      DesignSize = (
        529
        259)
      object BSubfont: TTntButton
        Left = 496
        Top = 31
        Width = 28
        Height = 21
        Anchors = [akTop, akRight]
        Caption = '...'
        TabOrder = 0
        OnClick = BSubfontClick
      end
      object CUni: TTntCheckBox
        Left = 295
        Top = 123
        Width = 236
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'unicode'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
      end
      object CUtf: TTntCheckBox
        Left = 4
        Top = 123
        Width = 241
        Height = 17
        Caption = 'utf8'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
      end
      object SSubcode: TTntStaticText
        Left = 4
        Top = 10
        Width = 86
        Height = 17
        Caption = 'Subtitle encoding'
        TabOrder = 7
      end
      object SSubfont: TTntStaticText
        Left = 4
        Top = 36
        Width = 65
        Height = 17
        Caption = 'Subtitle Font'
        TabOrder = 8
      end
      object SFsize: TTntStaticText
        Left = 4
        Top = 198
        Width = 57
        Height = 17
        Caption = 'Sufont size'
        TabOrder = 9
      end
      object SFB: TTntStaticText
        Left = 4
        Top = 220
        Width = 77
        Height = 17
        Caption = 'font blur radius'
        TabOrder = 10
      end
      object SFol: TTntStaticText
        Left = 4
        Top = 242
        Width = 106
        Height = 17
        Caption = 'font outline thickness'
        TabOrder = 11
      end
      object CSubfont: TTntComboBox
        Left = 240
        Top = 32
        Width = 256
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 0
        TabOrder = 15
        OnChange = FontChange
      end
      object PShow: TTntPanel
        Left = 8
        Top = 78
        Width = 514
        Height = 44
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -30
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object COsdfont: TTntComboBox
        Left = 240
        Top = 56
        Width = 256
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 0
        TabOrder = 17
        OnChange = FontChange
      end
      object BOsdfont: TButton
        Left = 496
        Top = 55
        Width = 28
        Height = 21
        Anchors = [akTop, akRight]
        Caption = '...'
        TabOrder = 18
        OnClick = BOsdfontClick
      end
      object SFontColor: TTntStaticText
        Left = 4
        Top = 173
        Width = 52
        Height = 17
        Caption = 'Text color'
        TabOrder = 19
      end
      object SOutline: TTntStaticText
        Left = 264
        Top = 173
        Width = 64
        Height = 17
        Alignment = taRightJustify
        Caption = 'Outline color'
        TabOrder = 20
      end
      object PTc: TPanel
        Left = 133
        Top = 166
        Width = 60
        Height = 25
        Cursor = crHandPoint
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BorderWidth = 1
        Color = clYellow
        ParentBackground = False
        TabOrder = 21
        OnClick = SetColor
      end
      object POc: TPanel
        Left = 413
        Top = 166
        Width = 60
        Height = 25
        Cursor = crHandPoint
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BorderWidth = 1
        Color = clBlack
        ParentBackground = False
        TabOrder = 22
        OnClick = SetColor
      end
      object CAss: TTntCheckBox
        Left = 4
        Top = 145
        Width = 245
        Height = 17
        Caption = 'Use libass for SubRender'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnClick = CAssClick
      end
      object CEfont: TTntCheckBox
        Left = 295
        Top = 145
        Width = 236
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Use embedded fonts'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
      end
      object SOsdfont: TTntCheckBox
        Left = 4
        Top = 60
        Width = 229
        Height = 17
        Caption = 'OSD font'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        OnClick = SOsdfontClick
      end
      object CSubcp: TComboBox
        Tag = -1
        Left = 240
        Top = 6
        Width = 284
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'GBK'
          'CP936 (SimChinese)'
          'GB18030'
          'BIG5 (TraChinese)'
          'BIG5-HKSCS'
          'HZ'
          ''
          'ISO-2022-CN'
          'ISO-2022-CN-EXT'
          'EUC-CN'
          'EUC-TW'
          ''
          'ISO-2022-KR'
          'EUC-KR'
          ''
          'ASCII'
          'UNICODE'
          'UTF-8'
          'UTF-7'
          'UTF-16'
          'UTF-16BE'
          'UTF-16LE'
          'UTF-32'
          'UTF-32BE'
          'UTF-32LE'
          'C99'
          'JAVA'
          'UCS-2'
          'UCS-2BE'
          'UCS-2LE'
          'UCS-4'
          'UCS-4BE'
          'UCS-4LE'
          ''
          'ISO-8859-1 (Western European)'
          'CP1252'
          'MacRoman'
          'MacIceland'
          'ISO-8859-15 (Western European with Euro)'
          ''
          'ISO-8859-2 (Slavic/Central European)'
          'CP1250 (Slavic/Central European Windows)'
          'MacCentrlEurope'
          'MacCroatian'
          'MacRomania'
          ''
          'ISO-8859-5 (Cyrillic)'
          'CP1251 (Cyrillic Windows)'
          'MacCyrillic'
          'MacUkraine'
          'KOI8-R (Russian)'
          'KOI8-U (Ukrainian)'
          'KOI8-RU (Belarusian)'
          ''
          'ISO-8859-6 (Arabic)'
          'CP1256'
          'MacArabic'
          ''
          'ISO-8859-7 (Modern Greek)'
          'CP1253'
          'MacGreek'
          ''
          'ISO-8859-8 (Hebrew)'
          'CP1255'
          'MacHebrew'
          ''
          'ISO-8859-9 (Turkish)'
          'CP1254'
          'MacTurkish'
          ''
          'ISO-8859-13 (Baltic)'
          'CP1257'
          ''
          'Macintosh'
          ''
          'ISO-2022-JP'
          'ISO-2022-JP-1'
          'ISO-2022-JP-2'
          'EUC-JP'
          'SHIFT_JIS (Japanese)'
          ''
          'MacThai'
          'KOI8-T'
          ''
          'ISO-8859-3 (Esperanto,Galician,Maltese,Turkish)'
          'ISO-8859-4 (Old Baltic)'
          'ISO-8859-10'
          'ISO-8859-14 (Celtic)'
          'ISO-8859-16'
          ''
          'CP850'
          'CP862'
          'CP866'
          'CP874 (Thai)'
          'CP932'
          'CP949 (Korean)'
          'CP950'
          'CP1133'
          'CP1258'
          ''
          'JOHAB'
          'ARMSCII-8'
          'Georgian-Academy'
          'Georgian-PS'
          'TIS-620'
          'MuleLao-1'
          'VISCII'
          'TCVN'
          'HPROMAN8'
          'NEXTSTEP')
      end
      object TFsize: TTrackBar
        Left = 232
        Top = 196
        Width = 263
        Height = 20
        Anchors = [akLeft, akTop, akRight]
        Max = 100
        Min = 1
        Position = 45
        TabOrder = 4
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = TFsizeChange
      end
      object TFB: TTrackBar
        Left = 232
        Top = 218
        Width = 263
        Height = 20
        Max = 80
        Min = 1
        Position = 20
        TabOrder = 6
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = TFBChange
      end
      object TFol: TTrackBar
        Left = 232
        Top = 240
        Width = 263
        Height = 20
        Anchors = [akLeft, akTop, akRight]
        Max = 80
        Min = 1
        Position = 20
        TabOrder = 5
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = TFolChange
      end
      object SFsP: TTntStaticText
        Left = 494
        Top = 198
        Width = 31
        Height = 17
        Caption = '4.5%'
        TabOrder = 12
      end
      object SFBl: TTntStaticText
        Left = 494
        Top = 219
        Width = 20
        Height = 17
        Caption = '2.0'
        TabOrder = 13
      end
      object SFo: TTntStaticText
        Left = 494
        Top = 241
        Width = 20
        Height = 17
        Caption = '2.0'
        TabOrder = 14
      end
    end
  end
  object ColorDialog1: TColorDialog
    Color = 147
    CustomColors.Strings = (
      'ColorA=5A5A5A'
      'ColorB=FFD304'
      'ColorC=060606'
      'ColorD=000093'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=FFAF80'
      'ColorJ=FFFFFF'
      'ColorK=7D3E1C'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Options = [cdFullOpen, cdAnyColor]
    Left = 210
    Top = 299
  end
  object ImageList1: TImageList
    Left = 136
    Top = 296
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F03FAAAAFFFDF1FFE3DFD555FFFBFE7F
      D1EFFFFFFC77FF1FA0E78000F9BFFFAF41C38000F3DEFC7763839FFCE9D9E3FB
      5F839FFC90EFDFFD37C39FFC90EFB21623339FFC90EF7FFE83879FFC90EF6122
      C2839FFCE9D97FFEE0D18000F3DE6486F0308000F9BFBFFDFFF1FFFFFC77DFFB
      FFF3AAAAFFFBE3C7FFF7FFFFFFFDFC3F00000000000000000000000000000000
      000000000000}
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [fdTrueTypeOnly, fdForceFontExist]
    Left = 179
    Top = 301
  end
end
