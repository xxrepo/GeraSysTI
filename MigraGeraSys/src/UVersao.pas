unit UVersao;

interface

  uses Windows, Classes;

type

  TVersao = class(TObject)
  private
    FInfoVersao : TStringList;
    constructor PrivateCreate;
    
    procedure SetCompanyName(const Value : String);

    function GetCompanyName : String;
    function GetFileVersion : String;
    function GetProductVersion : String;
  public
    constructor Create;

    property CompanyName: String read GetCompanyName write SetCompanyName;
    property FileVersion: String read GetFileVersion;
    property ProductVersion: String read GetProductVersion;

    class function GetInstance : TVersao;
    function getPropertyValue(propName: String): String;
  end;

const
  ivCOMPANY_NAME      = 'CompanyName';
  ivFILE_DESCRIPTION  = 'FileDescription';
  ivFILE_VERSION      = 'FileVersion';
  ivINTERNAL_NAME     = 'InternalName';
  ivLEGAL_COPYRIGHT   = 'LegalCopyright';
  ivLEGAL_TRADEMARKS  = 'LegalTradeMarks';
  ivORIGINAL_FILENAME = 'OriginalFilename';
  ivPRODUCT_NAME      = 'ProductName';
  ivPRODUCT_VERSION   = 'ProductVersion';
  ivCOMMENTS          = 'Comments';
  ivRELEASE_DATE      = 'ReleaseDate';
  ivSYSTEM_ANALYST    = 'Systems Analyst';
  ivCONTACTS          = 'Contacts';
  ivOWNER             = 'Owner';
  ivSPLASHNAME        = 'SplashName';
  ivSPLASHDESCRIPTION = 'SplashDescription';

implementation

uses SysUtils;

var
  InfoVersao : TVersao;

{ TVersao }

class function TVersao.GetInstance : TVersao;
begin
  if not Assigned(InfoVersao) then
    InfoVersao := TVersao.PrivateCreate;

  Result := InfoVersao;
end;

function TVersao.GetCompanyName: String;
begin
  Result := getPropertyValue(ivCOMPANY_NAME);
end;

function TVersao.getPropertyValue(propName: String): String;
type
  PLandCodepage = ^TLandCodepage;
  TLandCodepage = record
    wLanguage,
    wCodePage: word;
  end;
var
  Pntr      : Pointer;
  infoSize  : Cardinal;
  buffer    ,
  valorLido : PChar;
  tamanhoValorLido : Cardinal;
  appName  ,
  Language : String;
begin

  appName  := ParamStr(0);
  Result   := EmptyStr;
  infoSize := GetFileVersionInfoSize(PChar(appName), infoSize);

  if ( infoSize > 0 ) then
  begin
    buffer := AllocMem(infoSize);

    try

      GetFileVersionInfo(PChar(appName), 0, infoSize, buffer);

      if not VerQueryValue(buffer, '\VarFileInfo\Translation\', Pntr, infoSize) then
        RaiseLastOSError;

      Language := Format('%.4x%.4x', [PLandCodepage(Pntr)^.wLanguage, PLandCodepage(Pntr)^.wCodePage]);

      if VerQueryValue(buffer, PChar('StringFileInfo\' + Language + '\' + propName), Pointer(valorLido), tamanhoValorLido) then
      begin

       valorLido := PChar(Trim(valorLido));

       if ( Length(valorLido) > 0 ) then
         Result := valorLido;

      end;

    finally
      FreeMem(buffer, infoSize);
    end;

  end;

end;

procedure TVersao.SetCompanyName(const Value: String);
begin
  FInfoVersao.Values[ivCOMPANY_NAME] := Value;
end;

constructor TVersao.PrivateCreate;
begin
  inherited Create;
  FInfoVersao := TStringList.Create;
end;

constructor TVersao.Create;
begin
  raise Exception.Create('Para obter um TVersao invoque o método GetInstance().');
end;

function TVersao.GetFileVersion: String;
begin
  Result := getPropertyValue(ivFILE_VERSION);
end;

function TVersao.GetProductVersion: String;
begin
  Result := getPropertyValue(ivPRODUCT_VERSION);
end;

end.
