object OptionsForm: TOptionsForm
  Left = 283
  Top = 166
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'OptionsForm'
  ClientHeight = 398
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
    398)
  PixelsPerInch = 96
  TextHeight = 13
  object LParams: TTntLabel
    Left = 6
    Top = 324
    Width = 55
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Parameters'
  end
  object LHelp: TTntLabel
    Left = 519
    Top = 324
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
    Top = 368
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = BOKClick
  end
  object BApply: TTntButton
    Left = 158
    Top = 368
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Apply'
    TabOrder = 1
    OnClick = BApplyClick
  end
  object BSave: TTntButton
    Left = 312
    Top = 368
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Save'
    TabOrder = 2
    OnClick = BSaveClick
  end
  object BClose: TTntButton
    Left = 467
    Top = 368
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 4
    OnClick = BCloseClick
  end
  object EParams: TTntEdit
    Left = 6
    Top = 340
    Width = 537
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
  end
  object Tab: TTntPageControl
    Left = 5
    Top = 6
    Width = 537
    Height = 316
    ActivePage = TAbout
    Anchors = [akLeft, akTop, akRight, akBottom]
    Images = ImageList1
    TabOrder = 5
    object TSystem: TTntTabSheet
      Caption = 'System'
      DesignSize = (
        529
        287)
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
        Top = 245
        Width = 304
        Height = 21
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
      end
      object BMplayer: TTntButton
        Left = 497
        Top = 245
        Width = 28
        Height = 21
        Anchors = [akRight, akBottom]
        Caption = '...'
        TabOrder = 3
        OnClick = BMplayerClick
      end
      object CWid: TTntCheckBox
        Left = 283
        Top = 269
        Width = 312
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
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
        Top = 268
        Width = 269
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Current Directory'
        TabOrder = 9
        OnClick = RCMplayerClick
      end
      object RMplayer: TTntRadioButton
        Left = 4
        Top = 248
        Width = 181
        Height = 17
        Anchors = [akLeft, akBottom]
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
        Top = 226
        Width = 92
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'ScreenShot Folder'
        TabOrder = 20
      end
      object BSsf: TTntButton
        Left = 497
        Top = 220
        Width = 28
        Height = 21
        Anchors = [akRight, akBottom]
        Caption = '...'
        TabOrder = 21
        OnClick = BSsfClick
      end
      object ESsf: TTntEdit
        Left = 192
        Top = 221
        Width = 304
        Height = 21
        Anchors = [akLeft, akRight, akBottom]
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
      object CRS: TTntCheckBox
        Left = 12
        Top = 200
        Width = 290
        Height = 17
        Caption = 'start MPUI with last size'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 27
      end
      object CRP: TTntCheckBox
        Left = 300
        Top = 200
        Width = 229
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'start MPUI with last postion'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
      end
    end
    object TVideo: TTntTabSheet
      Caption = 'Video'
      ImageIndex = 1
      DesignSize = (
        529
        287)
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
    object TAudio: TTntTabSheet
      Caption = 'Audio'
      ImageIndex = 2
      DesignSize = (
        529
        287)
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
        ItemHeight = 13
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
        Top = 261
        Width = 492
        Height = 21
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 6
      end
      object BWadsp: TTntButton
        Left = 497
        Top = 261
        Width = 28
        Height = 21
        Anchors = [akRight, akBottom]
        Caption = '...'
        TabOrder = 7
        OnClick = BWadspClick
      end
      object CWadsp: TTntCheckBox
        Left = 4
        Top = 241
        Width = 528
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Use Winamp DSP plugin'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
        OnClick = CWadspClick
      end
      object TLyric: TTntGroupBox
        Left = 1
        Top = 129
        Width = 526
        Height = 110
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Lyric'
        TabOrder = 10
        DesignSize = (
          526
          110)
        object LTCL: TTntLabel
          Left = 46
          Top = 51
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akBottom]
          Caption = 'Text color'
        end
        object LHCL: TTntLabel
          Left = 202
          Top = 51
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akBottom]
          Caption = 'Hg color'
        end
        object LBCL: TTntLabel
          Left = 399
          Top = 51
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akBottom]
          Caption = 'bg color'
        end
        object SLyric: TTntLabel
          Left = 8
          Top = 84
          Width = 55
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Lyric Folder'
        end
        object PLTC: TPanel
          Left = 96
          Top = 46
          Width = 36
          Height = 25
          Cursor = crHandPoint
          Anchors = [akLeft, akBottom]
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
          Anchors = [akRight, akBottom]
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
          Anchors = [akLeft, akBottom]
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
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 2
        end
        object BLyric: TTntButton
          Tag = 1
          Left = 493
          Top = 80
          Width = 28
          Height = 21
          Anchors = [akRight, akBottom]
          Caption = '...'
          TabOrder = 4
          OnClick = BSsfClick
        end
        object LScroll: TTntCheckBox
          Left = 8
          Top = 20
          Width = 350
          Height = 17
          Anchors = [akLeft, akRight, akBottom]
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
          Anchors = [akRight, akBottom]
          Caption = 'font'
          TabOrder = 6
          OnClick = BFontClick
        end
      end
    end
    object TSub: TTntTabSheet
      Caption = 'Subtitle'
      ImageIndex = 5
      DesignSize = (
        529
        287)
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
        Top = 150
        Width = 236
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'unicode'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
      end
      object CUtf: TTntCheckBox
        Left = 4
        Top = 150
        Width = 241
        Height = 17
        Anchors = [akLeft, akBottom]
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
        Top = 225
        Width = 57
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Sufont size'
        TabOrder = 9
      end
      object SFB: TTntStaticText
        Left = 4
        Top = 247
        Width = 77
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'font blur radius'
        TabOrder = 10
      end
      object SFol: TTntStaticText
        Left = 4
        Top = 269
        Width = 106
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'font outline thickness'
        TabOrder = 11
      end
      object CSubfont: TTntComboBox
        Left = 240
        Top = 32
        Width = 256
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 15
        OnChange = FontChange
      end
      object PShow: TTntPanel
        Left = 8
        Top = 78
        Width = 514
        Height = 66
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
        ItemHeight = 13
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
        Top = 200
        Width = 52
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Text color'
        TabOrder = 19
      end
      object SOutline: TTntStaticText
        Left = 264
        Top = 200
        Width = 64
        Height = 17
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Outline color'
        TabOrder = 20
      end
      object PTc: TPanel
        Left = 133
        Top = 193
        Width = 60
        Height = 25
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
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
        Top = 193
        Width = 60
        Height = 25
        Cursor = crHandPoint
        Anchors = [akRight, akBottom]
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
        Top = 172
        Width = 245
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Use libass for SubRender'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnClick = CAssClick
      end
      object CEfont: TTntCheckBox
        Left = 295
        Top = 172
        Width = 236
        Height = 17
        Anchors = [akRight, akBottom]
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
        Top = 223
        Width = 263
        Height = 20
        Anchors = [akLeft, akRight, akBottom]
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
        Top = 245
        Width = 263
        Height = 20
        Anchors = [akLeft, akRight, akBottom]
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
        Top = 267
        Width = 263
        Height = 20
        Anchors = [akLeft, akRight, akBottom]
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
        Top = 225
        Width = 31
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = '4.5%'
        TabOrder = 12
      end
      object SFBl: TTntStaticText
        Left = 494
        Top = 246
        Width = 20
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = '2.0'
        TabOrder = 13
      end
      object SFo: TTntStaticText
        Left = 494
        Top = 268
        Width = 20
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = '2.0'
        TabOrder = 14
      end
    end
    object THelp: TTntTabSheet
      Caption = 'Help'
      ImageIndex = 4
      DesignSize = (
        529
        287)
      object HelpText: TTntMemo
        Left = 4
        Top = 4
        Width = 520
        Height = 278
        Cursor = crArrow
        Anchors = [akLeft, akTop, akRight, akBottom]
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
    end
    object TAbout: TTntTabSheet
      Caption = 'About'
      ImageIndex = 3
      OnShow = TAboutShow
      DesignSize = (
        529
        287)
      object LURL: TLabel
        Left = 8
        Top = 118
        Width = 108
        Height = 13
        Cursor = crHandPoint
        Caption = 'http://mpui-hcb.sf.net'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object MTitle: TTntLabel
        Left = 148
        Top = 4
        Width = 38
        Height = 16
        Caption = 'MTitle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LVersionMPUI: TTntLabel
        Left = 168
        Top = 24
        Width = 72
        Height = 13
        Caption = 'VersionMPUI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VersionMPUI: TTntLabel
        Left = 188
        Top = 38
        Width = 60
        Height = 13
        Caption = 'VersionMPUI'
      end
      object LVersionMPlayer: TTntLabel
        Left = 168
        Top = 56
        Width = 88
        Height = 13
        Caption = 'VersionMPlayer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VersionMPlayer: TTntLabel
        Left = 188
        Top = 70
        Width = 73
        Height = 13
        Caption = 'VersionMPlayer'
      end
      object FYI: TImage
        Left = 225
        Top = 83
        Width = 86
        Height = 52
        Picture.Data = {
          0A544A504547496D61676504330000FFD8FFE000104A46494600010201004800
          480000FFE106444578696600004D4D002A000000080007011200030000000100
          010000011A00050000000100000062011B0005000000010000006A0128000300
          00000100020000013100020000001B0000007201320002000000140000008D87
          69000400000001000000A4000000D00000004700000001000000470000000141
          646F62652050686F746F73686F702043532057696E646F777300323030363A30
          323A32332030333A31303A3035000000000003A001000300000001FFFF0000A0
          0200040000000100000051A00300040000000100000031000000000000000601
          0300030000000100060000011A0005000000010000011E011B00050000000100
          00012601280003000000010002000002010004000000010000012E0202000400
          0000010000050E0000000000000048000000010000004800000001FFD8FFE000
          104A46494600010201004800480000FFED000C41646F62655F434D0002FFEE00
          0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
          11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
          0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080031005103012200
          021101031101FFDD00040006FFC4013F00000105010101010101000000000000
          00030001020405060708090A0B01000105010101010101000000000000000100
          02030405060708090A0B1000010401030204020507060805030C330100021103
          04211231054151611322718132061491A1B14223241552C16233347282D14307
          259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
          D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
          37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
          021103213112044151617122130532819114A1B14223C152D1F0332462E17282
          92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
          B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
          E6F62737475767778797A7B7C7FFDA000C03010002110311003F00ED524924C5
          CA4924925292492494A48890478A492445E8A635BA441E42926020F9C6BF3F72
          755F9399972F0913C5B8123FA708CA51C73FF0F1F0CD7E4AE334A492495858FF
          00FFD0ED524945CED768E4F3E4143926211E2367A088F9A523F2C62BC0B34B38
          BDC76B341F9CEF0FEAA8D4D0DB6C038D3EF450204205A5CD6B8B7F3B527C952E
          6B34707B59731D78E52D361FAAC9118F1FF8FF0033362067C508F5007FCE8FAA
          49D41D7D2DB054E70163B86FC55536D9B5AF2E2D6B1ED6068EF3F48BBF794722
          B73AE2F6C866E69209E5C38FE57B5A999BE2606313C71EA3E6D7F57EAE297A7F
          B9FA4C98F941C553956876FDFF004FA7FE7379CE20B44483A13E09C477D63B78
          9F0416DD63DB01B0F3F7478A9561E0807BF7F2950737F1189856394E78B29F5C
          E2380C31407EBB0E197F9CF6F8E72FF36B63808F9AA328F4BBBED29249EE4EA7
          525252AC881A13C97387D1F29250F7868D79F253727F14C39673C4231C38B100
          314A538FAE3F2C6B1FE8FA62C72C521AEB291DF4649287AECF077F9A5257FEF1
          87FCE47ED59EDCFF0074FD8FFFD1ECAEB5B5565E7E007893C04F5B5CD6CBBE9B
          B577C55733919DB08FD1636A7CEC3FF915695687AF2199F96170C7FDEFF2993F
          F51B3CC704631FD290E39F91FE6E3FF76B3B8F048B43B57344E9A7869C29021A
          E6B8E801124A6067DDC499FBD55940E4F88FA87162C7CBE80EB1F732E4FF00BD
          C6806B1E9A132DD1BEC1218C6EE776F0050DB5B8BBDC752498F03DCA386B5BC0
          89E53A39B9196794659B26919717B78C70E3E01FA3C5F3F1FF00AC5D1CC20088
          4771F34BE6B59AD0D101220001DA4993AF000D38FDE4E9A0CE91E224491F04EE
          739794B1E3862809638CBD7844BD913C7C32F471FEE7B9C1EE47F4D6C25A9323
          44FE97CCA92747124F2E07B7EE313A40408494BC9F2C397C5C02B8A44CF2180E
          089C92FDD8FEE47E482D9CB88DF4E8BCA49925616BFFD2ED077F8A75F3AA4A30
          B8BF453BE894EBE7449153F4524BE7549253F4524BE7549253F4524BE7549253
          F4524BE7549253FFD9FFED0B0850686F746F73686F7020332E30003842494D04
          040000000000071C020000020002003842494D0425000000000010460CF28926
          B856DAB09C01A1B0A790773842494D03ED0000000000100047FBE70001000200
          47FBE7000100023842494D042600000000000E000000000000000000003F8000
          003842494D040D0000000000040000001E3842494D0419000000000004000000
          1E3842494D03F3000000000009000000000000000001003842494D040A000000
          00000100003842494D271000000000000A000100000000000000023842494D03
          F5000000000048002F66660001006C66660006000000000001002F6666000100
          A1999A0006000000000001003200000001005A00000006000000000001003500
          000001002D000000060000000000013842494D03F80000000000700000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF03E800003842494D0408000000000010000000010000024000
          000240000000003842494D041E000000000004000000003842494D041A000000
          00034F00000006000000000000000000000031000000510000000D672A680798
          98002D0031526F672C005F005000460047526F672C0000000100000000000000
          0000000000000000000000000100000000000000000000005100000031000000
          0000000000000000000000000001000000000000000000000000000000000000
          0010000000010000000000006E756C6C0000000200000006626F756E64734F62
          6A6300000001000000000000526374310000000400000000546F70206C6F6E67
          00000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E67
          0000003100000000526768746C6F6E670000005100000006736C69636573566C
          4C73000000014F626A6300000001000000000005736C69636500000012000000
          07736C69636549446C6F6E67000000000000000767726F757049446C6F6E6700
          000000000000066F726967696E656E756D0000000C45536C6963654F72696769
          6E0000000D6175746F47656E6572617465640000000054797065656E756D0000
          000A45536C6963655479706500000000496D672000000006626F756E64734F62
          6A6300000001000000000000526374310000000400000000546F70206C6F6E67
          00000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E67
          0000003100000000526768746C6F6E67000000510000000375726C5445585400
          0000010000000000006E756C6C54455854000000010000000000004D73676554
          45585400000001000000000006616C7454616754455854000000010000000000
          0E63656C6C54657874497348544D4C626F6F6C010000000863656C6C54657874
          5445585400000001000000000009686F727A416C69676E656E756D0000000F45
          536C696365486F727A416C69676E0000000764656661756C7400000009766572
          74416C69676E656E756D0000000F45536C69636556657274416C69676E000000
          0764656661756C740000000B6267436F6C6F7254797065656E756D0000001145
          536C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F
          75747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E6700
          0000000000000C626F74746F6D4F75747365746C6F6E67000000000000000B72
          696768744F75747365746C6F6E6700000000003842494D042800000000000C00
          0000013FF00000000000003842494D041100000000000101003842494D041400
          0000000004000000033842494D040C00000000052A0000000100000051000000
          31000000F400002EB40000050E00180001FFD8FFE000104A4649460001020100
          4800480000FFED000C41646F62655F434D0002FFEE000E41646F626500648000
          000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F15181313
          15131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C
          0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0CFFC00011080031005103012200021101031101FFDD0004
          0006FFC4013F0000010501010101010100000000000000030001020405060708
          090A0B0100010501010101010100000000000000010002030405060708090A0B
          1000010401030204020507060805030C33010002110304211231054151611322
          718132061491A1B14223241552C16233347282D14307259253F0E1F163733516
          A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B4
          95C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7
          D7E7F71100020201020404030405060707060535010002110321311204415161
          7122130532819114A1B14223C152D1F0332462E1728292435315637334F12506
          16A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A4
          85B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797
          A7B7C7FFDA000C03010002110311003F00ED524924C5CA4924925292492494A4
          8890478A492445E8A635BA441E42926020F9C6BF3F72755F9399972F0913C5B8
          123FA708CA51C73FF0F1F0CD7E4AE334A492495858FF00FFD0ED524945CED768
          E4F3E4143926211E2367A088F9A523F2C62BC0B34B38BDC76B341F9CEF0FEAA8
          D4D0DB6C038D3EF450204205A5CD6B8B7F3B527C952E6B34707B59731D78E52D
          361FAAC9118F1FF8FF0033362067C508F5007FCE8FAA49D41D7D2DB054E70163
          B86FC55536D9B5AF2E2D6B1ED6068EF3F48BBF794722B73AE2F6C866E69209E5
          C38FE57B5A999BE2606313C71EA3E6D7F57EAE297A7FB9FA4C98F941C5539568
          76FDFF004FA7FE7379CE20B44483A13E09C477D63B789F0416DD63DB01B0F3F7
          478A9561E0807BF7F2950737F1189856394E78B29F5CE2380C31407EBB0E197F
          9CF6F8E72FF36B63808F9AA328F4BBBED29249EE4EA7525252AC881A13C97387
          D1F29250F7868D79F253727F14C39673C4231C38B100314A538FAE3F2C6B1FE8
          FA62C72C521AEB291DF4649287AECF077F9A5257FEF187FCE47ED59EDCFF0074
          FD8FFFD1ECAEB5B5565E7E007893C04F5B5CD6CBBE9BB577C55733919DB08FD1
          636A7CEC3FF915695687AF2199F96170C7FDEFF2993FF51B3CC704631FD290E3
          9F91FE6E3FF76B3B8F048B43B57344E9A7869C29021AE6B8E801124A6067DDC4
          99FBD55940E4F88FA87162C7CBE80EB1F732E4FF00BDC6806B1E9A132DD1BEC1
          218C6EE776F0050DB5B8BBDC752498F03DCA386B5BC089E53A39B9196794659B
          26919717B78C70E3E01FA3C5F3F1FF00AC5D1CC200884771F34BE6B59AD0D101
          220001DA4993AF000D38FDE4E9A0CE91E224491F04EE739794B1E3862809638C
          BD7844BD913C7C32F471FEE7B9C1EE47F4D6C25A932344FE97CCA92747124F2E
          07B7EE313A40408494BC9F2C397C5C02B8A44CF2180E089C92FDD8FEE47E482D
          9CB88DF4E8BCA49925616BFFD2ED077F8A75F3AA4A30B8BF453BE894EBE74491
          53F4524BE7549253F4524BE7549253F4524BE7549253F4524BE7549253FFD938
          42494D042100000000005300000001010000000F00410064006F006200650020
          00500068006F0074006F00730068006F00700000001200410064006F00620065
          002000500068006F0074006F00730068006F0070002000430053000000010038
          42494D04060000000000070004000000010100FFE1193B687474703A2F2F6E73
          2E61646F62652E636F6D2F7861702F312E302F003C3F787061636B6574206265
          67696E3D27EFBBBF272069643D2757354D304D7043656869487A7265537A4E54
          637A6B633964273F3E0A3C783A786D706D65746120786D6C6E733A783D276164
          6F62653A6E733A6D6574612F2720783A786D70746B3D27584D5020746F6F6C6B
          697420332E302D32382C206672616D65776F726B20312E36273E0A3C7264663A
          52444620786D6C6E733A7264663D27687474703A2F2F7777772E77332E6F7267
          2F313939392F30322F32322D7264662D73796E7461782D6E73232720786D6C6E
          733A69583D27687474703A2F2F6E732E61646F62652E636F6D2F69582F312E30
          2F273E0A0A203C7264663A4465736372697074696F6E207264663A61626F7574
          3D27757569643A38643334626664612D613364362D313164612D626233352D63
          3437353032613262353538270A2020786D6C6E733A657869663D27687474703A
          2F2F6E732E61646F62652E636F6D2F657869662F312E302F273E0A20203C6578
          69663A436F6C6F7253706163653E343239343936373239353C2F657869663A43
          6F6C6F7253706163653E0A20203C657869663A506978656C5844696D656E7369
          6F6E3E38313C2F657869663A506978656C5844696D656E73696F6E3E0A20203C
          657869663A506978656C5944696D656E73696F6E3E34393C2F657869663A5069
          78656C5944696D656E73696F6E3E0A203C2F7264663A4465736372697074696F
          6E3E0A0A203C7264663A4465736372697074696F6E207264663A61626F75743D
          27757569643A38643334626664612D613364362D313164612D626233352D6334
          37353032613262353538270A2020786D6C6E733A7064663D27687474703A2F2F
          6E732E61646F62652E636F6D2F7064662F312E332F273E0A203C2F7264663A44
          65736372697074696F6E3E0A0A203C7264663A4465736372697074696F6E2072
          64663A61626F75743D27757569643A38643334626664612D613364362D313164
          612D626233352D633437353032613262353538270A2020786D6C6E733A70686F
          746F73686F703D27687474703A2F2F6E732E61646F62652E636F6D2F70686F74
          6F73686F702F312E302F273E0A20203C70686F746F73686F703A486973746F72
          793E3C2F70686F746F73686F703A486973746F72793E0A203C2F7264663A4465
          736372697074696F6E3E0A0A203C7264663A4465736372697074696F6E207264
          663A61626F75743D27757569643A38643334626664612D613364362D31316461
          2D626233352D633437353032613262353538270A2020786D6C6E733A74696666
          3D27687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F27
          3E0A20203C746966663A4F7269656E746174696F6E3E313C2F746966663A4F72
          69656E746174696F6E3E0A20203C746966663A585265736F6C7574696F6E3E37
          312F313C2F746966663A585265736F6C7574696F6E3E0A20203C746966663A59
          5265736F6C7574696F6E3E37312F313C2F746966663A595265736F6C7574696F
          6E3E0A20203C746966663A5265736F6C7574696F6E556E69743E323C2F746966
          663A5265736F6C7574696F6E556E69743E0A203C2F7264663A44657363726970
          74696F6E3E0A0A203C7264663A4465736372697074696F6E207264663A61626F
          75743D27757569643A38643334626664612D613364362D313164612D62623335
          2D633437353032613262353538270A2020786D6C6E733A7861703D2768747470
          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F273E0A20203C7861
          703A437265617465446174653E323030362D30322D32335430313A32363A3538
          2B30383A30303C2F7861703A437265617465446174653E0A20203C7861703A4D
          6F64696679446174653E323030362D30322D32335430333A31303A30352B3038
          3A30303C2F7861703A4D6F64696679446174653E0A20203C7861703A4D657461
          64617461446174653E323030362D30322D32335430333A31303A30352B30383A
          30303C2F7861703A4D65746164617461446174653E0A20203C7861703A437265
          61746F72546F6F6C3E41646F62652050686F746F73686F702043532057696E64
          6F77733C2F7861703A43726561746F72546F6F6C3E0A203C2F7264663A446573
          6372697074696F6E3E0A0A203C7264663A4465736372697074696F6E20726466
          3A61626F75743D27757569643A38643334626664612D613364362D313164612D
          626233352D633437353032613262353538270A2020786D6C6E733A7374526566
          3D27687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F7354
          7970652F5265736F7572636552656623270A2020786D6C6E733A7861704D4D3D
          27687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F
          273E0A20203C7861704D4D3A4465726976656446726F6D207264663A70617273
          65547970653D275265736F75726365273E0A2020203C73745265663A696E7374
          616E636549443E757569643A34303439613163322D613363382D313164612D62
          3166372D6338396134653934613366343C2F73745265663A696E7374616E6365
          49443E0A2020203C73745265663A646F63756D656E7449443E61646F62653A64
          6F6369643A70686F746F73686F703A66373733363436322D613363322D313164
          612D623166372D6338396134653934613366343C2F73745265663A646F63756D
          656E7449443E0A20203C2F7861704D4D3A4465726976656446726F6D3E0A2020
          3C7861704D4D3A446F63756D656E7449443E61646F62653A646F6369643A7068
          6F746F73686F703A34303439613163372D613363382D313164612D623166372D
          6338396134653934613366343C2F7861704D4D3A446F63756D656E7449443E0A
          203C2F7264663A4465736372697074696F6E3E0A0A203C7264663A4465736372
          697074696F6E207264663A61626F75743D27757569643A38643334626664612D
          613364362D313164612D626233352D633437353032613262353538270A202078
          6D6C6E733A64633D27687474703A2F2F7075726C2E6F72672F64632F656C656D
          656E74732F312E312F273E0A20203C64633A666F726D61743E696D6167652F6A
          7065673C2F64633A666F726D61743E0A203C2F7264663A446573637269707469
          6F6E3E0A0A3C2F7264663A5244463E0A3C2F783A786D706D6574613E0A202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020200A20202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020200A2020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020200A202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020200A20202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020202020200A2020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20200A2020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020200A202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020200A20202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020200A2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020200A202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020200A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          0A20202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020200A2020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020200A202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020200A20202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020200A2020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020200A202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020200A20
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020200A20202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020200A2020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020200A202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020200A20202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020200A2020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020200A202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020200A3C3F78
          7061636B657420656E643D2777273F3EFFEE000E41646F626500640000000001
          FFDB0084000604040405040605050609060506090B080606080B0C0A0A0B0A0A
          0C100C0C0C0C0C0C100C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C010707070D0C0D18101018140E0E0E14140E0E0E0E14110C0C0C0C
          0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0CFFC00011080031005103011100021101031101FFDD0004000BFF
          C401A20000000701010101010000000000000000040503020601000708090A0B
          0100020203010101010100000000000000010002030405060708090A0B100002
          0103030204020607030402060273010203110400052112314151061361227181
          143291A10715B14223C152D1E1331662F0247282F12543345392A2B26373C235
          442793A3B33617546474C3D2E2082683090A181984944546A4B456D355281AF2
          E3F3C4D4E4F465758595A5B5C5D5E5F566768696A6B6C6D6E6F6374757677787
          97A7B7C7D7E7F738485868788898A8B8C8D8E8F82939495969798999A9B9C9D9
          E9F92A3A4A5A6A7A8A9AAABACADAEAFA11000202010203050504050604080303
          6D0100021103042112314105511361220671819132A1B1F014C1D1E123421552
          6272F1332434438216925325A263B2C20773D235E2448317549308090A181926
          36451A2764745537F2A3B3C32829D3E3F38494A4B4C4D4E4F465758595A5B5C5
          D5E5F5465666768696A6B6C6D6E6F6475767778797A7B7C7D7E7F73848586878
          8898A8B8C8D8E8F839495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACA
          DAEAFAFFDA000C03010002110311003F00ED794B3762AEC55D8ABB15762AEC55
          A61C94AD69514AE472438A2637C3C43878BF9ACA268DA9C0E4AF13F697C7C335
          5D8BAC9E5C46193FBEC12F0B2FF9BF44FF00CE8B91AAC6232B8FD33F52AE6DDC
          5762AFFFD0ED794B3762AEC55AC55BC55D8ABB1576C373D314AD55A36FD68390
          F024F2FD4739BF67E5E2CF3EA07F779F2FEEFF00E497A789CAD4EC231FE685D9
          D2388EC55FFFD1ED794B3762AA3234B237A70FC23FDD92F80F05F7CD7CF512CB
          338B17F07F7D9BFD4FFDAF1FF3B37FD32726108C4714FF00CD87F3BFADFD1FF7
          4A56B1AA5DDC04078D146FBEFDF313B3E118EAF388F288C51FF3F87D5FE7376A
          666587193CFD68BCDDB80A125F5A477096CF2859E4A718F7AEFD3EFCC3CBDA18
          71E418A52FDE4BA7F59C986932CE07208FA23FC4A8EECAE838D558D09F038353
          A99E3CB8E223C70CB2E09CFF00D4BF9BFE6B0C78C4A3237463FEC9782B5F8B70
          3F67F98F87CBF9B351DB5ACC9926345A73FBECBFDF64FF00947C3FC7FE749B30
          E3A1C72E4D16EA59BE226A49DAA4E6EB49A6C7A5C31C51F4C20387D5FC5FF493
          44A4666DBCCA60EC55FFD2ED794B35377AB08D4FC6DD7D878E6B75D9F2190C38
          4FEFB27D53FF00947C3FEABFD7FE1C5FD26FC5015C72FA47FB397F357AA85000
          CCCD3E9E18602101518FE252FEB4BF89AA73323650572F2247214A8E66A586D5
          15ED9C16B3B68619E7844FEF32E7F570FF00A8E38F0FD7FD2FF4CEE74FA713E1
          BE508FFB341B5DDC148E632324714B144117F6ABF68B7F36D9938BB4734F1C72
          994A10C53C787823FE53F8B24A7FCFF4B7FE560246023194A709E4E23FC1FCC8
          C3F9AA77F6F2C97AF3202910963670C40AC8A36E9F15157B66176AE499CF3CB1
          8CA18FC48F1789F578B5C5F88FF037E8A718E2103EA9F04F8787FD4FFDCFD5FE
          99314BDB8990AA4616662771F640F1DF371A7F68B3EAA271E187F84C8FD5FE4B
          1E3FF549713ACC9A0C788F14A5FBBFF65297F357C0B2AB206DC31FB55E82BB91
          5F6CE4A39B2E1339E394465D2CA5C79BD52967965FDD7F17D5F89393978243CA
          5FC28DB72280F166A166775A04200D81246FFEC7E1CC1ED6D54B5590E69487AF
          8611C7FE521FCEE1C71FA21F57D5EA688C38070A1BD648D68D5AF70287AEFD8E
          7A4E8BB634B8F0C2113967C1110E2F0B2FAB87FCD70E5A69CA44FA7FD32DFAEC
          3FCB27FC01CCFF00E55C5FCDCDFF002A7231FCA4FBE1FE9E2FFFD3EC9797496D
          6ED2B751B22FF331E8330359AA1831199E9F4C7F9F3FE08B95A7C072CC447C7F
          A31FE29376D1BA460C86B33FC521F73D8655A0D29C51329EF9B2FAF34BFA7FCC
          8FF431FD314EA32891A8FD11FA151C8E3B9A03D48EB4EA69F7653DB5AC969F49
          3C91FAEB861FD69FA38BFCD63A78714C068A2C86B2200D45AA8E83E11B6697D9
          7D0E2C9A2072463938B2CE7C531C5C5FC3C4E46A72CA33F49236509EE54308A2
          412495DB6D8119B0D776AC04FC1C30FCC671FC1FE4F0CBF9D397F457069491C7
          33E1C3FD94D423B791A5F8CFC6CC491B1A1EE699C961D16A753AD38A6786709C
          B26697F92871FF001638FF003E7FC2EC726A210C771E54231FE723D23541451F
          33E39E83A3D162D3438318E11FC5FCE9CBF9D393A4CB96533727108AAAF41C9A
          AD56150AAA695A776AF8E72B9B01ED0D5E5C37F97D2E9ABC7E0F44F3CFF9F393
          971970441FAA52FA5C0BB028EC58D43C818D69FC894E9B0F89B2AF67FB3B065D
          54B518E3C3A7C3FBAD37FB64FF008F37F493A8998C40FE22BBE59DD5975EEA9F
          1C6CAD3FFFD4EAADCEFB5BF488FF0044D38066AF469DC540FF00623349389CFA
          900FF75A6F57F5B3CBFE21DC46B069AFFCAEA3FD8E08FF00C5C936CDABAA72BA
          A491BB10155C7227A01D339FF6A7199F67E40059F4FF00BA7234DF5B4ADCAAF4
          A1725A9F335CD876469BC0D2E3C7D6308F17F5BEA930CD2B9969238D2BC54027
          A9CCAC3A6C78AF82221C678A7C3FC52633C929559BA6E82B5A6E7A9CBA98B78A
          16156AEC4501AAD56A549EB43FD739FD77B3B8B5198E4E3C98FC5AF1B1E3FA73
          70FF0039CAC7A9318D52E550A282BEE4EE49F127379870C314042038610DA317
          1E5232365BCB18BB157FFFD5ED29D5BE798F1EADA7A2EC9315B27D86C4A4735C
          7AE1287605762AEC55D8ABB15762AEC55FFFD9}
      end
      object FY: TTntLabel
        Left = 148
        Top = 103
        Width = 29
        Height = 13
        Caption = #20316#32773':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MCredits: TMemo
        Left = 4
        Top = 134
        Width = 520
        Height = 147
        Cursor = crArrow
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'This is free software, licensed under the terms of the'
          'GNU General Public License, Version 2.'
          ''
          '(C) 2006-2009 Huang Chen Bin <hcb428@foxmail.com>'
          'based on work by Martin J. Fiedler <martin.fiedler@gmx.net>'
          ''
          'Code contributions and hints:'
          'Joackim Pennerup <joackim@pennerup.net>'
          'Vasily Khoruzhick <fenix-fen@mail.ru>'
          'Maxim Usov <UsovMV@kms.cctpu.edu.ru>'
          'TDFUnRar <dfrischalowski@del-net.com>'
          'TSevenZipVCL <http://www.rg-software.de>'
          'Interface to 7-zip32.dll <dominic@psas.co.za>'
          ''
          'Contibuted translations:'
          'French by Francois Gagne <frenchfrog@gmail.com>'
          'Spanish by Alex Fu <alexfu@nerdshack.com>'
          'Italian by Andres Zanzani <azanzani@gmail.com>'
          'Esperanto by Kristjan Schmidt <Kristjan@yandex.ru>'
          'Romanian by Florin Valcu <florin.valcu@gmail.com>'
          'Hungarian by MrG <mrguba@gmail.com>'
          'Polish by Wojciech Ga?ecki <kamikazeepl@gmail.com>'
          'Czech by Antonin Fujera <fujera@seznam.cz>'
          'Belarusian and Russian by Vasily Khoruzhick <fenix-fen@mail.ru>'
          'Ukrainian by <vadim-l@foxtrot.kiev.ua>'
          '                     and Andriy Zhouck <juksoft@ukr.net>'
          'Bulgarian by Boyan Boychev <boyan7640@gmail.com>'
          'Korean by Ken Jun <dalbaragi@gmail.com>')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        WordWrap = False
      end
      object PLogo: TPanel
        Left = 8
        Top = 6
        Width = 132
        Height = 110
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clBlack
        ParentBackground = False
        TabOrder = 1
        object ILogo: TImage
          Left = 0
          Top = 0
          Width = 128
          Height = 106
          Picture.Data = {
            0A544A504547496D61676535600000FFD8FFE000104A46494600010201012C01
            2C0000FFE10EE34578696600004D4D002A000000080007011200030000000100
            010000011A00050000000100000062011B0005000000010000006A0128000300
            0000010002000001310002000000140000007201320002000000140000008687
            690004000000010000009C000000C80000012C000000010000012C0000000141
            646F62652050686F746F73686F7020372E3000323030393A30313A3234203137
            3A32333A30300000000003A001000300000001FFFF0000A00200040000000100
            000080A0030004000000010000006A0000000000000006010300030000000100
            060000011A00050000000100000116011B0005000000010000011E0128000300
            00000100020000020100040000000100000126020200040000000100000DB500
            00000000000048000000010000004800000001FFD8FFE000104A464946000102
            01004800480000FFED000C41646F62655F434D0002FFEE000E41646F62650064
            8000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518
            131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14
            110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0CFFC0001108006A008003012200021101031101FFDD
            00040008FFC4013F000001050101010101010000000000000003000102040506
            0708090A0B010001050101010101010000000000000001000203040506070809
            0A0B1000010401030204020507060805030C3301000211030421123105415161
            1322718132061491A1B14223241552C16233347282D14307259253F0E1F16373
            3516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A4
            85B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7
            B7C7D7E7F7110002020102040403040506070706053501000211032131120441
            51617122130532819114A1B14223C152D1F0332462E1728292435315637334F1
            250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F346
            94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6273747576777
            8797A7B7C7FFDA000C03010002110311003F00F34493B5A5C435A09274006A49
            5BFD3BEA1FD6AEA31E860B9AD709DD6B9B5C0FE536C707FF00D14A8A090373BB
            CFA4BD071FFC4D75D780723371AA9E4377BC8FFA15AD1A7FC4C56D03D6CF2F3D
            F60D9FF54DB51A4BE5A92F61A3FC53F4BA796B6E3E3658FF00C958ADAAED3FE2
            FF001B1F5A31F11A7C4B4B8FF9CF6B9C8888FDE087C52BAADB4EDA98E79F0682
            4FE0AED1D03AD647F3585711E2E6168FF3ACDAD5ECE3EABF52608AACA183C007
            0FC8C5077D56EB278C8A3FE9FF00E4138421D66AB3D9F2AABEA475FB237D75D2
            0FEFD8DFFD17EA2BD57F8BFC8D3D7CEA99E218D73FFEABD25E80FF00AA1D71DC
            64D1FF004FFF002082FF00A93D75DFF6AF1FFE9FFE413C43175922CF6791ABEA
            3F46AFFA4655B69FE4ED60FC962B557D5EFAAF8FAFA06E3E363DC7FE882D6ADF
            77D42EBAEFFB578FFF004FFF0020867FC5E75B3FF6AF1FFE9FFE413C0C03F482
            BD4E630744C7FE630E861F10C6CFF9C46E54BA90E9B98C22DA2B713F9C1A0387
            C1EDF72DD3FE2E3AD1FF00B578FF00F4FF00F20A2FFF0016FD643491958E7CA5
            FF00F90520383F7823D4F99751C218B6FE8C9754EFA24F23F92E54D751F59BA2
            F51E98C7559B56CEEC783B98E8FDD785CBAAB9A318CBD3F29D42E074D5FFD01F
            D48E878D8180CEAB90C0FCCC81BAA2ED7D3ACFD0D9FF000967D2DCBD4B0E8146
            3B1B1EE20179F12579EE35E1D8B8A2BFA0595EDF843617A42B5CC43DB86303AD
            92E7F2398E6CB9A52FD0A03FABC5C5FF007ABA4924AABA0A4924925292492494
            A4924925292492494A4C784E924A79BFACDD3A8CFC3BB16E00B2D696CC4ED247
            B5EDFE5317835D53A9BACA5FF4AB7163BE2D3B4AFA23AB32584AF02EB95FA5D6
            7359E17D91F02E25255EB4FF00FFD11FD5EB7D6E9780EE7DAD61FEC9F4FF00EF
            ABD6578D7D48B3D4E9D5B0FF0083BCB7E44B5FFF007F5ECAAD7332BC784FF54F
            FDCB9DF0F87067E6C7F5C7FDDA925C17D6AFADDD5BA77D6076361DC063502B36
            55B5A77123D4B1BBDCD2FF00731CB43EB8FD69BB07070FF65DA197E601707C07
            4551E0F0E6FBDCE517B13F46DEBDBFB5D0E21AF83D6A4B96E9DD7B3F27EA55FD
            4DD6CE750CB41B76B7E930FB1DB36FA7F40B7F356063F5DFAEF7F4ABBABD596C
            762E338B6D05958769B67D9E9FD1F7FEF223048DEB11C27875EEAE27D2125CCE
            1FD60C9EA3F54723AA1B3EC9958CCB37D95B5AE1BAA1BF465C1EDDB6FB54FEA1
            F51EABD53A21CEEA76FAD65B6BC5676B58031BB59A7A6D6FF84F51452898920E
            E12F46921332F16C2F6D7756F757FCE06B812DFEBC1F6A93AEA59B77D8D6EFD1
            924099FDDFDE414CD250B2DAAA8363DAC9D06E204FDE9DF632B617D8E0C63752
            E71803E24A4A64921D59145CCF529B1963072E638387F9CD4DF6AC6151BBD667
            A434366E1B41FEBCED494D6EA2C9A8AF05FAD759675DCA3FBEF27EE25BFF007D
            5EFF009603AA246A089057857D74AE3AA3DFE365ADFB9D3FC53E22E133DB84B0
            E49565C43F7B8E3F8717FDCBFFD2C4FF0017F6CDD751FF000953C7CC96B97B82
            F03FA8576CEBCCABB5C00F9B5CC7AF7C52CE578B10EDC43F16B61870F31CC1FD
            FF006E5FF3785F32A3A6B7EB0FD63EB607BB6B2E7527F96D736AC7FF00A9557E
            AEF4CBFAD5F70CA25D4F4EC57B581DC35D0F1455FD9B1CFB3FB0BD23A7743E95
            D32DB2EC1A05365DA58E0E71275DDF9EE77E7145C4E998185EBFD9696D5F6A79
            B2F89F738FD23AA90F33A111076023E1FBCCFC2F07F56F20BFEA4F5AC73FE083
            9C3FB6C1FF00A4D56FABBF577ABF59E9560C7CFF00B3E11B4B2CC73B88738063
            B796361AEFCD5DE637D5BE8B8B8F918D8F8C194E580DC86073C87013FBCEFE57
            E6AB1D3BA5E074BA0E3E0D429A9CE2F2D049F71006EF7977EEA47981EBE11ACA
            4242C2B876B792FAD58957D5BFA8AFE9D43CBDD91636B7D8742E2F3EADCEDBFD
            4AB62A1F59AFCCE89F533A3F49C779A9D96C8C8B1A60C40BACAF70FDFB2EF7AE
            EBAAF48E9FD6317EC9D42A1753B83C092D21C340E6B985AEFCE55B23EABF44C9
            E9ECE9D918E6DC6ADDBD81EF7B9ED746DDCDB9CF36FD1FE5AAE492493B95CF19
            F5C7A56150FE81F57F02A632CB5C058F6001CE0E35D5BAC70F73BD477A967B95
            AFF19D8F8AE6F4BC3A2A60CCC9B7632D021CD6340A98CDDFB9BEE5D2D9F53BEA
            ED8DA43F1373B1FF009AB3D4B3D41F1BBD4F55FB63DBB9FEC597F597A75B7753
            C0C7B7A37ED0E8F4323D6A5EE17D6E3A3B6EDB6B7398DD95FF005D05399F5A2B
            6E7FD6FE83D13D4F5998AD63AED64C83BDFBFF0096EAB1D3F55CDCBCFF00F181
            5F4FB293938F80CDF461178631F66C16FACFF53D8FFA7FF81AD0FAB5F562FAFA
            EE475FCCC7186C835E061C873D8C8D9EB5EE697FE95ECFE5BFF9CB16E753FAB5
            D1BAA64332B2E8FD6AA0032FADEEAEC00703D4A5CC724A717A1FD5DA7A75FD5F
            2BA93E87BB2C7AD7F4EAB5AAAAE5F7377B5DB77FD1FF0046B9CFAA5F5519F587
            A06739F69C56DD920D040DCC6EC1BAC8A37319EEF53D3DEBD0E9E8DD369C3BB0
            ABA4368C8045FEE7173F70D8EF56E73BD67FB7F9689D3BA660F4BC56E2605428
            C7692E0C049D5C773B5797392531C6C1660F4DA3098E73D98F5B6A6B9DA921A3
            6CB978C7D76AE6FC877EE64BBEE25E17B8BC4B4AF19FADF5EFB3A80F0B1EE1FD
            97EE563046E1947F55A5CE4F872F2C7FD67E6FFFD3E33EA8DDE8FD65E9EEECEB
            9AC3FDBF67FDF97D10BE68E9B78C7EA18B904ED14DD5BC9F0DAE6B97D2C08700
            E69907504704237A01D893F6AD11F51977007F8BC5FF007CBA492482E5249249
            294924924A5249249294A2E7B58D2F790D6B752E26000AB754EA58DD2F06DCDC
            9315D426072E2746319FCA7B970A28EADF5A6BBBABF56BDD85D171C3AC15B013
            2C60DCFF004ABFF09B5BFE1DFF00F5B52431F1032278623AFF000412F66FFAC9
            D018FD8EEA18FB87FC234FE45771F271B2AB16E35ACBAB3C3EB7070FBDAB98E9
            DF53BEA7676236EC32ECBA9E34B9B6927E7B36EC77F2762A5D47EA667F4727A8
            FD5BC9B43EBF73B1C9971039DB10DBBFE2AC627706296919907FAC3D2AB3D9EE
            1DC15E41F590076666B0FE75968FBCB9775D0FEB755D57A7B9D68156651EDBEB
            1C7F26C64FE639799FD62EA0DF5F2AD07E958FD9E64930A5E5FD1EE096941A1F
            108199C023BF117FFFD4F345EC5F51FEBDE1BBA4E2E0F56B3D1B29ADB5D79067
            6B9ADF635B61FCCB1B1F4978EAD0E9D9BE937D17986CCB4FF052621027867B1D
            8F8A0DF47E876751E9EF687332A9734F0458D23F2A97DBB0BFEE455FE7B7FBD7
            82FDA1BDC04C725BE0A6FBB47F7FF04711ECFBD7DBF07FEE455FE7B7FBD31EA5
            8039C8AFFCF6FF007AF0376501E0105D9B58FCE09A70407E9FE0AE23D9FA07F6
            A74EFF00B9357F9EDFEF507759E94DE72EAFF382F9F1D9F5F99F80427677837E
            F4C30C63F4FF0004D9ECFD0C7AEF471CE655FE70513F58BA20FF00B5957DEBE7
            8766587800281C8B4FE747C026110EE4FD15ABEB9F5D3A8D5D63A8F4BE918768
            7D37581CF734E9B9CEF49BFE633D45D575BA2AC7FAB19F452D0CAAAC3B58C68E
            0015B805E23F55FA81C5EA34E43C971C7B596C1FDD69F7AF6EEB97D577D5BEA0
            FADC1CC7E1DAE6B87041ADC414FC9FCDE3AF975FF194372F8C74DEABD47A5DC3
            23A7E43F1ECEFB4FB5DE56567D967F6D7A0743FF0019D8B7B5B475A60C6B7819
            35826A3FD766AFABFE9B1715D0BEAC757EBAF030AA8A0187E4D9EDA87F6BFC23
            BF915AF44E93F52FA2F42AC5F60FB666B75F5ED1A34FFC0D5AB6BFEB7F38A24B
            C57D70C97F46EB97E560102BCCABD4DA346FBF471D3F96DF5570D91936E43F75
            867C0760BA9FF181D45997D5AC0C322968AA7F9525EFFF00AA5C8A93248D445F
            416B7863C5C55A8D017FFFD5F344924925336DD6B440718F048DB69E5C54124E
            F5575A568BC93CA64924D5292492494A492492524A2E7D360B19C8EDE21773F5
            73EBC8C7C33D3B3DA72701ED2C2DE5CC6BB47D6E6FE7D4B8253ABE98FA5FD9E5
            4B0BE0375C17D7F7BFAA83BF8BED34FD7CE82CA1ACAAF654C6086D61A5B03F74
            336AE77EB0FF008C26DB53AAE9E4C9D0DEE1007F51AEFA4E5C28E3F3BE7CAAB9
            1F4BF3BFB5FC101C17A5FF0085F2AB5564DEEB9E5C493A9327924FE71414924D
            9DF11E2DD21FFFD9FFED137A50686F746F73686F7020332E30003842494D0425
            000000000010000000000000000000000000000000003842494D03ED00000000
            0010012C000000010002012C0000000100023842494D042600000000000E0000
            00000000000000003F8000003842494D040D0000000000040000001E3842494D
            04190000000000040000001E3842494D03F30000000000090000000000000000
            01003842494D040A00000000000100003842494D271000000000000A00010000
            0000000000023842494D03F5000000000048002F66660001006C666600060000
            00000001002F6666000100A1999A0006000000000001003200000001005A0000
            0006000000000001003500000001002D000000060000000000013842494D03F8
            0000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8
            00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040800000000
            0010000000010000024000000240000000003842494D041E0000000000040000
            00003842494D041A0000000003430000000600000000000000000000006A0000
            008000000007006D0070006C0061007900650072000000010000000000000000
            0000000000000000000000010000000000000000000000800000006A00000000
            0000000000000000000000000100000000000000000000000000000000000000
            10000000010000000000006E756C6C0000000200000006626F756E64734F626A
            6300000001000000000000526374310000000400000000546F70206C6F6E6700
            000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E6700
            00006A00000000526768746C6F6E670000008000000006736C69636573566C4C
            73000000014F626A6300000001000000000005736C6963650000001200000007
            736C69636549446C6F6E67000000000000000767726F757049446C6F6E670000
            0000000000066F726967696E656E756D0000000C45536C6963654F726967696E
            0000000D6175746F47656E6572617465640000000054797065656E756D000000
            0A45536C6963655479706500000000496D672000000006626F756E64734F626A
            6300000001000000000000526374310000000400000000546F70206C6F6E6700
            000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E6700
            00006A00000000526768746C6F6E67000000800000000375726C544558540000
            00010000000000006E756C6C54455854000000010000000000004D7367655445
            585400000001000000000006616C74546167544558540000000100000000000E
            63656C6C54657874497348544D4C626F6F6C010000000863656C6C5465787454
            45585400000001000000000009686F727A416C69676E656E756D0000000F4553
            6C696365486F727A416C69676E0000000764656661756C740000000976657274
            416C69676E656E756D0000000F45536C69636556657274416C69676E00000007
            64656661756C740000000B6267436F6C6F7254797065656E756D000000114553
            6C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F75
            747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E670000
            00000000000C626F74746F6D4F75747365746C6F6E67000000000000000B7269
            6768744F75747365746C6F6E6700000000003842494D04110000000000010100
            3842494D0414000000000004000000013842494D040C000000000DD100000001
            000000800000006A0000018000009F0000000DB500180001FFD8FFE000104A46
            494600010201004800480000FFED000C41646F62655F434D0002FFEE000E4164
            6F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F
            0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E1414
            0E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108006A008003012200021101
            031101FFDD00040008FFC4013F00000105010101010101000000000000000300
            01020405060708090A0B01000105010101010101000000000000000100020304
            05060708090A0B1000010401030204020507060805030C330100021103042112
            31054151611322718132061491A1B14223241552C16233347282D14307259253
            F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3
            F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6374757
            67778797A7B7C7D7E7F711000202010204040304050607070605350100021103
            213112044151617122130532819114A1B14223C152D1F0332462E17282924353
            15637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3
            D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627
            37475767778797A7B7C7FFDA000C03010002110311003F00F34493B5A5C435A0
            9274006A495BFD3BEA1FD6AEA31E860B9AD709DD6B9B5C0FE536C707FF00D14A
            8A090373BBCFA4BD071FFC4D75D780723371AA9E4377BC8FFA15AD1A7FC4C56D
            03D6CF2F3DF60D9FF54DB51A4BE5A92F61A3FC53F4BA796B6E3E3658FF00C958
            ADAAED3FE2FF001B1F5A31F11A7C4B4B8FF9CF6B9C8888FDE087C52BAADB4EDA
            98E79F06824FE0AED1D03AD647F3585711E2E6168FF3ACDAD5ECE3EABF52608A
            ACA183C0070FC8C5077D56EB278C8A3FE9FF00E4138421D66AB3D9F2AABEA475
            FB237D75D20FEFD8DFFD17EA2BD57F8BFC8D3D7CEA99E218D73FFEABD25E80FF
            00AA1D71DC64D1FF004FFF002082FF00A93D75DFF6AF1FFE9FFE413C43175922
            CF6791ABEA3F46AFFA4655B69FE4ED60FC962B557D5EFAAF8FAFA06E3E363DC7
            FE882D6ADF77D42EBAEFFB578FFF004FFF0020867FC5E75B3FF6AF1FFE9FFE41
            3C0C03F482BD4E630744C7FE630E861F10C6CFF9C46E54BA90E9B98C22DA2B71
            3F9C1A0387C1EDF72DD3FE2E3AD1FF00B578FF00F4FF00F20A2FFF0016FD6434
            91958E7CA5FF00F90520383F7823D4F99751C218B6FE8C9754EFA24F23F92E54
            D751F59BA2F51E98C7559B56CEEC783B98E8FDD785CBAAB9A318CBD3F29D42E0
            74D5FFD01FD48E878D8180CEAB90C0FCCC81BAA2ED7D3ACFD0D9FF000967D2DC
            BD4B0E81463B1B1EE20179F12579EE35E1D8B8A2BFA0595EDF843617A42B5CC4
            3DB86303AD92E7F2398E6CB9A52FD0A03FABC5C5FF007ABA4924AABA0A492492
            5292492494A4924925292492494A4C784E924A79BFACDD3A8CFC3BB16E00B2D6
            96CC4ED247B5EDFE5317835D53A9BACA5FF4AB7163BE2D3B4AFA23AB32584AF0
            2EB95FA5D67359E17D91F02E25255EB4FF00FFD11FD5EB7D6E9780EE7DAD61FE
            C9F4FF00EFABD6578D7D48B3D4E9D5B0FF0083BCB7E44B5FFF007F5ECAAD7332
            BC784FF54FFDCB9DF0F87067E6C7F5C7FDDA925C17D6AFADDD5BA77D6076361D
            C063502B3655B5A77123D4B1BBDCD2FF00731CB43EB8FD69BB07070FF65DA197
            E601707C074551E0F0E6FBDCE517B13F46DEBDBFB5D0E21AF83D6A4B96E9DD7B
            3F27EA55FD4DD6CE750CB41B76B7E930FB1DB36FA7F40B7F356063F5DFAEF7F4
            ABBABD596C762E338B6D05958769B67D9E9FD1F7FEF223048DEB11C27875EEAE
            27D2125CCE1FD60C9EA3F54723AA1B3EC9958CCB37D95B5AE1BAA1BF465C1EDD
            B6FB54FEA1F51EABD53A21CEEA76FAD65B6BC5676B58031BB59A7A6D6FF84F51
            452898920EE12F46921332F16C2F6D7756F757FCE06B812DFEBC1F6A93AEA59B
            77D8D6EFD1924099FDDFDE414CD250B2DAAA8363DAC9D06E204FDE9DF632B617
            D8E0C63752E71803E24A4A64921D59145CCF529B1963072E638387F9CD4DF6AC
            6151BBD667A434366E1B41FEBCED494D6EA2C9A8AF05FAD759675DCA3FBEF27E
            E25BFF007D5EFF009603AA246A089057857D74AE3AA3DFE365ADFB9D3FC53E22
            E133DB84B0E49565C43F7B8E3F8717FDCBFFD2C4FF0017F6CDD751FF000953C7
            CC96B97B82F03FA8576CEBCCABB5C00F9B5CC7AF7C52CE578B10EDC43F16B618
            70F31CC1FDFF006E5FF3785F32A3A6B7EB0FD63EB607BB6B2E7527F96D736AC7
            FF00A9557EAEF4CBFAD5F70CA25D4F4EC57B581DC35D0F1455FD9B1CFB3FB0BD
            23A7743E95D32DB2EC1A05365DA58E0E71275DDF9EE77E7145C4E998185EBFD9
            696D5F6A79B2F89F738FD23AA90F33A111076023E1FBCCFC2F07F56F20BFEA4F
            5AC73FE0839C3FB6C1FF00A4D56FABBF577ABF59E9560C7CFF00B3E11B4B2CC7
            3B88738063B796361AEFCD5DE637D5BE8B8B8F918D8F8C194E580DC86073C870
            13FBCEFE57E6AB1D3BA5E074BA0E3E0D429A9CE2F2D049F71006EF7977EEA479
            81EBE11ACA4242C2B876B792FAD58957D5BFA8AFE9D43CBDD91636B7D8742E2F
            3EADCEDBFD4AB62A1F59AFCCE89F533A3F49C779A9D96C8C8B1A60C40BACAF70
            FDFB2EF7AEEBAAF48E9FD6317EC9D42A1753B83C092D21C340E6B985AEFCE55B
            23EABF44C9E9ECE9D918E6DC6ADDBD81EF7B9ED746DDCDB9CF36FD1FE5AAE492
            493B95CF19F5C7A56150FE81F57F02A632CB5C058F6001CE0E35D5BAC70F73BD
            477A967B95AFF19D8F8AE6F4BC3A2A60CCC9B7632D021CD6340A98CDDFB9BEE5
            D2D9F53BEAED8DA43F1373B1FF009AB3D4B3D41F1BBD4F55FB63DBB9FEC597F5
            97A75B7753C0C7B7A37ED0E8F4323D6A5EE17D6E3A3B6EDB6B7398DD95FF005D
            05399F5A2B6E7FD6FE83D13D4F5998AD63AED64C83BDFBFF0096EAB1D3F55CDC
            BCFF00F1815F4FB293938F80CDF461178631F66C16FACFF53D8FFA7FF81AD0FA
            B5F562FAFAEE475FCCC7186C835E061C873D8C8D9EB5EE697FE95ECFE5BFF9CB
            16E753FAB5D1BAA64332B2E8FD6AA0032FADEEAEC00703D4A5CC724A717A1FD5
            DA7A75FD5F2BA93E87BB2C7AD7F4EAB5AAAAE5F7377B5DB77FD1FF0046B9CFAA
            5F5519F587A06739F69C56DD920D040DCC6EC1BAC8A37319EEF53D3DEBD0E9E8
            DD369C3BB0ABA4368C8045FEE7173F70D8EF56E73BD67FB7F9689D3BA660F4BC
            56E2605428C7692E0C049D5C773B5797392531C6C1660F4DA3098E73D98F5B6A
            6B9DA921A36CB978C7D76AE6FC877EE64BBEE25E17B8BC4B4AF19FADF5EFB3A8
            0F0B1EE1FD97EE563046E1947F55A5CE4F872F2C7FD67E6FFFD3E33EA8DDE8FD
            65E9EEECEB9AC3FDBF67FDF97D10BE68E9B78C7EA18B904ED14DD5BC9F0DAE6B
            97D2C08700E69907504704237A01D893F6AD11F51977007F8BC5FF007CBA4924
            82E5249249294924924A5249249294A2E7B58D2F790D6B752E26000AB754EA58
            DD2F06DCDC9315D426072E2746319FCA7B970A28EADF5A6BBBABF56BDD85D171
            C3AC15B0132C60DCFF004ABFF09B5BFE1DFF00F5B52431F1032278623AFF0004
            12F66FFAC9D018FD8EEA18FB87FC234FE45771F271B2AB16E35ACBAB3C3EB707
            0FBDAB98E9DF53BEA7676236EC32ECBA9E34B9B6927E7B36EC77F2762A5D47EA
            667F4727A8FD5BC9B43EBF73B1C9971039DB10DBBFE2AC627706296919907FAC
            3D2AB3D9EE1DC15E41F590076666B0FE75968FBCB9775D0FEB755D57A7B9D681
            56651EDBEB1C7F26C64FE639799FD62EA0DF5F2AD07E958FD9E64930A5E5FD1E
            E096941A1F108199C023BF117FFFD4F345EC5F51FEBDE1BBA4E2E0F56B3D1B29
            ADB5D790676B9ADF635B61FCCB1B1F4978EAD0E9D9BE937D17986CCB4FF05262
            1027867B1D8F8A0DF47E876751E9EF687332A9734F0458D23F2A97DBB0BFEE45
            5FE7B7FBD782FDA1BDC04C725BE0A6FBB47F7FF04711ECFBD7DBF07FEE455FE7
            B7FBD31EA58039C8AFFCF6FF007AF0376501E0105D9B58FCE09A70407E9FE0AE
            23D9FA07F6A74EFF00B9357F9EDFEF507759E94DE72EAFF382F9F1D9F5F99F80
            427677837EF4C30C63F4FF0004D9ECFD0C7AEF471CE655FE70513F58BA20FF00
            B5957DEBE78766587800281C8B4FE747C026110EE4FD15ABEB9F5D3A8D5D63A8
            F4BE9187687D37581CF734E9B9CEF49BFE633D45D575BA2AC7FAB19F452D0CAA
            AC3B58C68E0015B805E23F55FA81C5EA34E43C971C7B596C1FDD69F7AF6EEB97
            D577D5BEA0FADC1CC7E1DAE6B87041ADC414FC9FCDE3AF975FF194372F8C74DE
            ABD47A5DC323A7E43F1ECEFB4FB5DE56567D967F6D7A0743FF0019D8B7B5B475
            A60C6B781935826A3FD766AFABFE9B1715D0BEAC757EBAF030AA8A0187E4D9ED
            A87F6BFC23BF915AF44E93F52FA2F42AC5F60FB666B75F5ED1A34FFC0D5AB6BF
            EB7F38A24BC57D70C97F46EB97E560102BCCABD4DA346FBF471D3F96DF5570D9
            1936E43F75867C0760BA9FF181D45997D5AC0C322968AA7F9525EFFF00AA5C8A
            93248D445F416B7863C5C55A8D017FFFD5F344924925336DD6B440718F048DB6
            9E5C54124EF5575A568BC93CA64924D5292492494A492492524A2E7D360B19C8
            EDE21773F573EBC8C7C33D3B3DA72701ED2C2DE5CC6BB47D6E6FE7D4B8253ABE
            98FA5FD9E54B0BE0375C17D7F7BFAA83BF8BED34FD7CE82CA1ACAAF654C6086D
            61A5B03F74336AE77EB0FF008C26DB53AAE9E4C9D0DEE1007F51AEFA4E5C28E3
            F3BE7CAAB91F4BF3BFB5FC101C17A5FF0085F2AB5564DEEB9E5C493A9327924F
            E71414924D9DF11E2DD21FFFD9003842494D0421000000000055000000010100
            00000F00410064006F00620065002000500068006F0074006F00730068006F00
            700000001300410064006F00620065002000500068006F0074006F0073006800
            6F007000200037002E003000000001003842494D040600000000000700080000
            00010100FFE11248687474703A2F2F6E732E61646F62652E636F6D2F7861702F
            312E302F003C3F787061636B657420626567696E3D27EFBBBF272069643D2757
            354D304D7043656869487A7265537A4E54637A6B633964273F3E0A3C3F61646F
            62652D7861702D66696C74657273206573633D224352223F3E0A3C783A786170
            6D65746120786D6C6E733A783D2761646F62653A6E733A6D6574612F2720783A
            786170746B3D27584D5020746F6F6C6B697420322E382E322D33332C20667261
            6D65776F726B20312E35273E0A3C7264663A52444620786D6C6E733A7264663D
            27687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264
            662D73796E7461782D6E73232720786D6C6E733A69583D27687474703A2F2F6E
            732E61646F62652E636F6D2F69582F312E302F273E0A0A203C7264663A446573
            6372697074696F6E2061626F75743D27757569643A66393439613966612D6539
            66372D313164642D623265372D666436343262653935636630270A2020786D6C
            6E733A7861704D4D3D27687474703A2F2F6E732E61646F62652E636F6D2F7861
            702F312E302F6D6D2F273E0A20203C7861704D4D3A446F63756D656E7449443E
            61646F62653A646F6369643A70686F746F73686F703A66393439613966352D65
            3966372D313164642D623265372D6664363432626539356366303C2F7861704D
            4D3A446F63756D656E7449443E0A203C2F7264663A4465736372697074696F6E
            3E0A0A3C2F7264663A5244463E0A3C2F783A7861706D6574613E0A2020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020202020200A
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020200A202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020200A20202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020200A2020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020200A202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020200A20202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020202020200A2020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20200A2020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020200A202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020200A20202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020200A2020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020200A202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020200A20202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            0A20202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020200A2020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020200A202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020200A20202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020200A2020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020200A202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020200A20
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020200A20202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020200A2020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020200A202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020200A20202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020200A2020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020200A202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            200A202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020200A20202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020200A2020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020200A202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020200A20202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020200A2020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020202020200A
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020200A202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020200A20202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020200A2020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020200A202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020200A20202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020202020200A2020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20200A2020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020200A3C3F787061
            636B657420656E643D2777273F3EFFEE000E41646F626500644000000001FFDB
            0084000101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010101020202020202020202020203030303030303
            0303030101010101010101010101020201020203030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            03030303FFC0001108006A008003011100021101031101FFDD00040010FFC401
            A20000000602030100000000000000000000070806050409030A0201000B0100
            000603010101000000000000000000060504030702080109000A0B1000020103
            0401030302030303020609750102030411051206210713220008311441322315
            09514216612433175271811862912543A1B1F02634720A19C1D13527E1533682
            F192A24454734546374763285556571AB2C2D2E2F2648374938465A3B3C3D3E3
            293866F3752A393A48494A58595A6768696A767778797A85868788898A949596
            9798999AA4A5A6A7A8A9AAB4B5B6B7B8B9BAC4C5C6C7C8C9CAD4D5D6D7D8D9DA
            E4E5E6E7E8E9EAF4F5F6F7F8F9FA110002010302040403050404040606056D01
            0203110421120531060022134151073261147108428123911552A162163309B1
            24C1D14372F017E18234259253186344F1A2B226351954364564270A73839346
            74C2D2E2F255657556378485A3B3C3D3E3F3291A94A4B4C4D4E4F495A5B5C5D5
            E5F52847576638768696A6B6C6D6E6F667778797A7B7C7D7E7F7485868788898
            A8B8C8D8E8F839495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEA
            FAFFDA000C03010002110311003F00D1FF00DFBAF75EF7EEBDD7BDFBAF75EF7E
            EBDD7BDFBAF75EF7EEBDD3F6036B6E7DD75631FB5F6E67B7257B7E9A2C062321
            98AB6B9B714D8EA7A998F3FED3EEE91BC8688858FC857AD120713D19BD8FF01F
            E6976294FEEA7C61EE6A98642812BB2DB1F31B5B16DAEFA4AE5B754185C615E3
            93E5B28FADBDAF8766DD6E3FB2DBE63FED481FB4D075469A25E320FDBD1B6DA9
            FC91FE7C6E134ED99D99B0360433E92D36F0ECEDAD27DBA30BEA9E9F6854EECA
            C52A3EAA232C2F622FECDA1E4EDFA5A56D5501FE265FF2127A64DE5B8FC55FCB
            A34DB67FE13FBBF4C703F61FCA3EAFDB6E403530ED2DA7B937908BE9AD619F2F
            5BB1C4C579E4A2036FF1F67307B7BB9494F16E917EC566FF000E9E996DC621C1
            4F464F6AFF0023EF86FB61524EC7EFBEDBDEF531A0F245B797686C6C74B28B6A
            260A8C56EFC808C906CAB54A7FDABFA9EDB7B66869E35C4AFF00600BFF004174
            9DB733F8540FE7FE6E878DADFCBE3F95FF0059C86A64EA8AADFB5B18012A7B03
            7E6EACD460AB0376C563F2987C14BAADCEBA46E38FA7B105A7B6960A41368CE7
            FA4C4FF2141D277DCE43F8C0E85FC4D3FC23EB46326C2F8E7D19B7EB110AC791
            A4EB9DA7365540E38CAD6636A725C91FF1D7D89ACF902D2120C7B7440FAE804F
            ED209E92BEE0E78C87F6F45ABE47D2FC6BEE8C36429B75F54EC0C8CD34332459
            7A6DBD8BC56E1A22F1B4624A0DC18BA7A4CBD24A97B8D1301702E0FD3D9F7F50
            369DC10C17FB644CA452A142B0FB1968C3F6F4C7EF09A33AA3948FCF1FB0E3AD
            677E4474AC1D47BA0B6DEABAAC9EC9CC4F50705575BE36AFA2788EA931392922
            48E29A78A360D1CCA88268EE7486560203F71390A6E4ABF85A194CBB45C57C36
            3F12B0F8A37A506A0082180019734043007FB75F8BD8DB50A4CBC4791F98FF00
            563A2EFEE39E8CBAFFD0D2228E8AB323574B8FC7D254D7D7D6D4434945454704
            B555757555122C505352D340AF354544D2B0544452CCC40009F7B0092001527A
            D332A82CC4050324F9756E1F1EBF9117F34EF92EF8E7D83F16371E0F1B91A383
            2232FD99B8B68F5B41438FA90A60ABC9633766731FB928A3951AE8AD43E571FA
            549F6693EC9B9DA5B25E5E5B186DDBE12E4296FF004AA4EB3F92E3CFA0E59737
            72FEE7B84BB5ED5B82DD5EC7F188433AA0AD2AF201E1AE7197049C004E3AB8CD
            87FF0008D5F9CD988286A3B13E4D7C5FD906A12392B68B6FB7676F9AFA0D68AC
            F09136CADA38FA99E26255B454F8C91E9722C7D96A08C9FD46603E401FF091D0
            8CD7CBA39FB4BFE119181A18A9FF00BF5F2E32DB96A1429AA3B570749B369E53
            7F52C2995C06F89A116FA12EFF00F11ECCA21B20A78EF74DFE95635FF0B374D9
            F1FF00084FE7FE61D1B1D95FF093CF8BBB312335987DBDD87571A8B566FF00EC
            AED072CC2C75C943B471FB5712F7B7D1A9CADBF1ECDA0BAE508BFB4DB6EA43FD
            261FF3EB2F4CB25E1E12A0FCBFD8E8CEECBFE403D71D66E26D81D3DF0FB13588
            55A2C964B66E577165E129CA98B2FB8F6AE6727158F274CC2E793ECE2DB7FE4F
            B6CA6C5257FD2C6C7F6B313D32D6F78DC671FCFA1BA0FE57FF0023B0F4E68F6B
            6F1E81DBD49C05A5C5D2EE9C65380BF41E0A0DA3147C7FADECEA1E7AE5A84517
            6BB903E4231FF3F74C1B0B93C655FE7FE6E92D94FE577F332B357DB76F746457
            BDB5D4EFE16FF92769B7B5E9EE2F2C252BB45E1FF9C7FF00417543B75D1FF464
            FE7FE6E832CB7F287F9C7902DE3EF1E8388126D7A9EC5FCFFADB40FB5D17BA1C
            A89C763BC3F9C5FF004174D9DAEECFFA3A7F3FF3741AE53F9267CEBC8963FE9F
            FE3FA06BFD6A7B2BF3FEB6CFF6BE3F77794E3FF9605EFED8BFE82E9B3B45D9FF
            00474FE7FE6E90190FE429F39EBAFABE437C7C173F9A8ECDFF0088D9DED6A7BD
            1CA89C397EF7F6C5FF00417543B2DD9FF8909FCFFCDD23EAFF00E13CBF372AC9
            327C87F8F26F7FACDD9A7EBFF9277B54BEF972B2F0E5EBDFDB17FD05D50EC574
            7FE2427F3FF374C537FC271BE67CE4993E427C7824FF00CDDECDFF00EC3B9F6F
            0F7E396470E5FBDFDB17FD05D6BF70DD7FCA427F3FF374C599FF0084DFFCCC8B
            1D532C5DEFF1D6BA58E2768E91EB3B2E99677552563350DB227116A22D7D0C3D
            BB1FBF5CB3AA8DB1DF28F5FD234FCB58FF000F5A3B05D7FBFD09FCFF00CDD6B5
            FF00CCB3E16FC87F8AD88CDED2EF9D8151806918E476C6E9C655C19FD99B8A4C
            354453554982DC543780D4AE3E472F4B5294D5B1C6F76840E7DA3E75DFF63E76
            E4EDDE6DA2E84AF005974905648CAB0A92873F0971A8557273D5ECADE7B1BD84
            4C940D515F2351EBF6D3AA28F78C1D0A3AFFD148FF00243F841D67F1D3A236CF
            CBDECCDBB89DC7DF5DB98A5DC1D7D5196A58AB5BAC3AEF2484600EDE86AE0D38
            FDD7BC2888ACAAAF8FF79286A21A689D14D489B23BDB0F6F3C4B2B5DEAEE106E
            EE06A4A8FECE33C08AF0671DDABF84802956AE067DE1FDF3106EFB8F296DB765
            36CB26F0E6D268669C7C6AD4398E23D810D019031606894DF57A736353EC1D81
            80C51855731558FA4C96E4AA6402A2AF39594E93D6F95F9668E925730C2B7B24
            4807D6E4C27CD5BC49BD6F57B73AEB6AAECB10F211A9A2D3E6C3B98F9927ACB8
            F6E395A1E53E51DA36FF00080DC5E1492E1A9DCD3BA867A9F4427420F2551E75
            A8A3EC3BD0EFAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BA
            F7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAC1529E48245FEAA7DFBAF754BFFCCB
            FE39ECAF913D39D8FD43BE68A9A5C2EFCDB598C2C55F351C75B3EDDCB5650D44
            387DD38C8A478F4E576EE4244AA80874D4D1E863A19817EDEEA7B47692DE42AC
            C8CA69E6AE0AB29F5041208EAACAAE00615CD7F31D7C94B796D6C96C7DDFBAF6
            56644632FB3F726736BE5444498864B6FE4EAB135DE2240263FB9A46D24FE3DB
            1D5BAFFFD2315D6DBEA9327D59D1D4DB75D63C04DB23ABE3C1C5190B04788970
            5825C6C68AB7558E3A3280017B016F7D3BE53DAECC72CEDB756E83E9DB6E8D96
            9FC3E082BFCA9D7CF07B97CC3BA3FB81CC1B75F4A7EB937CB88E4A9FF44174EA
            F5FF006D5F2EB76B8C59107F4451FED80F7CC56F88FDBD7D0EA61547CBAE7EF5
            D5BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEB
            DEFDD7BAF7BF75EEBDEFDD7BAE9B9520FF0043FEF5EFDD7BA211F2C310D361EA
            6655E4231FC1FC1E7FDBFBF75EEBE445F37B6EBED4F989F28304DE4D34BDEFDA
            334065FD6D4B91DE196C951BB1B0BEBA5AC437FCDEFED65F5A3595C98181AE84
            61F6488AEBFC987457B36E71EEF622F62229E2CD19A7F1433490B8FC9A320FCF
            AFFFD346FF002F6DC9FDF5F8B9F1532066354F16DFDA7B66537B9F2ED3DC0DB4
            DA13CDC320C385FF0061EFA59ED5EE02FBDA6E5FBAD7565DB5E327FE68F8917F
            2D1D7CFDFDE3F643B47DE6F9E36D1110926FD1CE07A8BBF06E6BF9998F5F42AF
            7CD3EBE813AF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7
            BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BA2B3F23713F79B6E
            B0E9B91139FA7D383F4FE9EFDD7BAF921FF359DBF2E13E74F7B54BC6123CF6F0
            CDE4E2603893EDF3995C1CA7FE0C26C4107FC2DEC77CFF0060D67B86C5315A2D
            C6CF6320F9D2DD223FCE33D433EC96F31EE9B1F38DAABD64B0E6ADE2061E9AAF
            A5B851FEF338FE7D7FFFD4283FC933707F783E3A6D1C1CB3F91B6977F56E0A38
            F502D4F4991AFDA9B91142F2555AA73B330B8B124FBCEBFBBFEE0D3FB4DBCC05
            AA6DA7BB503D0342928FC8B3B7F3EB8D7F7DAD912CFEF35CA97AB1E95DC2CB6E
            918D38B25CCB6E4FCC848907D8075F4B6F7829D7653AD48FF9A87F36DF95FF00
            193E7FE67ABBA53B2A971FD4BD5D8CEA8A8DDFB0DB66EC6CBA6E4CAD75152EF1
            DDF8B97706636DE4B71D0B65B6FE5A9E8C9A7AA8CD3B5DA30AE093933EDCFB67
            CB5CC1C9516E3BB6DE5B73B8698249E248BA14128874AB843A5816C835F3C741
            8DCB74B9B7BD31C327E9285A8A0CF99CD2BC3A38BFCE23F9A5EEDF8FDD25F1AD
            FE27760D0603B0BE4252D0F6B516E64C2EDCDD525074CC78386A29A65C7EE3C6
            E6B08B26E9CDE729618E430BC8AB435210A917F616F6B7DBAB6DEF77DFC732D8
            B3D8D893094D4E959F550E54AB762A924569DCB5E95EEBB8BC10DBFD33D24933
            5C1EDA7CF1927A557C7BF9DBDF5DA3FC95FB67E54E4B7CA4FF0022BADB68F75D
            1CDBF976D6D4807F7A766E72BAA36FE50ED8830A9B50B536DFAFA14311A2F0CA
            535BA12C494DBE726ECDB77BB3B6F2E47674D8AE2580F87ADFE0751A86BD5AF2
            C1B3AAA3803D5A0BD9A4DA65B92FFAEA1B341C41F4A5387CBAA8AEBCF9CBFCED
            77FF00C57EC5F9A9B57E406CACBF4BF4F6E3ACC0EF7A7C96C4E9BA6DCD14F8A8
            76E54E46AE0DBC9D6D4DFC4B114D0EE9A4690C55D14E57C8517D1CC9B7BC9FED
            259731D8F29DCEC92AEED751868C8927299D4002DE29A31D0D4AA91C2BC7A2B8
            EF37792DA4BB59C1850D0E16BE5E54F9F5735D3DF3FF00B1BE4DFF0028DEDFF9
            6B55BD64E82EE0E99DA5DAADB9F786C6DBBB5771E36A777F51607FBC549538DD
            AFD8588DCB87388DF549514295146C0CD04B532474F5119547102FB8DCAB0727
            F335C6D567333D9346B2C7ABE20AF5ED63E654822B415143C7A10ED9766F6D92
            575A3D483F68F3E947FC887E44FCA6F965F09EB3E407CAEEC29BB03766F4EDDD
            ED8ED9753FDD1DA1B3E871BB1768D3E176EA414145B430181A5AD8EA37651E55
            9AA2659646B05D565B7B020E97B000D00EADA30BDABD5FB96B370E3F6E7646C2
            CFD7ED10CDBAE870BBC36F656B36C2A33A3B6E1A6A1C8CF361423C6C09A958AC
            548FC1F7BEABD3C64F79ECFC28C3366775EDAC4AEE39A0A6DBCD93CEE2E8067A
            A2A951A9A9F0C6AAAA21949AA165531A41AD9C30B0371EFDD7BACB9FDD9B576A
            252CBBA372EDFDB71574C69E864CFE671D874ACA81A018295F23534EB5130322
            FA52EDEA1C723DFBAF752F379DC26DAC556E7771E6315B7F098D84D4E47339BC
            85262B158FA752034F5B90AF9A0A4A5854900B48EAA2FF005F7EEBDD346D6DFB
            B1B7CE225DC1B277A6D3DE1818249229B37B5B71E1F7062219614124D1CB92C4
            D655D147245190CC0B82AA6E78F7EEBDD437ECEEB68B6C55EF693B0B63C7B371
            F50F495FBB5F7660536C5155C73253C94B579E6AF18AA6A849E45428F2AB0760
            08B903DFBAF7490ED9A5832FB5679E9A48AAA9EA28FCF4F5103A4D0CF0CD1092
            19A19632D1C91491B0656524329B83EFDD7BAF93EFF3A3DBAD45F27372E7163B
            24FD91DC58395C0FA363F7ACD5D4E8C7FC464A4207F81F7387BB7625361F6CB7
            1D387DA638C9FF00491C4E3FEAE1A7E7D61F7DD8B7959B9CFEF09B117EE8799A
            69C0FF009AB3DCC6C47FCE15AFE5D7FFD5AB6FF84FEEE86A9DDFD8BB0249388B
            B0FA5B75D0C6C4950D5B9BC861327269E6C3FC968C123FC3FC3DE55FDDD372D3
            B0FB97B5B1C0B41301FF0036A747FF009F3AE6DFDFB760D7CEBF77FE628D7B9B
            7192D5CFFCDEB49631FF00574FEDF9F5F541F78A9D7493AD19F64FC71A2FE653
            FCC6BF9A0C14E64C99C6ED0F9099DEB4C82CCA560DFDB7B7960364751CB1CB2B
            04482A64C0B44CA485FB56957DE605DEFCFC83C89EDE3376EA96D9651EB1B46D
            24DFB3557EDA740E4B71B85FEE3F20C47DA080BD00BFCBC3E32EFAF9D7BDFB1E
            9FB62A7339BD8DF10FE26F626DBDBF8DCBC32CB4BB7B3F2E1F7CD0755EC1A6D5
            198695F03BC33593CD686BCBE4C6853FD920EB9E7982CF93ACEC5B6D544BCDD3
            738998AF165D5199A43EBA91523F4EFE99B1B77BD7904A4948A2207CB8D07E44
            93F97473BF96EEFF009F35FC947F99EF5D5470DB228B74EE48559AEF1C1D81D6
            F86578C2DFD118AFDA339FF162DEC27CF964B17BB5EDEDF2FF00A31453FF0036
            E56FF238E95D8393B46E319F2CFED03FCDD01FFCBB3F975FCBAF9C5F1537951F
            59FCB683A8BE3C57F6BE636CEF5E9FC8BEF4ADC36E4DC988C3ECCCCD66E2C86D
            FC15663F09975A9A7AAA0558EA65E64A252C3D2A41BF3CF3D72C728731DA36E1
            CB26EB7C5B6578E71E186446691428660596843701C1BA66C6C6EAF2D9C4773A
            60D4415CE4E3341F97562DFCD4BAA36D7F2BAFE463B8BE3475FEE2AEDC990EDA
            EC4DB1D7FBA377E429E2C764B75E6B7BE666DF5D8593A7C652C93478FA2ABDB5
            B1A6C7414A2499A2A0088F248E1A46C61E71E69BAE70DF6E77ABA8563D4AA888
            0D42228A2AD4F13C493415249000C742AB0B45B3856156AD2A49F527A291FCCC
            77D771FC08FE4C7FCB7BE1D759EE6AFD8790EFCDA6B4BDBBBB701595786CCC74
            5360715D89BBF68D3E5E827A692928B3FBBBB2CA645D195EA68A8A4849114D28
            2173C074B168598F4D5FCE17E2A74A75FE6FF9457F2DBF8EBB0363EDDDCDBE73
            9418DDDDBAB6BE2B1F87DD5BCB07B9733B0F6456657776771C91E533D49BCB35
            3E633558F5D2CE92D5D1ABAFF9B36F1F2EBCA4F713D0EBFF000A72D83D6590A0
            F82BD2DB0BAFF65E3FBD3B7BB569B696DBDF74F8DA5A4DE1B7B62ED3A0C4EC6D
            B7B6A973B122D663F6B9DCFD8B473AC08EB1ACB41E4401D49F7E3D7909CE71D3
            37F33DDBB8FF0090DFCDDBF94AFC093BACEFDDBFD2184D8F9AECB47AD5C9D69C
            9D26569F756E797710F3544B0EE0CC6C2E9BA6A8984FFBAB1645246BABDCF8F1
            1D786158F4EBF2ABBABB5FE44FFC280F6A7C6EDC7D7793EE6EABF8B7B4E3DDDD
            4FF18F2DBEB6FF005EEC6EC2EC88FAB31DBEE2EC7DD4FBB43EDDCFBE3ABF73FD
            C53ACB4D5F3A52E153EDE16B54AB7BCFAF0C257CFA3A7F073F9776CFF8C7BD7F
            98CF6F7CA5DD1D0FB8F31DFB89AAEDBED3F85DD61511673A73A6BACE6DC5BBBB
            2B091EE8C2E728710770D6D6CF8A9E9A9AB65C363E85E1A0A858566491B47BD7
            AD135D20754B1FCA6BF952E1FF009947C04F95D5D9BDF197E94C4F62FCA0C155
            F535562B1557BAB646D68F61D02E7375AD0F57D5EE1C06DDAC932916F3870CB9
            2D71E429A9B1C208E6111A88A5D01D599A8475B9E75A749E1FA13E39756F43E0
            3319ADC785EA2EB4DA9D758CCEEE29C5566F3147B4B054985832593917F6C555
            6251EB28968E2042200AA07BB74D93535EBE655FCEBB6E0937B7706484379705
            F24F7A31900B98A9B219EDD74530BFE124A8F05FF170BEF2A7DD6B012FB49C8D
            7813BE18ACCD7D15ED8A9FC8B69FE5D736FEED5BC9B7FBCE7BC3B5996915D5CE
            EA34FABC3B8875FCC27894F957AFFFD6A2AFE42FBBCE1BE76EDADA3212D06FDC
            6E2E8A38EF60F91DBFBDF6A67E9D88B804AE3E92AC0FCFABDCDDEC5EE9F45BF7
            345931EDBBD8EED47FA68D04A0FF00BCA3FEDEB10FEF8BCBBFBDB937DBCDDD17
            F536DE6FDB5CFF00CD39E46B661F9BC919FCBAFAE61170473C8B706C79FE8472
            0FB847ACBCE8A7FC79F837F163E2A6E7DEDBCFA0FA9F1FB0374763410D36F4CC
            D3EE0DDD9CABCF43064EB3331AD41DCDB83351C04E4F2134CC6158CBBBFA8900
            0025DF39C398F992DED2D37ADCDA7B780D6352A8A16A02E342AD7000CD7A4D05
            9DB5B33BC116966E393FE53D2EFA9FE32F447461ED23D4DD6D82D923BAB7865B
            7EF672629B20D1EEADD39B8A4872590A98EB2B6AA3A186649A4D34B4820A488C
            AE63894BB128F72E60DE778FDDDFBCEFDE6FA4896386B4EC45E00500AF964D49
            A0A934EAF15BC30F89E14606B353F33D02DD6FFCB87E1775175FF7075675D748
            E376D6C1EFBC351603B6F6DC1BAB7DD652EF0C4E3A2CA43454B513E4B7456D6E
            37C1166AA943D14B4D2112D8B1D2B636BFE7CE6CDCEF76BDC6FB77692F6C9CB4
            2E5230509A54801003F08F88118E998EC2D2249638E1A238A30A9CFF003FF074
            327C76F8C3D17F13B6457F5C7C7DD8349D75B2F27B92BB775760E8B2DB833115
            46E2C950E331B5B92355B932D99AE479E8B0F4C8516511011021412C4956FBCC
            3BC732DE25FEF77A67BB58C2062AAB45049028AAA3058F9573D3D05BC36C8638
            134A135F3E3F9F4CDF2ABE21FC7BF9ADD5FF00E877E49F5FD3761EC48B3D41BA
            68281F2B9BC0D7E1F72E2E9ABE8A833987CD6DDC8E2B2D415D051652A612526D
            12433BA48ACAC47B25E9F048E1D029BF7F95F7C24ED2F8FD80F8C9D8BD4153BD
            FAA76A671773ED78376761F65EE3DE3B7370AE261C0FF15C2F6366F77D7EFCC7
            16C353A52B534790144D4E8B1184C6A146A9D6F51AD7A46673F93D7F2EDDCD43
            D67067FE3F0CA65BA89A13B1F7B4DD9DDBF0F65508A6344D450E4BB2E8F7F536
            FBCFD262CE3E1FB1A7AEC854418E54D14890212A7D4EBDA8E7A20FFCC9FE3D6E
            ADF7F263E26F5BEEEFE59E9F2BBE08F576D2A7A48BB33AAF7CEF5C77C89EA6DC
            590AA96872B4F8B930FDABB3B2B96DB78BA6C0612AE5A4AC86B64C8FEE4B156C
            5571E93EEB6381CE7A81FCB53F9636F8DBFF003A7B83F989F74F4FE37E3C6125
            C7E4760FC4FF008E736571DB877C6C7D972E2A8B6ACBD89DA398C4E5F70509DF
            9B8B6BD14C274972392C8CD5997AF9AAE72FE22FEA75E2D8A0EAD3BE4BFF002D
            9F873F2D3B076C76F770F564F2F706CDA6A4A1DB9DB3B0F7AEF8EADEC7A0A0A0
            96A66A1A26DDBD77B8B6D656B60A27AD9840677964A7595D62645660774EAA18
            8E1D09BB47E1A7C6CD8BD41D89D17B5FAD2971DD7BDBB8BCD627B5627DC1BB32
            1BBFB269F70E224C0666A37C764E4F3B59D8DB9F27598499A9056566565AA869
            AD1452246AAA3DD7AA6B5E955F1D3E357487C4CEAFC674C7C7AD8541D6DD6987
            C9667318FDB18EAFCD65218727B82BE4C9662B1EBF7064B2F95A89AB6B252C4C
            93B851655B28007BAD135E3D0BD9A884D8FA8422E0C6C3FDB8F7EEBDD7CCE3F9
            BC6DB4CB6E2F9834A22121A5EC5EC9CC43600947C16FFADCB9914F36221A27FA
            7E09F79CBCE5B70BDF64ACA329565D92D241F231471495FD8A7F2EB8E7ED46FA
            769FBDDEE9389691C9CDDB95B9F422E27B9800FF007A75FCC0EBFFD7D66BF946
            6EE5D9BFCC9BE1E5748E129F33DD3B5767545DB4A91BCEA4ED8A704F1FA6BB29
            1301F92A3D8D3DBFDC86D7CD3673B1EC921B884FFCDFB69621FF001A707A89FD
            EED81B98FDB9DD6C916B2437563743D7FC52FADAE5A9FED2261F9F5F65DF60BE
            A58EBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BA
            F7BF75EEBDEFDD7BA8393CA633098FACCBE67234388C563A9E4ABC864F27574F
            418FA1A585754D53595B552454D4B4F128BB3BB2AA8FA9F778E3926748A28CB4
            8C680004927D001927AD1200249A0E89AE57F991FC06C2E564C2E47E5FFC7D8B
            2314C6092287B336D56C0932B68646ADA1AEA9A1528C2C7F72C0FD7D8AA3E42E
            7496312C7CAF7DA08AFF0064E0FEC201FE5D2537F640D0DD257ED1D1A2D83D97
            D75DAB808775758EFCD9DD89B66A1B443B83646E5C3EE9C3BC9A431886470959
            5B4826507D485C32FE40F61DBDDBEFB6D98DB6E1672C1703F0C88C8DFB1803D2
            84923957546E197D41AF4AAC81514936A200D0DF5FF5BDA4EAFD7CE1BF98E474
            994EE6F9318693434798EC4EE2C5B86B152B90DC1B8690EAE7E9FBDEFA2B3471
            DDFB6FB1593D2936C70A1FF6F6AABFE5EB8456B3CFB67BF9CE5BBC75D56BCE17
            530A7FC2B7177FF9F7AFFFD0D397E396F683AD7E42744F62D5571C652EC2EE3E
            B2DE7559100B7D8536D8DEB84CD5456690416FB686899EC3EB6F6E432BC12C53
            467BD1811F6835E98BAB68EF2DAE2D26158A54643F63020FF87AFB855255D2D7
            D2D35750D4D3D65156D3C35747594B347514B574B511ACD4F534D510B3C53D3C
            F138647525594820907DB7D3FD48F7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7
            EEBDD7BDFBAF75EF7EEBDD7571FD47FB7F7EEBDD005F27BE4875BFC4CE8FDF7D
            F3DA75EF4DB5764630540A0A4689B2FB93375B32516076B6029E4741579ACFE5
            278E0857F4A0669642B146ECA75CBDB0DFF32EEF67B36DA95B999A953F0AA8CB
            3B1F2551527F60C91D3173711DAC2F3487B47F3F403EDEB54A8B627CB1FE6E9B
            77B27E65FCC8ED7DCBF1C7F97C755E2F786F5C7ECCD9D4592CC475FB43615157
            E5B72B6C7D9C8153765762B114134757BA7254B5C6A6B11E1C7D1BAA3430E42E
            E3BDF28FB3B6EBB3EC56097BCD65019257E2B51505D854A83C56042A42D0BB54
            8243D14179BCB78D3C852D2B803CFECF5F9B1FCBAB26F8F5FC9CBF93B77D7536
            337CF4AE4739DE9B3F394B11A4EC4C37796E0C8E4219E5A78E534D5D4BB76A70
            B8FC066A9D24066A1AAC753D453B9D3242878F71D4BEF673E4B30952F2DD12BF
            0AC29A7FE35A9BFE35D190D8EC146928D5F9935E8B1FC86FE4D1DEDF08AA6B7E
            4D7F2B9EEEED0A5CE6CF80E6B3BD3B95C9D3D76E5CEE2B1CBF7990A7C2D651D2
            D060BB1E95E283D5B7F338E9A6AB40561A892631C4C34D8FDD5D9B9B55797FDC
            4DA2DCC329D2B380422938058125A23FF0C8D801E6A054F4867DA66B426E36E9
            9B50E2BE7F97AFD847E7D1E2F83FFCDBB6C7CBEF8FF99CA6ECA2C76CCEF6EB5F
            B5C2F6B6D1A46969F1D51515314E31BBC76D52D6CB2574180CF3D1CC8F4D333C
            D8FAD865A7919808E49233F71391DF9337658EDE532ECF382D0B9E229C51C8C1
            65A8C8C3290C3CC033DBAF85EC44B0A4CB861FE51F23FCBAD1BBF987FC81C6BE
            FCEFCDE34F5B1BAE6F7FF617F77955C135D90CE6E0CC363FC3A6FAD23494CEE4
            70228C9BFD3DE45F32F35AEC5EDEED8667D3729B6C30A2F9994C0AA00FF4B963
            F253D72C3907DB6939CFDF1E60169097DBE5DFEEEEE671F0ADB0BB791989E1DE
            088D38D59D714AF5FFD1D1FF00DFBAF75F499FE483FCF63A76B7E29F45F41FCC
            3DD71F5FEE7EBDEBEDBBB17667726552B2AB68EECC06D2A68B6C62711BD6BA9A
            1AA9F6D6EAC3D2E3929CD754AFD857C112CB2CD1546A12CAF3FB67B96EBCB9B2
            F33F2C45F5114F00F1610478892255246404F7AB32162A3B949A0057814AEE71
            457335ADD1D255B0DE441C8AFA115FB3F3EB679C47C8CF8F99FC7D365707DE9D
            3D98C656C6B3526431BD95B36B68AA62750CB243534F99921910823907DC792E
            C9BD42ED1CDB45D2C8388313823F22BD1889E120113291F68E9D8777F4BB0D4B
            DBBD62C3E975DFBB5585FF00A5D72A45FDB7FBA775FF00A365C7FCE37FF375BF
            162FF7E2FED1D6093BDFA4E3BEBEDEEB216FFB3EF6B7E3FF0022BEF5FBAB74FF
            00A36DC7FCE37FF375BF163FF7E2FED1D36CBF237A1E0369BB87ACD07376FEFD
            6D8205BFD6CA1F7AFDD7B9FF00D1BA7FF9C6FF00E6EBDE247FEFC5FDA3A8BFEC
            CE7C751AC3778F552F8C6A7D5BEF6DAD87F5E723EEA76FBF1C6C66FF00786FF3
            75EF123FF7E2FED1D27AB7E637C57C796153DFDD54A54D8E8DE585945EF6E0C7
            54C0D88F7AFA0BEFF94297FDE1BFCDD7BC48FF008C7EDE98AA7E75FC3DA45D55
            1F22FAA905C8B0DD540EDC737D28ECD6FF0061EEBF477638DAC9FEF2DFE6EB7A
            D3F8C7EDE9925FE61BF09E1215BE49F57B315D4163CFC721FF00053A232039FC
            0BFBD7D25D7FCA349FEF27FCDD7B5A7F10FDBD6BBDFCE87E456D7F9ADF21BE0A
            FC33E94DF78CDCDB13B0B7E62F35BA72FB7F20F2D249B8373EE9A0D8188154A9
            A4A4FB6B6F5565AA50953CD4865BE907DCF3ED0247B06D1CE1CD575011710405
            5030A76AA191A95FE26083F2E883782679ACED14F6B367F334FE42BD5FAFCD5D
            97B57AE3F9657CB0EBFD8D85A2DB9B3B65FC2EEEFDB1B63058E8961A2C56130D
            D37B96871D45020E4AC34D0A82C6EEED76625893EE07BDBCB9DC2EAE6FAF2632
            5D4CECEEC789663524FE7D0823458C24682882800EBE649F1BFE52FC86F895BC
            A9FB13E3976DEF0EA8DD04533645F6E642F82DC90C0018E8B77ED4AF4ACDB3BB
            71E3E822C8525404FAA696B3047D28201E23ADC17E0DFF00C29CFABBB0A871BD
            79F3AB6AD2F4BEF59523A1A6EEAD8F4993CAF52672A4451C50CBBA76F6BC96E9
            D835F5D3037921FE278DF23DDA4A48ECA2D5E9B287CBAA35FE701D8B98F835F3
            8BB5FB67E3AD463A9B6CFC85EA51BDA2C662E7928B013C3D832CD8FCFE42963C
            788A16FF007F1E1BF8ED2D974A4F546D6B9F737DB6F6376F6F6DA7DCEDFEAA6D
            B27140C69A821529A8D09D211F4B0142CAB4A8AD403F79DB2E6E96FF006FDBF7
            036735DC453C5550CD187C3B202401252BE1B1A847218AB01A4EAB7BFBB2375F
            64E58E57735799FC6D27D963E00D163B1C9290644A4A76791B548546B91D9E59
            081A98D85A30E60E65DDB99AEFEAB739EA057422E1101F255CFE6492C7CC9E93
            F2472072D7B7FB61DBB97ACF497A1965721A6998568D23D0569534550A8B53A5
            454D7FFFD2D1FF00DFBAF746DFE3CF7547B5A865D8D9CAA5A6A092AA4ABC0D6C
            CCB1D3D3D45492D578FA890D9638EA65B4913121448CC09F50F737FB5BCFF1EC
            F049CBBB9CE12D59CBC2E4D1559BE2463E418D1949C06D40FC42847BAEDE6661
            7312D580A11F2F5FF3FCA9E9D1B95EC1C7213E48298B9E4B18622C4FF524AF37
            F73F2F33E8C339FDBD07FE9BCE9D44A9EC9C7A83A20A7FF6114607FBC28F6CC9
            CD74E121FDBD585AFCBA4AE43B3A96256775A58507D5E410C6A3FD767B01ECAA
            E79BCC6A5A49C2AFA9341FCFA756CEBC16BD07D92EE8C044584996C5023EAB1C
            914EC3FC34C0256BFB0CDDFB8BB6C5A83EF11547A36AFF008ED7A549B74A7842
            7F67F9FA40E43BDB02198472545558FD69A84853FEB1A934FEC3175EEA6D6858
            25C4D27FA5534FF8D15E94A6D529E2AA3ED3FE6AF488AFEF157D42930D34BF50
            1AA67869FF00D8948A3A8FFA1BD872EBDD5624FD358C8DF3670BFC806FF0F4A5
            76AFE2900FB07492ADEDECF540229E87194D7FED3C72D4B8FF0058B491C7FEDD
            4FB20B9F7277B98110C31463D7B98FF3207F2E942EDB02FC4C4FF2E93553D81B
            AEA7EB921003F8A6A4A384FF00B07583C83FE4AF64B3739F324FC772651FD155
            5FE6057F9F4FAD95B2FF00A157EDA9EAC8FF0095F7C80A8EA4F917D73D999BAD
            AAC9CDD55DA9D6FD96F0D5CF24C66DBD81DC746771C10062C500A0045947265E
            39F72A7B677F75CD1B5F3872E6E37F2CB7735A9319762D40CAC86953801CC668
            319E8A7738D2D65B3B98E30115B3414F43FE0AF5F523F9C5BDF6D6F2FE5C5F30
            33FB6B31439AC267FE1CF79E630B95A0A88EA68B298ACAF4EEE5ADC76428A78C
            B24F4B5B493A491BAF0C8C08FAFB81A6865B79658278CACC8C5594E086068411
            EA0E0F420421B4B29AA9A75F3B4F82BFCB13E5DFF304CBD345D1BB04E3FAEA9E
            A451EE1EF0DF7F79B7FAA302F01856B29E0CDAD254D5EEDCD532CCA4E3F0F056
            542923CDE14BC819A74F96038F5B9B7C4EFE4BFF000B3F97BEDDA2DFDB968E9F
            E41FC84C645F7CBDAFD8F8DA56C66D8C9C77747EB7EBF69EBF03B4DA91EDE1AE
            94D6E5D4AEA15681B40DD3A68B13F675A61FF3FDF91185EE1F95BBDA8F09530D
            5D1F5E6DBC27589AA8A55923A9CF7F14C86E3CFC48413EAC6B658D3483FB3353
            B8FC7B93A253B4FB7771E3625BD96AA3CE84A81FB5519BEC23A2927C6DC569C1
            067FD5F691D6BAFEE32E8D3AFFD3D1FF00DFBAF75EF7EEBDD28E83776E5C642B
            4F459AAE8A04E1216904D1C63FA4693ACAB1AFF82D87B38B4E60DEAC6310DAEE
            52AC4380AD40FB03569F974CBDBC121AB4409EB8D56ECDCB5A0AD466F24CA7EA
            895324287FC0A4063523FD87BD4FBFEF772089B749CAFA06207EC141D796DE04
            F8625FD9D31492CB29D52CB24ADFEAA47673FEDD893ECADE477357724FCCD7A7
            400380EB1FBA75BEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EE955B2F77E57636
            E3A0DC788702A28DD96681D98435B4730D155455014DCC53C7F9FAAB00C3951E
            CE760DF2F797775B5DDAC5BF5A3390783A9C3237C987EC34232074CDC4097313
            C320C1FE47C88EB6ADFE5D5FCF129BADBA8AB7E357C85C154F707C6ACEE0325B
            3E6C3CC23AFDD1B276AEE2A5A8A0CFECCCAE26A6A204DD5B0AAA8EB658920592
            39A9E291D216962D1047296F9B4EC9CFE877FE5EB9487786159A27C6A6A0CB53
            2ADE5AC028FC706A7A2A8269F6F22DEE149847C247A7F97ECE23AD8C766FF3DF
            F81F81D8989C46D0ED3D97B2F6EE0F17050E1F6852EDBCC6D48F07434C9A20C6
            63B6C4380A45A5869D45962A684C7FEA6FEE3C9392F99A37319DA9CFCC3211FB
            4353F6F4622F6D9857C51FCEBD536FF30AFF00850850EEDDB19BDA1F1BE7C83D
            5E429E7A4A9ED1DC1453E2711828660E924DB7307938E3C8E5B306337864A986
            18227B1F1CE7D0041B672547623F78F33DC4715A267C30C096F9330C01FD1525
            9B80A749E5BE327E9DAA92E7CE9FE0FF00671D6997D8BBEEBB7D66EA2BEA2A2A
            AA626AAABAA6A9AD95E6ADC8D756CCD3D6E52BA590B49255564CC589625B924F
            24FB20E69E613BEDDA2C0BA36F845235E1F22C479540000F20079D7A516B6FE0
            292C6B2371FF003741EFB0B74ABAFFD4D1FF00DFBAF75EF7EEBDD7BDFBAF75EF
            7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF
            74FF00B67FE2ED07FC5F7F4B7FC7B9FF00174FAAFF009AFF0068FF0055FEC3D9
            A6CFFEE747FEE57FD43FF6BF97CBD7A6A6FECDBE1FF6DC3A3390FF00C045FF00
            8FA7F48FF819FF0002BE83F57F8FFC4FB9D21FEC07FC943FDBFC7D1137C47FB3
            FCB874026FDFF81CBFF1F3FEB3FF0017EFF80DFA47FC00FF0069FEBEE24E6CFF
            0072C7FB9FC4FF00B91C3FDA7CBA36B3F80FF67FED7FCBD07FEC25D2CEBDEFDD
            7BAFFFD9}
        end
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
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      00000000000000000000000000000000FFFFF1FF00000000FFFFFE7F00000000
      FE7FFF1F00000000FE7FFFAF00000000FFFFFC7700000000FE7FE3FB00000000
      FE7FDFFD00000000FE7FB21600000000FF3F7FFE00000000FF9F612200000000
      FF9F7FFE00000000F99F648600000000F81FBFFD00000000FC3FDFFB00000000
      FFFFE3C700000000FFFFFC3F00000000F03FAAAAFFFDFFFFE3DFD555FFFBFFFF
      D1EFFFFFFC77FFFFA0E78000F9BFFC3F41C38000F3DEFE7F63839FFCE9D9FE7F
      5F839FFC90EFFE7F37C39FFC90EFFE7F23339FFC90EFFE7F83879FFC90EFFC7F
      C2839FFCE9D9FFFFE0D18000F3DEFE7FF0308000F9BFFE7FFFF1FFFFFC77FFFF
      FFF3AAAAFFFBFFFFFFF7FFFFFFFDFFFF00000000000000000000000000000000
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
