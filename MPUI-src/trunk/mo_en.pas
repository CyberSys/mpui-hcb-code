{   MPUI-hcb, an MPlayer frontend for Windows
    Copyright (C) 2005 Martin J. Fiedler <martin.fiedler@gmx.net>
    Copyright (C) 2006-2009 Huang Chen Bin <hcb428@foxmail.com>
    based on work by Martin J. Fiedler <martin.fiedler@gmx.net>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}
unit mo_en;
interface
implementation
uses Windows,Locale,Main,Options,plist,Info,Core,Equalizer;

procedure Activate;
begin
  with MainForm do begin
    LOCstr_Title:='MPlayer for Windows';
      LOCstr_Status_Opening:='Opening ...';
      LOCstr_Status_Closing:='Closing ...';
      LOCstr_Status_Playing:='Playing';
      LOCstr_Status_Paused:='Pause/Frame step';
      LOCstr_Status_Stopped:='Stopped';
      LOCstr_Status_Error:='Unable to play media (Click for more info)';
      LOCstr_SetPW_Caption:='Please enter password of following Archive';
      LOCstr_NoSuport_OS_Prompt:='not executing MPlayer: invalid Operating System version';
      LOCstr_Win9x_Prompt:='MPUI will not run properly on Win9x systems. Continue anyway?';
      LOCstr_Check_Mplayer_Prompt:='Please check MPlayer.exe location.';
      LOCstr_Error1_Prompt:='Error ';
      LOCstr_Error2_Prompt:=' while starting MPlayer:';
      LOCstr_CmdLine_Prompt:='command line:';
      OSD_Volume_Prompt:='Volume';
      OSD_ScreenShot_Prompt:='ScreenShot ';
      OSD_Contrast_Prompt:='Contrast';
      OSD_Brightness_Prompt:='Brightness';
      OSD_Hue_Prompt:='Hue';
      OSD_Saturation_Prompt:='Saturation';
      OSD_Gamma_Prompt:='Gamma';
      OSD_Enable_Prompt:='Enable';
      OSD_Disable_Prompt:='Disable';
      OSD_VideoTrack_Prompt:='Video Track';
      OSD_AudioTrack_Prompt:='Audio Track';
      OSD_OnTop0_Prompt:='Nerve On Top';
      OSD_OnTop1_Prompt:='Always On Top';
      OSD_OnTop2_Prompt:='While Playing On Top';
      OSD_Auto_Prompt:='Auto';
      OSD_Custom_Prompt:='Custom';
      OSD_Size_Prompt:='Size';
      OSD_Scale_Prompt:='Scale';
      OSD_Balance_Prompt:='Balance';
      OSD_Reset_Prompt:='Reset';
      OSD_AudioDelay_Prompt:='Audio Delay';
      OSD_SubDelay_Prompt:='Subtitle Delay';
      SubFilter:='Subtitle Files';
      AudioFilter:='Audio File';
      AnyFilter:='Any File';
      FontFilter:='TrueType Font';
      MediaFilter:='Media Files';
      LyricFilter:='Lyric File';
    BPause.Hint:=LOCstr_Status_Paused;
    BOpen.Hint:='Play file';
    BPlaylist.Hint:='Show/hide playlist window';
    BStreamInfo.Hint:='Show/hide clip information';
    BFullscreen.Hint:='Toggle fullscreen mode';
    BCompact.Hint:='Toggle compact mode';
    BMute.Hint:='Toggle Mute';
    BSkip.Hint:='Toggle Skip Intro Ending';
    SeekBarSlider.Hint:='MMB/RMB Set Intro,Ending';
    MPCtrl.Caption:='Show/hide Controls';
    OSDMenu.Caption:='OSD mode';
      MNoOSD.Caption:='No OSD';
      MDefaultOSD.Caption:='Default OSD';
      MTimeOSD.Caption:='Show time';
      MFullOSD.Caption:='Show total time';
    LEscape.Caption:='Press Escape to exit fullscreen mode.';
    MFile.Caption:='File';
      MOpenFile.Caption:='Play file ...';
      MOpenDir.Caption:='Open Directory ...';
      MOpenURL.Caption:='Play URL ...';
        LOCstr_OpenURL_Caption:='Play URL';
        LOCstr_OpenURL_Prompt:='Which URL do you want to play?';
      MOpenDrive.Caption:='Play Media CD';
      MLoadLyric.Caption:='Load Lyric File';
      MLoadSub.Caption:='Load Subtitle...';
      MOsdfont.Caption:='OSD Font...';
      MSubfont.Caption:='Subtitle Font...';
      MClose.Caption:='Close';
      MQuit.Caption:='Quit';
    MView.Caption:='View';
      MSizeAny.Caption:='Custom size (';
      MSCS.Caption:='Set custom size';
      MSize50.Caption:='Half size';
      MSize100.Caption:='Original size';
      MSize200.Caption:='Double size';
      MFullscreen.Caption:='Fullscreen';
      MCompact.Caption:='Compact mode';
      MMaxW.Caption:='Maximize Windows';
      MOnTop.Caption:='On Top';
        MNoOnTop.Caption:='Never On Top';
        MAOnTop.Caption:='Always on top';
        MWOnTop.Caption:='While Playing On Top';
      MKaspect.Caption:='Keep movie aspect';
      MExpand.Caption:='Expand with black bands';
        MNoExpand.Caption:='Off';
        MSrtExpand.Caption:='Srt';
        MSubExpand.Caption:='Sub';
      Hide_menu.Caption:='AutoHide MainMenu';
      Mctrl.Caption:='AutoHide ControlPanel';
    MSeek.Caption:='Play';
      MPlay.Caption:=MSeek.Caption;
      MPause.Caption:=LOCstr_Status_Paused;
      MStop.Caption:='Stop';
      MPrev.Caption:='Previous title';
      MNext.Caption:='Next title';
      MShowPlaylist.Caption:='Playlist ...';
      MSpeed.Caption:='Play Speed';
        MN8X.Caption:='1/8X';
        MN4X.Caption:='1/4X';
        MN2X.Caption:='1/2X';
        M1X.Caption:='1X';
        M2X.Caption:='2X';
        M4X.Caption:='4X';
        M8X.Caption:='8X';
      MAudiochannels.Caption:='Channel';
        MStereo.Caption:='Stereo';
        MLchannels.Caption:='Left channels';
        MRchannels.Caption:='Right channels';
        MMix.Caption:='Mix Stereo';
        MMute.Caption:='Mute';
      MWheelControl.Caption:='Mouse wheel control';
        MVol.Caption:=OSD_Volume_Prompt;
        MSize.Caption:=OSD_Size_Prompt;
      MSkip.Caption:='Skip Intro Ending';
        MIntro.Caption:='BeginPoint ';
        MEnd.Caption:='EndPoint ';
        MSIE.Caption:='Skip Intro Ending';
      MSeekF10.Caption:='Forward 10 seconds';
      MSeekR10.Caption:='Rewind 10 seconds';
      MSeekF60.Caption:='Forward 1 minute';
      MSeekR60.Caption:='Rewind 1 minute ';
      MSeekF600.Caption:='Forward 10 minutes';
      MSeekR600.Caption:='Rewind 10 minutes';
    MExtra.Caption:='Tools';
      MAudio.Caption:=OSD_AudioTrack_Prompt;
      MSubtitle.Caption:='Subtitle track';
      MShowSub.Caption:='Show/Hide Subtitles';
      MVideo.Caption:=OSD_VideoTrack_Prompt;
      MDVDT.Caption:='DVD Titles';
      MRmMenu.Caption:='Return to main menu';
      MRnMenu.Caption:='Return to nearest menu';
      MVCDT.Caption:='VCD Tracks';
      MAspect.Caption:='Aspect ratio';
        MAutoAspect.Caption:='Autodetect';
        MForce43.Caption:='Force 4:3';
        MForce169.Caption:='Force 16:9';
        MForceCinemascope.Caption:='Force 2.35:1';
        MForce54.Caption:='Force 5:4';
        MForce85.Caption:='Force 16:10';
        MForce221.Caption:='Force 2.21:1';
        MForce11.Caption:='Force 1:1';
        MForce122.Caption:='Force 1.22:1';
        MCustomAspect.Caption:='Custom ';
      MDeinterlace.Caption:='Deinterlace';
        MNoDeint.Caption:='Off';
        MSimpleDeint.Caption:='Simple';
        MAdaptiveDeint.Caption:='Adaptive';
      MEqualizer.Caption:='Video Equalizer';
      MOptions.Caption:='Options ...';
      MLanguage.Caption:='Language';
      MUUni.Caption:='Use Unicode for output info';
      MStreamInfo.Caption:='Show clip information ...';
      MShowOutput.Caption:='Show MPlayer output ...';
    MVideos.Caption:='Video';
    MAudios.Caption:='Audio';
    MSub.Caption:='Subtitles';
      M2ch.Caption:='Default';
      M4ch.Caption:='4.0 surround';
      M6ch.Caption:='Full 5.1';
    MShot.Caption:=OSD_ScreenShot_Prompt;
    MLoadAudio.Caption:='Load external Audio';
    MUloadAudio.Caption:='Unload external Audio';
    MRotate0.Caption:='0';
      MRotate9.Caption:='+90';
      MRotateN9.Caption:='-90';
    MScale.Caption:=OSD_Scale_Prompt+' image';
      MScale0.Caption:=OSD_Reset_Prompt+' '+OSD_Scale_Prompt;
      MScale1.Caption:='Zoom +';
      MScale2.Caption:='Zoom -';
   MPan.Caption:=OSD_Reset_Prompt+' '+OSD_Balance_Prompt;
     MPan0.Caption:=OSD_Balance_Prompt+' +';
     MPan1.Caption:=OSD_Balance_Prompt+' -';
   MSubStep.Caption:='Subtitle Step';
     MSubStep0.Caption:='Step backward';
     MSubStep1.Caption:='Step forward';
   MAudioDelay.Caption:=OSD_AudioDelay_Prompt;
     MAudioDelay0.Caption:='Delay +';
     MAudioDelay1.Caption:='Delay -';
     MAudioDelay2.Caption:=OSD_Reset_Prompt+' '+OSD_AudioDelay_Prompt;
   MSubDelay.Caption:=OSD_SubDelay_Prompt;
     MSubDelay0.Caption:=MAudioDelay0.Caption;
     MSubDelay1.Caption:=MAudioDelay1.Caption;
     MSubDelay2.Caption:=OSD_Reset_Prompt+' '+OSD_SubDelay_Prompt;
   MSubScale.Caption:=MSub.Caption+' '+UTF8Decode(OSD_Scale_Prompt);
     MSubScale0.Caption:=MScale1.Caption;
     MSubScale1.Caption:=MScale2.Caption;
     MSubScale2.Caption:=UTF8Decode(OSD_Reset_Prompt)+' '+MSubScale.Caption;
   MHelp.Caption:='Help';
     MKeyHelp.Caption:='Keyboard help ...';
     MAbout.Caption:='About ...';
  end;
  OptionsForm.BClose.Caption:='Close';
  OptionsForm.HelpText.Text:=UTF8Decode(
'Space'^I'Play/Pause'^I'T/R'^I'Adjust subtitle position'^M^J+
'Left'^I'Rewind 10 seconds'^I'Y/U'^I'Adjust subtitle step'^M^J+
'Right'^I'Forward 10 seconds Z/X'^I'Adjust subtitle delay'^M^J+
'Up'^I'Forward 1 minute'^I'C'^I'Adjust subtitle alignment'^M^J+
'Down'^I'Rewind 1 minute'^I'B'^I'Switch subtitle language'^M^J+
'PgUp'^I'Forward 10 minutes'^I'V'^I'Toggle subtitle visibility'^M^J+
'PgDn'^I'Rewind 10 minutes'^I'A'^I'switch audio'^M^J+
'Home'^I'Forward 1 chapter'^I'End'^I'Rewind 1 chapter'^M^J+
'O'^I'Toggle OSD'^I'F5'^I'Toggle compact mode'^M^J+
'S'^I'Screen shot'^I'Shift+S'^I'Start/stop screenshot eachframe'^M^J+
'N'^I'switch aspect ratio'^I'F1'^I'Cycle toggle on top mode'^M^J+
'Q'^I'switch video'^I',/.'^I'Adjust balance'^M^J+
'D'^I'Toggle framedrop'^I'M'^I'Toggle mute'^M^J+
'G/H/;'^I'DVDnav menu/select/nearest menu'^I'÷,9/*,0'^I'Adjust volume'^M^J+
'-/+'^I'Adjust audio delay'^I'I/K'^I'DVD nav up/down'^M^J+
'1/2'^I'Adjust brightness'^I'J/L'^I'DVD nav left/right'^M^J+
'3/4'^I'Adjust contrast'^I'Back'^I'Reset speed to normal'^M^J+
'5/6'^I'Adjust hue'^I'-/='^I'Adjust playback speed'^M^J+
'7/8'^I'Adjust saturation'^I'F/DblClick'^I'Toggle fullscreen'^M^J+
'Enter'^I'Maximize windows'^I'Ins/Del'^I'Adjust gamma'^M^J+
'[/]'^I'Set Intro/Ending'^I'\'^I'Toggle Skip Intro/Ending'^M^J+
'P'^I'switch program'^I'LMB click StatusBar Timer'^I'Toggle Time'^M^J+
'W/E'^I'Scale video'^I'MMB'^I'Toggle Wheel function'^M^J+
'Ctrl+-/='^I'Scale subtitle'^I'Ctrl+LMB drag subtitle'^I'Scale subtitle'^M^J+
'Ctrl+Wheel '^I'Seek'^I'LMB click video'^I'Play/Pause'^M^J+
''''^I'Deinterlace(if adaptive deinterlace)'^I'/'^I'Frame step'^M^J+
'Shift+A'^I'Toggle Angle'^I'M/RMB click SeekBar Slider'^I'Set Intro/Ending'^M^J+
'Tab'^I'Toggle Menu and ControlPanel'^M^J+
'LMB drag video'^I'Adjust window position'^M^J+
'LMB drag subtitle'^I'Adjust subtitle position'^M^J+
'Ctrl+Left/Right/Up/Down'^I'Adjust aspect ratio'^M^J+
'Ctrl+LMB drag video'^I'Adjust aspect ratio'^M^J+
'Shift+LMB drag video'^I'Scale video,Adjust volume or size'^M^J+
'`'^I'Reset brightness,contrast,hue,saturation,gamma'^M^J+
'Alt+LMB drag video'^I'Adjust brightness,contrast,hue,saturation,gamma'^M^J+
'While drag,release or press different function key invoke different function');
  with OptionsForm do begin
    THelp.Caption:=MainForm.MHelp.Caption;
    TAbout.Caption:='About';
    LVersionMPUI.Caption:='MPUI-hcb version:';
    LVersionMPlayer.Caption:='MPlayer core version:';
    FY.Caption:='Author:';
    Caption:='Options';
    BOK.Caption:='OK';
    BApply.Caption:='Apply';
    BSave.Caption:='Save';
    TSystem.Caption:='System';
    TVideo.Caption:='Video';
    TAudio.Caption:='Audio';
    TSub.Caption:='Subtitle';
    CSP.Caption:='Click video to pause';
    CRS.Caption:='start MPUI with last size';
    CTime.Caption:='Display OS time in status bar';
    CRP.Caption:='start MPUI with last postion';
    LAudioOut.Caption:='Sound output driver';
      CAudioOut.Items[0]:='(don''t decode sound)';
      CAudioOut.Items[1]:='(don''t play sound)';
    LAudioDev.Caption:='DirectSound output device';
    LPostproc.Caption:='Postprocessing';
      CPostproc.Items[0]:='Off';
      CPostproc.Items[1]:='Automatic';
      CPostproc.Items[2]:='Maximum quality';
    LOCstr_AutoLocale:='(Auto-select)';
    CIndex.Caption:='Rebuild file index if necessary';
    CIndex.Hint:='Useful with broken/incomplete downloads,'^M^J+
                 'or badly created files';
    CNi.Caption:='Use non-interleaved AVI parser';
    CNi.Hint:='Fixes playback of some bad AVI files';
    Cone.Caption:='Use only one instance of MPUI';
    CDnav.Caption:='Use DVDNav';
    CDnav.Hint:='if Mplayer is compiled with DVDnav lib, you can use'^M^J+
                'mouse to handle DVD menu on screen';
    CNobps.Caption:='Don''t use avg b/s for A-V sync';
    CNobps.Hint:='Don''t use average byte/second value for A-V sync.'^M^J+
                 'Helps with some AVI files with broken header';
    CFilter.Caption:='Filter DropFiles';
    CFilter.Hint:='When to load files by drop, only load'^M^J+
                  'files supported by Mplayer.';
    CFlip.Caption:='Flip image';
    CMir.Caption:='Mirrors image';
    CUseekC.Caption:='Fast Chapter Switching';
    CUseekC.Hint:='For some DVD, it need to reboot '^M^J+
                  'Mplayer when switch chapter';
    CGUI.Caption:='Use GUI of Mplayer';
    CGUI.Hint:='Avoid GMplayer to use GUI of itself. For mplayer without ''-nogui'','^M^J+
               'you can cancel this checkbox to ensure mplayer can be runed';
    SSF.Caption:='ScreenShot Folder';
    CSoftVol.Caption:='Software volume boost';
    CDr.Caption:='Direct rendering';
    CDr.Hint:='Turns on direct rendering (not supported by'^M^J+
              'all codecs and video outputs)';
    double.Caption:='double buffer';
    double.Hint:='Double buffering fixes OSD flicker by '^M^J+
                 'storing two frames in memory';
    CVolnorm.Caption:='Normalize volume';
    CVolnorm.Hint:='Maximizes the volume without distorting the sound';
    nFconf.Caption:='Use nofontconfig option';
    nFconf.Hint:='For mplayer without ''-nofontconfig'' option, you can'^M^J+
                 'uncheck this box to ensure mplayer can be runed';
    CRFScr.Caption:='Click MBR to FullScreen';
    CRFScr.Hint:='Click Right button of Mouse to FullScreen.';
    CSPDIF.Caption:='Passthrough S/PDIF';
    LCh.Caption:='Stereo Mode';
    LRot.Caption:='Rotate image';
    SSubcode.Caption:='Subtitle encoding';
    SSubfont.Caption:='Subtitle Font';
    SOsdfont.Caption:='Osd Font';
    SOsdfont.Hint:='Use OSDfont for recent Mplayer version';
    RMplayer.Caption:='Mplayer location';
    RCMplayer.Caption:='In the same directory as MPUI';
    CWid.Caption:='Use WID';
    LMAspect.Caption:='Monitor Aspect ratio';
    LVideoOut.Caption:='Video output driver';
    CEq2.Caption:='Use Software video Equalizer';
    CEq2.Hint:='for cards/drivers that do not support brightness'^M^J+
               ' and contrast controls in hardware';
    CVSync.Caption:='vsync';
    CVSync.Hint:='Useful for video laniated';
    CYuy2.Caption:='YUY2 colorspace';
    CYuy2.Hint:='Useful for video cards/drivers with '^M^J+
                'slow YV12 but fast YUY2 support';
    CUni.Caption:='Handle subtitle as unicode';
    CUtf.Caption:='Handle subtitle as UTF-8';
    SFol.Caption:='Font outline thickness';
    SFsize.Caption:='Subtitle text scale';
    SFB.Caption:='Font blur radius';
    CWadsp.Caption:='Use Winamp DSP plugins';
    Clavf.Caption:='Use lavf Demuxer';
    Clavf.Hint:='For unplayable files, try this option, TimeCode may be wrong.';
    CFd.Caption:='Enable framedrop';
    CFd.Hint:='Skip displaying some frames to maintain '^M^J+
              'A/V sync on slow systems';
    CAsync.Caption:='Autosync';
    CAsync.Hint:='Gradually adjusts the A/V sync based '^M^J+
                 'on audio delay measurements';
    CCache.Caption:='Cache';
    CCache.Hint:='Specifies how much memory (in kBytes) to use when precaching'^M^J+
                 'a file or URL. Especially useful on slow media';
    CPriorityBoost.Caption:='Priority boost';
    SFontColor.Caption:='Text Color';
    SOutline.Caption:='Outline Color';
    CISub.Caption:='Include Subtitles on Screenshot';
    CEfont.Caption:='Use embedded fonts';
    CEfont.Hint:='Enables extraction of Matroska embedded fonts.These fonts'^M^J+
                 'can be used for SSA/ASS subtitle rendering';
    CAss.Caption:='Use libass for SubRender';
    CAss.Hint:='Turn on SSA/ASS subtitle rendering. With this option, libass will'^M^J+
               'be used for SSA/ASS external subtitles and Matroska tracks';
    LParams.Caption:='Additional MPlayer parameters:';
    LHelp.Caption:=THelp.Caption;
    SLyric.Caption:='Lyric folder';
    TLyric.Caption:='Lyric';
    LScroll.Caption:='Smooth scroll';
    LTCL.Caption:='Text Color';
    LBCL.Caption:='Background';
    LHCL.Caption:='Hightlight';
    TBa.Caption:='Select All';
    TBn.Caption:='None';
    TFadd.Caption:='Add';
    TFdel.Caption:='Delete';
    TFSet.Caption:='Associate';
    TOther.Caption:='Other';
  end;
  with PlaylistForm do begin
    Caption:='Playlist';
    BPlay.Hint:='Play';
    BAdd.Hint:='Add Files...';
    BAddDir.Hint:='Add Directory...';
    BMoveUp.Hint:='Move up';
    BMoveDown.Hint:='Move down';
    BDelete.Hint:='Remove';
    BClear.Hint:='Clear';
    CShuffle.Hint:='Shuffle';
    CLoop.Hint:='Repeat All';
    COneLoop.Hint:='Repeat Current';
    BSave.Hint:='Save Playlist...';
    TntTabSheet1.Caption:=Caption;
    TntTabSheet2.Caption:='Lyric';
    CP0.Caption:='System Default';
    CPO.Caption:='Other';
    SC.Caption:=UTF8Decode('简体中文 (Simplified Chinese)');
    TC.Caption:=UTF8Decode('繁體中文 (Traditional Chinese)');
    CY0.Caption:=UTF8Decode('Русский (Russian OEM866)');
    CY.Caption:='Cyrillic';
    CY4.Caption:=UTF8Decode('Русский (Russian,20866,KOI8-R)');
    CY6.Caption:=UTF8Decode('Українська (UKrainian,21866,KOI8-U)');
    AR.Caption:=UTF8Decode('العربية (Arabic)');
    TU.Caption:=UTF8Decode('Türkiye (Turkish)');
    HE.Caption:=UTF8Decode('עִבְרִית‎ (Hebrew)');
    JA.Caption:=UTF8Decode('日本語 (Japanese)');
    KO.Caption:=UTF8Decode('한국어 (Korean)');
    TH.Caption:=UTF8Decode('ภาษาไทย (Thai)');
    FR.Caption:=UTF8Decode('Français(French)');
    IC.Caption:=UTF8Decode('íslenska (Icelandic)');
    BG.Caption:=UTF8Decode('Български (Bulgarian)');
    PO.Caption:=UTF8Decode('Português (Portuguese)');
    GR.Caption:=UTF8Decode('Ελληνικά (Greek)');
    BA.Caption:='Baltic';
    VI.Caption:=UTF8Decode('Việt (Vietnamese,1258,windows-1258)');
    WE.Caption:='Western European (1252,iso-8859-1)';
    CE.Caption:='Central European';
    ND.Caption:=UTF8Decode('Norsk (Nordic OEM865)');
    i18.Caption:='IBM EBCDIC-International (500)';
    co.Caption:=UTF8Decode('Hrvatska (Croatia MAC10082)');
    rm.Caption:=UTF8Decode('Română (Romania MAC10010)');
    ro.Caption:='Roman (MAC 10000)';
    pg.Caption:=UTF8Decode('ਪੰਜਾਬੀ Punjabi(Gurmukhi) 57011');
    gu.Caption:=UTF8Decode('ગુજરાતી (Gujarati 57010)');
    ma.Caption:=UTF8Decode('മലയാളം (Malayalam 57009)');
    ka.Caption:=UTF8Decode('ಕನ್ನಡ (Kannada 57008)');
    oy.Caption:='Oriya (57007)';
    am.Caption:=UTF8Decode('অসমীয়া (Assamese 57006)');
    te.Caption:=UTF8Decode('తెలుగు (Telugu 57005)');
    ta.Caption:=UTF8Decode('தமிழ் (Tamil 57004)');
    be.Caption:=UTF8Decode('বাংলা (Bengali 57003)');
    dv.Caption:=UTF8Decode('संस्कृतम् (Devanagari 57002)');
  end;
  AddDirCP:='Select a folder';
  with EqualizerForm do begin
    Caption:=MainForm.MEqualizer.Caption;
    BReset.Caption:=OSD_Reset_Prompt;
    BClose.Caption:=OptionsForm.BClose.Caption;
    SBri.Caption:=OSD_Brightness_Prompt;
    SCon.Caption:=OSD_Contrast_Prompt;
    SSat.Caption:=OSD_Saturation_Prompt;
    SHue.Caption:=OSD_Hue_Prompt;
  end;
  InfoForm.Caption:='Clip information';
  InfoForm.BClose.Caption:=OptionsForm.BClose.Caption;
  InfoForm.TCB.Caption:='Copy Info';
  LOCstr_NoInfo:='No clip information is available at the moment.';
  LOCstr_InfoFileName:='Clip name';
  LOCstr_InfoFileFormat:='Format';
  LOCstr_InfoPlaybackTime:='Duration';
  LOCstr_InfoTags:='Clip Metadata';
  LOCstr_InfoVideo:=OSD_VideoTrack_Prompt;
  LOCstr_InfoAudio:=OSD_AudioTrack_Prompt;
  LOCstr_InfoDecoder:='Decoder';
  LOCstr_InfoCodec:='Codec';
  LOCstr_InfoBitrate:='Bitrate';
  LOCstr_InfoVideoSize:='Dimensions';
  LOCstr_InfoVideoFPS:='Frame Rate';
  LOCstr_InfoVideoAspect:='Aspect Ratio';
  LOCstr_InfoAudioRate:='Sample Rate';
  LOCstr_InfoAudioChannels:='Channels';
  Ccap:='Chapter'; Acap:='Angle';
end;

begin
  RegisterLocale('English',Activate,LANG_ENGLISH,ANSI_CHARSET);
end.
