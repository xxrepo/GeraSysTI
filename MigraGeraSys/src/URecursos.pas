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
    procedure ListarCompetencia(cmb : TComboBox; aQtdeAnoAnterior : Integer);

    function SelecionarArquivoFDB(const AOnwer : HWND; var aFileName : TFileName) : Boolean;
  end;

var
  dmRecursos: TdmRecursos;
  gVersao : TVersao;
  gConfiguracao  : TIniFile;
  gFormularios   : TFormularios;
  gLogImportacao : TStringList;

  procedure TrimAppMemorySize;
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

// Limpar memória do Windows referente ao processo atual da aplicação
procedure TrimAppMemorySize;
var
  MainHandle : THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
    CloseHandle(MainHandle);
  except
  end;
  Application.ProcessMessages;
end;
(*
  Importante ler a documentação em:
  - https://www.thoughtco.com/design-your-delphi-program-1058488

  Implementar o complemento que está no passo 06:
  TApplicationEvents OnMessage + a Timer := TrimAppMemorySize NOW
*)

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

procedure TdmRecursos.ListarCompetencia(cmb: TComboBox; aQtdeAnoAnterior : Integer);
var
  idx ,
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

    idx := 0;

    cmb.Clear;
    cmb.AddItem(obj.Descricao, obj);

    // Anos anteriores
    for ano := (YearOf(Date) - aQtdeAnoAnterior) to (YearOf(Date) - 1) do
    begin
      mes := 1;
      while ((mes >= 1) and (mes <= 12)) do
      begin
        obj := TGenerico.Create;

        obj.ID        := StrToInt(FormatFloat('0000', ano) + FormatFloat('00', mes));
        obj.Codigo    := FormatFloat('00', mes) + FormatFloat('0000', ano);
        obj.Descricao := FormatFloat('00', mes) + '/' + FormatFloat('0000', ano);
        cmb.AddItem(obj.Descricao, obj);

        Inc(mes);
      end;
    end;

    // Ano atual
    idx := cmb.Items.Count;
    mes := MonthOf(Date);
    ano := YearOf(Date);
    while ((mes >= 1) and (mes <= 12)) do
    begin
      obj := TGenerico.Create;

      obj.ID        := StrToInt(FormatFloat('0000', ano) + FormatFloat('00', mes));
      obj.Codigo    := FormatFloat('00', mes) + FormatFloat('0000', ano);
      obj.Descricao := FormatFloat('00', mes) + '/' + FormatFloat('0000', ano);
      cmb.AddItem(obj.Descricao, obj);

      Dec(mes);
    end;

    cmb.ItemIndex := idx;
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
