{   MPUI-hcb, an MPlayer frontend for Windows
    Copyright (C) 2006-2010 Huang Chen Bin <hcb428@foxmail.com>
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
unit Config;
interface
uses Core, Main, Locale, info, Menus,TntMenus;

const DefaultFileName='MPUI.ini';
      SectionName='MPUI';

var DefaultLocale:integer=AutoLocale;

procedure Load(FileName:WideString; Mode:integer);
procedure Save(FileName:WideString; Mode:integer);

implementation
uses SysUtils, TntSysUtils, INIFiles, Windows;

procedure Load(FileName:WideString; Mode:integer);
var INI:TMemIniFile; t:TTntMenuItem; s:String; i:integer;
begin
  if not WideFileExists(FileName) then begin
    FileName:=AppdataDir+WideExtractFileName(FileName);
    if not WideFileExists(FileName) then exit;
  end;
  INI:=TMemIniFile.Create(WideExtractShortPathName(FileName));
  with INI do begin
    case mode of
      0: begin
           DefaultLocale:=ReadInteger(SectionName,'Locale',DefaultLocale);
           Core.DefaultOSDLevel:=ReadInteger(SectionName,'OSDLevel',DefaultOSDLevel);
           Core.OSDLevel:=Core.DefaultOSDLevel;
           Core.AudioOut:=ReadInteger(SectionName,'AudioOut',Core.AudioOut);
           Core.AudioDev:=ReadInteger(SectionName,'AudioDev',Core.AudioDev);
           Core.Postproc:=ReadInteger(SectionName,'Postproc',Core.Postproc);
           Core.Deinterlace:=ReadInteger(SectionName,'Deinterlace',Core.Deinterlace);
           Core.Aspect:=ReadInteger(SectionName,'Aspect',Core.Aspect);
           Core.Ch:=ReadInteger(SectionName,'Channels',Core.Ch);
           Core.Rot:=ReadInteger(SectionName,'Rotate',Core.Rot);
           s:=ReadString(SectionName,'MAspect','');
           if s<>'' then Core.MAspect:=s;
           s:=ReadString(SectionName,'Subcode','');
           if s<>'' then Core.subcode:=s;
           Core.ReIndex:=ReadBool(SectionName,'ReIndex',Core.ReIndex);
           Core.SoftVol:=ReadBool(SectionName,'SoftVol',Core.SoftVol);
           Core.RFScr:=ReadBool(SectionName,'MBRFullScreen',Core.RFScr);
           Core.UseekC:=ReadBool(SectionName,'Seek_Chapter',Core.UseekC);
           Core.Dr:=ReadBool(SectionName,'Dr',Core.Dr);
           Core.dbbuf:=ReadBool(SectionName,'Double',Core.dbbuf);
           Core.Volnorm:=ReadBool(SectionName,'Volnorm',Core.Volnorm);
           Core.nfc:=ReadBool(SectionName,'nofontconfig',Core.nfc);
           Core.nmsg:=ReadBool(SectionName,'nomsgmodule',Core.nmsg);
           s:=ReadString(SectionName,'Subfont','');
           if s<>'' then begin
             if WideFileExists(s) then Core.subfont:=Tnt_WideLowerCase(GetLongPath(s))
             else Core.subfont:=Tnt_WideLowerCase(s);
           end;
           s:=ReadString(SectionName,'OSDfont','');
           if s<>'' then begin
             if WideFileExists(s) then osdfont:=Tnt_WideLowerCase(GetLongPath(s))
             else Core.osdfont:=Tnt_WideLowerCase(s);
           end;
           s:=ReadString(SectionName,'ShotDir','');
           if s<>'' then begin
             if WideDirectoryExists(s) then ShotDir:=GetLongPath(s)
             else Core.ShotDir:=s;
           end;
           s:=ReadString(SectionName,'LyricDir','');
           if s<>'' then begin
             if WideDirectoryExists(s) then LyricDir:=GetLongPath(s)
             else if WideDirectoryExists(ExpandName(HomeDir,LyricDir)) then Core.LyricDir:=s;
           end;
           Core.ML:=ReadBool(SectionName,'ML',Core.ML);
           s:=ReadString(SectionName,'MplayerLocation','');
           if s<>'' then begin
             if WideFileExists(s) then MplayerLocation:=GetLongPath(s)
             else Core.MplayerLocation:=s;
           end;
           Core.Wid:=ReadBool(SectionName,'Wid',Core.Wid);
           Core.Flip:=ReadBool(SectionName,'Flip',Core.Flip);
           Core.Mirror:=ReadBool(SectionName,'Mirror',Core.Mirror);
           Core.Eq2:=ReadBool(SectionName,'Eq2',Core.Eq2);
           Core.Yuy2:=ReadBool(SectionName,'Yuy2',Core.Yuy2);
           s:=ReadString(SectionName,'VideoOut','');
           if s<>'' then Core.VideoOut:=s;
           Core.Dda:=Trim(LowerCase(Core.VideoOut))='directx:noaccel';
           Core.ni:=ReadBool(SectionName,'Ni',Core.ni);
           Core.nobps:=ReadBool(SectionName,'NoBPS',Core.nobps);
           Core.Dnav:=ReadBool(SectionName,'DVDNav',Core.Dnav);
           Core.UseUni:=ReadBool(SectionName,'UseUni',Core.UseUni);
           Core.vsync:=ReadBool(SectionName,'VSync',Core.vsync);
           Core.Uni:=ReadBool(SectionName,'Unicode',Core.Uni);
           Core.sconfig:=ReadBool(SectionName,'Show config windows',Core.sconfig);
           Core.Utf:=ReadBool(SectionName,'Utf8',Core.Utf);
           Core.FSize:=ReadFloat(SectionName,'FontSize',Core.FSize);
           Core.Fol:=ReadFloat(SectionName,'Outline',Core.Fol);
           Core.FB:=ReadFloat(SectionName,'FontBlur',Core.FB);
           Core.Wadsp:=ReadBool(SectionName,'Wadsp',Core.Wadsp);
           s:=ReadString(SectionName,'WadspL','');
           if s<>'' then begin
             if WideFileExists(s) then WadspL:=GetLongPath(s)
             else Core.WadspL:=s;
           end;
           Core.lavf:=ReadBool(SectionName,'Lavf',Core.lavf);
           Core.Fd:=ReadBool(SectionName,'Framedrop',Core.Fd);
           Core.Async:=ReadBool(SectionName,'Autosync',Core.Async);
           s:=ReadString(SectionName,'AutosyncV','');
           if s<>'' then Core.AsyncV:=s;
           Core.Cache:=ReadBool(SectionName,'Cache',Core.Cache);
           s:=ReadString(SectionName,'CacheV','');
           if s<>'' then Core.CacheV:=s;
           Core.Pri:=ReadBool(SectionName,'Priority',Core.Pri);
           Core.Ass:=ReadBool(SectionName,'ASS',Core.Ass);
           Core.Efont:=ReadBool(SectionName,'EFont',Core.Efont);
           Core.ISub:=ReadBool(SectionName,'ISub',Core.ISub);
           Core.TextColor:=ReadInteger(SectionName,'TextColor',Core.TextColor);
           Core.OutColor:=ReadInteger(SectionName,'OutColor',Core.OutColor);
           Core.LTextColor:=ReadInteger(SectionName,'LyricTextColor',Core.LTextColor);
           Core.LbgColor:=ReadInteger(SectionName,'BGColor',Core.LbgColor);
           Core.LhgColor:=ReadInteger(SectionName,'HGColor',Core.LhgColor);
           s:=ReadString(SectionName,'Params','');
           if s<>'' then Core.Params:=s;
           Core.AutoPlay:=ReadBool(SectionName,'AutoPlay',Core.AutoPlay);
           Core.uof:=ReadBool(SectionName,'UseOSDfont',Core.uof);
           Core.GUI:=ReadBool(SectionName,'GUI',Core.GUI);
           Core.DS:=ReadBool(SectionName,'DSize',Core.DS);
           Core.RS:=ReadBool(SectionName,'RSize',Core.RS);
           Core.RP:=ReadBool(SectionName,'RPostion',Core.RP);
           Core.SP:=ReadBool(SectionName,'SPause',Core.SP);
           Core.CT:=ReadBool(SectionName,'DTime',Core.CT);
           Core.IL:=ReadInteger(SectionName,'InfoLeft',Core.IL);
           Core.IT:=ReadInteger(SectionName,'InfoTop',Core.IT);
           Core.EL:=ReadInteger(SectionName,'LastLeft',Core.EL);
           Core.ET:=ReadInteger(SectionName,'LastTop',Core.ET);
           Core.EW:=ReadInteger(SectionName,'LastWidth',Core.EW);
           Core.EH:=ReadInteger(SectionName,'LastHeight',Core.EH);
           Core.InterW:=ReadInteger(SectionName,'IPanelWidth',Core.InterW);
           Core.InterH:=ReadInteger(SectionName,'IPanelHeight',Core.InterH);
           Core.NW:=ReadInteger(SectionName,'CWidth',Core.NW);
           Core.NH:=ReadInteger(SectionName,'CHeight',Core.NH);
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
           s:=ReadString(SectionName,'LyricFont','');
           if s<>'' then Core.LyricF:=s;
           Core.LyricS:=ReadInteger(SectionName,'LyricSize',Core.LyricS);
           Core.seekLen:=ReadInteger(SectionName,'seekLen',Core.seekLen);
           s:=ReadString(SectionName,'HotKey','');
           if s<>'' then Core.HKS:=s;
           for i:=0 to RFileMax-1 do begin
             s:=ReadString(SectionName,'RF'+IntToStr(i),'');
             if s<>'' then begin
               t:=TTntMenuItem.Create(MainForm.MRFile);
               if WideFileExists(s) then begin
                 s:=GetLongPath(s); t.Caption:=WideExtractFileName(s);
               end
               else t.Caption:=s;
               t.Hint:=s;
               t.OnClick:=MainForm.MRFClick;
               MainForm.MRFile.add(t);
               MainForm.MRFile.Visible:=true;
             end;
           end;
           MainForm.MOnTop.Items[Core.OnTop].Checked:=true;
           MainForm.MUUni.Checked:=Core.UseUni;
           MainForm.UpdateMenuCheck;
         end;
      1: begin
           Core.oneM:=ReadBool(SectionName,'instance',Core.oneM);
           s:=ReadString(SectionName,'fileAss','');
           if s<>'' then Core.Fass:=s;
         end;
    end;
    Free;
  end;
end;

procedure Save(FileName:WideString; Mode:integer);
var INI:TMemIniFile; h:integer; s:WideString;
begin
  if (NoAccess>0) or (not WideFileExists(FileName)) then
    FileName:=AppdataDir+WideExtractFileName(FileName);
  if not WideFileExists(FileName) then begin
    h:=WideFileCreate(FileName);
    if GetLastError=0 then FileName:=WideExtractShortPathName(FileName);
    if h<0 then
        FileName:=WideExtractShortPathName(WideIncludeTrailingPathDelimiter(WideExtractFilePath(FileName)))+WideExtractFileName(FileName)
    else CloseHandle(h);
  end
  else begin
    if WideFileIsReadOnly(FileName) then WideFileSetReadOnly(FileName,false);
    FileName:=WideExtractShortPathName(FileName);
  end;

  INI:=TMemIniFile.Create(FileName);
  with INI do try
    case mode of
      0: begin
           WriteInteger(SectionName,'LyricSize',Core.LyricS);
           WriteString(SectionName,'LyricFont',Core.LyricF);
           WriteInteger(SectionName,'Locale',DefaultLocale);
           WriteInteger(SectionName,'AudioOut',Core.AudioOut);
           WriteInteger(SectionName,'AudioDev',Core.AudioDev);
           WriteInteger(SectionName,'Postproc',Core.Postproc);
           WriteInteger(SectionName,'Deinterlace',Core.Deinterlace);
           WriteInteger(SectionName,'Aspect',Core.Aspect);
           WriteInteger(SectionName,'Channels',Core.Ch);
           WriteInteger(SectionName,'Rotate',Core.Rot);
           WriteString(SectionName,'MAspect',Core.MAspect);
           WriteBool  (SectionName,'ReIndex',Core.ReIndex);
           WriteBool  (SectionName,'SoftVol',Core.SoftVol);
           WriteBool  (SectionName,'MBRFullScreen',Core.RFScr);
           WriteBool  (SectionName,'Seek_Chapter',Core.UseekC);
           WriteBool  (SectionName,'Dr',Core.Dr);
           WriteBool  (SectionName,'Double',Core.dbbuf);
           WriteBool  (SectionName,'Show config windows',Core.sconfig);
           WriteBool  (SectionName,'Volnorm',Core.Volnorm);
           WriteBool  (SectionName,'nofontconfig',Core.nfc);
           WriteBool  (SectionName,'nomsgmodule',Core.nmsg);
           WriteString  (SectionName,'Subcode',Core.subcode);
           if WideFileExists(subfont) then
             WriteString  (SectionName,'Subfont',WideExtractShortPathName(subfont))
           else WriteString(SectionName,'Subfont',subfont);
           if WideFileExists(osdfont) then
             WriteString  (SectionName,'OSDfont',WideExtractShortPathName(osdfont))
           else WriteString(SectionName,'OSDfont',osdfont);
           if WideDirectoryExists(ShotDir) then
             WriteString  (SectionName,'ShotDir',WideExtractShortPathName(ShotDir))
           else WriteString(SectionName,'ShotDir',ShotDir);
           if WideDirectoryExists(LyricDir) then
             WriteString  (SectionName,'LyricDir',WideExtractShortPathName(LyricDir))
           else WriteString(SectionName,'LyricDir',LyricDir);
           WriteBool  (SectionName,'ML',Core.ML);
           if WideFileExists(MplayerLocation) then
             WriteString  (SectionName,'MplayerLocation',WideExtractShortPathName(MplayerLocation))
           else WriteString(SectionName,'MplayerLocation',MplayerLocation);
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
           if WideFileExists(WadspL) then
             WriteString(SectionName,'WadspL',WideExtractShortPathName(WadspL))
           else WriteString(SectionName,'WadspL',WadspL);
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
           WriteBool  (SectionName,'GUI',Core.GUI);
           WriteBool  (SectionName,'FilterDrop',Core.FilterDrop);
           WriteBool  (SectionName,'Scroll',Core.PScroll);
           WriteBool  (SectionName,'SPause',Core.SP);
           WriteBool  (SectionName,'DTime',Core.CT);
           WriteString(SectionName,'Params',Core.Params);
         end;
      1: begin
           WriteInteger(SectionName,'IPanelWidth',Core.InterW);
           WriteInteger(SectionName,'IPanelHeight',Core.InterH);
           if ds then begin
             Core.EL:=MainForm.Left; Core.ET:=MainForm.Top;
           end
           else begin
             Core.EL:=MainForm.Left+((MainForm.Width-MainForm.Constraints.MinWidth) DIV 2);
             Core.ET:=MainForm.Top+((MainForm.Height-MainForm.Constraints.MinHeight) DIV 2);
           end;
           if Core.EL<0 then Core.EL:=0; if Core.ET<0 then Core.ET:=0;
           WriteInteger(SectionName,'InfoLeft',IL);
           WriteInteger(SectionName,'InfoTop',IT);
           WriteInteger(SectionName,'LastLeft',Core.EL);
           WriteInteger(SectionName,'LastTop',Core.ET);
           WriteInteger(SectionName,'LastWidth',Core.EW);
           WriteInteger(SectionName,'LastHeight',Core.EH);
           WriteInteger(SectionName,'Intro',Core.Bp);
           WriteInteger(SectionName,'Ending',Core.Ep);
           WriteInteger(SectionName,'Volume',Core.Volume);
           WriteInteger(SectionName,'OSDLevel',Core.OSDLevel);
           WriteInteger(SectionName,'OnTop',Core.OnTop);
           WriteInteger(SectionName,'seekLen',Core.seekLen);
           WriteBool   (SectionName,'UseUni',Core.UseUni);
           for h:=MainForm.MRFile.Count-1 downto 2 do begin
             s:=TTntMenuItem(MainForm.MRFile.Items[h]).Hint;
             if WideFileExists(s) then
               WriteString(SectionName,'RF'+IntToStr(h-2),WideExtractShortPathName(s))
             else WriteString(SectionName,'RF'+IntToStr(h-2),s);
           end;
         end;
      2: begin
           WriteBool  (SectionName,'instance',Core.oneM);
           WriteBool  (SectionName,'RSize',Core.RS);
           WriteBool  (SectionName,'RPostion',Core.RP);
           WriteBool  (SectionName,'DSize',Core.ds);
           WriteString(SectionName,'HotKey',Core.HKS);
         end;
      3: begin
           WriteInteger(SectionName,'CWidth',Core.NW);
           WriteInteger(SectionName,'CHeight',Core.NH);
         end;
      4: WriteString(SectionName,'fileAss',Core.Fass);
    end;
    INI.UpdateFile;
  finally
    Free;
  end;
end;

end.
