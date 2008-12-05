{   MPUI, an MPlayer frontend for Windows
    Copyright (C) 2005 Martin J. Fiedler <martin.fiedler@gmx.net>
    Copyright (C) 2005 Pawel Wieczorek <platon@radio.ujscie.com>

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
unit mo_pl;
interface
implementation
uses Windows,Locale,Main,Log,Help,About,Options,plist,Info;

procedure Activate;
begin
  with MainForm do begin
    LOCstr_Title:=UTF8Decode('MPlayer dla Windows');
      LOCstr_Status_Opening:=UTF8Decode('Otwieranie ...');
      LOCstr_Status_Closing:=UTF8Decode('Zamykanie ...');
      LOCstr_Status_Playing:=UTF8Decode('Odtwarzanie');
      LOCstr_Status_Paused:=UTF8Decode('Pauza');
      LOCstr_Status_Stopped:=UTF8Decode('Zatrzymane');
      LOCstr_Status_Error:=UTF8Decode('Brak moźliwości otwarcia pliku (Nacisnij aby uzyskac wiecej informacji)');
    BPlaylist.Hint:=UTF8Decode('Pokaź/ukryj okno playlisty');
    BStreamInfo.Hint:=UTF8Decode('Pokaź/ukryj informacje o pliku');
    BFullscreen.Hint:=UTF8Decode('Włącz tryb fullscreen');
    BCompact.Hint:=UTF8Decode('Włącz tryb compact');
    BMute.Hint:=UTF8Decode('Włącz Mute');
    MPCtrl.Caption:=UTF8Decode('Pokaź ustawienia fullscreen');
    OSDMenu.Caption:=UTF8Decode('Ustawienia OSD');
      MNoOSD.Caption:=UTF8Decode('Wyłącz OSD');
      MDefaultOSD.Caption:=UTF8Decode('Domyślne OSD');
      MTimeOSD.Caption:=UTF8Decode('Pokaź czas');
      MFullOSD.Caption:=UTF8Decode('Pokaź całkowity czas');
    LEscape.Caption:=UTF8Decode('Wcisnij Esc aby wyłączyć fullscreen.');
    MFile.Caption:=UTF8Decode('Plik');
      MOpenFile.Caption:=UTF8Decode('Otwórz plik ...');
      MOpenURL.Caption:=UTF8Decode('Otwórz URL ...');
        LOCstr_OpenURL_Caption:=UTF8Decode('Otwórz URL');
        LOCstr_OpenURL_Prompt:=UTF8Decode('Jaki URL chciałbyś otworzyć?');
      MOpenDrive.Caption:=UTF8Decode('Otwórz CD/DVD');
      MClose.Caption:=UTF8Decode('Zamknij');
      MQuit.Caption:=UTF8Decode('Koniec');
    MView.Caption:=UTF8Decode('Widok');
      MSizeAny.Caption:=UTF8Decode('Własna wielkość');
      MSize50.Caption:=UTF8Decode('Połowa wielkości');
      MSize100.Caption:=UTF8Decode('Oryginalna wielkość');
      MSize200.Caption:=UTF8Decode('Podwójna wielkość');
      MFullscreen.Caption:=UTF8Decode('Fullscreen');
      MCompact.Caption:=UTF8Decode('Tryb Compact');
      MOSD.Caption:=UTF8Decode('Włącz OSD');
      MOnTop.Caption:=UTF8Decode('Zawsze na wierzchu');
    MSeek.Caption:=UTF8Decode('Film');
      MPlay.Caption:=UTF8Decode('Play');
      MPause.Caption:=UTF8Decode('Pause');
      MPrev.Caption:=UTF8Decode('Poprzedni tytół');
      MNext.Caption:=UTF8Decode('Następny tytół');
      MShowPlaylist.Caption:=UTF8Decode('Playlista ...');
      MMute.Caption:=UTF8Decode('Mute');
      MSeekF10.Caption:=UTF8Decode('Przewiń 10 sekund');
      MSeekR10.Caption:=UTF8Decode('Cofnij 10 sekund');
      MSeekF60.Caption:=UTF8Decode('Przewiń 1 minute');
      MSeekR60.Caption:=UTF8Decode('Cofnij 1 minute');
      MSeekF600.Caption:=UTF8Decode('Przewiń 10 minut');
      MSeekR600.Caption:=UTF8Decode('Cofnij 10 minut');
    MExtra.Caption:=UTF8Decode('Ustawienia');
      MAudio.Caption:=UTF8Decode('Ścieźka dźwiękowa');
      MSubtitle.Caption:=UTF8Decode('Ścieźka napisów');
      MAspect.Caption:=UTF8Decode('Format obrazu');
        MAutoAspect.Caption:=UTF8Decode('Automatycznie');
        MForce43.Caption:=UTF8Decode('Wymuszaj 4:3');
        MForce169.Caption:=UTF8Decode('Wymuszaj 16:9');
        MForceCinemascope.Caption:=UTF8Decode('Wymuszaj 2.35:1');
      MDeinterlace.Caption:=UTF8Decode('Przeplot');
        MNoDeint.Caption:=UTF8Decode('Wyłącz');
        MSimpleDeint.Caption:=UTF8Decode('Prosty');
        MAdaptiveDeint.Caption:=UTF8Decode('Automatyczny');
      MOptions.Caption:=UTF8Decode('Ustawienia ...');
      MLanguage.Caption:=UTF8Decode('Język');
      MStreamInfo.Caption:=UTF8Decode('Pokaź informacje o pliku ...');
      MShowOutput.Caption:=UTF8Decode('Pokaź konsole MPlayer');
    MHelp.Caption:=UTF8Decode('Pomoc');
      MKeyHelp.Caption:=UTF8Decode('Funkcje klawiatury ...');
      MAbout.Caption:=UTF8Decode('O programie ...');
  end;
  LogForm.Caption:=UTF8Decode('Wyjście MPlayer');
  LogForm.BClose.Caption:=UTF8Decode('Zamknij');
  HelpForm.Caption:=UTF8Decode('Funkcje klawiatury');
  HelpForm.HelpText.Text:=UTF8Decode(
'Klawisze nawigacji:'^M^J+
'Spacja'^I'Play/Pause'^M^J+
'Prawo'^I'Przewiń 10 sekund'^M^J+
'Lewo'^I'Cofnij 10 sekund'^M^J+
'Góra'^I'Przewiń 1 minute'^M^J+
'Dół'^I'Cofnij 1 minute'^M^J+
'PgUp'^I'Przewiń 10 minut'^M^J+
'PgDn'^I'Cofnij 10 minut'^M^J+
^M^J+
'Inne klawisze:'^M^J+
'O'^I'Włącz OSD'^M^J+
'F'^I'Włącz fullscreen'^M^J+
'C'^I'Włącz tryb compact'^M^J+
'T'^I'Ustaw zawsze na wierzchu'^M^J+
'Q'^I'Zakończenie programu'^M^J+
'9/0'^I'Ustawienie głośności'^M^J+
'-/+'^I'Ustawienie audio/video synchronizacji'^M^J+
'1/2'^I'Ustawienie jasności'^M^J+
'3/4'^I'Ustawienie kontrastu'^M^J+
'5/6'^I'Ustawienie koloru'^M^J+
'7/8'^I'Ustawienie nasycenia'
  );
  HelpForm.BClose.Caption:=UTF8Decode('Zamknij');
  AboutForm.Caption:=UTF8Decode('O programie MPUI');
  AboutForm.BClose.Caption:=UTF8Decode('Zamknij');
  AboutForm.LVersionMPUI.Caption:=UTF8Decode('Wersja MPUI: ');
  AboutForm.LVersionMPlayer.Caption:=UTF8Decode('Wersja jądra MPlayer: ');
  with OptionsForm do begin
    Caption:=UTF8Decode('Ustawienia');
    BOK.Caption:=UTF8Decode('OK');
    BApply.Caption:=UTF8Decode('Zatwierdź');
    BSave.Caption:=UTF8Decode('Zapisz');
    BClose.Caption:=UTF8Decode('Zamknij');
    LAudioOut.Caption:=UTF8Decode('Sterownik dźwięku');
      CAudioOut.Items[0]:=UTF8Decode('(nie dekoduj dźwięku)');
      CAudioOut.Items[1]:=UTF8Decode('(nie odtwarzaj dźwięku)');
    LAudioDev.Caption:=UTF8Decode('Urządzenie wyjściowe DirectSound');
    LPostproc.Caption:=UTF8Decode('Postprocessing');
      CPostproc.Items[0]:=UTF8Decode('Wyłącz');
      CPostproc.Items[1]:=UTF8Decode('Automatycznie');
      CPostproc.Items[2]:=UTF8Decode('Maksymalna jakość');
    LOCstr_AutoLocale:=UTF8Decode('(Wybór automaytczny)');
    CIndex.Caption:=UTF8Decode('Przebuduj index pliku jeśli konieczne');
    CSoftVol.Caption:=UTF8Decode('Programowe ustawienia głośności / Głośność zwiększona');
    CPriorityBoost.Caption:=UTF8Decode('Uruchom z wyrzszym priorytetem');
    LParams.Caption:=UTF8Decode('Dodatkowe parametry MPlayer:');
    LHelp.Caption:=UTF8Decode('Pomoc');
  end;
  with PlaylistForm do begin
    Caption:=UTF8Decode('Playlist');
    BPlay.Hint:=UTF8Decode('Play');
    BAdd.Hint:=UTF8Decode('Dodaj ...');
    BMoveUp.Hint:=UTF8Decode('Przesuń do góry');
    BMoveDown.Hint:=UTF8Decode('Przesuń w dół');
    BDelete.Hint:=UTF8Decode('Usuń');
  end;
  InfoForm.Caption:=UTF8Decode('Informacje o pliku');
  InfoForm.BClose.Caption:=UTF8Decode('Zamknij');
  LOCstr_NoInfo:=UTF8Decode('Informacje o pilik niedostępne.');
  LOCstr_InfoFileFormat:=UTF8Decode('Format');
  LOCstr_InfoPlaybackTime:=UTF8Decode('Czas trwania');
  LOCstr_InfoTags:=UTF8Decode('Clip Metadata');
  LOCstr_InfoVideo:=UTF8Decode('Video Track');
  LOCstr_InfoAudio:=UTF8Decode('Audio Track');
  LOCstr_InfoDecoder:=UTF8Decode('Decoder');
  LOCstr_InfoCodec:=UTF8Decode('Codec');
  LOCstr_InfoBitrate:=UTF8Decode('Bitrate');
  LOCstr_InfoVideoSize:=UTF8Decode('Dimensions');
  LOCstr_InfoVideoFPS:=UTF8Decode('Frame Rate');
  LOCstr_InfoVideoAspect:=UTF8Decode('Aspect Ratio');
  LOCstr_InfoAudioRate:=UTF8Decode('Sample Rate');
  LOCstr_InfoAudioChannels:=UTF8Decode('Kanały');
end;

begin
  RegisterLocale(UTF8Decode('Polski (Polish)'),Activate,LANG_POLISH,EASTEUROPE_CHARSET);
end.
