{   MPUI, an MPlayer frontend for Windows
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
unit mo_cn;
interface
implementation
uses Windows,Locale,Main,Options,plist,Info,Core,Equalizer;

procedure Activate;
begin
  with MainForm do begin
    LOCstr_Title:=UTF8Decode('MPlayer for Windows');
      LOCstr_Status_Opening:=UTF8Decode('打开 ...');
      LOCstr_Status_Closing:=UTF8Decode('关闭 ...');
      LOCstr_Status_Playing:=UTF8Decode('播放');
      LOCstr_Status_Paused:=UTF8Decode('暂停/帧进');
      LOCstr_Status_Stopped:=UTF8Decode('停止');
      LOCstr_Status_Error:=UTF8Decode('不能播放该文件 (点击这里查看更多的信息)');
      LOCstr_SetPW_Caption:=UTF8Decode('请输入下列文档的正确解压密码');
      LOCstr_NoSuport_OS_Prompt:=UTF8Decode('不能运行MPlayer: 不支持的操作系统版本');
      LOCstr_Win9x_Prompt:=UTF8Decode('MPUI不能正常的运行在Win9x系统下。继续吗?');
      LOCstr_Check_Mplayer_Prompt:=UTF8Decode('请检查MPlayer.exe的位置是否正确');
      LOCstr_Error1_Prompt:=UTF8Decode('错误代码(');
      LOCstr_Error2_Prompt:=UTF8Decode('): 在加载MPlayer时');
      LOCstr_CmdLine_Prompt:=UTF8Decode('命令行:');
      OSD_Volume_Prompt:='音量';
      OSD_ScreenShot_Prompt:='截屏 ';
      OSD_Contrast_Prompt:='对比度';
      OSD_Brightness_Prompt:='亮度';
      OSD_Hue_Prompt:='色调';
      OSD_Saturation_Prompt:='饱和度';
      OSD_Gamma_Prompt:='灰度';
      OSD_Enable_Prompt:='启用';
      OSD_Disable_Prompt:='停用';
      OSD_VideoTrack_Prompt:='视频轨';
      OSD_AudioTrack_Prompt:='音频轨';
      OSD_OnTop0_Prompt:='取消置顶';
      OSD_OnTop1_Prompt:='总在最上';
      OSD_OnTop2_Prompt:='播放时总在最上';
      OSD_Auto_Prompt:='自动';
      OSD_Custom_Prompt:='自定义';
      OSD_Size_Prompt:='尺寸';
      OSD_Scale_Prompt:='缩放';
      OSD_Balance_Prompt:='声道左右平衡';
      OSD_Reset_Prompt:='重置';
      OSD_AudioDelay_Prompt:='音频延迟';
      OSD_SubDelay_Prompt:='字幕延迟';
      SubFilter:=UTF8Decode('字幕文件');
      AudioFilter:=UTF8Decode('音频文件');
      AnyFilter:=UTF8Decode('所有文件');
      FontFilter:=UTF8Decode('字体文件');
      MediaFilter:=UTF8Decode('媒体文件');
      LyricFilter:=UTF8Decode('歌词文件');
    BPause.Hint:=LOCstr_Status_Paused;
    BOpen.Hint:=UTF8Decode('打开 文件');
    BPlaylist.Hint:=UTF8Decode('显示/隐藏 播放列表窗口');
    BStreamInfo.Hint:=UTF8Decode('显示/隐藏 文件信息 ...');
    BFullscreen.Hint:=UTF8Decode('全屏');
    BCompact.Hint:=UTF8Decode('切换到 精简模式');
    BMute.Hint:=UTF8Decode('静音');
    BSkip.Hint:=UTF8Decode('启用/停止 跳过片头、片尾');
    SeekBarSlider.Hint:=UTF8Decode('鼠标中键/右键单击 设置片头/片尾位置');
    MPCtrl.Caption:=UTF8Decode('显示菜单和控制面板');
    OSDMenu.Caption:=UTF8Decode('OSD 模式');
      MNoOSD.Caption:=UTF8Decode('无 OSD');
      MDefaultOSD.Caption:=UTF8Decode('默认 OSD');
      MTimeOSD.Caption:=UTF8Decode('显示时间');
      MFullOSD.Caption:=UTF8Decode('显示总时间');
    LEscape.Caption:=UTF8Decode('按Esc键退出全屏模式.');
    MFile.Caption:=UTF8Decode('文件');
      MOpenFile.Caption:=UTF8Decode('打开 文件 ...');
      MOpenDir.Caption:=UTF8Decode('打开 目录 ...');
      MOpenURL.Caption:=UTF8Decode('打开 URL ...');
        LOCstr_OpenURL_Caption:=UTF8Decode('打开 URL');
        LOCstr_OpenURL_Prompt:=UTF8Decode('你想要打开的 URL 是？');
      MOpenDrive.Caption:=UTF8Decode('播放 光盘');
      MLoadLyric.Caption:=UTF8Decode('载入歌词');
      MLoadSub.Caption:=UTF8Decode('载入字幕...');
      MSubfont.Caption:=UTF8Decode('字幕字体...');
      MOsdfont.Caption:=UTF8Decode('OSD字体...');
      MClose.Caption:=UTF8Decode('关闭');
      MQuit.Caption:=UTF8Decode('退出');
    MView.Caption:=UTF8Decode('查看');
      MSizeAny.Caption:=UTF8Decode('自定义尺寸 (');
      MSCS.Caption:=UTF8Decode('设置 自定义尺寸');
      MSize50.Caption:=UTF8Decode('一半大小 50%');
      MSize100.Caption:=UTF8Decode('原始大小 100%');
      MSize200.Caption:=UTF8Decode('两倍大小 200%');
      MFullscreen.Caption:=BFullscreen.Hint;
      MMaxW.Caption:=UTF8Decode('最大化窗口');
      MCompact.Caption:=UTF8Decode('精简模式');
      MOnTop.Caption:=UTF8Decode('置顶模式');
        MNoOnTop.Caption:=UTF8Decode('从不');
        MAOnTop.Caption:=UTF8Decode('总是置顶');
        MWOnTop.Caption:=UTF8Decode('播放时置顶');
      MKaspect.Caption:=UTF8Decode('维持纵横比');
      MExpand.Caption:=UTF8Decode('用黑边扩展视频');
        MNoExpand.Caption:=UTF8Decode('关');
        MSrtExpand.Caption:=UTF8Decode('Srt字幕');
        MSubExpand.Caption:=UTF8Decode('Sub字幕');
      Hide_menu.Caption:=UTF8Decode('自动隐藏 主菜单');
      Mctrl.Caption:=UTF8Decode('自动隐藏 控制面板');
    MSeek.Caption:=LOCstr_Status_Playing;
      MPlay.Caption:=LOCstr_Status_Playing;
      MPause.Caption:=LOCstr_Status_Paused;
      MStop.Caption:=UTF8Decode('停止');
      MPrev.Caption:=UTF8Decode('上一个');
      MNext.Caption:=UTF8Decode('下一个');
      MShowPlaylist.Caption:=UTF8Decode('播放列表 ...');
      MSpeed.Caption:=UTF8Decode('播放速度');
        MN8X.Caption:=UTF8Decode('1/8倍速');
        MN4X.Caption:=UTF8Decode('1/4倍速');
        MN2X.Caption:=UTF8Decode('1/2倍速');
        M1X.Caption:=UTF8Decode('1倍速');
        M2X.Caption:=UTF8Decode('2倍速');
        M4X.Caption:=UTF8Decode('4倍速');
        M8X.Caption:=UTF8Decode('8倍速');
      MAudiochannels.Caption:=UTF8Decode('声道');
        MStereo.Caption:=UTF8Decode('立体声');
        MLchannels.Caption:=UTF8Decode('左声道');
        MRchannels.Caption:=UTF8Decode('右声道');
        MMix.Caption:=UTF8Decode('混合立体声');
        MMute.Caption:=BMute.Hint;
      MWheelControl.Caption:=UTF8Decode('鼠标滚轮控制');
        MVol.Caption:=UTF8Decode(OSD_Volume_Prompt);
        MSize.Caption:=UTF8Decode(OSD_Size_Prompt);
      MSkip.Caption:=UTF8Decode('跳过片头片尾');
        MIntro.Caption:=UTF8Decode('开始点 ');
        MEnd.Caption:=UTF8Decode('结束点 ');
        MSIE.Caption:=UTF8Decode('跳过片头片尾');
      MSeekF10.Caption:=UTF8Decode('前进 10 秒');
      MSeekR10.Caption:=UTF8Decode('后退 10 秒');
      MSeekF60.Caption:=UTF8Decode('前进 1 分钟');
      MSeekR60.Caption:=UTF8Decode('后退 1 分钟');
      MSeekF600.Caption:=UTF8Decode('前进 10 分钟');
      MSeekR600.Caption:=UTF8Decode('后退 10 分钟');
    MExtra.Caption:=UTF8Decode('工具');
      MAudio.Caption:=UTF8Decode(OSD_AudioTrack_Prompt);
      MSubtitle.Caption:=UTF8Decode('字幕轨');
      MShowSub.Caption:=UTF8Decode('显示/隐藏 字幕');
      MVideo.Caption:=UTF8Decode(OSD_VideoTrack_Prompt);
      MDVDT.Caption:=UTF8Decode('DVD 标题');
      MRmMenu.Caption:=UTF8Decode('返回主菜单');
      MRnMenu.Caption:=UTF8Decode('返回最近的菜单');
      MVCDT.Caption:=UTF8Decode('VCD 轨');
      MAspect.Caption:=UTF8Decode('纵横比');
        MAutoAspect.Caption:=UTF8Decode('自动');
        MForce43.Caption:=UTF8Decode('4:3');
        MForce169.Caption:=UTF8Decode('16:9');
        MForceCinemascope.Caption:=UTF8Decode('2.35:1');
        MForce54.Caption:=UTF8Decode('5:4');
        MForce85.Caption:=UTF8Decode('16:10');
        MForce221.Caption:=UTF8Decode('2.21:1');
        MForce11.Caption:=UTF8Decode('1:1');
        MForce122.Caption:=UTF8Decode('1.22:1');
        MCustomAspect.Caption:=UTF8Decode('自定义 ');
      MDeinterlace.Caption:=UTF8Decode('反交错');
        MNoDeint.Caption:=UTF8Decode('关');
        MSimpleDeint.Caption:=UTF8Decode('简单');
        MAdaptiveDeint.Caption:=UTF8Decode('自适应');
      MEqualizer.Caption:=UTF8Decode('视频均衡器');
      MOptions.Caption:=UTF8Decode('选项 ...');
      MLanguage.Caption:=UTF8Decode('语言');
      MStreamInfo.Caption:=UTF8Decode('显示文件信息 ...');
      MUUni.Caption:=UTF8Decode('使用Unicode显示输出信息');
      MShowOutput.Caption:=UTF8Decode('显示 MPlayer 输出信息 ...');
    MVideos.Caption:=UTF8Decode('视频');
    MAudios.Caption:=UTF8Decode('音频');
    MSub.Caption:=UTF8Decode('字幕');
    M2ch.Caption:=UTF8Decode('2.0 立体声');
    M4ch.Caption:=UTF8Decode('4.0 环绕立体声');
    M6ch.Caption:=UTF8Decode('5.1 环绕立体声');
    MShot.Caption:=UTF8Decode('截取单帧画面');
    MLoadAudio.Caption:=UTF8Decode('载入伴音');
    MUloadAudio.Caption:=UTF8Decode('卸载伴音');
    MRotate0.Caption:=UTF8Decode('不旋转');
    MRotate9.Caption:=UTF8Decode('顺时针旋转90度');
    MRotateN9.Caption:=UTF8Decode('逆时针旋转90度');
    MScale.Caption:=UTF8Decode(OSD_Scale_Prompt)+' '+MVideos.Caption;
      MScale0.Caption:=UTF8Decode(OSD_Reset_Prompt+' '+OSD_Scale_Prompt);
      MScale1.Caption:=UTF8Decode('放大');
      MScale2.Caption:=UTF8Decode('缩小');
   MPan.Caption:=UTF8Decode(OSD_Reset_Prompt+' '+OSD_Balance_Prompt);
     MPan0.Caption:=UTF8Decode(OSD_Balance_Prompt+' 向右');
     MPan1.Caption:=UTF8Decode(OSD_Balance_Prompt+' 向左');
   MSubStep.Caption:=UTF8Decode('字幕 语句');
     MSubStep0.Caption:=UTF8Decode('上一句');
     MSubStep1.Caption:=UTF8Decode('下一句');
   MAudioDelay.Caption:=UTF8Decode(OSD_AudioDelay_Prompt);
     MAudioDelay0.Caption:=UTF8Decode('延迟 +');
     MAudioDelay1.Caption:=UTF8Decode('延迟 -');
     MAudioDelay2.Caption:=UTF8Decode(OSD_Reset_Prompt+' '+OSD_AudioDelay_Prompt);
   MSubDelay.Caption:=UTF8Decode(OSD_SubDelay_Prompt);
     MSubDelay0.Caption:=MAudioDelay0.Caption;
     MSubDelay1.Caption:=MAudioDelay1.Caption;
     MSubDelay2.Caption:=UTF8Decode(OSD_Reset_Prompt+' '+OSD_SubDelay_Prompt);
   MSubScale.Caption:=UTF8Decode(OSD_Scale_Prompt)+' '+MSub.Caption;
     MSubScale0.Caption:=MScale1.Caption;
     MSubScale1.Caption:=MScale2.Caption;
     MSubScale2.Caption:=UTF8Decode(OSD_Reset_Prompt)+' '+MSub.Caption+UTF8Decode(OSD_Scale_Prompt);
  end;
  OptionsForm.Caption:=UTF8Decode('MPlayer 输出');
  OptionsForm.BClose.Caption:=UTF8Decode('关闭');
  OptionsForm.HelpText.Text:=UTF8Decode(
'快捷键:'^M^J+
'Space'^I'播放/暂停'^I'T/R'^I'调节字幕在屏位置'^M^J+
'Right'^I'前进10 秒'^I'Y/U'^I'调节字幕语句'^M^J+
'Left'^I'后退10秒'^I'Z/X'^I'调节字幕延迟'^M^J+
'Up'^I'前进1分钟'^I'C'^I'调节字幕对齐方式'^M^J+
'Down'^I'后退1分钟'^I'B'^I'循环可用的字幕'^M^J+
'PgUp'^I'前进10分钟'^I'V'^I'显示/隐藏字幕'^M^J+
'PgDn'^I'后退10分钟'^I'A'^I'切换 音轨'^M^J+
'Home'^I'前进1个MKV章节'^I'End'^I'后退1个MKV章节'^M^J+
'O'^I'切换OSD '^I'Tab'^I'切换菜单和控制面板'^M^J+
'N'^I'切换纵横比'^I'Ctrl+方向键'^I'调节视频宽高比'^M^J+
'F1'^I'循环置顶模式'^I'F或双击左键'^I'切换全屏'^M^J+
'F5'^I'切换精简模式'^I'Alt+1~3'^I'调节视频尺寸'^M^J+
'Q'^I'切换 视频轨'^I',/.'^I'调节声道左右平衡'^M^J+
'D'^I'切换丢帧模式'^I'M'^I'静音'^M^J+
'-/+'^I'调节音频延迟'^I'-/='^I'调节播放速度'^M^J+
'1/2'^I'调节亮度'^I'Back'^I'恢复正常播放速度'^M^J+
'3/4'^I'调节对比'^I'G/H/;'^I'DVD的菜单/选择钮/最近的菜单'^M^J+
'5/6'^I'调节色调'^I'I/K'^I'DVD的向上/向下钮'^M^J+
'7/8'^I'调节饱和'^I'J/L'^I'DVD的向左/向右钮'^M^J+
'÷,9/*,0'^I'调节音量'^I'W/E'^I'缩放 视频'^M^J+
'Enter'^I'最大化窗口'^I'Ins/Del'^I'调节Gamma'^M^J+
'S'^I'截取单帧画面'^I'Shift+S'^I'开始/停止 截取每帧画面'^M^J+
'[/]'^I'设置片头/片尾'^I'\'^I'启用/停止 跳过片头、片尾'^M^J+
'P'^I'循环可用的节目'^I'Ctrl+左键拖曳'^I'调节视频宽高比'^M^J+
'Ctrl+-/='^I'缩放 字幕'^I'Ctrl+左键拖曳字幕'^I'缩放 字幕'^M^J+
'中键'^I'切换滚轮功能'^I'Ctrl+滚轮'^I'前进/后退 媒体'^M^J+
'左键 单击'^I'播放/暂停'^I'左键拖曳'^I'调节窗体位置'^M^J+
'/'^I'帧进'^I^I''''^I'反交错(自适应反交错时有效)'^M^J+
'Alt+左键拖曳'^I'调节亮度、对比、色调、饱和、伽玛'^M^J+
'Shift+左键拖曳'^I'缩放视频，调节音量、窗体尺寸'^M^J+
'左键拖曳字幕'^I'调节字幕在屏位置'^I'Shift+A'^I'切换 视角'^M^J+
'左键 单击状态栏时间'^I'切换时间显示模式'^M^J+
'中键/右键 单击进度条滑块'^I'设置片头/片尾'^M^J+
'`'^I'恢复亮度、对比、色调、饱和、伽玛 到默认值'^M^J+
'在拖曳时，松开、按下不同的功能键和起始拖曳方向决定不同的功能'
  );
  with OptionsForm do begin
    THelp.Caption:=UTF8Decode('帮助');
    TAbout.Caption:=UTF8Decode('关于');
    LVersionMPUI.Caption:=UTF8Decode('MPUI-hcb 版本:');
    LVersionMPlayer.Caption:=UTF8Decode('MPlayer 版本:');
    FY.Caption:=UTF8Decode('作者:');
    Caption:=UTF8Decode('选项');
    BOK.Caption:=UTF8Decode('确定');
    BApply.Caption:=UTF8Decode('应用');
    BSave.Caption:=UTF8Decode('保存');
    BClose.Caption:=OptionsForm.BClose.Caption;
    TSystem.Caption:=UTF8Decode('系统');
    TVideo.Caption:=MainForm.MVideos.Caption;
    TAudio.Caption:=MainForm.MAudios.Caption;
    TSub.Caption:=MainForm.MSub.Caption;
    CSP.Caption:=UTF8Decode('单击画面暂停');
    CRS.Caption:=UTF8Decode('启动时使用上次的窗体大小');
    CTime.Caption:=UTF8Decode('在状态栏显示系统时间');
    CRP.Caption:=UTF8Decode('启动时使用上次的窗体位置');
    LAudioOut.Caption:=UTF8Decode('音频输出的驱动:');
      CAudioOut.Items[0]:=UTF8Decode('(不解码 音频)');
      CAudioOut.Items[1]:=UTF8Decode('(不播放 音频)');
    LAudioDev.Caption:=UTF8Decode('DirectSound 输出设备:');
    LPostproc.Caption:=UTF8Decode('图像后处理');
      CPostproc.Items[0]:=UTF8Decode('关');
      CPostproc.Items[1]:=UTF8Decode('自动');
      CPostproc.Items[2]:=UTF8Decode('最佳画质');
    LOCstr_AutoLocale:=UTF8Decode('(自动-选择)');
    Cone.Caption:=UTF8Decode('仅运行一个MPUI实例');
    CIndex.Caption:=UTF8Decode('重建 文件索引');
    CIndex.Hint:=UTF8Decode('在没有找到索引的情况下重建AVI文件的索引, 从而允许搜索.'^M^J+
                            '对于损坏的/不完整的下载, 或制作低劣的AVI.');
    CSoftVol.Caption:=UTF8Decode('音量增益10倍');
    CGUI.Caption:=UTF8Decode('使用Mplayer的GUI');
    CGUI.Hint:=UTF8Decode('对于那些没有-nogui选项的Mplayer，也可以勾选此项避免错误');
    CRFScr.Caption:=UTF8Decode('右键全屏');
    CRFScr.Hint:=UTF8Decode('右键进行切换全屏操作时，右键菜单将不会弹出');
    CDr.Caption:=UTF8Decode('直接渲染');
    CDr.Hint:=UTF8Decode('打开直接渲染功能(不是所有的编解码器和视频输出都支持),'^M^J+
                         '警告: 可能导致OSD/字幕损坏!');
    double.Caption:=UTF8Decode('双倍缓存');
    double.Hint:=UTF8Decode('启用双缓冲. 通过在内存里储存两帧来解决闪烁问题, 在显示'^M^J+
                            '一帧的同时解码另一帧.会影响OSD. 需要单一缓冲方式两倍的'^M^J+
                            '内存. 所以不能用于显存很少的显卡.');
    CVolnorm.Caption:=UTF8Decode('标准化音量');
    CVolnorm.Hint:=UTF8Decode('最大化文件的音量而不失真');
    nFconf.Caption:=UTF8Decode('使用nofontconfig选项');
    nFconf.Hint:=UTF8Decode('对于那些不支持-nofontconfig选项的Mplayer，可以'^M^J+
                            '取消勾选此项以避免错误');
    CSPDIF.Caption:=UTF8Decode('通过S/PDIF输出AC3/DTS');
    LCh.Caption:=UTF8Decode('立体声输出模式');
    LRot.Caption:=UTF8Decode('旋转视频');
    SSubcode.Caption:=UTF8Decode('字幕编码:');
    SSubfont.Caption:=UTF8Decode('字幕字体:');
    SOsdfont.Caption:=UTF8Decode('OSD字体:');
    SOsdfont.Hint:=UTF8Decode('最近的Mplayer版本需要单独设置OSD字体');
    RMplayer.Caption:=UTF8Decode('Mplayer的位置');
    RCMplayer.Caption:=UTF8Decode('Mplayer和MPUI在同一目录下');
    CWid.Caption:=UTF8Decode('使用WID');
    LMAspect.Caption:=UTF8Decode('显示器的宽高比');
    LVideoOut.Caption:=UTF8Decode('视频输出的驱动');
    CEq2.Caption:=UTF8Decode('使用软件视频均衡器');
    CEq2.Hint:=UTF8Decode('用于不支持硬件亮度对比度控制的显卡/驱动');
    CYuy2.Caption:=UTF8Decode('YUY2色域');
    CYuy2.Hint:=UTF8Decode('指定使用YV12/I420或422P到YUY2的软件转换.用于当显卡/驱动'^M^J+
                           '显示YV12速度慢而YUY2速度快的情况.');
    CFlip.Caption:=UTF8Decode('上下翻转视频');
    CMir.Caption:=UTF8Decode('左右翻转视频');
    CUseekC.Caption:=UTF8Decode('快速切换DVD章节');
    CUseekC.Hint:=UTF8Decode('对于一些DVD,切换DVD章节的时候需要重启Mplayer');
    CVSync.Caption:=UTF8Decode('vsync垂直同步');
    CVSync.Hint:=UTF8Decode('对于解决图像撕裂情况有所帮助');
    CNi.Caption:=UTF8Decode('使用非交错的AVI解析器');
    CNi.Hint:=UTF8Decode('用来处理某些质量差的AVI文件的播放');
    CNobps.Caption:=UTF8Decode('不用平均比特率维持AV同步');
    CNobps.Hint:=UTF8Decode('不使用平均比特率值来维持AV同步(AVI),'^M^J+
                            '对某些文件头损坏的AVI文件有帮助');
    CFilter.Caption:=UTF8Decode('过滤 拖放的文件');
    CFilter.Hint:=UTF8Decode('通过拖放载入文件时，仅载入支持的媒体文件');
    CDnav.Caption:=UTF8Decode('使用DVDNav');
    CDnav.Hint:=UTF8Decode('如果编译了DVDNav');
    CUni.Caption:=UTF8Decode('以UNICODE格式处理字幕');
    CUtf.Caption:=UTF8Decode('以UTF-8格式处理字幕');
    SFontColor.Caption:=UTF8Decode('字幕颜色');
    SOutline.Caption:=UTF8Decode('字幕轮廓颜色');
    CEfont.Caption:=UTF8Decode('使用内嵌字体');
    CEfont.Hint:=UTF8Decode('允许抽取 Matroska 内嵌字体，这些字体能用于 SSA/ASS 字幕渲染');
    CAss.Caption:=UTF8Decode('使用SSA/ASS库渲染字幕');
    CAss.Hint:=UTF8Decode('打开 SSA/ASS 字幕渲染，libass 将用于 SSA/ASS'^M^J+
                          '外部字幕和 Matroska 内部字幕');
    CISub.Caption:=UTF8Decode('截图包含字幕');
    SFol.Caption:=UTF8Decode('字幕文字轮廓宽度:');
    SFsize.Caption:=UTF8Decode('字幕文字大小:');
    SFB.Caption:=UTF8Decode('字体模糊半径:');
    CWadsp.Caption:=UTF8Decode('使用Winamp的DSP插件(如果编译了Wadsp补丁)');
    Clavf.Caption:=UTF8Decode('使用libavformat进行Demux');
    Clavf.Hint:=UTF8Decode('对某些不能播放的文件,可以试试这个选项,可能造成时间显示不准确');
    CFd.Caption:=UTF8Decode('启用丢帧');
    CFd.Hint:=UTF8Decode('跳过一些帧从而在慢的机器上实现A/V同步.视频滤镜不会应用到这些帧上.'^M^J+
                         '对于B帧解码也会完全跳过');
    CAsync.Caption:=UTF8Decode('自动同步');
    CAsync.Hint:=UTF8Decode('基于音频延迟的检测逐步调整A/V同步,对于某些不能连续读取、帧速较低'^M^J+
                            '的文件（如一些屏幕捕捉的视频）反而不是很好');
    CCache.Caption:=UTF8Decode('缓存');
    CCache.Hint:=UTF8Decode('设定播放 文件/URL的预缓冲(以kBytes为单位),对速度慢的媒体特别有用');
    CPriorityBoost.Caption:=UTF8Decode('以高优先级运行');
    CPriorityBoost.Hint:=UTF8Decode('使用高的优先级会避免因系统繁忙造成的播放不流畅的现象，'^M^J+
                                    '有时候可能造成其他的一些问题');
    LParams.Caption:=UTF8Decode('其它 MPlayer 播放参数:');
    LHelp.Caption:=THelp.Caption;
    SSF.Caption:=UTF8Decode('保存截图的目录');
    SLyric.Caption:=UTF8Decode('歌词目录:');
    TLyric.Caption:=UTF8Decode('歌词');
    LScroll.Caption:=UTF8Decode('平滑滚动');
    LTCL.Caption:=UTF8Decode('文字');
    LBCL.Caption:=UTF8Decode('背景');
    LHCL.Caption:=UTF8Decode('高亮');
  end;
  with PlaylistForm do begin
    Caption:=UTF8Decode('播放列表');
    BPlay.Hint:=UTF8Decode('播放 列表');
    BAdd.Hint:=UTF8Decode('添加文件 ...');
    BAddDir.Hint:=UTF8Decode('添加目录 ...');
    BMoveUp.Hint:=UTF8Decode('上移');
    BMoveDown.Hint:=UTF8Decode('下移');
    BDelete.Hint:=UTF8Decode('移除所选');
    BClear.Hint:=UTF8Decode('清除列表');
    CShuffle.Hint:=UTF8Decode('随机播放');
    CLoop.Hint:=UTF8Decode('循环播放全部');
    COneLoop.Hint:=UTF8Decode('循环播放当前');
    BSave.Hint:=UTF8Decode('保存播放列表...');
    TntTabSheet1.Caption:=Caption;
    TntTabSheet2.Caption:=UTF8Decode('歌词');
    CP0.Caption:=UTF8Decode('系统默认');
    CPO.Caption:=UTF8Decode('其他');
    SC.Caption:=UTF8Decode('简体中文');
    TC.Caption:=UTF8Decode('繁體中文');
    CY0.Caption:=UTF8Decode('Русский (俄文 OEM866)');
    CY.Caption:=UTF8Decode('西里尔文');
    CY4.Caption:=UTF8Decode('Русский (俄文, 20866,KOI8-R)');
    CY6.Caption:=UTF8Decode('Українська (乌克兰文,21866,KOI8-U)');
    BG.Caption:=UTF8Decode('Български (保加利亚文)');
    AR.Caption:=UTF8Decode('العربية (阿拉伯文)');
    TU.Caption:=UTF8Decode('Türkiye (土耳其文)');
    HE.Caption:=UTF8Decode('עִבְרִית‎ (希伯来文)');
    JA.Caption:=UTF8Decode('日文');
    KO.Caption:=UTF8Decode('한국어 (韩文)');
    TH.Caption:=UTF8Decode('ภาษาไทย (泰文)');
    FR.Caption:=UTF8Decode('Français(法文)');
    IC.Caption:=UTF8Decode('íslenska (冰岛文)');
    PO.Caption:=UTF8Decode('Português(葡萄牙文)');
    GR.Caption:=UTF8Decode('Ελληνικά (希腊文)');
    BA.Caption:=UTF8Decode('波罗的海文');
    VI.Caption:=UTF8Decode('Việt (越南文1258,windows-1258)');
    WE.Caption:=UTF8Decode('西欧(1252,iso-8859-1)');
    CE.Caption:=UTF8Decode('中欧');
    ND.Caption:=UTF8Decode('Norsk (挪威文)');
    i18.Caption:=UTF8Decode('国际');
    co.Caption:=UTF8Decode('Hrvatska (克罗地亚文)');
    rm.Caption:=UTF8Decode('Română (罗马尼亚文)');
    ro.Caption:=UTF8Decode('罗马文');
    pg.Caption:=UTF8Decode('ਪੰਜਾਬੀ 旁遮普(古尔木其)文');
    gu.Caption:=UTF8Decode('ગુજરાતી (古吉拉特文)');
    ma.Caption:=UTF8Decode('മലയാളം (马拉亚拉姆文)');
    ka.Caption:=UTF8Decode('ಕನ್ನಡ (卡纳达文)');
    oy.Caption:=UTF8Decode('奥里亚文');
    am.Caption:=UTF8Decode('অসমীয়া (阿萨姆文)');
    te.Caption:=UTF8Decode('తెలుగు (泰卢固文)');
    ta.Caption:=UTF8Decode('தமிழ் (泰米尔文)');
    be.Caption:=UTF8Decode('বাংলা (孟加拉文)');
    dv.Caption:=UTF8Decode('संस्कृतम् (梵文)');
  end;
  AddDircp:=UTF8Decode('选择一个文件夹');
  with EqualizerForm do begin
    Caption:=MainForm.MEqualizer.Caption;
    BReset.Caption:=UTF8Decode(OSD_Reset_Prompt);
    BClose.Caption:=UTF8Decode('关闭');
    SBri.Caption:=UTF8Decode(OSD_Brightness_Prompt);
    SCon.Caption:=UTF8Decode(OSD_Contrast_Prompt);
    SSat.Caption:=UTF8Decode(OSD_Saturation_Prompt);
    SHue.Caption:=UTF8Decode(OSD_Hue_Prompt);
  end;
  InfoForm.Caption:=UTF8Decode('文件信息');
  InfoForm.BClose.Caption:=UTF8Decode('关闭');
  LOCstr_NoInfo:=UTF8Decode('当前无可用的文件信息');
  LOCstr_InfoFileFormat:=UTF8Decode('格式');
  LOCstr_InfoPlaybackTime:=UTF8Decode('片长');
  LOCstr_InfoTags:=UTF8Decode('文件 元信息');
  LOCstr_InfoVideo:=UTF8Decode('视频');
  LOCstr_InfoAudio:=UTF8Decode('音频');
  LOCstr_InfoDecoder:=UTF8Decode('解码器');
  LOCstr_InfoCodec:=UTF8Decode('编码');
  LOCstr_InfoBitrate:=UTF8Decode('位率');
  LOCstr_InfoVideoSize:=UTF8Decode('尺寸');
  LOCstr_InfoVideoFPS:=UTF8Decode('帧率');
  LOCstr_InfoVideoAspect:=UTF8Decode('宽高比');
  LOCstr_InfoAudioRate:=UTF8Decode('采样率');
  LOCstr_InfoAudioChannels:=UTF8Decode('声道');
  Ccap:=UTF8Decode('章节');
  Acap:=UTF8Decode('视角');
end;

begin
  RegisterLocale(UTF8Decode('简体中文 (Simplified Chinese)'),Activate,$804,GB2312_CHARSET);
end.
