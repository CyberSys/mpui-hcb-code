unit OpenDevice;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, TntForms, Controls, StdCtrls,
  Buttons, ExtCtrls, TntStdCtrls, ActiveX, ComCtrls, TntComCtrls,TntSysUtils,
  Dialogs, TntClasses;
type
    TOpenDevicesForm = class(TTntForm)
    CVideoDevices: TTntComboBox;
    CAudioDevices: TTntComboBox;
    CCountryCode: TTntComboBox;
    LVideoDevices: TTntStaticText;
    LCountryCode: TTntStaticText;
    LAudioDevices: TTntStaticText;
    HK: TTntListView;
    TScan: TTntButton;
    TView: TTntButton;
    TClear: TTntButton;
    TLoad: TTntButton;
    TStop: TTntButton;
    TSave: TTntButton;
    TPrev: TTntButton;
    TNext: TTntButton;
    TOpen: TTntButton;
    procedure FormShow(Sender: TObject);
    procedure TOpenClick(Sender: TObject);
    procedure TViewClick(Sender: TObject);
    procedure TStopClick(Sender: TObject);
    procedure TLoadClick(Sender: TObject);
    procedure TPrevClick(Sender: TObject);
    procedure TSaveClick(Sender: TObject);
    procedure TClearClick(Sender: TObject);
    procedure TScanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  ICreateDevEnum = interface(IUnknown)
    ['{29840822-5B84-11D0-BD3B-00A0C911CE86}']
    (*** ICreateDevEnum methods ***)
    function CreateClassEnumerator(const clsidDeviceClass: TGUID;
        out ppEnumMoniker: IEnumMoniker; dwFlags: DWORD): HResult; stdcall;
  end;

var
  OpenDevicesForm: TOpenDevicesForm; SysDevEnum:ICreateDevEnum; EnumCat:IEnumMoniker;
  Moniker:IMoniker; cFetched:Longint; PropBag:IPropertyBag; varName:oleVariant;

const  IID_IPropertyBag:TGUID='{55272A00-42CB-11CE-8135-00AA004BB851}';
       IID_ICreateDevEnum:TGUID='{29840822-5B84-11D0-BD3B-00A0C911CE86}';
       CLSID_SystemDeviceEnum:TGUID='{62BE5D10-60EB-11D0-BD3B-00A0C911CE86}';
       CLSID_VideoInputDeviceCategory:TGUID='{860BB310-5D01-11D0-BD3B-00A0C911CE86}';
       CLSID_AudioInputDeviceCategory:TGUID='{33D9A762-90C8-11D0-BD43-00A0C911CE86}';
                                                                                  
implementation
uses main, plist, Core;
{$R *.dfm}
procedure CreateDevEnum;
var hr:HResult;
begin SysDevEnum:=nil;
  hr:=CoCreateInstance(CLSID_SystemDeviceEnum,nil,CLSCTX_INPROC_SERVER,IID_ICreateDevEnum,SysDevEnum);
  if Failed(hr) then exit;
  EnumCat:=nil;
  hr:=SysDevEnum.CreateClassEnumerator(CLSID_VideoInputDeviceCategory,EnumCat,0);
  if hr=S_OK then begin Moniker:=nil; cFetched:=0;
    while(EnumCat.Next(1,Moniker,@cFetched)=S_OK) do begin
      PropBag:=nil;
      hr:=Moniker.BindToStorage(nil,nil,IID_IPropertyBag,PropBag);
      if Succeeded(hr) then begin
        VariantInit(varName);
        hr:=PropBag.Read('FriendlyName',varName,nil);
        if Succeeded(hr) then opendevicesForm.CVideoDevices.items.add(varname);
        VariantClear(varName);
      end;
    end;
  end;
  EnumCat:=nil;
  hr:=SysDevEnum.CreateClassEnumerator(CLSID_AudioInputDeviceCategory,EnumCat,0);
  if hr=S_OK then begin Moniker:=nil; cFetched:=0;
    while(EnumCat.Next(1,Moniker,@cFetched)=S_OK) do begin
      PropBag:=nil;
      hr:=Moniker.BindToStorage(nil,nil,IID_IPropertyBag,PropBag);
      if Succeeded(hr) then begin
        VariantInit(varName);
        hr:=PropBag.Read('FriendlyName',varName,nil);
        if Succeeded(hr) then opendevicesForm.CAudioDevices.items.add(varname);
        VariantClear(varName);
       end;
    end;
  end;
end;

procedure TOpenDevicesForm.TSaveClick(Sender: TObject);
var FList: TStringList; i, h: integer; FN: WideString;
begin
  with playlistform.SaveDialog do begin
    Title := playlistform.BSave.Hint;
    Filter:='Channel list [UTF-8] (*.cl)|*.cl|Anyfile (*.*)|*.*';
    if Execute then begin
      FList := TStringList.Create;
      if Tnt_WideLowerCase(WideExtractFileExt(FileName)) = '.cl' then
        for i := 0 to Hk.items.Count - 1 do FList.Add(UTF8Encode(HK.items[i].caption+' '+HK.items[i].SubItems.Strings[0]))
      else for i := 0 to Playlist.Count - 1 do FList.Add(HK.items[i].caption+' '+HK.items[i].SubItems.Strings[0]);
      if not WideFileExists(FileName) then begin
        h := WideFileCreate(FileName);
        if GetLastError = 0 then FN := WideExtractShortPathName(FileName);
        if h < 0 then
          FN := WideExtractShortPathName(WideIncludeTrailingPathDelimiter(WideExtractFilePath(FileName))) + WideExtractFileName(FileName)
        else CloseHandle(h);
      end
      else begin
        if WideFileIsReadOnly(FileName) then WideFileSetReadOnly(FileName, false);
        FN := WideExtractShortPathName(FileName);
      end;
      FList.SaveToFile(FN);
      FList.Free;
    end;
  end;
end;

procedure TOpenDevicesForm.TPrevClick(Sender: TObject);
begin
  SendCommand('tv_step_channel '+IntToStr((Sender as TTntButton).tag));
end;

procedure TOpenDevicesForm.FormShow(Sender: TObject);
begin
  CVideoDevices.Clear; CAudioDevices.Clear; CreateDevEnum;
  if CVideoDevices.Items.Count>0 then CVideoDevices.ItemIndex:=0;
  if CAudioDevices.Items.Count>0 then CAudioDevices.ItemIndex:=0;
end;

procedure TOpenDevicesForm.TOpenClick(Sender: TObject);
var Entry:TPlaylistEntry; i:integer; s:WideString;
begin
  if CVideoDevices.ItemIndex=-1 then exit;
  with Entry do begin
    State:=psNotPlayed;
    if CCountryCode.Text='' then s:='us-bcast'
    else s:=CCountryCode.Text;
    if CVideoDevices.ItemIndex>-1 then
      FullURL:='tv://'+IntToStr(HK.ItemIndex+1)
              +' -tv automute=100:audioid='+IntToStr(CAudioDevices.ItemIndex)
              +':input='+IntToStr(CVideoDevices.ItemIndex)
              +':chanlist='+s
    else FullURL:='tv://'+IntToStr(HK.ItemIndex+1)
              +' -tv automute=100:audioid='+IntToStr(CAudioDevices.ItemIndex)
              +':input=0:chanlist='+s;
    DisplayURL:='TV-'+IntToStr(CVideoDevices.ItemIndex);
  end;
  Playlist.Add(Entry);
  Playlist.Changed; MainForm.UpdateParams;
  MainForm.NextFile(0,psPlaying);
end;

procedure TOpenDevicesForm.TViewClick(Sender: TObject);
var Entry:TPlaylistEntry;
begin
  SendCommand('tv_set_channel '+IntToStr(HK.ItemIndex+1));
end;

procedure TOpenDevicesForm.TStopClick(Sender: TObject);
begin
  SendCommand('stop');
end;

procedure TOpenDevicesForm.TLoadClick(Sender: TObject);
var NameList: TWStringList; i,a: integer; s:WideString;
begin
  NameList := TWStringList.Create;
  with MainForm.OpenDialog do begin
    Title := MainForm.MOpenFile.Caption;
    Options := Options - [ofAllowMultiSelect] - [ofoldstyledialog];
    filter := 'Channel list [UTF-8] (*.cl)|*.cl|Anyfile (*.*)|*.*';
    if Execute then begin
      NameList := TWStringList.Create;
      NameList.LoadFile(FileName, csutf8);
      if NameList.Count > 0 then begin
        HK.Items.Clear;
        for i := 0 to NameList.Count - 1 do begin
          s:=Trim(NameList[i]); a:= pos(' ',s);
          with HK.Items.Add do begin
            Caption:=Copy(s, 1, a-1);
            SubItems.add(Copy(s, a+1,maxint));
          end;
        end;
      end;
      NameList.Free;
    end;
  end;
end;

procedure TOpenDevicesForm.TClearClick(Sender: TObject);
begin
  HK.Items.Clear;
end;

procedure TOpenDevicesForm.TScanClick(Sender: TObject);
begin
  SendCommand('tv_set_freq 0'); SendCommand('tv_start_scan');
end;

end.
