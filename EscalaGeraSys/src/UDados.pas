unit UDados;

interface

uses
  TLHelp32, ComObj, Windows, Vcl.Forms, Vcl.Dialogs, System.VarUtils, System.Variants,
  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls, cxGraphics,
  Data.DB, Datasnap.DBClient, Vcl.OleServer, ExcelXP, cxProgressBar;

type
  TTipoPlanilha = (tpAdministrativo = 1, tpEducacao = 2);
  TdmDados = class(TDataModule)
    img16: TcxImageList;
    img32: TcxImageList;
    cdsUnidadeLotacao: TClientDataSet;
    cdsSubUnidOrcamentaria: TClientDataSet;
    cdsCargo: TClientDataSet;
    cdsServidor: TClientDataSet;
    opnPlanilha: TOpenDialog;
    ExcelApplication: TExcelApplication;
    ExcelOLEObject: TExcelOLEObject;
    ExcelWorkbook: TExcelWorkbook;
    ExcelWorksheet: TExcelWorksheet;
    dtsUnidadeLotacao: TDataSource;
    dtsSubUnidOrcamentaria: TDataSource;
    dtsCargo: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure LimparTabela(const aCds : TClientDataSet);
    procedure CreateDataSetUnidadeLotacao;
    procedure CreateDataSetSubUnidOrcamentaria;
    procedure CreateDataSetCargo;
    procedure CreateDataSetServidor(const aReferencia : Integer);

    procedure ProcessarPlanilha(const aFileName : TFileName; var OK : Boolean;
      aProgressBar : TcxProgressBar);
    procedure AtualizarPlanilha(const aFileName : TFileName; var OK : Boolean;
      aProgressBar : TcxProgressBar);

    function GetReferencia : Integer;
    function GetTipoPlanilha : TTipoPlanilha;
  public
    { Public declarations }
    property Referencia : Integer read GetReferencia;
    property TipoPlanilha : TTipoPlanilha read GetTipoPlanilha;

    procedure CarregarTabelas;
    procedure CarregarTabelaServidor(aReferencia : Integer);

    function StrTipoPlanilha(aTipoPlanilha : TTipoPlanilha) : String;
    function FieldValueStr(const aCds : TClientDataSet; const aField : String) : String;
    function FieldValueInt(const aCds : TClientDataSet; const aField : String) : Integer;

    function ImportarPlanilha(aProgressBar : TcxProgressBar) : Boolean;
    function ExportarPlanilha(aProgressBar : TcxProgressBar) : Boolean;
  end;


var
  dmDados: TdmDados;

const
  cA = 1;
  cB = 2;
  cC = 3;
  cD = 4;
  cE = 5;
  cF = 6;
  cG = 7;
  cH = 8;
  cI = 9;
  cJ = 10;
  cK = 11;
  cL = 12;

  function KillTask(ExeFileName : String): Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses gsLib;

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


procedure TdmDados.AtualizarPlanilha(const aFileName: TFileName;
  var OK: Boolean; aProgressBar: TcxProgressBar);
const
   xlCellTypeLastCell = $0000000B;
var
  XLSAplicacao,
  AbaXLS      : OLEVariant;
  RangeMatrix : Variant;
  I : Integer;
  aRegistro    ,
  aCargoFuncao ,
  aMatricula   : String;
  aTipo : TTipoPlanilha;
begin
  KillTask('Excel.exe');

  OK := False;
  Screen.Cursor := crSQLWait;
  XLSAplicacao  := CreateOleObject('Excel.Application');
  try
    try
      CarregarTabelaServidor(cdsUnidadeLotacao.FieldByName('Referencia').AsInteger);
      aTipo := TTipoPlanilha(cdsUnidadeLotacao.FieldByName('Tipo').AsInteger);

      XLSAplicacao.Visible := False;
      XLSAplicacao.Workbooks.Open(aFileName);
      XLSAplicacao.WorkSheets[1].Activate;

      AbaXLS := XLSAplicacao.Workbooks[ExtractFileName(aFileName)].WorkSheets[1];

      AbaXLS.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

      cdsServidor.Last;
      cdsServidor.First;

      aProgressBar.Position       := 0;
      aProgressBar.Properties.Max := cdsServidor.RecordCount;
      aProgressBar.Visible := True;

      while not cdsServidor.Eof do
      begin
        I := cdsServidor.FieldByName('Linha').AsInteger;
        if (I > 0) then
        begin
          if (aTipo = tpAdministrativo) then
          begin
            AbaXLS.Cells[I, cF] := cdsServidor.FieldByName('QuantidadeCH').AsInteger;
            AbaXLS.Cells[I, cG] := cdsServidor.FieldByName('HoraExtra').AsInteger;
            AbaXLS.Cells[I, cI] := cdsServidor.FieldByName('Falta').AsInteger;
            AbaXLS.Cells[I, cK] := cdsServidor.FieldByName('Observacao').AsString;

            OK := True;
          end
          else
          if (aTipo = tpEducacao) then
          begin
            AbaXLS.Cells[I, cG] := cdsServidor.FieldByName('QuantidadeCH').AsInteger;
            AbaXLS.Cells[I, cH] := cdsServidor.FieldByName('HoraExtra').AsInteger;
            AbaXLS.Cells[I, cI] := cdsServidor.FieldByName('Falta').AsInteger;
            AbaXLS.Cells[I, cL] := cdsServidor.FieldByName('Observacao').AsString;

            OK := True;
          end;
        end;

        aProgressBar.Position := cdsServidor.RecNo;
        cdsServidor.Next;
      end;

      AbaXLS.Cells[1, 1].Select;

      OK := True;
    except
      On E : Exception do
      begin
        OK := False;
        Mensagem('Erro ao tentar atualizar arquivo!' + #13#13 + E.Message, 'Erro', MB_ICONERROR);
      end;
    end;
  finally
    Screen.Cursor := crDefault;

    // Fecha o Microsoft Excel
    if not VarIsEmpty(XLSAplicacao) then
    begin
      if OK then
      begin
        XLSAplicacao.DisplayAlerts := False;
        XLSAplicacao.Workbooks[1].SaveAs(aFileName);
      end;

      XLSAplicacao.Quit;
      XLSAplicacao := Unassigned;
      AbaXLS       := Unassigned;
    end;

    if OK then
      Mensagem('Importação da planilha finalizada com sucesso.', 'Informação', MB_ICONINFORMATION);
  end;
end;

procedure TdmDados.CarregarTabelas;
begin
  CreateDataSetUnidadeLotacao;
  CreateDataSetSubUnidOrcamentaria;
  CreateDataSetCargo;
end;

procedure TdmDados.CarregarTabelaServidor(aReferencia: Integer);
begin
  CreateDataSetServidor(aReferencia);
end;

procedure TdmDados.CreateDataSetCargo;
var
  aFile : String;
begin
  if cdsCargo.Active then
    Exit;

  aFile := ExtractFilePath(ParamStr(0)) + 'db\CargoFuncao.cds';
  if FileExists(aFile) then
  begin
    cdsCargo.FileName := aFile;
    cdsCargo.LoadFromFile;
  end
  else
  begin
    ForceDirectories( ExtractFilePath(aFile) );
    cdsCargo.FileName := aFile;
    cdsCargo.CreateDataSet;
  end;
end;

procedure TdmDados.CreateDataSetServidor(const aReferencia: Integer);
var
  aFile : String;
begin
  if cdsServidor.Active then
    cdsServidor.Close;

  aFile := ExtractFilePath(ParamStr(0)) + 'db\' + FormatFloat('0000', aReferencia) + '_CHServidor.cds';
  if FileExists(aFile) then
  begin
    cdsServidor.FileName := aFile;
    cdsServidor.LoadFromFile;
  end
  else
  begin
    ForceDirectories( ExtractFilePath(aFile) );
    cdsServidor.FileName := aFile;
    cdsServidor.CreateDataSet;
  end;
end;

procedure TdmDados.CreateDataSetSubUnidOrcamentaria;
var
  aFile : String;
begin
  if cdsSubUnidOrcamentaria.Active then
    Exit;

  aFile := ExtractFilePath(ParamStr(0)) + 'db\SubUnidadeOrcamentaria.cds';
  if FileExists(aFile) then
  begin
    cdsSubUnidOrcamentaria.FileName := aFile;
    cdsSubUnidOrcamentaria.LoadFromFile;
  end
  else
  begin
    ForceDirectories( ExtractFilePath(aFile) );
    cdsSubUnidOrcamentaria.FileName := aFile;
    cdsSubUnidOrcamentaria.CreateDataSet;
  end;
end;

procedure TdmDados.CreateDataSetUnidadeLotacao;
var
  aFile : String;
begin
  if cdsUnidadeLotacao.Active then
    Exit;

  aFile := ExtractFilePath(ParamStr(0)) + 'db\UnidadeLotacao.cds';
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

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  if cdsUnidadeLotacao.Active then
    cdsUnidadeLotacao.Close;

  if cdsSubUnidOrcamentaria.Active then
    cdsSubUnidOrcamentaria.Close;

  if cdsCargo.Active then
    cdsCargo.Close;

  if cdsServidor.Active then
    cdsServidor.Close;

  CreateDataSetUnidadeLotacao;
  CreateDataSetSubUnidOrcamentaria;
  CreateDataSetCargo;
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

function TdmDados.ExportarPlanilha(aProgressBar: TcxProgressBar): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    aRetorno := FileExists(cdsUnidadeLotacao.FieldByName('Arquivo').AsString);
    if aRetorno then
      AtualizarPlanilha(cdsUnidadeLotacao.FieldByName('Arquivo').AsString, aRetorno, aProgressBar)
    else
      Mensagem('Planlha não localizada!' + #13 + cdsUnidadeLotacao.FieldByName('Arquivo').AsString, 'Alerta', MB_ICONWARNING);
  finally
    Result := aRetorno;
  end;
end;

function TdmDados.FieldValueInt(const aCds: TClientDataSet;
  const aField: String): Integer;
var
  aRetorno : Integer;
begin
  aRetorno := 0;
  try
    if Assigned(aCds) then
      if (aCds.Fields.FindField(aField) <> nil) then
        aRetorno := aCds.FieldByName(aField).AsInteger;
  finally
    Result := aRetorno;
  end;
end;

function TdmDados.FieldValueStr(const aCds: TClientDataSet;
  const aField: String): String;
var
  aRetorno : String;
begin
  aRetorno := EmptyStr;
  try
    if Assigned(aCds) then
      if (aCds.Fields.FindField(aField) <> nil) then
        aRetorno := aCds.FieldByName(aField).AsString;
  finally
    Result := aRetorno;
  end;
end;

function TdmDados.GetReferencia: Integer;
begin
  Result := FieldValueInt(cdsUnidadeLotacao, 'Referencia');
end;

function TdmDados.GetTipoPlanilha: TTipoPlanilha;
begin
  Result := TTipoPlanilha(cdsUnidadeLotacao.FieldByName('Tipo').AsInteger);
end;

function TdmDados.ImportarPlanilha(aProgressBar : TcxProgressBar): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    aRetorno := opnPlanilha.Execute(Application.Handle);
    if aRetorno then
      ProcessarPlanilha(opnPlanilha.FileName, aRetorno, aProgressBar);
  finally
    Result := aRetorno;
  end;
end;

procedure TdmDados.LimparTabela(const aCds: TClientDataSet);
begin
  if aCds.Active and (not aCds.IsEmpty) then
  begin
    aCds.Close;
    DeleteFile(aCds.FileName);
  end;
end;

procedure TdmDados.ProcessarPlanilha(const aFileName: TFileName; var OK : Boolean;
  aProgressBar : TcxProgressBar);
const
   xlCellTypeLastCell = $0000000B;
var
  XLSAplicacao,
  AbaXLS      : OLEVariant;
  RangeMatrix : Variant;
  I ,
  X ,
  Y ,
  R : Integer;
  aRegistro    ,
  aCargoFuncao ,
  aMatricula   : String;
  aTipo : TTipoPlanilha;
begin
  OK := False;
  Screen.Cursor := crSQLWait;
  XLSAplicacao  := CreateOleObject('Excel.Application');
  try
    try
      LimparTabela(cdsUnidadeLotacao);
      LimparTabela(cdsSubUnidOrcamentaria);
      LimparTabela(cdsServidor);

      CreateDataSetUnidadeLotacao;
      CreateDataSetSubUnidOrcamentaria;
      CreateDataSetCargo;

      XLSAplicacao.Visible := False;
      XLSAplicacao.Workbooks.Open(aFileName);
      XLSAplicacao.WorkSheets[1].Activate;

      AbaXLS := XLSAplicacao.Workbooks[ExtractFileName(aFileName)].WorkSheets[1];

      AbaXLS.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
      X := XLSAplicacao.ActiveCell.Row;
      Y := XLSAplicacao.ActiveCell.Column;

      aProgressBar.Position       := 0;
      aProgressBar.Properties.Max := x;
      aProgressBar.Visible := True;

      RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;

      for I := 1 to X do
      begin
        aRegistro := AbaXLS.Cells[I, cA];
        if (aRegistro = '0') then
        begin
          cdsUnidadeLotacao.Append;
          cdsUnidadeLotacao.FieldByName('Codigo').AsString      := Trim( StringReplace(VarToStr(AbaXLS.Cells[I, cB]), '''', '', [rfReplaceAll]) );
          cdsUnidadeLotacao.FieldByName('Descricao').AsString   := Trim( VarToStr(AbaXLS.Cells[I, cC]) );
          cdsUnidadeLotacao.FieldByName('Tipo').AsInteger       := StrToIntDef(Trim(VarToStr(AbaXLS.Cells[I, cF])), 1);
          cdsUnidadeLotacao.FieldByName('Referencia').AsInteger := StrToIntDef(Trim(VarToStr(AbaXLS.Cells[I, cH])), 0);
          cdsUnidadeLotacao.FieldByName('Arquivo').AsString     := aFileName;
          cdsUnidadeLotacao.Post;

          aTipo := TTipoPlanilha(cdsUnidadeLotacao.FieldByName('Tipo').AsInteger);
          LimparTabela(cdsServidor);
          CreateDataSetServidor(cdsUnidadeLotacao.FieldByName('Referencia').AsInteger);
        end
        else
        if (aRegistro = '1') then
        begin
          cdsSubUnidOrcamentaria.Append;
          cdsSubUnidOrcamentaria.FieldByName('Codigo').AsString    := Trim( StringReplace(VarToStr(AbaXLS.Cells[I, cB]), '''', '', [rfReplaceAll]) );
          cdsSubUnidOrcamentaria.FieldByName('Descricao').AsString := Trim( VarToStr(AbaXLS.Cells[I, cC]) );
          cdsSubUnidOrcamentaria.Post;
        end
        else
        if (aRegistro = '2') then
        begin
          aCargoFuncao := Trim( VarToStr(AbaXLS.Cells[I, cD]) );
          if not cdsCargo.Locate('Descricao', aCargoFuncao, []) then
          begin
            R := cdsCargo.RecNo + 1;
            cdsCargo.Append;
            cdsCargo.FieldByName('Codigo').AsString    := FormatFloat('000', R);
            cdsCargo.FieldByName('Descricao').AsString := aCargoFuncao;
            cdsCargo.Post;
          end;

          aMatricula := Trim( VarToStr(AbaXLS.Cells[I, cB]) );

          cdsServidor.Append;

          cdsServidor.FieldByName('Matricula').AsString   := aMatricula;
          cdsServidor.FieldByName('Nome').AsString        := Trim( VarToStr(AbaXLS.Cells[I, cC]) );
          cdsServidor.FieldByName('Unidade').AsString     := cdsUnidadeLotacao.FieldByName('Codigo').AsString;
          cdsServidor.FieldByName('SubUnidade').AsString  := cdsSubUnidOrcamentaria.FieldByName('Codigo').AsString;
          cdsServidor.FieldByName('Cargo').AsString       := cdsCargo.FieldByName('Codigo').AsString;
          cdsServidor.FieldByName('Admissao').AsDateTime  := StrToDateTime( Trim( StringReplace(VarToStr(AbaXLS.Cells[I, cE]), '''', '', [rfReplaceAll]) ) );
          cdsServidor.FieldByName('Referencia').AsInteger := cdsUnidadeLotacao.FieldByName('Referencia').AsInteger;
          cdsServidor.FieldByName('Linha').AsInteger      := I;

          if (aTipo = tpAdministrativo) then
          begin
            cdsServidor.FieldByName('QuantidadeCH_Ante').AsInteger := 0;
            cdsServidor.FieldByName('QuantidadeCH').AsInteger      := StrToIntDef(Trim(VarToStr(AbaXLS.Cells[I, cF])), 0);
            cdsServidor.FieldByName('EstadoFuncional').AsString    := Trim( VarToStr(AbaXLS.Cells[I, cJ]) );
          end
          else
          if (aTipo = tpEducacao) then
          begin
            cdsServidor.FieldByName('QuantidadeCH_Ante').AsInteger := StrToIntDef(Trim(VarToStr(AbaXLS.Cells[I, cF])), 0);
            cdsServidor.FieldByName('QuantidadeCH').AsInteger      := StrToIntDef(Trim(VarToStr(AbaXLS.Cells[I, cF])), 0);
            cdsServidor.FieldByName('EstadoFuncional').AsString    := Trim( VarToStr(AbaXLS.Cells[I, cK]) );
          end;

          cdsServidor.FieldByName('HoraExtra').Clear;
          cdsServidor.FieldByName('Falta').Clear;
          cdsServidor.FieldByName('Observacao').Clear;

          cdsServidor.Post;
        end;

        aProgressBar.Position := I;
      end;

      RangeMatrix := Unassigned;

      cdsUnidadeLotacao.SaveToFile;
      cdsSubUnidOrcamentaria.SaveToFile;
      cdsCargo.SaveToFile;
      cdsServidor.SaveToFile;

      OK := (not cdsUnidadeLotacao.IsEmpty);
    except
      On E : Exception do
      begin
        OK := False;
        Mensagem('Erro ao tentar carregar arquivo!' + #13#13 + E.Message, 'Erro', MB_ICONERROR);
      end;
    end;
  finally
    Screen.Cursor := crDefault;

    // Fecha o Microsoft Excel
    if not VarIsEmpty(XLSAplicacao) then
    begin
      XLSAplicacao.Quit;
      XLSAplicacao := Unassigned;
      AbaXLS       := Unassigned;
    end;

    if OK then
      Mensagem('Importação da planilha finalizada com sucesso.', 'Informação', MB_ICONINFORMATION);
  end;
end;

function TdmDados.StrTipoPlanilha(aTipoPlanilha: TTipoPlanilha): String;
var
  aRetorno : String;
begin
  case aTipoPlanilha of
    tpAdministrativo : aRetorno := 'Administrativo';
    tpEducacao       : aRetorno := 'Educação';
  end;
  Result := aRetorno;
end;



end.
