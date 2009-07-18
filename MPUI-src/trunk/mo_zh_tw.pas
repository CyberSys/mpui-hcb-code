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
unit mo_zh_tw;
interface
implementation
uses Windows,Locale,Main,Options,plist,Info,Core,Equalizer;

procedure Activate;
begin
  with MainForm do begin
    LOCstr_Title:=UTF8Decode('MPlayer for Windows');
      LOCstr_Status_Opening:=UTF8Decode('正在開啟 ...');
      LOCstr_Status_Closing:=UTF8Decode('正在關閉 ...');
      LOCstr_Status_Playing:=UTF8Decode('播放中');
      LOCstr_Status_Paused:=UTF8Decode('暫停/幀進');
      LOCstr_Status_Stopped:=UTF8Decode('停止');
      LOCstr_Status_Error:=UTF8Decode('無法播放媒體（點此查看更多訊息）');
      LOCstr_SetPW_Caption:=UTF8Decode('請輸入下列文檔的正確解壓密碼');
      LOCstr_NoSuport_OS_Prompt:=UTF8Decode('不能運行MPlayer: 不支持的操作系統版本');
      LOCstr_Win9x_Prompt:=UTF8Decode('MPUI不能正常的運行在Win9x系統下。繼續嗎?');
      LOCstr_Check_Mplayer_Prompt:=UTF8Decode('請檢查MPlayer.exe的位置是否正確');
      LOCstr_Error1_Prompt:=UTF8Decode('錯誤代碼(');
      LOCstr_Error2_Prompt:=UTF8Decode('): 在加載MPlayer時');
      LOCstr_CmdLine_Prompt:=UTF8Decode('命令行:');
      OSD_Volume_Prompt:='音量';
      OSD_ScreenShot_Prompt:='截屏 ';
      OSD_Contrast_Prompt:='對比度';
      OSD_Brightness_Prompt:='亮度';
      OSD_Hue_Prompt:='色調';
      OSD_Saturation_Prompt:='飽和度';
      OSD_Gamma_Prompt:='灰度';
      OSD_Enable_Prompt:='啟用';
      OSD_Disable_Prompt:='停用';
      OSD_VideoTrack_Prompt:='視頻軌';
      OSD_AudioTrack_Prompt:='音頻軌';
      OSD_OnTop0_Prompt:='取消置頂';
      OSD_OnTop1_Prompt:='總在最上';
      OSD_OnTop2_Prompt:='播放時總在最上';
      OSD_Auto_Prompt:='自動';
      OSD_Custom_Prompt:='自定義';
      OSD_Size_Prompt:='尺寸';
      OSD_Scale_Prompt:='縮放';
      OSD_Balance_Prompt:='聲道左右平衡';
      OSD_Reset_Prompt:='重置';
      OSD_AudioDelay_Prompt:='音頻延遲';
      OSD_SubDelay_Prompt:='字幕延遲';
      SubFilter:=UTF8Decode('字幕文件');
      AudioFilter:=UTF8Decode('音頻文件');
      AnyFilter:=UTF8Decode('所有文件');
      FontFilter:=UTF8Decode('字體文件');
      MediaFilter:=UTF8Decode('媒體文件');
      LyricFilter:=UTF8Decode('歌詞文件');
    BPause.Hint:=LOCstr_Status_Paused;
    BOpen.Hint:=UTF8Decode('打開 文件');
    BPlaylist.Hint:=UTF8Decode('顯示/隱藏播放清單');
    BStreamInfo.Hint:=UTF8Decode('顯示/隱藏影片資訊');
    BFullscreen.Hint:=UTF8Decode('切換全螢幕模式');
    BCompact.Hint:=UTF8Decode('切換精簡模式');
    BMute.Hint:=UTF8Decode('切換靜音');
    BSkip.Hint:=UTF8Decode('啟用/停止 跳過片頭、片尾');
    SeekBarSlider.Hint:=UTF8Decode('鼠標中鍵/右鍵單擊 設置片頭/片尾位置');
    MPCtrl.Caption:=UTF8Decode('顯示菜單和控制面板');
    OSDMenu.Caption:=UTF8Decode('OSD 模式');
      MNoOSD.Caption:=UTF8Decode('關閉 OSD');
      MDefaultOSD.Caption:=UTF8Decode('預設 OSD');
      MTimeOSD.Caption:=UTF8Decode('顯示時間');
      MFullOSD.Caption:=UTF8Decode('顯示完整時間');
    LEscape.Caption:=UTF8Decode('按 Escape 跳出全螢幕模式');
    MFile.Caption:=UTF8Decode('檔案');
      MOpenFile.Caption:=UTF8Decode('播放檔案 ...');
      MOpenDir.Caption:=UTF8Decode('播放目錄 ...');
      MOpenURL.Caption:=UTF8Decode('播放網址 ...');
        LOCstr_OpenURL_Caption:=UTF8Decode('播放網址');
        LOCstr_OpenURL_Prompt:=UTF8Decode('請輸入您想播放的網址');
      MOpenDrive.Caption:=UTF8Decode('播放 鐳射光碟');
      MLoadLyric.Caption:=UTF8Decode('載入歌詞');
      MLoadSub.Caption:=UTF8Decode('載入字幕...');
      MSubfont.Caption:=UTF8Decode('字幕字體...');
      MClose.Caption:=UTF8Decode('關閉');
      MQuit.Caption:=UTF8Decode('退出');
    MView.Caption:=UTF8Decode('檢視');
      MSizeAny.Caption:=UTF8Decode('自訂畫面大小 (');
      MSCS.Caption:=UTF8Decode('設置 自訂畫面大小');
      MSize50.Caption:=UTF8Decode('一半大小');
      MSize100.Caption:=UTF8Decode('原始大小');
      MSize200.Caption:=UTF8Decode('兩倍大小');
      MFullscreen.Caption:=UTF8Decode('全螢幕');
      MMaxW.Caption:=UTF8Decode('最大化窗口');
      MCompact.Caption:=UTF8Decode('精簡模式');
      MOnTop.Caption:=UTF8Decode('永遠在視窗最上層');
        MNoOnTop.Caption:=UTF8Decode('從不');
        MAOnTop.Caption:=UTF8Decode('總是置頂');
        MWOnTop.Caption:=UTF8Decode('播放時置頂');
      MKaspect.Caption:=UTF8Decode('維持縱橫比');
      MExpand.Caption:=UTF8Decode('用黑邊擴展視頻');
        MNoExpand.Caption:=UTF8Decode('關');
        MSrtExpand.Caption:=UTF8Decode('Srt字幕');
        MSubExpand.Caption:=UTF8Decode('Sub字幕');
      Hide_menu.Caption:=UTF8Decode('自動隱藏 主菜單');
      Mctrl.Caption:=UTF8Decode('自動隱藏 控制面板');
    MSeek.Caption:=UTF8Decode('播放');
      MPlay.Caption:=MSeek.Caption;
      MPause.Caption:=LOCstr_Status_Paused;
      MStop.Caption:=UTF8Decode('停止');
      MPrev.Caption:=UTF8Decode('上一個主題');
      MNext.Caption:=UTF8Decode('下一個主題');
      MShowPlaylist.Caption:=UTF8Decode('播放清單 ...');
      MSpeed.Caption:=UTF8Decode('播放速度');
        MN8X.Caption:=UTF8Decode('1/8倍速');
        MN4X.Caption:=UTF8Decode('1/4倍速');
        MN2X.Caption:=UTF8Decode('1/2倍速');
        M1X.Caption:=UTF8Decode('1倍速');
        M2X.Caption:=UTF8Decode('2倍速');
        M4X.Caption:=UTF8Decode('4倍速');
        M8X.Caption:=UTF8Decode('8倍速');
      MAudiochannels.Caption:=UTF8Decode('聲道');
        MStereo.Caption:=UTF8Decode('立體聲');
        MLchannels.Caption:=UTF8Decode('左聲道');
        MRchannels.Caption:=UTF8Decode('右聲道');
        MMix.Caption:=UTF8Decode('混合立體聲');
        MMute.Caption:=UTF8Decode('靜音');
      MWheelControl.Caption:=UTF8Decode('鼠標滾輪控制');
        MVol.Caption:=UTF8Decode(OSD_Volume_Prompt);
        MSize.Caption:=UTF8Decode(OSD_Size_Prompt);
      MSkip.Caption:=UTF8Decode('跳過片頭片尾');
        MIntro.Caption:=UTF8Decode('開始點 ');
        MEnd.Caption:=UTF8Decode('結束點 ');
        MSIE.Caption:=UTF8Decode('跳過片頭片尾');
      MSeekF10.Caption:=UTF8Decode('向前 10秒');
      MSeekR10.Caption:=UTF8Decode('向後 10秒');
      MSeekF60.Caption:=UTF8Decode('向前 1分鐘');
      MSeekR60.Caption:=UTF8Decode('向後 1分鐘');
      MSeekF600.Caption:=UTF8Decode('向前 10分鐘');
      MSeekR600.Caption:=UTF8Decode('向後 10分鐘');
    MExtra.Caption:=UTF8Decode('工具');
      MAudio.Caption:=UTF8Decode(OSD_AudioTrack_Prompt);
      MSubtitle.Caption:=UTF8Decode('字幕軌');
      MShowSub.Caption:=UTF8Decode('顯示/隱藏 字幕');
      MVideo.Caption:=UTF8Decode(OSD_VideoTrack_Prompt);
      MDVDT.Caption:=UTF8Decode('DVD 標題');
      MRmMenu.Caption:=UTF8Decode('返回主菜單');
      MRnMenu.Caption:=UTF8Decode('返回最近的菜單');
      MVCDT.Caption:=UTF8Decode('VCD 軌');
      MAspect.Caption:=UTF8Decode('顯示比例');
        MAutoAspect.Caption:=UTF8Decode('自動偵測');
        MForce43.Caption:=UTF8Decode('4:3');
        MForce169.Caption:=UTF8Decode('16:9');
        MForceCinemascope.Caption:=UTF8Decode('2.35:1');
        MForce54.Caption:=UTF8Decode('5:4');
        MForce85.Caption:=UTF8Decode('16:10');
        MForce221.Caption:=UTF8Decode('2.21:1');
        MForce11.Caption:=UTF8Decode('1:1');
        MForce122.Caption:=UTF8Decode('1.22:1');
        MCustomAspect.Caption:=UTF8Decode('自定義 ');
      MDeinterlace.Caption:=UTF8Decode('反交錯');
        MNoDeint.Caption:=UTF8Decode('關閉');
        MSimpleDeint.Caption:=UTF8Decode('簡單模式');
        MAdaptiveDeint.Caption:=UTF8Decode('適應模式');
      MEqualizer.Caption:=UTF8Decode('視頻均衡器');
      MOptions.Caption:=UTF8Decode('選項 ...');
      MLanguage.Caption:=UTF8Decode('語系');
      MStreamInfo.Caption:=UTF8Decode('顯示影片訊息 ...');
      MUUni.Caption:=UTF8Decode('使用Unicode顯示輸出訊息');
      MShowOutput.Caption:=UTF8Decode('顯示 MPlayer 輸出 ...');
    MVideos.Caption:=UTF8Decode('視頻');
    MAudios.Caption:=UTF8Decode('音頻');
    MSub.Caption:=UTF8Decode('字幕');
    M2ch.Caption:=UTF8Decode('2.0 立體聲');
      M4ch.Caption:=UTF8Decode('4.0 環繞立體聲');
      M6ch.Caption:=UTF8Decode('5.1 環繞立體聲');
    MShot.Caption:=UTF8Decode('截取單幀畫面');
    MLoadAudio.Caption:=UTF8Decode('載入伴音');
    MUloadAudio.Caption:=UTF8Decode('卸載伴音');
    MRotate0.Caption:=UTF8Decode('不旋轉');
      MRotate9.Caption:=UTF8Decode('順時針旋轉90度');
      MRotateN9.Caption:=UTF8Decode('逆時針旋轉90度');
    MScale.Caption:=UTF8Decode(OSD_Scale_Prompt)+' '+MVideos.Caption;
      MScale0.Caption:=UTF8Decode(OSD_Reset_Prompt+' '+OSD_Scale_Prompt);
      MScale1.Caption:=UTF8Decode('放大');
      MScale2.Caption:=UTF8Decode('縮小');
    MPan.Caption:=UTF8Decode(OSD_Reset_Prompt+' '+OSD_Balance_Prompt);
      MPan0.Caption:=UTF8Decode(OSD_Balance_Prompt+' 向右');
      MPan1.Caption:=UTF8Decode(OSD_Balance_Prompt+' 向左');
    MSubStep.Caption:=UTF8Decode('字幕 語句');
      MSubStep0.Caption:=UTF8Decode('上一句');
      MSubStep1.Caption:=UTF8Decode('下一句');
    MAudioDelay.Caption:=UTF8Decode(OSD_AudioDelay_Prompt);
      MAudioDelay0.Caption:=UTF8Decode('延遲 +');
      MAudioDelay1.Caption:=UTF8Decode('延遲 -');
      MAudioDelay2.Caption:=UTF8Decode(OSD_Reset_Prompt+' '+OSD_AudioDelay_Prompt);
    MSubDelay.Caption:=UTF8Decode(OSD_SubDelay_Prompt);
      MSubDelay0.Caption:=MAudioDelay0.Caption;
      MSubDelay1.Caption:=MAudioDelay1.Caption;
      MSubDelay2.Caption:=UTF8Decode(OSD_Reset_Prompt+' '+OSD_SubDelay_Prompt);
   MSubScale.Caption:=UTF8Decode(OSD_Scale_Prompt)+' '+MSub.Caption;
     MSubScale0.Caption:=MScale1.Caption;
     MSubScale1.Caption:=MScale2.Caption;
     MSubScale2.Caption:=UTF8Decode(OSD_Reset_Prompt)+' '+MSub.Caption+UTF8Decode(OSD_Scale_Prompt);
   MHelp.Caption:=UTF8Decode('說明');
     MKeyHelp.Caption:=UTF8Decode('快速鍵說明 ...');
     MAbout.Caption:=UTF8Decode('關於 ...');
  end;
  OptionsForm.Caption:=UTF8Decode('MPlayer 輸出');
  OptionsForm.HelpText.Text:=UTF8Decode(
'快捷鍵:'^M^J+
'Space'^I'播放/暫停'^I'T/R'^I'調節字幕在屏位置'^M^J+
'Right'^I'前進10 秒'^I'Y/U'^I'調節字幕語句'^M^J+
'Left'^I'後退10秒'^I'Z/X'^I'調節字幕延遲'^M^J+
'Up'^I'前進1分鐘'^I'C'^I'調節字幕對齊方式'^M^J+
'Down'^I'後退1分鐘'^I'B'^I'循環可用的字幕'^M^J+
'PgUp'^I'前進10分鐘'^I'V'^I'顯示/隱藏字幕'^M^J+
'PgDn'^I'後退10分鐘'^I'A'^I'切換 音軌'^M^J+
'Home'^I'前進1個MKV章節'^I'End'^I'後退1個MKV章節'^M^J+
'O'^I'切換OSD '^I'Tab'^I'切換菜單和控制面板'^M^J+
'N'^I'切換縱橫比'^I'Ctrl+方向鍵'^I'調節視頻寬高比'^M^J+
'F1'^I'循環置頂模式'^I'F或雙擊左鍵'^I'切換全屏'^M^J+
'F5'^I'切換精簡模式'^I'Alt+1~3'^I'調節視頻尺寸'^M^J+
'Q'^I'切換 視頻軌'^I',/.'^I'調節聲道左右平衡'^M^J+
'D'^I'切換丟幀模式'^I'M'^I'靜音'^M^J+
'-/+'^I'調節音頻延遲'^I'-/='^I'調節播放速度'^M^J+
'1/2'^I'調節亮度'^I'Back'^I'恢復正常播放速度'^M^J+
'3/4'^I'調節對比'^I'G/H/;'^I'DVD的菜單/選擇鈕/最近的菜單'^M^J+
'5/6'^I'調節色調'^I'I/K'^I'DVD的向上/向下鈕'^M^J+
'7/8'^I'調節飽和'^I'J/L'^I'DVD的向左/向右鈕'^M^J+
'/,9/*,0'^I'調節音量'^I'W/E'^I'縮放 視頻'^M^J+
'Enter'^I'最大化窗口'^I'Ins/Del'^I'調節Gamma'^M^J+
'S'^I'截取單幀畫面'^I'Shift+S'^I'開始/停止 截取每幀畫面'^M^J+
'[/]'^I'設置片頭/片尾'^I'\'^I'啟用/停止 跳過片頭、片尾'^M^J+
'P'^I'循環可用的節目'^I'Ctrl+左鍵拖曳'^I'調節視頻寬高比'^M^J+
'Ctrl+-/='^I'縮放 字幕'^I'Ctrl+左鍵拖曳字幕'^I'縮放 字幕'^M^J+
'中鍵'^I'切換滾輪功能'^I'Ctrl+滾輪'^I'前進/後退 媒體'^M^J+
'左鍵 單擊'^I'播放/暫停'^I'左鍵拖曳'^I'調節窗體位置'^M^J+
'/'^I'幀進'^I^I''''^I'反交錯(自適應反交錯時有效)'^M^J+
'Alt+左鍵拖曳'^I'調節亮度、對比、色調、飽和、伽瑪'^M^J+
'Shift+左鍵拖曳'^I'縮放視頻，調節音量、窗體尺寸'^M^J+
'左鍵拖曳字幕'^I'調節字幕在屏位置'^I'Shift+A'^I'切換 視角'^M^J+
'左鍵 單擊狀態欄時間'^I'切換時間顯示模式'^M^J+
'中鍵/右鍵 單擊進度條滑塊'^I'設置片頭/片尾'^M^J+
'`'^I'恢復亮度、對比、色調、飽和、伽瑪 到默認值'^M^J+
'在拖曳時，松開、按下不同的功能鍵和起始拖曳方向決定不同的功能'
  );
  with OptionsForm do begin
    LVersionMPUI.Caption:=UTF8Decode('MPUI-hcb 版本: ');
    LVersionMPlayer.Caption:=UTF8Decode('MPlayer 核心版本');
    FY.Caption:=UTF8Decode('作者:');
    Caption:=UTF8Decode('選項');
    BOK.Caption:=UTF8Decode('確認');
    BApply.Caption:=UTF8Decode('套用');
    BSave.Caption:=UTF8Decode('儲存');
    BClose.Caption:=UTF8Decode('關閉');
    TSystem.Caption:=UTF8Decode('系統');
    TVideo.Caption:=MainForm.MVideos.Caption;
    TAudio.Caption:=MainForm.MAudios.Caption;
    TSub.Caption:=MainForm.MSub.Caption;
    TAbout.Caption:=UTF8Decode('關於');
    THelp.Caption:=MainForm.MHelp.Caption;
    CSP.Caption:=UTF8Decode('單擊畫面暫停');
    CRS.Caption:=UTF8Decode('啟動時使用上次的窗體大小');
    CRP.Caption:=UTF8Decode('啟動時使用上次的窗體位置');
    CTime.Caption:=UTF8Decode('在状态栏显示系统时间');
    LAudioOut.Caption:=UTF8Decode('音效輸出驅動程式');
      CAudioOut.Items[0]:=UTF8Decode('(不解碼音效)');
      CAudioOut.Items[1]:=UTF8Decode('(不播放音效)');
    LAudioDev.Caption:=UTF8Decode('DirectSound 輸出裝置');
    LPostproc.Caption:=UTF8Decode('後置處理');
      CPostproc.Items[0]:=OptionsForm.BClose.Caption;
      CPostproc.Items[1]:=UTF8Decode('自動');
      CPostproc.Items[2]:=UTF8Decode('最佳品質');
    LOCstr_AutoLocale:=UTF8Decode('(自動選擇)');
    Cone.Caption:=UTF8Decode('僅運行一個MPUI實例');
    CIndex.Caption:=UTF8Decode('必要時重建檔案索引');
    CIndex.Hint:=UTF8Decode('在沒有找到索引的情況下重建AVI文件的索引, 從而允許搜索.'^M^J+
                            '對于損壞的/不完整的下載, 或制作低劣的AVI.');
    CSoftVol.Caption:=UTF8Decode('軟體音量控制/音量增強');
    CGUI.Caption:=UTF8Decode('使用Mplayer的GUI');
    CGUI.Hint:=UTF8Decode('對于那些沒有-nogui選項的Mplayer，也可以勾選此項避免錯誤');
    CRFScr.Caption:=UTF8Decode('右鍵全屏');
    CRFScr.Hint:=UTF8Decode('右鍵進行切換全屏操作時，右鍵菜單將不會彈出');
    CDr.Caption:=UTF8Decode('直接渲染');
    CDr.Hint:=UTF8Decode('打開直接渲染功能(不是所有的編解碼器和視頻輸出都支持),'^M^J+
                         '警告: 可能導致OSD/字幕損壞!');
    double.Caption:=UTF8Decode('雙倍緩存');
    double.Hint:=UTF8Decode('啟用雙倍緩沖. 通過在內存里儲存兩幀來解決閃爍問題,'^M^J+
                            '在顯示一幀的同時解碼另一幀. 會影響OSD. 需要單一緩'^M^J+
                            '沖方式兩倍的內存. 所以不能用于顯存很少的顯卡.');
    CVolnorm.Caption:=UTF8Decode('標準化音量');
    CVolnorm.Hint:=UTF8Decode('最大化文件的音量而不失真');
    nFconf.Caption:=UTF8Decode('使用nofontconfig選項');
    nFconf.Hint:=UTF8Decode('對于那些不支持-nofontconfig選項的Mplayer，可以'^M^J+
                            '取消勾選此項以避免錯誤');
    CSPDIF.Caption:=UTF8Decode('通過S/PDIF輸出AC3/DTS');
    LCh.Caption:=UTF8Decode('立體聲模式');
    LRot.Caption:=UTF8Decode('旋轉視頻');
    SSubcode.Caption:=UTF8Decode('字幕編碼:');
    SSubfont.Caption:=UTF8Decode('字幕字體:');
    SOsdfont.Caption:=UTF8Decode('OSD字體:');
    SOsdfont.Hint:=UTF8Decode('最近的Mplayer版本需要單獨設置OSD字體');
    RMplayer.Caption:=UTF8Decode('Mplayer的位置:');
    RCMplayer.Caption:=UTF8Decode('Mplayer和MPUI在同一目錄下');
    CWid.Caption:=UTF8Decode('使用WID');
    LVideoOut.Caption:=UTF8Decode('視效輸出驅動程式');
    CEq2.Caption:=UTF8Decode('使用軟件視頻均衡器');
    CEq2.Hint:=UTF8Decode('用于不支持硬件亮度對比度控制的顯卡/驅動');
    CYuy2.Caption:=UTF8Decode('YUY2色域');
    CYuy2.Hint:=UTF8Decode('指定使用YV12/I420或422P到YUY2的軟件轉換.用于當顯卡/驅動'^M^J+
                           '顯示YV12速度慢而YUY2速度快的情況.');
    CFlip.Caption:=UTF8Decode('上下翻轉視頻');
    CMir.Caption:=UTF8Decode('左右翻轉視頻');
    CVSync.Caption:=UTF8Decode('vsync垂直同步');
    CVSync.Hint:=UTF8Decode('對於解決圖像撕裂情況有所幫助');
    CUseekC.Caption:=UTF8Decode('快速切換DVD章節');
    CUseekC.Hint:=UTF8Decode('對於一些DVD,切換DVD章節的時候需要重啓Mplayer');
    CNi.Caption:=UTF8Decode('使用非交錯的AVI解析器');
    CNi.Hint:=UTF8Decode('用來處理某些質量差的AVI文件的播放');
    CNobps.Caption:=UTF8Decode('不用平均比特率維持AV同步');
    CNobps.Hint:=UTF8Decode('不使用平均比特率值來維持A-V同步(AVI),'^M^J+
                            '對某些文件頭損壞的AVI文件有幫助');
    CFilter.Caption:=UTF8Decode('過濾 拖放的文件');
    CFilter.Hint:=UTF8Decode('通過拖放載入文件時，僅載入支持的媒體文件');
    CDnav.Caption:=UTF8Decode('使用DVDNav');
    CDnav.Hint:=UTF8Decode('如果編譯了DVDNav');
    CUni.Caption:=UTF8Decode('以UNICODE格式處理字幕');
    CUtf.Caption:=UTF8Decode('以UTF-8格式處理字幕');
    SFontColor.Caption:=UTF8Decode('字幕顏色');
    SOutline.Caption:=UTF8Decode('字幕輪廓顏色');
    CEfont.Caption:=UTF8Decode('使用內嵌字體');
    CEfont.Hint:=UTF8Decode('允許抽取 Matroska 內嵌字體，這些字體'^M^J+
                            '能用于 SSA/ASS 字幕渲染');
    CAss.Caption:=UTF8Decode('使用SSA/ASS庫渲染字幕');
    CAss.Hint:=UTF8Decode('打開 SSA/ASS 字幕渲染，libass 將用于 SSA/ASS'^M^J+
                          '外部字幕和 Matroska 內部字幕');
    CISub.Caption:=UTF8Decode('截圖包含字幕');
    SFol.Caption:=UTF8Decode('字幕文字輪廓寬度:');
    SFsize.Caption:=UTF8Decode('字幕文字大小:');
    SFB.Caption:=UTF8Decode('字體模糊半徑:');
    CWadsp.Caption:=UTF8Decode('使用Winamp的DSP插件(如果編譯了Wadsp補丁)');
    Clavf.Caption:=UTF8Decode('使用libavformat進行Demux');
    Clavf.Hint:=UTF8Decode('對某些不能播放的文件,可以試試這個選項,'^M^J+
                           '可能造成時間顯示不準確');
    CFd.Caption:=UTF8Decode('啟用丟幀');
    CFd.Hint:=UTF8Decode('跳過一些幀從而在慢的機器上實現A/V同步.視頻濾鏡不會'^M^J+
                         '應用到這些幀上.對于B幀解碼也會完全跳過');
    CAsync.Caption:=UTF8Decode('自動同步');
    CAsync.Hint:=UTF8Decode('基于音頻延遲的檢測逐步調整A/V同步,對于某些不能連續讀取、'^M^J+
                            '幀速較低的文件（如一些屏幕捕捉的視頻）反而不是很好');
    CCache.Caption:=UTF8Decode('緩存');
    CCache.Hint:=UTF8Decode('設定播放 文件/URL的預緩沖(以kBytes為單位),'^M^J+
                            '對速度慢的媒體特別有用');
    CPriorityBoost.Caption:=UTF8Decode('以高優先級運行');
    CPriorityBoost.Hint:=UTF8Decode('使用高的優先級會避免因系統繁忙造成的播放不流暢的現象，'^M^J+
                                    '有時候可能造成其他的一些問題');
    LMAspect.Caption:=UTF8Decode('顯示器的寬高比');
    LParams.Caption:=UTF8Decode('其它 MPlayer 播放參數: ');
    LHelp.Caption:=THelp.Caption;
    SSF.Caption:=UTF8Decode('保存截圖的目錄');
    SLyric.Caption:=UTF8Decode('歌詞目錄:');
    TLyric.Caption:=UTF8Decode('歌词');
    LScroll.Caption:=UTF8Decode('平滑滾動');
    LTCL.Caption:=UTF8Decode('文字');
    LBCL.Caption:=UTF8Decode('背景');
    LHCL.Caption:=UTF8Decode('高亮');
    TBa.Caption:=UTF8Decode('全選');
    TBn.Caption:=UTF8Decode('無');
    TFadd.Caption:=UTF8Decode('添加');
    TFdel.Caption:=UTF8Decode('刪除');
    TFSet.Caption:=UTF8Decode('關聯');
    TOther.Caption:=UTF8Decode('其他');
    CDs.Caption:=UTF8Decode('播放音頻時顯示logo');
  end;
  with PlaylistForm do begin
    Caption:=UTF8Decode('播放清單');
    BPlay.Hint:=UTF8Decode('播放');
    BAdd.Hint:=UTF8Decode('新增 ...');
    BAddDir.Hint:=UTF8Decode('新增目錄 ...');
    BMoveUp.Hint:=UTF8Decode('上移');
    BMoveDown.Hint:=UTF8Decode('下移');
    BDelete.Hint:=UTF8Decode('移除');
    CShuffle.Hint:=UTF8Decode('隨機播放');
    CLoop.Hint:=UTF8Decode('重複播放');
    COneLoop.Hint:=UTF8Decode('循環播放當前');
    BSave.Hint:=UTF8Decode('儲存播放清單為 ...');
    TntTabSheet1.Caption:=Caption;
    TntTabSheet2.Caption:=UTF8Decode('歌詞');
    CP0.Caption:=UTF8Decode('系統默認');
    MGB.Caption:=UTF8Decode('简体<-->繁體');
    CPO.Caption:=UTF8Decode('其他');
    SC.Caption:=UTF8Decode('簡體中文');
    TC.Caption:=UTF8Decode('繁體中文');
    CY0.Caption:=UTF8Decode('Русский (俄文 OEM866)');
    CY.Caption:=UTF8Decode('西里爾文');
    CY4.Caption:=UTF8Decode('Русский (俄文, 20866,KOI8-R)');
    CY6.Caption:=UTF8Decode('Українська (烏克蘭文,21866,KOI8-U)');
    AR.Caption:=UTF8Decode('العربية (阿拉伯文)');
    TU.Caption:=UTF8Decode('Türkiye (土耳其文)');
    HE.Caption:=UTF8Decode('עִבְרִית‎ (希伯來文)');
    JA.Caption:=UTF8Decode('日文');
    KO.Caption:=UTF8Decode('한국어 (韓文)');
    TH.Caption:=UTF8Decode('ภาษาไทย (泰文)');
    FR.Caption:=UTF8Decode('Français(法文)');
    IC.Caption:=UTF8Decode('íslenska (冰島文)');
    BG.Caption:=UTF8Decode('Български (保加利亞文)');
    PO.Caption:=UTF8Decode('Português(葡萄牙文)');
    GR.Caption:=UTF8Decode('Ελληνικά (希臘文)');
    BA.Caption:=UTF8Decode('波羅的海文');
    VI.Caption:=UTF8Decode('Việt (越南文1258,windows-1258)');
    WE.Caption:=UTF8Decode('西歐(1252,iso-8859-1)');
    CE.Caption:=UTF8Decode('中歐');
    ND.Caption:=UTF8Decode('Norsk (挪威文)');
    i18.Caption:=UTF8Decode('國際');
    co.Caption:=UTF8Decode('Hrvatska (克羅地亞文)');
    rm.Caption:=UTF8Decode('Română (羅馬尼亞文)');
    ro.Caption:=UTF8Decode('羅馬文');
    pg.Caption:=UTF8Decode('ਪੰਜਾਬੀ 旁遮普(古爾木其)文');
    gu.Caption:=UTF8Decode('ગુજરાતી (古吉拉特文)');
    ma.Caption:=UTF8Decode('മലയാളം (馬拉亞拉姆文)');
    ka.Caption:=UTF8Decode('ಕನ್ನಡ (卡納達文)');
    oy.Caption:=UTF8Decode('奧里亞文');
    am.Caption:=UTF8Decode('অসমীয়া (阿薩姆文)');
    te.Caption:=UTF8Decode('తెలుగు (泰盧固文)');
    ta.Caption:=UTF8Decode('தமிழ் (泰米爾文)');
    be.Caption:=UTF8Decode('বাংলা (孟加拉文)');
    dv.Caption:=UTF8Decode('संस्कृतम् (梵文)');
  end;
  AddDirCp:=UTF8Decode('選擇一個文件夾');
  with EqualizerForm do begin
    Caption:=MainForm.MEqualizer.Caption;
    BReset.Caption:=UTF8Decode(OSD_Reset_Prompt);
    BClose.Caption:=OptionsForm.BClose.Caption;
    SBri.Caption:=UTF8Decode(OSD_Brightness_Prompt);
    SCon.Caption:=UTF8Decode(OSD_Contrast_Prompt);
    SSat.Caption:=UTF8Decode(OSD_Saturation_Prompt);
    SHue.Caption:=UTF8Decode(OSD_Hue_Prompt);
  end;
  InfoForm.Caption:=UTF8Decode('影片資訊');
  InfoForm.BClose.Caption:=OptionsForm.BClose.Caption;
  InfoForm.TCB.Caption:=UTF8Decode('拷貝資訊');
  LOCstr_NoInfo:=UTF8Decode('目前沒有可用的影片資訊');
  LOCstr_InfoFileName:=UTF8Decode('影片');
  LOCstr_InfoFileFormat:=UTF8Decode('影片格式');
  LOCstr_InfoPlaybackTime:=UTF8Decode('影片長度');
  LOCstr_InfoTags:=UTF8Decode('影片 metadata');
  LOCstr_InfoVideo:=UTF8Decode(OSD_VideoTrack_Prompt);
  LOCstr_InfoAudio:=UTF8Decode(OSD_AudioTrack_Prompt);
  LOCstr_InfoDecoder:=UTF8Decode('解碼器');
  LOCstr_InfoCodec:=UTF8Decode('CODEC');
  LOCstr_InfoBitrate:=UTF8Decode('平均流量');
  LOCstr_InfoVideoSize:=UTF8Decode('畫面大小');
  LOCstr_InfoVideoFPS:=UTF8Decode('畫面頻率');
  LOCstr_InfoVideoAspect:=UTF8Decode('顯示比例');
  LOCstr_InfoAudioRate:=UTF8Decode('取樣率');
  LOCstr_InfoAudioChannels:=UTF8Decode(' 聲道數');
  Ccap:=UTF8Decode('章節');
  Acap:=UTF8Decode('視角');
end;

begin
  RegisterLocale(UTF8Decode('繁體中文 (Traditional Chinese)'),Activate,$404,CHINESEBIG5_CHARSET);
end.
