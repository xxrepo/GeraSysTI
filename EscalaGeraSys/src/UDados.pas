unit UDados;

interface

uses
  TLHelp32, Windows,
  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls, cxGraphics,
  Data.DB, Datasnap.DBClient;

type
  TdmDados = class(TDataModule)
    img16: TcxImageList;
    img32: TcxImageList;
    cdsUnidadeLotacao: TClientDataSet;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  dmDados: TdmDados;

  function KillTask(ExeFileName : String): Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function KillTask(ExeFileName : String): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop    : BOOL;
  FSnapshotHandle : THandle;
  FProcessEntry32 : TProcessEntry32;
begin
  try
    Result := 0;

    FSnapshotHandle        := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
    ContinueLoop           := Process32First(FSnapshotHandle, FProcessEntry32);

    while Integer(ContinueLoop) <> 0 do
    begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or
        (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
        Result := Integer(TerminateProcess(
                          OpenProcess(PROCESS_TERMINATE,
                                      BOOL(0),
                                      FProcessEntry32.th32ProcessID),
                                      0));
       ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;
    CloseHandle(FSnapshotHandle);
  except
  end;
end;


procedure TdmDados.DataModuleCreate(Sender: TObject);
var
  aFile : String;
begin
  aFile := ExtractFilePath(ParamStr(0)) + 'db\UnidadeLotacao.dat';
  if FileExists(aFile) then
  begin
    cdsUnidadeLotacao.FileName := aFile;
    cdsUnidadeLotacao.LoadFromFile;
  end
  else
  begin
    ForceDirectories( ExtractFilePath(aFile) );
    cdsUnidadeLotacao.FileName := aFile;
    cdsUnidadeLotacao.CreateDataSet;
  end;
end;

procedure TdmDados.DataModuleDestroy(Sender: TObject);
begin
  if cdsUnidadeLotacao.Active then
  begin
    if not cdsUnidadeLotacao.IsEmpty then
      cdsUnidadeLotacao.SaveToFile;

    cdsUnidadeLotacao.Close;
  end;
end;

end.
