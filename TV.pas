unit TV;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, TntForms, Controls, StdCtrls,
  Buttons, ExtCtrls, TntStdCtrls, ActiveX;

type
    TOpenDevicesForm = class(TTntForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    CVideoDevices: TTntComboBox;
    CAudioDevices: TTntComboBox;
    CCountryCode: TTntComboBox;
    LVideoDevices: TTntStaticText;
    LCountryCode: TTntStaticText;
    LAudioDevices: TTntStaticText;
    procedure FormShow(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
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
uses main, plist;
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
        //PropBag._Release;
      end;
     // Moniker._Release;
    end;
   // EnumCat._Release;
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
        //PropBag._Release;
      end;
     // Moniker._Release;
    end;
   // EnumCat._Release;
  end;
 // SysDevEnum._Release;
end;

procedure TOpenDevicesForm.FormShow(Sender: TObject);
begin
  CVideoDevices.Clear; CAudioDevices.Clear; CreateDevEnum;
  if CVideoDevices.Items.Count>0 then CVideoDevices.ItemIndex:=0;
  if CAudioDevices.Items.Count>0 then CAudioDevices.ItemIndex:=0;
end;

procedure TOpenDevicesForm.OKBtnClick(Sender: TObject);
var Entry:TPlaylistEntry;
begin
if CVideoDevices.ItemIndex=-1 then exit;
  with Entry do begin
    State:=psNotPlayed;
    if CVideoDevices.ItemIndex=-1 then
      FullURL:='tv:///'+IntToStr(CVideoDevices.ItemIndex)
    else FullURL:='-tv audioid='+IntToStr(CAudioDevices.ItemIndex)+' tv:///'+IntToStr(CVideoDevices.ItemIndex);
    DisplayURL:='TV'+IntToStr(CVideoDevices.ItemIndex);
  end;
  Playlist.Add(Entry);
  Playlist.Changed; MainForm.UpdateParams;
  MainForm.NextFile(0,psPlaying);
  close;
end;

end.
