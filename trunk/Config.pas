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
procedure Load(FileName:WideString); overload;
procedure Save(Mode:integer); overload;
procedure Save(FileName:WideString; Mode:integer); overload;

implementation
uses SysUtils,TntSysUtils, TntRegistry, INIFiles ,windows,RTLConsts;

procedure Load(FileName:WideString);
var INI:TINIFile;
begin
  if not WideFileExists(FileName) then begin
    FileName:=AppdataDir+WideExtractFileName(FileName);
    if not WideFileExists(FileName) then begin  Load; exit; end;
  end;
  if not IsWideStringMappableToAnsi(FileName) then FileName:=WideExtractShortPathName(FileName);
  INI:=TINIFile.Create(FileName);
  with INI do begin
    DefaultLocale:=ReadInteger(SectionName,'Locale',DefaultLocale);
    AudioOut:=CheckInfo(AudioOutMap,ReadString(SectionName,'AudioOut',AudioOutMap[AudioOut]));
    AudioDev:=ReadInteger(SectionName,'AudioDev',AudioDev);
    Postproc:=CheckInfo(PostprocMap,ReadString(SectionName,'Postproc',PostprocMap[Postproc]));
    Deinterlace:=CheckInfo(DeinterlaceMap,ReadString(SectionName,'Deinterlace',DeinterlaceMap[Deinterlace]));
    Aspect:=CheckInfo(AspectMap,ReadString(SectionName,'Aspect',AspectMap[Aspect]));
    Ch:=CheckInfo(ChMap,ReadString(SectionName,'Channels',ChMap[Ch]));
    Rot:=CheckInfo(RotMap,ReadString(SectionName,'Rotate',RotMap[Rot]));
    MAspect:=ReadString(SectionName,'MAspect',MAspect);
    subcode:=ReadString(SectionName,'Subcode',subcode);
    ReIndex:=ReadBool(SectionName,'ReIndex',ReIndex);
    SoftVol:=ReadBool(SectionName,'SoftVol',SoftVol);
    RFScr:=ReadBool(SectionName,'MBRFullScreen',RFScr);
    UseekC:=ReadBool(SectionName,'Seek_Chapter',UseekC);
    Dr:=ReadBool(SectionName,'Dr',Dr);
    dbbuf:=ReadBool(SectionName,'Double',dbbuf);
    Volnorm:=ReadBool(SectionName,'Volnorm',Volnorm);
    Dlang:=ReadBool(SectionName,'Defaultslang',Dlang);
    subfont:=ReadString(SectionName,'Subfont',subfont);
    osdfont:=ReadString(SectionName,'OSDfont',osdfont);
    ShotDir:=ReadString(SectionName,'ShotDir',ShotDir);
    LyricDir:=ReadString(SectionName,'LyricDir',LyricDir);
    ML:=ReadBool(SectionName,'ML',ML);
    MplayerLocation:=ReadString(SectionName,'MplayerLocation',MplayerLocation);
    Wid:=ReadBool(SectionName,'Wid',Wid);
    Flip:=ReadBool(SectionName,'Flip',Flip);
    Mirror:=ReadBool(SectionName,'Mirror',Mirror);
    Eq2:=ReadBool(SectionName,'Eq2',Eq2);
    Yuy2:=ReadBool(SectionName,'Yuy2',Yuy2);
    VideoOut:=ReadString(SectionName,'VideoOut',VideoOut);
    Dda:=Trim(LowerCase(VideoOut))='directx:noaccel';
    ni:=ReadBool(SectionName,'Ni',ni);
    nobps:=ReadBool(SectionName,'NoBPS',nobps);
    Dnav:=ReadBool(SectionName,'DVDNav',Dnav);
    UseUni:=ReadBool(SectionName,'UseUni',UseUni);
    vsync:=ReadBool(SectionName,'VSync',vsync);
    Uni:=ReadBool(SectionName,'Unicode',Uni);
    Utf:=ReadBool(SectionName,'Utf8',Utf);
    FSize:=ReadFloat(SectionName,'FontSize',FSize);
    Fol:=ReadFloat(SectionName,'Outline',Fol);
    FB:=ReadFloat(SectionName,'FontBlur',FB);
    Wadsp:=ReadBool(SectionName,'Wadsp',Wadsp);
    WadspL:=ReadString(SectionName,'WadspL',WadspL);
    lavf:=ReadBool(SectionName,'Lavf',lavf);
    Fd:=ReadBool(SectionName,'Framedrop',Fd);
    Async:=ReadBool(SectionName,'Autosync',Async);
    AsyncV:=ReadString(SectionName,'AutosyncV',AsyncV);
    Cache:=ReadBool(SectionName,'Cache',Cache);
    CacheV:=ReadString(SectionName,'CacheV',CacheV);
    Pri:=ReadBool(SectionName,'Priority',Pri);
    Ass:=ReadBool(SectionName,'ASS',Ass);
    Efont:=ReadBool(SectionName,'EFont',Efont);
    ISub:=ReadBool(SectionName,'ISub',ISub);
    TextColor:=ReadInteger(SectionName,'TextColor',TextColor);
    OutColor:=ReadInteger(SectionName,'OutColor',OutColor);
    LTextColor:=ReadInteger(SectionName,'LyricTextColor',LTextColor);
    LbgColor:=ReadInteger(SectionName,'BGColor',LbgColor);
    LhgColor:=ReadInteger(SectionName,'HGColor',LhgColor);
    Params:=ReadString(SectionName,'Params',Params);
    AutoPlay:=ReadBool(SectionName,'AutoPlay',AutoPlay);
    DragM:=ReadBool(SectionName,'DragMode',DragM);
    uof:=ReadBool(SectionName,'UseOSDfont',uof);
    GUI:=ReadBool(SectionName,'GUI',GUI);
    InterW:=ReadInteger(SectionName,'InnerPanel_Width',InterW);
    InterH:=ReadInteger(SectionName,'InnerPanel_Height',InterH);
    Bp:=ReadInteger(SectionName,'Intro',Bp);
    Ep:=ReadInteger(SectionName,'Ending',Ep);
    Volume:=ReadInteger(SectionName,'Volume',Volume);
    OnTop:=ReadInteger(SectionName,'OnTop',OnTop);
    FilterDrop:=ReadBool(SectionName,'FilterDrop',FilterDrop);
    Speed:=ReadFloat(SectionName,'Speed',Speed);
    WantFullscreen:=ReadBool(SectionName,'Fullscreen',WantFullscreen);
    AutoQuit:=ReadBool(SectionName,'AutoQuit',AutoQuit);
    WantCompact:=ReadBool(SectionName,'Compact',WantCompact);
    PScroll:=ReadBool(SectionName,'Scroll',PScroll);
    LyricF:=ReadString(SectionName,'LyricFont',LyricF);
    LyricS:=ReadInteger(SectionName,'LyricSize',LyricS);
    MainForm.MOnTop.Items[OnTop].Checked:=true;
    MainForm.MUUni.Checked:=UseUni;
    MainForm.UpdateMenuCheck;
    Free;
  end;
end;

procedure Save(FileName:WideString; Mode:integer);
var INI:TINIFile; d:WideString; h:integer;
begin
  try INI:=TINIFile.Create(AppdataDir+WideExtractFileName(FileName));
  except
    if NoAccess then begin Save(Mode); exit; end;
    h:=WideFileCreate(FileName);
    case GetLastError of
      ERROR_ALREADY_EXISTS,0: if not IsWideStringMappableToAnsi(FileName) then
                                FileName:=WideExtractShortPathName(FileName);
    end;
    if h<0 then begin
      d:=WideExtractFilePath(FileName);
      if not IsWideStringMappableToAnsi(FileName) then
        FileName:=WideExtractShortPathName(d)+WideExtractFileName(FileName);
    end
    else CloseHandle(h);
    try INI:=TINIFile.Create(FileName);
    except
      Save(Mode); exit;
    end;
  end;
  with INI do try
    case mode of
      0: begin
           WriteInteger(SectionName,'LyricSize',LyricS);
           WriteString(SectionName,'LyricFont',LyricF);
           WriteInteger(SectionName,'Locale',DefaultLocale);
           WriteString(SectionName,'AudioOut',AudioOutMap[AudioOut]);
           WriteInteger(SectionName,'AudioDev',AudioDev);
           WriteString(SectionName,'Postproc',PostprocMap[Postproc]);
           WriteString(SectionName,'Deinterlace',DeinterlaceMap[Deinterlace]);
           WriteString(SectionName,'Aspect',AspectMap[Aspect]);
           WriteString(SectionName,'Channels',ChMap[Ch]);
           WriteString(SectionName,'Rotate',RotMap[Rot]);
           WriteString(SectionName,'MAspect',MAspect);
           WriteBool  (SectionName,'ReIndex',ReIndex);
           WriteBool  (SectionName,'SoftVol',SoftVol);
           WriteBool  (SectionName,'MBRFullScreen',RFScr);
           WriteBool  (SectionName,'Seek_Chapter',UseekC);
           WriteBool  (SectionName,'Dr',Dr);
           WriteBool  (SectionName,'Double',dbbuf);
           WriteBool  (SectionName,'Volnorm',Volnorm);
           WriteBool  (SectionName,'Defaultslang',Dlang);
           WriteString  (SectionName,'Subcode',subcode);

           if IsWideStringMappableToAnsi(subfont) then
             WriteString(SectionName,'Subfont',subfont)
           else WriteString(SectionName,'Subfont',WideExtractShortPathName(subfont));

           if IsWideStringMappableToAnsi(osdfont) then
             WriteString(SectionName,'OSDfont',osdfont)
           else WriteString(SectionName,'OSDfont',WideExtractShortPathName(osdfont));

           if IsWideStringMappableToAnsi(ShotDir) then
             WriteString(SectionName,'ShotDir',ShotDir)
           else WriteString(SectionName,'ShotDir',WideExtractShortPathName(ShotDir));

           if IsWideStringMappableToAnsi(LyricDir) then
             WriteString(SectionName,'LyricDir',LyricDir)
           else WriteString(SectionName,'LyricDir',WideExtractShortPathName(LyricDir));

           WriteBool  (SectionName,'ML',ML);

           if IsWideStringMappableToAnsi(MplayerLocation) then
             WriteString(SectionName,'MplayerLocation',MplayerLocation)
           else WriteString(SectionName,'MplayerLocation',WideExtractShortPathName(MplayerLocation));

           WriteBool  (SectionName,'Wid',Wid);
           WriteBool  (SectionName,'Flip',Flip);
           WriteBool  (SectionName,'Mirror',Mirror);
           WriteBool  (SectionName,'Eq2',Eq2);
           WriteBool  (SectionName,'Yuy2',Yuy2);
           WriteBool  (SectionName,'Dda',Dda);
           WriteString(SectionName,'VideoOut',VideoOut);
           WriteBool  (SectionName,'NoBPS',nobps);
           WriteBool  (SectionName,'Ni',ni);
           WriteBool  (SectionName,'DVDNav',Dnav);
           WriteBool  (SectionName,'VSync',vsync);
           WriteBool  (SectionName,'Unicode',Uni);
           WriteBool  (SectionName,'Utf8',Utf);
           WriteFloat(SectionName,'FontSize',FSize);
           WriteFloat(SectionName,'Outline',Fol);
           WriteFloat(SectionName,'FontBlur',FB);
           WriteBool  (SectionName,'Wadsp',Wadsp);

           if IsWideStringMappableToAnsi(WadspL) then
             WriteString(SectionName,'WadspL',WadspL)
           else WriteString(SectionName,'WadspL',WideExtractShortPathName(WadspL));

           WriteBool  (SectionName,'Lavf',lavf);
           WriteBool  (SectionName,'Framedrop',Fd);
           WriteBool  (SectionName,'Autosync',Async);
           WriteString(SectionName,'AutosyncV',AsyncV);
           WriteBool  (SectionName,'Cache',Cache);
           WriteString(SectionName,'CacheV',CacheV);
           WriteBool  (SectionName,'ASS',Ass);
           WriteBool  (SectionName,'EFont',Efont);
           WriteBool  (SectionName,'ISub',ISub);
           WriteInteger(SectionName,'TextColor',TextColor);
           WriteInteger(SectionName,'OutColor',OutColor);
           WriteInteger(SectionName,'LyricTextColor',LTextColor);
           WriteInteger(SectionName,'BGColor',LbgColor);
           WriteInteger(SectionName,'HGColor',LhgColor);
           WriteBool  (SectionName,'Priority',Pri);
           WriteBool  (SectionName,'UseOSDfont',uof);
           WriteBool  (SectionName,'DragMode',DragM);
           WriteBool  (SectionName,'GUI',GUI);
           WriteBool  (SectionName,'FilterDrop',FilterDrop);
           WriteBool  (SectionName,'Scroll',PScroll);
           WriteString(SectionName,'Params',Params);
         end;
      1: begin
           WriteInteger(SectionName,'InnerPanel_Width',InterW);
           WriteInteger(SectionName,'InnerPanel_Height',InterH);
           WriteInteger(SectionName,'Intro',Bp);
           WriteInteger(SectionName,'Ending',Ep);
           WriteInteger(SectionName,'Volume',Volume);
           WriteInteger(SectionName,'OnTop',OnTop);
           WriteBool   (SectionName,'UseUni',UseUni);
         end;
    end;
  finally
    ini.Free;
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
        if ValueExists('Defaultslang') then Dlang:=ReadBool('Defaultslang');
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
               WriteBool  ('Defaultslang',Dlang);
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
