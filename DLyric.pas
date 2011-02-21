{  MPUI-hcb, an MPlayer frontend for Windows
   Copyright (C) 2006-2011 Huang Chen Bin <hcb428@foxmail.com>
   Copyright (C) 2009 YulinSoft
   based on GetLrc by YulinSoft
}

unit DLyric;

interface

uses
    Windows, SysUtils, TntSysUtils, Variants, Classes, Controls, TntControls,
    Dialogs, TntDialogs, StdCtrls, TntStdCtrls, ComCtrls, TntComCtrls, IdHTTP,
    Forms, TntForms, XMLDoc, XMLIntf, ActiveX;

const LangList:array[0..56] of string=('all','alb','ara','arm','ben','bos','pob',
          'bul','cat','chi','hrv','cze','dan','dut','eng','epo','est','fin','fre',
          'glg','geo','ger','ell','heb','hin','hun','ice','ind','ita','jpn','kaz',
          'kor','lav','lit','ltz','mac','may','nor','oci','per','pol','por','rum',
          'rus','scc','sin','slo','slv','spa','swe','syr','tgl','tha','tur','ukr',
          'urd','vie');
          
type
    TLyricEntry = record
      id: widestring;
      artist: widestring;
      title: widestring;
    end;
    TLyricEntryList = array of TLyricEntry;

    TSubEntry = record
       IDSubtitle,LanguageName,SubFormat,SubSumCD,MovieName,
       SubAddDate,SubDownloadsCnt:WideString;
    end;
    TSubEntryList = array of TSubEntry;

    TDownLoadLyric = class(TThread)
    private
      Len:Integer; LyricList:TLyricEntryList;
      SubList:TSubEntryList;
    protected
      procedure Execute; override;
      procedure GetLyricList;
      procedure GetLyric(FN,URL:WideString);
      procedure UpdateListView;
    public
      artist, title, FN, id, URL:WideString;
      mode,Lang: Integer;
    end;

    TDLyricForm = class(TTntForm)
    LArtist: TTntLabel;
    EArtist: TTntEdit;
    ETitle: TTntEdit;
    LTitle: TTntLabel;
    BSearch: TTntButton;
    LyricListView: TTntListView;
    PLS: TTntPageControl;
    LSTitle: TTntLabel;
    ESTitle: TTntEdit;
    BSSearch: TTntButton;
    SubListView: TTntListView;
    CLang: TTntComboBox;
    slyric:TTntTabSheet;
    ssubtitle:TTntTabSheet;
    LSLang: TTntLabel;
    BLSave: TTntButton;
    BLApply: TTntButton;
    BLClose: TTntButton;
    BSave: TTntButton;
    BApply: TTntButton;
    BClose: TTntButton;
    procedure BSearchClick(Sender: TObject);
    procedure BApplyClick(Sender: TObject);
    procedure BCloseClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
    procedure TntFormHide(Sender: TObject);
    procedure PLSChange(Sender: TObject);
    procedure CLangClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var DLyricForm: TDLyricForm; stList:TSubEntryList;

implementation
uses Plist, Core, Locale, Main;

{$R *.dfm}
procedure TDownLoadLyric.Execute;
begin
{ mode value:
      1,2 --> Seearch
    -1,-2 --> Save
      3,4 --> Auto Search and Load
    -3,-4 --> Apply
}

  Len:=0;
  if mode>0 then begin
    GetLyricList;
    if mode mod 2=1 then Len:= Length(LyricList)
    else Len:=Length(SubList);
    if Len=0 then begin
      case mode of
        1: DLyricForm.BSearch.Enabled:=True;
        2: DLyricForm.BSSearch.Enabled:=True;
      end;
      Exit;
    end
    else if (Len=1) and (mode>2) then begin
      if mode=3 then GetLyric(FN, LyricList[0].id)
      else GetLyric(FN, SubList[0].IDSubtitle);
    end;
  end
  else GetLyric(FN, URL);
  Application.ProcessMessages;
  Synchronize(UpdateListView);
  Application.ProcessMessages;
end;

procedure TDownLoadLyric.GetLyric(FN,URL:WideString);
var IdHTTP1: TIdhttp; fs:TFileStream;
begin
  IdHTTP1:=TIdhttp.Create(nil);
  IdHTTP1.HTTPOptions:=[hoKeepOrigProtocol];
  if Abs(mode mod 2)=0 then begin
    IdHTTP1.Host:='www.opensubtitles.org';
    URL:='/en/download/sub/' + URL;
  end;
  fs:=TFileStream.Create(FN,fmCreate or fmShareDenyNone);
  try
    IdHTTP1.Get(URL,fs);
  except
    IdHTTP1.Free;
    fs.Free;
    Exit;
  end;
  IdHTTP1.Free;
  fs.Free;
end;

procedure TDownLoadLyric.GetLyricList;
var XMLString, MyUrl: string; artistV, titleV,linkV,s:OleVariant;
    XDOC: IXMLDocument; XmlNd,nd,nd1: IXMLNode; i,j,Len:Integer;
    IdHTTP1: TIdhttp; SList: TStringList;
    IDSubtitle,LanguageName,SubFormat,SubSumCD,MovieName,
    SubAddDate,SubEnabled,SubDownloadsCnt,SubBad:WideString;

begin
  IdHTTP1:=TIdhttp.Create(nil);
  IdHTTP1.HTTPOptions:=[hoKeepOrigProtocol];
  XMLString:='';
  if Abs(mode mod 2)=1 then begin
    artist := Tnt_WideLowerCase(Tnt_WideStringReplace(artist, '''', '', [rfReplaceAll]));
    artist := Tnt_WideLowerCase(Tnt_WideStringReplace(artist, '"', '', [rfReplaceAll]));
    title := Tnt_WideLowerCase(Tnt_WideStringReplace(title, '''', '', [rfReplaceAll]));
    title := Tnt_WideLowerCase(Tnt_WideStringReplace(title, '"', '', [rfReplaceAll]));

    SList:=TStringList.Create;
    SList.Text:=Format('<?xml version="1.0" encoding=''utf-8''?><search filetype="lyrics" artist="%s" title="%s"/>', [UTF8Encode(artist), UTF8Encode(title)]);
    try   //http://www.viewlyrics.com:1212/searchlyrics.htm
    //http://search.crintsoft.com//searchlyrics.htm
      XMLString:=IdHTTP1.Post('http://search.crintsoft.com/searchlyrics.htm',SList);
      SList.Free;
    except
      IdHTTP1.Free;
      SList.Free;
      Exit;
    end;
  end
  else begin
    IdHTTP1.Host:='www.opensubtitles.org';
    MyUrl:= Format('/en/search2/sublanguageid-%s/moviename-%s/xml', [LangList[Lang],UTF8Encode(title)]);
    try
      XMLString:=IdHTTP1.Get(MyUrl);
    except
      IdHTTP1.Free;
      Exit;
    end;
  end;

  IdHTTP1.Free;
  if XMLString='' then Exit;

  try
    OleInitialize(nil);
    XDOC := XMLDoc.LoadXMLData(UTF8Decode(XMLString));
  except
    XDOC:=nil;
    OleUninitialize;
    Exit;
  end;
  OleUninitialize;
  XDOC.Options:= XDOC.Options - [doAttrNull];
  XmlNd := XDOC.DocumentElement;
  if Abs(mode mod 2)=1 then begin
    SetLength(LyricList,0);
    for i := 0 to XmlNd.ChildNodes.Count - 1 do begin
      artistV:=XmlNd.ChildNodes[i].Attributes['artist'];
      titleV:=XmlNd.ChildNodes[i].Attributes['title'];
      linkV:=XmlNd.ChildNodes[i].Attributes['link'];
      if (artistV<>Null) and (artistV<>'') and
         (titleV<>Null) and (titleV<>'') and
         (linkV<>Null) and (Tnt_WideLowerCase(WideExtractFileExt(linkV))='.lrc')  then begin
        Len:=Length(LyricList);
        SetLength(LyricList,Len + 1);
        LyricList[Len].id := linkV;
        LyricList[Len].artist:=artistV;
        LyricList[Len].title:=titleV;
      end;
    end;
  end
  else begin
    SList:= TStringList.Create;
    SetLength(SubList,0);
    nd:= XmlNd.ChildNodes.FindNode('search');
    if nd<>nil then begin
      nd:=nd.ChildNodes.FindNode('results');
      if nd<>nil then begin
        for i := 0 to nd.ChildNodes.Count - 1 do begin
          nd1:=nd.ChildNodes[i];
          if nd1.NodeName='subtitle' then begin
             s:=nd1.ChildValues['MovieID'];
             if (s<>Null) and (StrToIntDef(s,-1)>-1) then SList.Add(s);
             break;
          end;
        end;
      end;
    end;

    XDOC:=nil;

    for i := 0 to SList.Count - 1 do begin
      MyUrl:= Format('/en/search/sublanguageid-%s/xml/idmovie-%s', [LangList[Lang],SList[i]]);
      repeat
        IdHTTP1:=TIdhttp.Create(nil);
        IdHTTP1.Host:='www.opensubtitles.org';
        XMLString:='';
        try
          XMLString := IdHTTP1.Get(MyUrl);
        except
          IdHTTP1.Free;
          Break;
        end;

        IdHTTP1.Free;
        if XMLString='' then Break;

        try
          OleInitialize(nil);
          XDOC := XMLDoc.LoadXMLData(UTF8Decode(XMLString));
        except
          XDOC:=nil;
          OleUninitialize;
          Break;
        end;
        OleUninitialize;
        MyUrl:='';
        XDOC.Options:= XDOC.Options - [doAttrNull];
        XmlNd := XDOC.DocumentElement;
        nd:= XmlNd.ChildNodes.FindNode('search');
        if nd<>nil then begin
          nd:=nd.ChildNodes.FindNode('results');
          if nd<>nil then begin
            for j := 0 to nd.ChildNodes.Count - 1 do begin
              nd1:=nd.ChildNodes[j];
              if nd1.NodeName='subtitle' then begin
                SubBad:=''; SubEnabled:='';
                s:=nd1.ChildValues['SubBad'];
                if (s<>Null) and (StrToIntDef(s,-1)=0) then SubBad:=s;
                s:=nd1.ChildValues['SubEnabled'];
                if (s<>Null) and (StrToIntDef(s,-1)>0) then SubEnabled:=s;
                if (SubEnabled<>'') and (SubBad<>'') then begin
                  IDSubtitle:=''; LanguageName:=''; SubFormat:='';
                  SubSumCD:=''; SubAddDate:='';
                  SubDownloadsCnt:=''; MovieName:='';
                  s:=nd1.ChildValues['SubDownloadsCnt'];
                  if (s<>Null) and (StrToIntDef(s,-1)>-1) then SubDownloadsCnt := s;
                  s:=nd1.ChildValues['IDSubtitle'];
                  if (s<>Null) and (StrToIntDef(s,-1)>-1) then IDSubtitle := s;
                  s:=nd1.ChildValues['LanguageName'];
                  if (s<>Null) and (s<>'') then LanguageName := s;
                  s:=nd1.ChildValues['SubSumCD'];
                  if (s<>Null) and (StrToIntDef(s,-1)>-1) then SubSumCD := s;
                  s:=nd1.ChildValues['SubFormat'];
                  if (s<>Null) and (s<>'') then  SubFormat := s;
                  s:=nd1.ChildValues['SubAddDate'];
                  if (s<>Null) and (s<>'') then SubAddDate := s;
                  s:=nd1.ChildValues['MovieName'];
                  if (s<>Null) and (s<>'') then MovieName := s;
                  if (IDSubtitle<>'') and (LanguageName<>'') and (SubSumCD<>'') and (MovieName<>'')
                    and (SubFormat<>'') and (SubAddDate<>'') and (SubDownloadsCnt<>'') then begin
                    Len:=Length(SubList);
                    SetLength(SubList,Len + 1);
                    SubList[Len].IDSubtitle:=IDSubtitle; SubList[Len].LanguageName:=LanguageName;
                    SubList[Len].SubFormat:=SubFormat; SubList[Len].SubSumCD:=SubSumCD;
                    SubList[Len].SubAddDate:=SubAddDate; SubList[Len].SubDownloadsCnt:=SubDownloadsCnt;
                    SubList[Len].MovieName:=MovieName;
                  end;
                end;
              end;
            end;
            nd:=nd.ChildNodes.FindNode('rel_links');
            if nd<>nil then begin
              nd:=nd.ChildNodes.FindNode('next');
              if nd<>nil then begin
                s:=nd.Attributes['LinkRel'];
                if s<>Null then MyUrl := s;
              end;
            end;
          end;
        end;
      until MyUrl='';
    end;
    SList.Free;
  end;
  XDOC := nil;
end;

procedure TDownLoadLyric.UpdateListView;
var i:Integer;
begin
  if WideFileExists(FN) then begin
    case mode of
      3,-3: begin
              DLyricForm.BLSave.Enabled:=True; DLyricForm.BLApply.Enabled:=True;
              Lyric.ParseLyric(FN); if Len=1 then Exit;
            end;
      4,-4: begin
              DLyricForm.BSave.Enabled:=True; DLyricForm.BApply.Enabled:=True;
              DownSubtitle_CallBackW(PWChar(FN),1,0); if Len=1 then Exit;
            end;
    end;
  end;

  if mode mod 2=1 then begin
    DLyricForm.BSearch.Enabled := true;
    if Len=0 then Exit;
    DLyricForm.EArtist.Text:= artist; DLyricForm.ETitle.Text:= title;
    DLyricForm.BLSave.Enabled:=True; DLyricForm.BLApply.Enabled:=True;
    DLyricForm.PLS.ActivePageIndex:=0;
    DLyricForm.LyricListView.Clear;
    for i:=0 to Len-1 do begin
      with DLyricForm.LyricListView.Items.Add do begin
        Caption:=LyricList[i].id;
        SubItems.Add(LyricList[i].artist);
        SubItems.Add(LyricList[i].title);
      end;
    end;
  end
  else begin
    DLyricForm.BSSearch.Enabled := true;
    if Len=0 then Exit;
    DLyricForm.ESTitle.Text:= title;
    DLyricForm.BSave.Enabled:=True; DLyricForm.BApply.Enabled:=True;
    DLyricForm.CLang.ItemIndex:=Lang; stList:=SubList;
    DLyricForm.PLS.ActivePageIndex:=1;
    DLyricForm.SubListView.Clear;
    for i:=0 to Len-1 do begin
      with DLyricForm.SubListView.Items.Add do begin
        Caption:=SubList[i].IDSubtitle;
        SubItems.Add(SubList[i].MovieName);
        SubItems.Add(SubList[i].LanguageName);
        SubItems.Add(SubList[i].SubFormat);
        SubItems.Add(SubList[i].SubSumCD);
        SubItems.Add(SubList[i].SubDownloadsCnt);
        SubItems.Add(SubList[i].SubAddDate);
      end;
    end;
  end;
  DLyricForm.Show;
  DLyricForm.PLSChange(nil);
end;

procedure TDLyricForm.BSearchClick(Sender: TObject);
var t:TDownLoadLyric;
begin
  Application.ProcessMessages;
  if PLS.ActivePageIndex=0 then begin
    if (EArtist.Text='') and (ETitle.Text='') then Exit;
    BSearch.Enabled := False;
    t:=TDownLoadLyric.Create(True);
    t.FreeOnTerminate:=True;
    t.artist:=EArtist.Text; t.title:=ETitle.Text;
    t.mode:=1; t.Resume;
  end
  else begin
    if ESTitle.Text='' then Exit;
    BSSearch.Enabled := False;
    t:=TDownLoadLyric.Create(True);
    t.FreeOnTerminate:=True;
    t.title:=ESTitle.Text; t.Lang:=CLang.ItemIndex;
    t.mode:=2; t.Resume;
  end;
end;

procedure TDLyricForm.BApplyClick(Sender: TObject);
var t:TDownLoadLyric;
begin
  Application.ProcessMessages;
  if PLS.ActivePageIndex=0 then begin
    if LyricListView.Items.Count=0 then Exit;
    if LyricListView.ItemIndex=-1 then LyricListView.ItemIndex:=0;
    BLSave.Enabled:=False; BLApply.Enabled:=False;
    t:=TDownLoadLyric.Create(True);
    t.FreeOnTerminate:=True;
    t.FN:=WideIncludeTrailingPathDelimiter(LyricDir) + GetFileName(WideExtractFileName(MediaURL)) + '.lrc';
    t.URL:= LyricListView.Selected.Caption;
    t.mode:=-3; t.Resume;
  end
  else begin
    if SubListView.Items.Count=0 then Exit;
    if SubListView.ItemIndex=-1 then SubListView.ItemIndex:=0;
    BSave.Enabled:=False; BApply.Enabled:=False;
    t:=TDownLoadLyric.Create(True);
    t.FreeOnTerminate:=True;
    t.FN:=WideIncludeTrailingPathDelimiter(LyricDir) + GetFileName(WideExtractFileName(MediaURL)) + '.zip';
    t.URL:= SubListView.Selected.Caption;
    t.mode:=-4;
    t.Resume;
  end;
end;

procedure TDLyricForm.BCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TDLyricForm.BSaveClick(Sender: TObject);
var t:TDownLoadLyric;
begin
  Application.ProcessMessages;
  with PlaylistForm.SaveDialog do begin
    if PLS.ActivePageIndex=0 then begin
      Title := BLSave.Hint;
      Filter:= LyricFilter + ' (*.lrc)|*.lrc|' + AnyFilter + ' (*.*)|*.*';
      if LyricListView.Items.Count=0 then Exit;
      if LyricListView.ItemIndex=-1 then LyricListView.ItemIndex:=0;
      FileName:=LyricListView.Selected.SubItems[0] + ' - ' + LyricListView.Selected.SubItems[1];
      if Execute then begin
        BLSave.Enabled:=False; BLApply.Enabled:=False;
        t:=TDownLoadLyric.Create(True);
        t.FN:=FileName; t.URL:=LyricListView.Selected.Caption;
        t.mode:=-1;
        t.Resume;
      end;
    end
    else begin
      Title := BSave.Hint;
      Filter:= SubFilter + ' (*.zip)|*.zip|' + AnyFilter + ' (*.*)|*.*';
      if SubListView.Items.Count=0 then Exit;
      if SubListView.ItemIndex=-1 then SubListView.ItemIndex:=0;
      FileName:=SubListView.Selected.SubItems[0] + ' - ' + SubListView.Selected.SubItems[1];
      if Execute then begin
        BSave.Enabled:=False; BApply.Enabled:=False;
        t:=TDownLoadLyric.Create(True);
        t.FN:=FileName; t.URL:=LyricListView.Selected.Caption;
        t.mode:=-2;
        t.Resume;
      end;
    end;
  end;
end;

procedure TDLyricForm.TntFormShow(Sender: TObject);
begin
  if (MainForm.Width >= Screen.Width) or (MainForm.Height >= Screen.WorkAreaHeight) then MainForm.Enabled := false;
  if (OnTop > 0) or MainForm.MFullScreen.Checked then SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TDLyricForm.TntFormHide(Sender: TObject);
begin
  if PlayListForm.Visible then exit;
  MainForm.Enabled := true;
  if (OnTop = 1) or ((OnTop = 2) and (Status = sPlaying)) or MainForm.MFullScreen.Checked then
    SetWindowPos(MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TDLyricForm.PLSChange(Sender: TObject);
begin
  if PLS.TabIndex=0 then Caption:= MainForm.MDownloadLyric.Caption
  else Caption:=MainForm.Mdownloadsubtitle.Caption;
end;

procedure TDLyricForm.CLangClick(Sender: TObject);
var Len,i:Integer;
begin
  Len:=Length(stList);
  if (CLang.ItemIndex=-1) or (Len=0) then Exit;
  SubListView.Clear;
  for i:=0 to Len-1 do begin
    if (CLang.ItemIndex=0) or (stList[i].LanguageName=CLang.Items[CLang.ItemIndex]) then begin
      with SubListView.Items.Add do begin
        Caption:=stList[i].IDSubtitle;
        SubItems.Add(stList[i].MovieName);
        SubItems.Add(stList[i].LanguageName);
        SubItems.Add(stList[i].SubFormat);
        SubItems.Add(stList[i].SubSumCD);
        SubItems.Add(stList[i].SubDownloadsCnt);
        SubItems.Add(stList[i].SubAddDate);
      end;
    end;
  end;
end;

end.
