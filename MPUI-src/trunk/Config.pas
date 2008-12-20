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

const AudioOutMap:array[0..4]of string=('nosound','null','auto','win32','dsound');
const PostprocMap:array[0..2]of string=('off','auto','max');
const DeinterlaceMap:array[0..2]of string=('off','simple','adaptive');
const AspectMap:array[0..10]of string=('auto','4:3','16:9','2.35:1','14:9','5:4','16:10','2.21:1','1:1','1.22:1','custom');
const ChMap:array[0..2]of string=('2','4','6');
const RotMap:array[0..2]of string=('0','90','-90');

procedure Load(FileName:string);
procedure Save(FileName:string; Mode:integer);

implementation
uses SysUtils, INIFiles;

procedure Load(FileName:string);
var INI:TINIFile;
begin
  if not FileExists(FileName) then begin
    FileName:=AppdataDir+ExtractFileName(FileName);
    if not FileExists(FileName) then exit;
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

procedure Save(FileName:string; Mode:integer);
var INI:TINIFile;
begin
  try INI:=TINIFile.Create(AppdataDir+ExtractFileName(FileName));
  except
    if NoAccess=IncludeTrailingPathDelimiter(ExtractFileDir(FileName)) then exit;
    try INI:=TINIFile.Create(FileName);
    except exit;
    end;
  end;
  with INI do try
  finally
    case mode of
      0: begin
           WriteInteger(SectionName,'LyricSize',Core.LyricS);
           WriteString(SectionName,'LyricFont',Core.LyricF);
           WriteInteger(SectionName,'Locale',DefaultLocale);
           WriteString(SectionName,'AudioOut',AudioOutMap[Core.AudioOut]);
           WriteInteger(SectionName,'AudioDev',Core.AudioDev);
           WriteString(SectionName,'Postproc',PostprocMap[Core.Postproc]);
           WriteString(SectionName,'Deinterlace',DeinterlaceMap[Core.Deinterlace]);
           WriteString(SectionName,'Aspect',AspectMap[Core.Aspect]);
           WriteString(SectionName,'Channels',ChMap[Core.Ch]);
           WriteString(SectionName,'Rotate',RotMap[Core.Rot]);
           WriteString(SectionName,'MAspect',Core.MAspect);
           WriteBool  (SectionName,'ReIndex',Core.ReIndex);
           WriteBool  (SectionName,'SoftVol',Core.SoftVol);
           WriteBool  (SectionName,'MBRFullScreen',Core.RFScr);
           WriteBool  (SectionName,'Seek_Chapter',Core.UseekC);
           WriteBool  (SectionName,'Dr',Core.Dr);
           WriteBool  (SectionName,'Double',Core.dbbuf);
           WriteBool  (SectionName,'Volnorm',Core.Volnorm);
           WriteBool  (SectionName,'Defaultslang',Core.Defaultslang);
           WriteString  (SectionName,'Subcode',Core.subcode);
           WriteString  (SectionName,'Subfont',Core.subfont);
           WriteString  (SectionName,'OSDfont',Core.osdfont);
           WriteString  (SectionName,'ShotDir',Core.ShotDir);
           WriteString  (SectionName,'LyricDir',Core.LyricDir);
           WriteBool  (SectionName,'ML',Core.ML);
           WriteString  (SectionName,'MplayerLocation',Core.MplayerLocation);
           WriteBool  (SectionName,'Wid',Core.Wid);
           WriteBool  (SectionName,'Flip',Core.Flip);
           WriteBool  (SectionName,'Mirror',Core.Mirror);
           WriteBool  (SectionName,'Eq2',Core.Eq2);
           WriteBool  (SectionName,'Yuy2',Core.Yuy2);
           WriteBool  (SectionName,'Dda',Core.Dda);
           WriteString(SectionName,'VideoOut',Core.VideoOut);
           WriteBool  (SectionName,'NoBPS',Core.nobps);
           WriteBool  (SectionName,'Ni',Core.ni);
           WriteBool  (SectionName,'DVDNav',Core.Dnav);
           WriteBool  (SectionName,'VSync',Core.vsync);
           WriteBool  (SectionName,'Unicode',Core.Uni);
           WriteBool  (SectionName,'Utf8',Core.Utf);
           WriteFloat(SectionName,'FontSize',Core.FSize);
           WriteFloat(SectionName,'Outline',Core.Fol);
           WriteFloat(SectionName,'FontBlur',Core.FB);
           WriteBool  (SectionName,'Wadsp',Core.Wadsp);
           WriteString(SectionName,'WadspL',Core.WadspL);
           WriteBool  (SectionName,'Lavf',Core.lavf);
           WriteBool  (SectionName,'Framedrop',Core.Fd);
           WriteBool  (SectionName,'Autosync',Core.Async);
           WriteString(SectionName,'AutosyncV',Core.AsyncV);
           WriteBool  (SectionName,'Cache',Core.Cache);
           WriteString(SectionName,'CacheV',Core.CacheV);
           WriteBool  (SectionName,'ASS',Core.Ass);
           WriteBool  (SectionName,'EFont',Core.Efont);
           WriteBool  (SectionName,'ISub',Core.ISub);
           WriteInteger(SectionName,'TextColor',Core.TextColor);
           WriteInteger(SectionName,'OutColor',Core.OutColor);
           WriteInteger(SectionName,'LyricTextColor',Core.LTextColor);
           WriteInteger(SectionName,'BGColor',Core.LbgColor);
           WriteInteger(SectionName,'HGColor',Core.LhgColor);
           WriteBool  (SectionName,'Priority',Core.Pri);
           WriteBool  (SectionName,'UseOSDfont',Core.uof);
           WriteBool  (SectionName,'DragMode',Core.DragM);
           WriteBool  (SectionName,'GUI',Core.GUI);
           WriteBool  (SectionName,'FilterDrop',Core.FilterDrop);
           WriteBool  (SectionName,'Scroll',Core.PScroll);
           WriteString(SectionName,'Params',Core.Params);
         end;
      1: begin
           WriteInteger(SectionName,'InnerPanel_Width',Core.InterW);
           WriteInteger(SectionName,'InnerPanel_Height',Core.InterH);
           WriteInteger(SectionName,'Intro',Core.Bp);
           WriteInteger(SectionName,'Ending',Core.Ep);
           WriteInteger(SectionName,'Volume',Core.Volume);
           WriteInteger(SectionName,'OnTop',Core.OnTop);
           WriteBool   (SectionName,'UseUni',Core.UseUni);
         end;
    end;
    Free;
  end;
end;

end.
