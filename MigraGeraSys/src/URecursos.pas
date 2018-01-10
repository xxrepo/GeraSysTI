unit URecursos;

interface

uses
  FuncoesFormulario,
  UVersao,
  Winapi.Windows,
  Vcl.Forms, ShellApi,
  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.StdCtrls, Vcl.Controls,
  Vcl.Dialogs, cxGraphics, IniFiles, DateUtils;

type
  TdmRecursos = class(TDataModule)
    img32x32: TcxImageList;
    img16x16: TcxImageList;
    opdSelecionar: TOpenDialog;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExibriLog;
    procedure ListarCompetencia(cmb : TComboBox);

    function SelecionarArquivoFDB(const AOnwer : HWND; var aFileName : TFileName) : Boolean;
  end;

var
  dmRecursos: TdmRecursos;
  gVersao : TVersao;
  gConfiguracao  : TIniFile;
  gFormularios   : TFormularios;
  gLogImportacao : TStringList;

  procedure MensagemInforme(pTitulo : String; pMensagem : String);
  procedure MensagemAlerta(pTitulo : String; pMensagem : String);
  procedure MensagemErro(pTitulo : String; pMensagem : String);

  function MensagemConfirmar(pTitulo : String; pMensagem : String) : Boolean;
  function CalcularDigitoVerificador(pCodigo: String): String;

const
  TARGET_DB_USER_NAME = 'GERASYS.TI';
  TARGET_DB_PASSWORD  = 'gsti2010';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UConexaoTargetDB;

{$R *.dfm}

procedure MensagemInforme(pTitulo : String; pMensagem : String);
begin
  Application.MessageBox(PWideChar(pMensagem), PWideChar(pTitulo), MB_OK + MB_ICONINFORMATION);
end;

procedure MensagemAlerta(pTitulo : String; pMensagem : String);
begin
  Application.MessageBox(PWideChar(pMensagem), PWideChar(pTitulo), MB_OK + MB_ICONWARNING);
end;

procedure MensagemErro(pTitulo : String; pMensagem : String);
begin
  Application.MessageBox(PWideChar(pMensagem), PWideChar(pTitulo), MB_OK + MB_ICONERROR);
end;

function MensagemConfirmar(pTitulo : String; pMensagem : String) : Boolean;
begin
  Result := (Application.MessageBox(PWideChar(pMensagem), PWideChar(pTitulo), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES);
end;

function CalcularDigitoVerificador(pCodigo: String): String;
var
  sCodigo : String;
  iTotNum : Integer;
begin
  try
    sCodigo := Trim(pCodigo);
    if (Length(sCodigo) < 6) then
      sCodigo := FormatFloat('000000', StrToIntDef(Trim(pCodigo), 0));

    iTotNum := (StrToInt(sCodigo[6]) * 3) +
               (StrToInt(sCodigo[5]) * 4) +
               (StrToInt(sCodigo[4]) * 5) +
               (StrToInt(sCodigo[3]) * 6) +
               (StrToInt(sCodigo[2]) * 7) +
               (StrToInt(sCodigo[1]) * 8);
    Result := IntToStr(iTotNum Mod 10);
  except
   Result  := '0';
  end;
end;

{ TdmRecursos }

procedure TdmRecursos.ExibriLog;
var
  sLog : String;
begin
  if (gLogImportacao.Count > 0) then
  begin
    sLog := ExtractFilePath(ParamStr(0)) + '_LogImportacao' + FormatDateTime('YYYYMMD_HHMM".txt"', Date);
    gLogImportacao.SaveToFile(sLog);
    ShellExecute(Application.Handle, 'Open', PChar(sLog), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TdmRecursos.ListarCompetencia(cmb: TComboBox);
var
  mes ,
  ano : Integer;
  obj : TGenerico;
begin
  if Assigned(cmb) then
  begin
    obj := TGenerico.Create;
    obj.ID        := 0;
    obj.Codigo    := '000000';
    obj.Descricao := '(Todas)';

    cmb.Clear;
    cmb.AddItem(obj.Descricao, obj);

    mes := 1;
    ano := YearOf(Date) - 1;
    while ((mes >= 1) and (mes <= 12)) do
    begin
      obj := TGenerico.Create;

      obj.ID        := StrToInt(FormatFloat('0000', ano) + FormatFloat('00', mes));
      obj.Codigo    := FormatFloat('00', mes) + FormatFloat('0000', ano);
      obj.Descricao := FormatFloat('00', mes) + '/' + FormatFloat('0000', ano);
      cmb.AddItem(obj.Descricao, obj);

      Inc(mes);
    end;

    mes := MonthOf(Date);
    ano := YearOf(Date);
    while (mes >= 1) do
    begin
      obj := TGenerico.Create;

      obj.ID        := StrToInt(FormatFloat('0000', ano) + FormatFloat('00', mes));
      obj.Codigo    := FormatFloat('00', mes) + FormatFloat('0000', ano);
      obj.Descricao := FormatFloat('00', mes) + '/' + FormatFloat('0000', ano);
      cmb.AddItem(obj.Descricao, obj);

      Dec(mes);
    end;

    cmb.ItemIndex := 0;
  end;
end;

function TdmRecursos.SelecionarArquivoFDB(const AOnwer: HWND;
  var aFileName: TFileName): Boolean;
begin
  opdSelecionar.Filter := 'Arquivos FireBird *.fdb|*.fdb';
  Result := opdSelecionar.Execute(AOnwer);
  if Result then
    aFileName := opdSelecionar.FileName;
end;

initialization
  gConfiguracao  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Configuracoes.ini');
  gVersao        := TVersao.GetInstance;
  gFormularios   := TFormularios.Create;
  gLogImportacao := TStringList.Create;

finalization
  gVersao.Destroy;
  gFormularios.Destroy;
  gLogImportacao.Destroy;

end.
