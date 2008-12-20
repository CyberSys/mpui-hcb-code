{   MPUI, an MPlayer frontend for Windows
    Copyright (C) 2005 Martin J. Fiedler <martin.fiedler@gmx.net>

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
unit Config;
interface
uses Core, Main, Locale;

const DefaultFileName='MPUI.ini';
      SectionName='MPUI';

var DefaultLocale:integer=AutoLocale;

const AudioOutMap:array[0..4]of WideString=('nosound','null','auto','win32','dsound');
const PostprocMap:array[0..2]of WideString=('off','auto','max');
const DeinterlaceMap:array[0..2]of WideString=('off','simple','adaptive');
const AspectMap:array[0..10]of WideString=('auto','4:3','16:9','2.35:1','14:9','5:4','16:10','2.21:1','1:1','1.22:1','custom');
const ChMap:array[0..2]of WideString=('2','4','6');
const RotMap:array[0..2]of WideString=('0','90','-90');

procedure Load; overload;
procedure Load(FileName:string); overload;
procedure Save(Mode:integer);

implementation
uses SysUtils, TntRegistry, INIFiles ,windows,RTLConsts;

procedure Load(FileName:string);
var INI:TINIFile;
begin
  if not FileExists(FileName) then begin
    FileName:=AppdataDir+ExtractFileName(FileName);
    if not FileExists(FileName) then begin  Load; exit; end;
  end;
  INI:=TINIFile.Create(FileName);
  with INI do begin
    DefaultLocale:=ReadInteger(SectionName,'Locale',DefaultLocale);
    Core.AudioOut:=CheckInfo(AudioOutMap,ReadString(SectionName,'AudioOut',AudioOutMap[Core.AudioOut]));
    Core.AudioDev:=ReadInteger(SectionName,'AudioDev',Core.AudioDev);
    Core.Postproc:=CheckInfo(PostprocMap,ReadString(SectionName,'Postproc',PostprocMap[Core.Postproc]));
    Core.Deinterlace:=CheckInfo(DeinterlaceMap,ReadString(SectionName,'Deinterlace',DeinterlaceMap[Core.Deinterlace]));
    Core.Aspect:=CheckInfo(AspectMap,ReadString(SectionName,'Aspect',AspectMap[Core.Aspect]));
    Core.Ch:=CheckInfo(ChMap,ReadString(SectionName,'Channels',ChMap[Core.Ch]));
    Core.Rot:=CheckInfo(RotMap,ReadString(SectionName,'Rotate',RotMap[Core.Rot]));
    Core.MAspect:=ReadString(SectionName,'MAspect',Core.MAspect);
    Core.subcode:=ReadString(SectionName,'Subcode',Core.subcode);
    Core.ReIndex:=ReadBool(SectionName,'ReIndex',Core.ReIndex);
    Core.SoftVol:=ReadBool(SectionName,'SoftVol',Core.SoftVol);
    Core.RFScr:=ReadBool(SectionName,'MBRFullScreen',Core.RFScr);
    Core.UseekC:=ReadBool(SectionName,'Seek_Chapter',Core.UseekC);
    Core.Dr:=ReadBool(SectionName,'Dr',Core.Dr);
    Core.dbbuf:=ReadBool(SectionName,'Double',Core.dbbuf);
    Core.Volnorm:=ReadBool(SectionName,'Volnorm',Core.Volnorm);
    Core.Defaultslang:=ReadBool(SectionName,'Defaultslang',Core.Defaultslang);
    Core.subfont:=ReadString(SectionName,'Subfont',Core.subfont);
    Core.osdfont:=ReadString(SectionName,'OSDfont',Core.osdfont);
    Core.ShotDir:=ReadString(SectionName,'ShotDir',Core.ShotDir);
    Core.LyricDir:=ReadString(SectionName,'LyricDir',Core.LyricDir);
    Core.ML:=ReadBool(SectionName,'ML',Core.ML);
    Core.MplayerLocation:=ReadString(SectionName,'MplayerLocation',Core.MplayerLocation);
    Core.Wid:=ReadBool(SectionName,'Wid',Core.Wid);
    Core.Flip:=ReadBool(SectionName,'Flip',Core.Flip);
    Core.Mirror:=ReadBool(SectionName,'Mirror',Core.Mirror);
    Core.Eq2:=ReadBool(SectionName,'Eq2',Core.Eq2);
    Core.Yuy2:=ReadBool(SectionName,'Yuy2',Core.Yuy2);
    Core.VideoOut:=ReadString(SectionName,'VideoOut',Core.VideoOut);
    Core.Dda:=Trim(LowerCase(Core.VideoOut))='directx:noaccel';
    Core.ni:=ReadBool(SectionName,'Ni',Core.ni);
    Core.nobps:=ReadBool(SectionName,'NoBPS',Core.nobps);
    Core.Dnav:=ReadBool(SectionName,'DVDNav',Core.Dnav);
    Core.UseUni:=ReadBool(SectionName,'UseUni',Core.UseUni);
    Core.vsync:=ReadBool(SectionName,'VSync',Core.vsync);
    Core.Uni:=ReadBool(SectionName,'Unicode',Core.Uni);
    Core.Utf:=ReadBool(SectionName,'Utf8',Core.Utf);
    Core.FSize:=ReadFloat(SectionName,'FontSize',Core.FSize);
    Core.Fol:=ReadFloat(SectionName,'Outline',Core.Fol);
    Core.FB:=ReadFloat(SectionName,'FontBlur',Core.FB);
    Core.Wadsp:=ReadBool(SectionName,'Wadsp',Core.Wadsp);
    Core.WadspL:=ReadString(SectionName,'WadspL',Core.WadspL);
    Core.lavf:=ReadBool(SectionName,'Lavf',Core.lavf);
    Core.Fd:=ReadBool(SectionName,'Framedrop',Core.Fd);
    Core.Async:=ReadBool(SectionName,'Autosync',Core.Async);
    Core.AsyncV:=ReadString(SectionName,'AutosyncV',Core.AsyncV);
    Core.Cache:=ReadBool(SectionName,'Cache',Core.Cache);
    Core.CacheV:=ReadString(SectionName,'CacheV',Core.CacheV);
    Core.Pri:=ReadBool(SectionName,'Priority',Core.Pri);
    Core.Ass:=ReadBool(SectionName,'ASS',Core.Ass);
    Core.Efont:=ReadBool(SectionName,'EFont',Core.Efont);
    Core.ISub:=ReadBool(SectionName,'ISub',Core.ISub);
    Core.TextColor:=ReadInteger(SectionName,'TextColor',Core.TextColor);
    Core.OutColor:=ReadInteger(SectionName,'OutColor',Core.OutColor);
    Core.LTextColor:=ReadInteger(SectionName,'LyricTextColor',Core.LTextColor);
    Core.LbgColor:=ReadInteger(SectionName,'BGColor',Core.LbgColor);
    Core.LhgColor:=ReadInteger(SectionName,'HGColor',Core.LhgColor);
    Core.Params:=ReadString(SectionName,'Params',Core.Params);
    Core.AutoPlay:=ReadBool(SectionName,'AutoPlay',Core.AutoPlay);
    Core.DragM:=ReadBool(SectionName,'DragMode',Core.DragM);
    Core.uof:=ReadBool(SectionName,'UseOSDfont',Core.uof);
    Core.GUI:=ReadBool(SectionName,'GUI',Core.GUI);
    Core.InterW:=ReadInteger(SectionName,'InnerPanel_Width',Core.InterW);
    Core.InterH:=ReadInteger(SectionName,'InnerPanel_Height',Core.InterH);
    Core.Bp:=ReadInteger(SectionName,'Intro',Core.Bp);
    Core.Ep:=ReadInteger(SectionName,'Ending',Core.Ep);
    Core.Volume:=ReadInteger(SectionName,'Volume',Core.Volume);
    Core.OnTop:=ReadInteger(SectionName,'OnTop',Core.OnTop);
    Core.FilterDrop:=ReadBool(SectionName,'FilterDrop',Core.FilterDrop);
    Core.Speed:=ReadFloat(SectionName,'Speed',Core.Speed);
    Core.WantFullscreen:=ReadBool(SectionName,'Fullscreen',Core.WantFullscreen);
    Core.AutoQuit:=ReadBool(SectionName,'AutoQuit',Core.AutoQuit);
    Core.WantCompact:=ReadBool(SectionName,'Compact',Core.WantCompact);
    Core.PScroll:=ReadBool(SectionName,'Scroll',Core.PScroll);
    Core.LyricF:=ReadString(SectionName,'LyricFont',Core.LyricF);
    Core.LyricS:=ReadInteger(SectionName,'LyricSize',Core.LyricS);
    MainForm.MOnTop.Items[Core.OnTop].Checked:=true;
    MainForm.MUUni.Checked:=Core.UseUni;
    MainForm.UpdateMenuCheck;
    Free;
  end;
end;

procedure Load;
var reg: TTntRegistry;

{function ReadWString(const Name:WideString):WideString;
var BufSize:integer; Value:array[0..MAX_PATH]of WideChar;
begin
  Result:=''; FillChar(Value,sizeof(Value),0);
  RegQueryValueExW(reg.CurrentKey,PwideChar(Name),nil,nil,nil,@BufSize);
  if RegQueryValueExW(reg.CurrentKey,PwideChar(Name),nil,nil,@Value[0],@BufSize)=ERROR_SUCCESS then
  Result:=Value;
end;}

begin   
  reg:=TTntRegistry.Create;
  with reg do begin
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKeyReadOnly('SOFTWARE\MPUI') then begin
        if ValueExists('Locale') then DefaultLocale:=ReadInteger('Locale');
        if ValueExists('AudioOut') then AudioOut:=CheckInfo(AudioOutMap,ReadString('AudioOut'));
        if ValueExists('AudioDev') then AudioDev:=ReadInteger('AudioDev');
        if ValueExists('Postproc') then Postproc:=CheckInfo(PostprocMap,ReadString('Postproc'));
        if ValueExists('Deinterlace') then Deinterlace:=CheckInfo(DeinterlaceMap,ReadString('Deinterlace'));
        if ValueExists('Aspect') then Aspect:=CheckInfo(AspectMap,ReadString('Aspect'));
        if ValueExists('Channels') then Ch:=CheckInfo(ChMap,ReadString('Channels'));
        if ValueExists('Rotate') then Rot:=CheckInfo(RotMap,ReadString('Rotate'));
        if ValueExists('MAspect') then MAspect:=ReadString('MAspect');
        if ValueExists('VideoOut') then begin
          VideoOut:=ReadString('VideoOut');
          Dda:=Trim(LowerCase(VideoOut))='directx:noaccel';
        end;
        if ValueExists('Subcode') then subcode:=ReadString('Subcode');
        if ValueExists('ReIndex') then ReIndex:=ReadBool('ReIndex');
        if ValueExists('SoftVol') then SoftVol:=ReadBool('SoftVol');
        if ValueExists('MBRFullScreen') then RFScr:=ReadBool('MBRFullScreen');
        if ValueExists('Seek_Chapter') then UseekC:=ReadBool('Seek_Chapter');
        if ValueExists('Dr') then Dr:=ReadBool('Dr');
        if ValueExists('Double') then dbbuf:=ReadBool('Double');
        if ValueExists('Volnorm') then Volnorm:=ReadBool('Volnorm');
        if ValueExists('Defaultslang') then Defaultslang:=ReadBool('Defaultslang');
        if ValueExists('Subfont') then subfont:=ReadString('Subfont');
        if ValueExists('OSDfont') then osdfont:=ReadString('OSDfont');
        if ValueExists('ShotDir') then ShotDir:=ReadString('ShotDir');
        if ValueExists('LyricDir') then LyricDir:=ReadString('LyricDir');
        if ValueExists('ML') then ML:=ReadBool('ML');
        if ValueExists('MplayerLocation') then MplayerLocation:=ReadString('MplayerLocation');
        if ValueExists('Wid') then Wid:=ReadBool('Wid');
        if ValueExists('Flip') then Flip:=ReadBool('Flip');
        if ValueExists('Mirror') then Mirror:=ReadBool('Mirror');
        if ValueExists('Eq2') then Eq2:=ReadBool('Eq2');
        if ValueExists('Yuy2') then Yuy2:=ReadBool('Yuy2');
        if ValueExists('Ni') then ni:=ReadBool('Ni');
        if ValueExists('NoBPS') then nobps:=ReadBool('NoBPS');
        if ValueExists('DVDNav') then Dnav:=ReadBool('DVDNav');
        if ValueExists('UseUni') then UseUni:=ReadBool('UseUni');
        if ValueExists('VSync') then vsync:=ReadBool('VSync');
        if ValueExists('Unicode') then Uni:=ReadBool('Unicode');
        if ValueExists('Utf8') then Utf:=ReadBool('Utf8');
        if ValueExists('FontSize') then FSize:=ReadFloat('FontSize');
        if ValueExists('Outline') then Fol:=ReadFloat('Outline');
        if ValueExists('FontBlur') then FB:=ReadFloat('FontBlur');
        if ValueExists('Wadsp') then Wadsp:=ReadBool('Wadsp');
        if ValueExists('WadspL') then WadspL:=ReadString('WadspL');
        if ValueExists('Lavf') then lavf:=ReadBool('Lavf');
        if ValueExists('Framedrop') then Fd:=ReadBool('Framedrop');
        if ValueExists('Autosync') then Async:=ReadBool('Autosync');
        if ValueExists('AutosyncV') then AsyncV:=ReadString('AutosyncV');
        if ValueExists('Cache') then Cache:=ReadBool('Cache');
        if ValueExists('CacheV') then CacheV:=ReadString('CacheV');
        if ValueExists('Priority') then Pri:=ReadBool('Priority');
        if ValueExists('ASS') then Ass:=ReadBool('ASS');
        if ValueExists('EFont') then Efont:=ReadBool('EFont');
        if ValueExists('ISub') then ISub:=ReadBool('ISub');
        if ValueExists('TextColor') then TextColor:=ReadInteger('TextColor');
        if ValueExists('OutColor') then OutColor:=ReadInteger('OutColor');
        if ValueExists('LyricTextColor') then LTextColor:=ReadInteger('LyricTextColor');
        if ValueExists('BGColor') then LbgColor:=ReadInteger('BGColor');
        if ValueExists('HGColor') then LhgColor:=ReadInteger('HGColor');
        if ValueExists('Params') then Params:=ReadString('Params');
        if ValueExists('AutoPlay') then AutoPlay:=ReadBool('AutoPlay');
        if ValueExists('DragMode') then DragM:=ReadBool('DragMode');
        if ValueExists('UseOSDfont') then uof:=ReadBool('UseOSDfont');
        if ValueExists('GUI') then GUI:=ReadBool('GUI');
        if ValueExists('InnerPanel_Width') then InterW:=ReadInteger('InnerPanel_Width');
        if ValueExists('InnerPanel_Height') then InterH:=ReadInteger('InnerPanel_Height');
        if ValueExists('Intro') then Bp:=ReadInteger('Intro');
        if ValueExists('Ending') then Ep:=ReadInteger('Ending');
        if ValueExists('Volume') then Volume:=ReadInteger('Volume');
        if ValueExists('OnTop') then OnTop:=ReadInteger('OnTop');
        if ValueExists('FilterDrop') then FilterDrop:=ReadBool('FilterDrop');
        if ValueExists('Speed') then Speed:=ReadFloat('Speed');
        if ValueExists('Fullscreen') then WantFullscreen:=ReadBool('Fullscreen');
        if ValueExists('AutoQuit') then AutoQuit:=ReadBool('AutoQuit');
        if ValueExists('Compact') then WantCompact:=ReadBool('Compact');
        if ValueExists('Scroll') then PScroll:=ReadBool('Scroll');
        if ValueExists('LyricFont') then LyricF:=ReadString('LyricFont');
        if ValueExists('LyricSize') then LyricS:=ReadInteger('LyricSize');	
		CloseKey;
      end;
    finally
     Free;
    end;
    MainForm.MOnTop.Items[OnTop].Checked:=true;
    MainForm.MUUni.Checked:=UseUni;
    MainForm.UpdateMenuCheck;
  end;
end;

procedure Save(Mode:integer);
var reg: TTntRegistry;
{procedure WriteWString(const Name,Value:WideString);
begin
  RegSetValueExW(reg.CurrentKey,PWideChar(Name),0,REG_SZ,PWideChar(Value),Length(Value)*2);
end;}
begin
  reg:=TTntRegistry.Create;
  with reg do begin
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('SOFTWARE\MPUI',true) then begin
        case mode of
          0: begin
               WriteInteger('LyricSize',LyricS);
               WriteString('LyricFont',LyricF);
               WriteInteger('Locale',DefaultLocale);
               WriteString('AudioOut',AudioOutMap[AudioOut]);
               WriteInteger('AudioDev',AudioDev);
               WriteString('Postproc',PostprocMap[Postproc]);
               WriteString('Deinterlace',DeinterlaceMap[Deinterlace]);
               WriteString('Aspect',AspectMap[Aspect]);
               WriteString('Channels',ChMap[Ch]);
               WriteString('Rotate',RotMap[Rot]);
               WriteString('MAspect',MAspect);
               WriteString('VideoOut',VideoOut);
               WriteBool  ('ReIndex',ReIndex);
               WriteBool  ('SoftVol',SoftVol);
               WriteBool  ('MBRFullScreen',RFScr);
               WriteBool  ('Seek_Chapter',UseekC);
               WriteBool  ('Dr',Dr);
               WriteBool  ('Double',dbbuf);
               WriteBool  ('Volnorm',Volnorm);
               WriteBool  ('Defaultslang',Defaultslang);
               WriteString  ('Subcode',subcode);
               WriteString  ('Subfont',subfont);
               WriteString  ('OSDfont',osdfont);
               WriteString  ('ShotDir',ShotDir);
               WriteString  ('LyricDir',LyricDir);
               WriteBool  ('ML',ML);
               WriteString  ('MplayerLocation',MplayerLocation);
               WriteBool  ('Wid',Wid);
               WriteBool  ('Flip',Flip);
               WriteBool  ('Mirror',Mirror);
               WriteBool  ('Eq2',Eq2);
               WriteBool  ('Yuy2',Yuy2);
               WriteBool  ('NoBPS',nobps);
               WriteBool  ('Ni',ni);
               WriteBool  ('DVDNav',Dnav);
               WriteBool  ('VSync',vsync);
               WriteBool  ('Unicode',Uni);
               WriteBool  ('Utf8',Utf);
               WriteFloat('FontSize',FSize);
               WriteFloat('Outline',Fol);
               WriteFloat('FontBlur',FB);
               WriteBool  ('Wadsp',Wadsp);
               WriteString('WadspL',WadspL);
               WriteBool  ('Lavf',lavf);
               WriteBool  ('Framedrop',Fd);
               WriteBool  ('Autosync',Async);
               WriteString('AutosyncV',AsyncV);
               WriteBool  ('Cache',Cache);
               WriteString('CacheV',CacheV);
               WriteBool  ('ASS',Ass);
               WriteBool  ('EFont',Efont);
               WriteBool  ('ISub',ISub);
               WriteInteger('TextColor',TextColor);
               WriteInteger('OutColor',OutColor);
               WriteInteger('LyricTextColor',LTextColor);
               WriteInteger('BGColor',LbgColor);
               WriteInteger('HGColor',LhgColor);
               WriteBool  ('Priority',Pri);
               WriteBool  ('UseOSDfont',uof);
               WriteBool  ('DragMode',DragM);
               WriteBool  ('GUI',GUI);
               WriteBool  ('FilterDrop',FilterDrop);
               WriteBool  ('Scroll',PScroll);
               WriteString('Params',Params);
             end;
          1: begin
               WriteInteger('InnerPanel_Width',InterW);
               WriteInteger('InnerPanel_Height',InterH);
               WriteInteger('Intro',Bp);
               WriteInteger('Ending',Ep);
               WriteInteger('Volume',Volume);
               WriteInteger('OnTop',OnTop);
               WriteBool   ('UseUni',UseUni);
             end;
        end;
        CloseKey;
      end;
    finally
      Free;
    end;
  end;
end;

end.
