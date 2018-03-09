unit gsLib;

interface

Uses
 SysUtils, WinTypes, WinProcs, Classes, Messages, Controls, DateUtils,
 Forms, Dialogs, stdCtrls, DBClient, cxGridTableView, StrUtils,
 Graphics, Db, SqlExpr, JPEG, Mask, DbCtrls, ExtCtrls,
 ShellApi, IniFiles;

Function PreencheZeros(sTexto: String; iTam: Integer): String;
Function IncNumToStr(sNum: String): String;
function ValidData(sData: String): Boolean;
Function Empty(sText: String): Boolean;
Function RTrim(sString: String): String;
Function LTrim(sString: String): String;
Function CharEspeciais(sString: String): Boolean;
Procedure Mensagem(sTexto: String; sCaption: String; iFlags: Integer);
Function Confirma(sTexto: String): Boolean;
Function IncMesAno(sMesAno: String): String;
Function DecMesAno(sMesAno,sMMAAAA: String): String;
Function IncDecAno(sAno,sOpcao: String): String;
Function EmptyData(sData: String): Boolean;
Function NomeMes(bMes: Byte): String;
Function UltimoDiaMes(sMesAno: String): TDate;
Function Arredonda(xValor: Extended; bQtDecimais: Byte): Extended;
Function FormatString(sMask, sString: String): String;
Function PeriodoValido(sData1, sData2: String; sDefault: String): Boolean;
Function Replicate(cChar: Char; iNumVezes: Integer): String;
Function Decimal(crValor: Currency): Integer;
Function Inteiro(crValor: Currency): Integer;
Function ValData(sData: String): String;
Function ValidCPF(sCPF: String; bMsgErro: Boolean): Boolean;
Function Criptografa(sTexto: AnsiString; sOper: String; iTamTexto: Integer): WideString;
Function Criptografa2(sTexto: AnsiString; iAddOrd: Integer; sOper: String): WideString;
Function Descriptografa(sTexto: AnsiString): WideString;
Function ExtraiPonto(sTexto: String): String;
Function DelphiCarregado: Boolean;
Function JanelaExiste(Classe, Janela: String): Boolean;
Function AnoStr(sData: String): String;
Function MesStr(sData: String): String;
Function DiaMesStr(sData: String): String;
Function PutSpacesRight(sTexto: String; wLenText: Word): String;
Function PutCharRight(sTexto,sChar: String; wLenText: Word): String;
Function Iif(bExpressao: Boolean; sRet1, sRet2: String): String;
Function VerTeclasNoGrid(wKey: Word; tTable: TClientDataSet): Word;
// Procedure ColorGrid(Sender: TObject; Field: TField; AFont: TFont; Background: TColor; Highlight: Boolean);
Function CalcDigVerificador(sNumero: String): String;
Function CentralizaForm_Horizontal(iLargura: Integer): Integer;
Function CentralizaForm_Vertical(iAltura: Integer): Integer;
Function ValidaUF(sTexto: String): Boolean;
Function TiraAcentos(Texto: string): string;
Function QuantDiasUteis(dataini, datafin: string): Integer;
Function ValidaCGC(sNumero: String; bMsgErro: Boolean): Boolean;
Function DataExtenso(sData: String): String;
Function Maiusculas(sTexto: String): String;
Function Minusculas(sTexto: String): String;
Function Validapis(sNum: String; lMsg: Boolean): Boolean;
Function ValidMesAno(sMesAno: String): Boolean;
Function ExtraiAnoMesData(sData: String): String;
Function ValidMatricula(sMatric: String; lDispMsg: Boolean): Boolean;
Function VerDataAdmissao(sDtAdmissao, sDtReadmissao: String): String;
Function PutSpacesLeft(sTexto: String; wLenText: Word): String;
Function CalcDigProprietario(sNum: String): String;
Function CalcDigUnidConsumidora(sNum: String): String;
Function LeftSpace(sTexto: String; wLen: Word): String;
Function AnoMesAnterior(sAnoMes: String): String;
Function DescrSituacao(sSituac: String): String;
Function InverteAnoMes(sData, sOpcao: String): String;
Function AnoAtual: String;
Function DescrCategoria(sCodigo: String): String;
function kLoadJPEG(const psFileIN: PChar): TPicture;
procedure SetMaskCPF_CGC(oMaskEdit1: TMaskEdit; sTipo: String);
Function FormatCPF_CNPJ(sCPF_CNPJ: String; sTipo: String): String;
Function DataAdmissao(sDtAdmissao,sDtReadmisaao: String): String;
Function CalcIdade(dDataHoje, dDataNasc: TDate): String;
Function CalcTempoContrato(dDtFim, dDtIni: TDate): String;
Function ValidaPeriodo(sIni,sFim,sOrdem: string): Boolean;
Function ValidaPeriodo2(sIni,sFim,sOrdem: string): Boolean;
Function ExtraiBarrasDate(dData: TDate): String;
Function BarrasDateParaPonto(dData: TDate): String;
Function AjustaZeros(crValor: Currency;wTam: Word): String;
Function DescrMesParcela(sAnoMes,sParcela: String): String;
Function ExtraiUnidGestoraNaoPermitida(sUnidsGestoras: String): String;
Function AjustaTextoParamVarios(sTexto: String): String;
Function GetPathRel: WideString;
Function GetPathDataBase: WideString;
Function GetPathAtualizaVer: WideString;
Function GetUltAnoMes: String;
Function GetUltmaVersao(sExe: string): string;
Function CurrToStrZeros(crValor: Currency; iLen: Integer): String;
Function CurrToStrZeros2(crValor: Currency; iLen: Integer): String;
Function LZerosValor(crValor: Currency; wTam: Word): String;
function Versao_Executavel(sArquivo: String): String;
Function CalcDigito(sCodigo: String): String;
function FormatId(Id_: String; Factor: Integer=0): String;
Function DescrParcela(sParcela,sComplementar: string): string;
procedure Atualiza_Executavel(sExe: string);
function CategTrabalhador(sIdSituacTCM,sEfetivo: string): string;
Function DtPerAquisitivo(sOpcao, sAno: String;
   dDtAdm: TDate): TDate;
function ExecAndWait(const FileName, Params: string;
  const WindowState: Word): boolean;
function ini_le_secao(sNomeSecao: string): string;
function AlteraIni(sl1: TStringList; sSecao, sTextoNovo: String): Boolean;
Function MarcaRegInicial(oCds: TClientDataSet; sIds: string): Integer;
Function ConvertTempoEmAnosMesesDias(iTempo: Integer): String;
Function PeriodoImplantacao: Boolean;
function CriptLiberaPrazoLicenca(sQuadrimLiberado,sAnoMesTrava: string): string;
Function AltSeparadorData(sData,sNovoSeparador: string): String;
Function FormataDataSaveDirect(dData: TDate): String;
Function QtdMeses(sAnoMesIni,sAnoMesFim: String): String;
Function ConvertCurrSaveDirect(crVal: Currency): String;
Function ConvertStringSaveDirect(sText: string): String;
Function ConvertIntegerSaveDirect(iVal: Integer): String;

implementation

uses
  //udmPrincipal, UtilsDb,
  VarGlobais, Variants, Windows;

Function PreencheZeros(sTexto: String; iTam: Integer): String;
Begin
 While Length(sTexto) < iTam do
  sTexto := '0' + sTexto;
 Result := sTexto;
End;

Function IncNumToStr(sNum: String): String;
Var
 iCodeErro: Integer;
 iNum: Integer;
Begin
 If sNum = '' Then
  sNum := '0';
 Val(sNum, iNum, iCodeErro);
 Inc(iNum);
 Result := IntToStr(iNum);
End;

function ValidData(sData: String): Boolean;
Begin
 Result := True;
 If EmptyData(sData) Then
  Exit;
 Try
  StrToDate(sData);
 Except
  On E: EConvertError do
  Begin
   Mensagem('Data inv·lida !', 'Erro !', MB_ICONEXCLAMATION + MB_OK);
   Result := False;
  End;
 End;
 If Length(RTrim(sData)) < 10 Then
 Begin
  Mensagem('O Ano dever ter 4 dÌgitos !', 'Erro !', MB_ICONEXCLAMATION + MB_OK);
  Result := False;
 End;
End;

Function Empty(sText: String): Boolean;
Var
 bIndex: Byte;
Begin
 bIndex := 1;
 Result := True;
 If sText = Null Then Exit;
 While (bIndex <= Length(sText)) And (bIndex > 0) do
 Begin
  If (sText[bIndex] = ' ') Or (sText[bIndex] = '') Then
   Inc(bIndex)
  Else
  Begin
   Result := False;
   bIndex := 0;
  End;
 End;
End;

Function RTrim(sString: String): String;
Var
 iConta: Integer;
 lSpace: Boolean;
Begin
 lSpace := True;
 iConta := Length(sString);
 While (lSpace) And (iConta > 0) do
  If sString[iConta] = ' ' Then
  Begin
   Dec(iConta);
   sString := Copy(sString, 1, iConta);
  End
  Else
   lSpace := False;
 Result := sString;
End;

Function LTrim(sString: String): String;
Var
 iConta, iLenString: Integer;
 lSpace: Boolean;
Begin
 lSpace := True;
 iLenString := Length(sString);
 iConta := 1;
 While (lSpace) And (iConta <= iLenString) do
  If (sString[iConta] = ' ') Then
   Inc(iConta)
  Else
   lSpace := False;
 Result := Copy(sString, iConta, (iLenString - iConta) + 1);
End;

Function CharEspeciais(sString: String): Boolean;
Var
 bInd: Byte;
 cLetra: Char;
Begin
 bInd := 1;
 Result := False;
 While (bInd <= Length(sString)) And (bInd > 0) do
 Begin
  cLetra := sString[bInd];
  If cLetra in ['¡', '¬', '√', '¿', '«', '…', ' ', '”', '’', '‘', 'Õ', '⁄',
    '‹', '·', '‚', '„', '‡', 'Á', 'È', 'Í', 'Û', 'ı', 'Ù', 'Ì', '˙', '¸'] Then
  Begin
   Result := True;
   bInd := 0;
  End
  Else
   Inc(bInd);
 End;
End;

Procedure Mensagem(sTexto: String; sCaption: String; iFlags: Integer);
Begin
 Application.MessageBox(PChar(sTexto), PChar(sCaption), iFlags);
End;

Function Confirma(sTexto: String): Boolean;
Var
 iButton: Integer;
Begin
 iButton := Application.MessageBox(PChar(sTexto), 'Confirma !',
  MB_ICONQUESTION + MB_YESNO);
 If iButton = IDYES Then
  Result := True
 Else
  Result := False;
End;

Function IncMesAno(sMesAno: String): String;
Var
 iMes, iAno: Integer;
Begin
 iMes := StrToInt(LeftStr(sMesAno, 2));
 iAno := StrToInt(RightStr(sMesAno, 4));
 If iMes = 12 Then
 Begin
  iMes := 1;
  Inc(iAno);
 End
 Else
  Inc(iMes);
 Result := PreencheZeros(IntToStr(iMes), 2) + IntToStr(iAno);
End;

Function DecMesAno(sMesAno,sMMAAAA: String): String;
Var
 iMes, iAno: Integer;
Begin
 if sMMAAAA = '1' then
 begin
    iMes := StrToInt(LeftStr(sMesAno, 2));
    iAno := StrToInt(RightStr(sMesAno, 4));
 end else
 begin
    iMes := StrToInt(RightStr(sMesAno,2));
    iAno := StrToInt(LeftStr(sMesAno,4));
 end;
 If iMes = 1 Then
 Begin
  iMes := 13;
  Dec(iAno);
 End
 Else
  Dec(iMes);
 if sMMAAAA  = '1' then
    Result := PreencheZeros(IntToStr(iMes), 2) + IntToStr(iAno)
 else
    Result := IntToStr(iAno) + PreencheZeros(IntToStr(iMes), 2);
End;

Function IncDecAno(sAno,sOpcao: String): String;
Var
 iAno: Integer;
Begin
  if sOpcao = '1' then
  begin
     iAno := StrToInt(sAno)+1;
  end else
  begin
     iAno := StrToInt(sAno)-1;
 end;
 Result := PreencheZeros(IntToStr(iAno),4);
End;


Function EmptyData(sData: String): Boolean;
Begin
 Result := True;
 If sData = Null Then
  Exit;
 Result := (sData = '') Or (sData = '  /  /    ') Or (sData = '  /  /  ');
End;

Function NomeMes(bMes: Byte): String;
Var
   slMeses : TStringList;
   sTemp   : string[1];
   oQry1   : TSQLQuery;
   sTextSQL: string;
Begin
   slMeses := TStringList.Create;
   slMeses.Add('Janeiro');
   slMeses.Add('Fevereiro');
   slMeses.Add('MarÁo');
   slMeses.Add('Abril');
   slMeses.Add('Maio');
   slMeses.Add('Junho');
   slMeses.Add('Julho');
   slMeses.Add('Agosto');
   slMeses.Add('Setembro');
   slMeses.Add('Outubro');
   slMeses.Add('Novembro');
   slMeses.Add('Dezembro');
   slMeses.Add('Dec.Terc. 1™ parc');
   slMeses.Add('Dec.Terc. parc final');
//   if bMes = 15 then // em caso de abono - colocar o tÌtulo correto de acorodo com o tipo: fundeb ou natal
//   begin
//      sTextSQL := 'select tipo_abono from config_abono_fundeb where (ref_ano = '+
//         QuotedStr(LeftStr(glb_sAnoMesTrab,4))+') and (parcela='+QuotedStr('0')+')';
//      oQry1 := TSQLQuery.Create(Nil);
//      oQry1.SQLConnection := dmPrincipal.SConPrincipal;
//      oQry1.SQL.Add(sTextSQL);
//      try
//         oQry1.Open;
//         if oQry1.Fields[0].IsNull then
//            slMeses.Add('Abono FUNDEB/OUTRO')
//         else if oQry1.Fields[0].Value = '2' then
//            slMeses.Add('Abono de NATAL')
//         else
//            slMeses.Add('Abono do FUNDEB');
//         oQry1.Close;
//      finally
//         FreeAndNil(oQry1);
//      end;
//   end else
//      slMeses.Add('Abono FUNDEB/OUTRO');
   slMeses.Add('Abono PASEP');
   slMeses.Add('SimulaÁ„o');

   Result := slMeses[bMes-1];

End;

Function UltimoDiaMes(sMesAno: String): TDate;
Var
 wAno, wMes, wDia: Word;
 sMes, sMes2: String[2];
 sAno: String[4];
 dDataTemp: TDate;
 sUltDia: String[2];
Begin
 sMes := LeftStr(sMesAno,2);
 if sMes > '12' then
    sMes := '12';
 sMes2 := sMes;
 sAno := RightStr(sMesAno,4);
 dDataTemp := StrToDate('28/' + sMes + '/' + sAno);
 While sMes2 = sMes do
 Begin
  dDataTemp := dDataTemp + 1;
  DecodeDate(dDataTemp, wAno, wMes, wDia);
  sMes2 := Copy(IntToStr(wMes + 100), 2, 2);
 End;
 sUltDia := Copy(DateToStr(dDataTemp - 1), 1, 2);
 Result := dDataTemp - 1;
End;

Function CalcTempoServico(dDtAdm, dDtBase: TDate): String;
Var
 wAnoBase, wAnoAdm, wMesBase, wMesAdm, wDiaBase, wDiaAdm: Word;
 wQtAnos, wQtMeses, wQtDias: Word;
Begin
 DecodeDate(dDtAdm, wAnoAdm, wMesAdm, wDiaAdm);
 DecodeDate(dDtBase, wAnoBase, wMesBase, wDiaBase);
 wQtAnos := wAnoBase - wAnoAdm;
 If wMesBase < wMesAdm Then
 Begin
  Dec(wQtAnos);
  wQtMeses := 12 - (wMesAdm - wMesBase);
  If wDiaBase < wDiaAdm Then
  Begin
   Dec(wQtMeses);
   wQtDias := (30 - wDiaAdm) + wDiaBase;
  End
  Else
   wQtDias := wDiaBase - wDiaAdm;
 End
 Else If wMesBase > wMesAdm Then
 Begin
  wQtMeses := wMesBase - wMesAdm;
  If wDiaBase < wDiaAdm Then
  Begin
   Dec(wQtMeses);
   wQtDias := (30 - wDiaAdm) + wDiaBase;
  End
  Else
   wQtDias := wDiaBase - wDiaAdm;
 End
 Else
 Begin
  If wDiaBase < wDiaAdm Then
  Begin
   Dec(wQtAnos);
   wQtMeses := 11;
   wQtDias := (30 - wDiaAdm) + wDiaBase;
  End
  Else
  Begin
   wQtMeses := 0;
   wQtDias := wDiaBase - wDiaAdm;
  End;
 End;
 Result := PreencheZeros(IntToStr(wQtAnos), 2) + PreencheZeros
   (IntToStr(wQtMeses), 2) + PreencheZeros(IntToStr(wQtDias), 2);
End;

Function VerNivel(sTempoServ, sQuantRef: String): String;
Begin
 Result := '00';
 If (sQuantRef = '12') Or (sQuantRef = '3') Then
 Begin
  If StrToInt(sTempoServ) <= 120000 Then
   Result := '01'
  Else If StrToInt(sTempoServ) <= 240000 Then
   Result := '02'
  Else
   Result := '03';
 End;
End;

Function VerReferencia(sTempoServ, sCodRef: String): String;
{ Var
  oTbProgSal: TTable;
  iTSTemp   : Integer;
  iTSTemp2  : Integer;
  wConta    : Word;
  iQuantRef : Integer; }
Begin
 { Result := '';
   oTbProgSal := TTable.Create(Nil);
   oTbProgSal.DataBaseName:= 'Folha_de_Pagamento';
   oTbProgSal.TableName   := 'TabProgSalarial';
   oTbProgSal.Open;
   oTbProgSal.FindKey([sCodRef]);
   iQuantRef := oTbProgSal.FieldByName('Quantidade').AsInteger;
   iTSTemp := 0;
   iTSTemp2:= oTbProgSal.FieldByName('Tempo').AsInteger;
   For wConta := 1 To iQuantRef Do
   Begin
   If (LeftStr(sTempoServ,2) >= Copy(IntToStr(iTSTemp+100),2,2)) And
   (LeftStr(sTempoServ,2) < Copy(IntToStr(iTSTemp2+100),2,2)) Then
   Begin
   Result := Copy(IntToStr(wConta+100),2,2);
   Break;
   End Else
   Begin
   iTSTemp := iTSTemp + oTbProgSal.FieldByName('Tempo').AsInteger;
   iTSTemp2:= iTSTemp2 + oTbProgSal.FieldByName('Tempo').AsInteger;
   End;
   End;
   oTbProgSal.Close;
   oTbProgSal.Free;
   If Result = '' Then Result := '01'; }
End;

Function Arredonda(xValor: Extended; bQtDecimais: Byte): Extended;
Var
 sValor: String;
Begin
 Result := 0;
 If xValor = 0 Then
  Exit;
 sValor := FormatFloat('###########0.00', xValor);
 // sValor := LeftStr(sValor,Pos(',',sValor)-1)+'.'+
 // Copy(sValor,Pos(',',sValor)+1,2);
 Result := StrToCurr(sValor);
 { Str(xValor:14:bQtDecimais,sValor);
   Result := StrToCurr(sValor); }
End;

Function FormatString(sMask, sString: String): String;
Var
  i, i2: Integer;
Begin
  Result := '';
  If Empty(sString) Then Exit;

  if Length(ExtraiPonto(sMask)) > Length(sString) then
     sString := PreencheZeros(sString,Length(ExtraiPonto(sMask)));
  i := 1;
  i2 := i;
  While i <= Length(sMask) Do
  Begin
     If sMask[i] in ['.', ',', '-', '/', ':', ';'] Then
       Result := Result + sMask[i]
     Else
     Begin
       Result := Result + sString[i2];
       Inc(i2);
     End;
     Inc(i);
  End;
End;

Function PeriodoValido(sData1, sData2: String; sDefault: String): Boolean;
Begin
 Result := True;
 If sDefault = '1' Then
  Result := ValidData(sData1)
 Else
  Result := ValidData(sData2);
 If (Not Result) Or (EmptyData(sData1) Or (EmptyData(sData2))) Then
  Exit;
 Result := (StrToDate(sData1) <= StrToDate(sData2));
End;

Function Replicate(cChar: Char; iNumVezes: Integer): String;
Var
 iConta: Integer;
Begin
 Result := '';
 For iConta := 1 To iNumVezes Do
  Result := Result + cChar;
End;

Function Decimal(crValor: Currency): Integer;
Var
 bPosPonto: Byte;
Begin
 bPosPonto := Pos(',', CurrToStr(crValor));
 If bPosPonto > 0 Then
  Result := StrToInt(Copy(CurrToStr(crValor), bPosPonto + 1, 10))
 Else
  Result := 0;
End;

Function Inteiro(crValor: Currency): Integer;
Var
 bPosPonto: Byte;
Begin
 bPosPonto := Pos(',', CurrToStr(crValor));
 If bPosPonto > 0 Then
  Result := StrToInt(Copy(CurrToStr(crValor), 1, bPosPonto - 1))
 Else
  Result := StrToInt(CurrToStr(crValor));
End;

Function ValidMesAno(sMesAno: String): Boolean;
Var
   sMes : string[2];
   sAno : string[4];
Begin
   Result := True;
   sMes := LeftStr(sMesAno,2);
   sAno := RightStr(sMesAno,4);
   If (Trim(sMes+sAno)='') then exit;
   if (Pos(sMes,'01_02_03_04_05_06_07_08_09_10_11_12_13_14_15_16')>0) and
      (sAno > '1900') Then Exit;
   Mensagem('MÍs/Ano inv·lido, digite novamente !','E r r o !!!',
      MB_OK+MB_ICONERROR);
   Result := False;
End;

Function ValData(sData: String): String;
Begin
  Result := '';
  If (Not EmptyData(sData)) and
     (StrToDate(sData) > StrToDate('01/01/1900')) Then
     Result := sData;
End;

Function ValidCPF(sCPF: String; bMsgErro: Boolean): Boolean;
Var
 iN1, iN2, iN3, iN4, iN5, iN6, iN7, iN8, iN9: Integer;
 iD1, iD2: Integer;
 sDigitado, sCalculado: String;
Begin
 if (sCPF = '11111111111') or (sCPF = '00000000000') then
 begin
    Result := False;
    if bMsgErro then
       Mensagem('C. P. F.  I n v · l i d o !', 'E r r o !!!',
        MB_ICONEXCLAMATION + MB_OK);
    exit;
 end;

 Result := True;
 sCPF := ExtraiPonto(sCPF);
 if Empty(sCPF) then exit;
 Result := False;
 If Length(Trim(sCPF)) < 11 Then Exit;
 iN1 := StrToInt(sCPF[1]);
 iN2 := StrToInt(sCPF[2]);
 iN3 := StrToInt(sCPF[3]);
 iN4 := StrToInt(sCPF[4]);
 iN5 := StrToInt(sCPF[5]);
 iN6 := StrToInt(sCPF[6]);
 iN7 := StrToInt(sCPF[7]);
 iN8 := StrToInt(sCPF[8]);
 iN9 := StrToInt(sCPF[9]);
 iD1 := (iN9 * 2) + (iN8 * 3) + (iN7 * 4) + (iN6 * 5) + (iN5 * 6) + (iN4 * 7) +
   (iN3 * 8) + (iN2 * 9) + (iN1 * 10);
 iD1 := 11 - (iD1 Mod 11);
 If iD1 >= 10 Then
  iD1 := 0;
 iD2 := (iD1 * 2) + (iN9 * 3) + (iN8 * 4) + (iN7 * 5) + (iN6 * 6) + (iN5 * 7) +
   (iN4 * 8) + (iN3 * 9) + (iN2 * 10) + (iN1 * 11);
 iD2 := 11 - (iD2 Mod 11);
 If iD2 >= 10 Then
  iD2 := 0;
 sCalculado := IntToStr(iD1) + IntToStr(iD2);
 sDigitado := RightStr(sCPF, 2);
 Result := (sCalculado = sDigitado);
 If (Not Result) And (bMsgErro) Then
  Mensagem('C. P. F.  I n v · l i d o !', 'E r r o !!!',
   MB_ICONEXCLAMATION + MB_OK);
End;

Function Criptografa(sTexto: AnsiString; sOper: String; iTamTexto: Integer): WideString;
Var
  sNewTexto: String;
  iConta,
  xTemp    : Extended;
  iTamPart : Integer;
  iTamUltPart,
  iTamTemp : Integer;
  sPartTexto1,
  sPartTexto2,
  sPartTexto3,
  sPartTexto4,
  sPartTexto5: String;
Begin

  sPartTexto1 := '';
  sPartTexto2 := '';
  sPartTexto3 := '';
  sPartTexto4 := '';
  sPartTexto5 := '';
  if iTamTexto < 15 then
  begin
     xTemp      := iTamTexto / 2;
     iTamPart     := Inteiro(xTemp) + 1;
     iTamUltPart:= iTamTexto - iTamPart;
     iTamTemp   := Length(sTexto);
     if sOper = '1' then
     begin
        if iTamTemp < (iTamPart+iTamUltPart) then
           sTexto := sTexto + Replicate(' ',(iTamPart+iTamUltPart)-iTamTemp);
        sPartTexto1:= Copy(sTexto,1,iTamPart);
        sPartTexto2:= Copy(sTexto,iTamPart+1,iTamUltPart);
        sNewTexto  := Criptografa2(sPartTexto2,129,sOper)+
                      Criptografa2(sPartTexto1,131,sOper);
     end else
     begin
        sPartTexto1:= Copy(sTexto,iTamUltPart+1,iTamPart);
        sPartTexto2:= Copy(sTexto,1,iTamUltPart);
        sNewTexto  := Criptografa2(sPartTexto1,131,sOper)+
                      Criptografa2(sPartTexto2,129,sOper);
     end;
  end else
  if iTamTexto < 45 then
  begin
     xTemp      := iTamTexto / 3;
     iTamPart   := Inteiro(xTemp) + 1;
     iTamUltPart:= iTamTexto - (iTamPart*2);
     iTamTemp   := Length(sTexto);
     if sOper = '1' then
     begin
        if iTamTemp < ((iTamPart*2)+iTamUltPart) then
           sTexto := sTexto + Replicate(' ',((iTamPart*2)+iTamUltPart)-iTamTemp);
        sPartTexto1 := Copy(sTexto,1,iTamPart);
        sPartTexto2 := Copy(sTexto,iTamPart+1,iTamPart);
        sPartTexto3 := RightStr(sTexto,iTamUltPart);
        sNewTexto   := Criptografa2(sPartTexto2,129,sOper)+
                       Criptografa2(sPartTexto3,136,sOper)+
                       Criptografa2(sPartTexto1,131,sOper);
     end else
     begin
        sPartTexto1 := RightStr(sTexto,iTamPart);
        sPartTexto2 := LeftStr(sTexto,iTamPart);
        sPartTexto3 := Copy(sTexto,iTamPart+1,iTamUltPart);
        sNewTexto   := Criptografa2(sPartTexto1,131,sOper)+
                       Criptografa2(sPartTexto2,129,sOper)+
                       Criptografa2(sPartTexto3,136,sOper);
     end;
  end  else
  if iTamTexto < 135 then
  begin
     xTemp      := iTamTexto / 4;
     iTamPart   := Inteiro(xTemp) + 1;
     iTamUltPart:= iTamTexto - (iTamPart*3);
     iTamTemp   := Length(sTexto);
     if sOper = '1' then
     begin
        if iTamTemp < ((iTamPart*3)+iTamUltPart) then
           sTexto := sTexto + Replicate(' ',((iTamPart*3)+iTamUltPart)-iTamTemp);
        sPartTexto1 := Copy(sTexto,1,iTamPart);
        sPartTexto2 := Copy(sTexto,iTamPart+1,iTamPart);
        sPartTexto3 := Copy(sTexto,(iTamPart*2)+1,iTamPart);
        sPartTexto4 := RightStr(sTexto,iTamUltPart);
        sNewTexto   := Criptografa2(sPartTexto4,129,sOper)+
                       Criptografa2(sPartTexto1,136,sOper)+
                       Criptografa2(sPartTexto3,134,sOper)+
                       Criptografa2(sPartTexto2,131,sOper);
     end else
     begin
        sPartTexto1 := Copy(sTexto,iTamUltPart+1,iTamPart);
        sPartTexto2 := Copy(sTexto,iTamUltPart+iTamPart+iTamPart+1,iTamPart);
        sPartTexto3 := Copy(sTexto,iTamUltPart+iTamPart+1,iTamPart);;
        sPartTexto4 := LeftStr(sTexto,iTamUltPart);
        sNewTexto   := Criptografa2(sPartTexto1,136,sOper)+
                       Criptografa2(sPartTexto2,131,sOper)+
                       Criptografa2(sPartTexto3,134,sOper)+
                       Criptografa2(sPartTexto4,129,sOper);
     end;
  end else
  begin
     xTemp      := iTamTexto / 5;
     iTamPart   := Inteiro(xTemp) + 1;
     iTamUltPart:= iTamTexto - (iTamPart*4);
     iTamTemp   := Length(sTexto);
     if sOper = '1' then
     begin
        if iTamTemp < ((iTamPart*4)+iTamUltPart) then
           sTexto := sTexto + Replicate(' ',((iTamPart*4)+iTamUltPart)-iTamTemp);
        sPartTexto1 := Copy(sTexto,1,iTamPart);
        sPartTexto2 := Copy(sTexto,iTamPart+1,iTamPart);
        sPartTexto3 := Copy(sTexto,(iTamPart*2)+1,iTamPart);
        sPartTexto4 := Copy(sTexto,(iTamPart*3)+1,iTamPart);
        sPartTexto5 := RightStr(sTexto,iTamUltPart);
        sNewTexto   := Criptografa2(sPartTexto4,129,sOper)+
                       Criptografa2(sPartTexto1,135,sOper)+
                       Criptografa2(sPartTexto2,134,sOper)+
                       Criptografa2(sPartTexto5,136,sOper)+
                       Criptografa2(sPartTexto3,131,sOper);
     end else
     begin
        sPartTexto1 := Copy(sTexto,iTamPart+1,iTamPart);
        sPartTexto2 := Copy(sTexto,(iTamPart*2)+1,iTamPart);
        sPartTexto3 := RightStr(sTexto,iTamPart);
        sPartTexto4 := LeftStr(sTexto,iTamPart);
        sPartTexto5 := Copy(sTexto,(iTamPart*3)+1,iTamUltPart);
        sNewTexto   := Criptografa2(sPartTexto1,135,sOper)+
                       Criptografa2(sPartTexto2,134,sOper)+
                       Criptografa2(sPartTexto3,131,sOper)+
                       Criptografa2(sPartTexto4,129,sOper)+
                       Criptografa2(sPartTexto5,136,sOper);
     end;
  end;

  Result := sNewTexto;

End;

Function Criptografa2(sTexto: AnsiString; iAddOrd: Integer; sOper: String): WideString;
Var
  iConta   : Integer;
  sChar    : AnsiChar;
  sNewChar : Char;
  iOrd     : Byte;
  sNewTexto: String;
begin
  sNewTexto := '';
  for iConta := 1 to Length(sTexto) do
  begin
    sChar    := sTexto[iConta];
    if sOper = '1' then
    begin
       //if sChar = ' ' then
       //   iOrd := 244
       //else
          iOrd := Ord(sChar) + (iAddOrd);
    end else
    begin
       //if sChar = '∂' then
       //   iOrd := 244
       //else
          iOrd := Ord(sChar) - (iAddOrd);
    end;
    sNewChar := Chr(iOrd);
    sNewTexto:= sNewTexto + sNewChar;
    //sNewTexto:= sNewTexto + sChar;
  end;
  Result := sNewTexto;
end;

Function Descriptografa(sTexto: AnsiString): WideString;
Var
  sNewTexto: String;
  iConta,
  iPos,
  iUltId   : Integer;
  iOrd     : Byte;
  sTexto2  : String;
  sChar    : AnsiChar;
  sNewChar : Char;
  sl1: TStringList;
Begin
  sl1      := TStringList.Create;
  sl1.Add('0');
  sTexto2  := '';
  sNewTexto:= '';
  for iConta := 1 to Length(sTexto) do
  begin
    sChar := sTexto[iConta];
    if Pos(sChar,sTexto2) = 0 then
    begin
      sTexto2 := sTexto2 + sChar;
      sl1.Add('1');
    end;
  end;

  for iConta := 1 to Length(sTexto) do
  begin
    sChar    := sTexto[iConta];
    iPos     := Pos(sChar,sTexto2);
    iUltId   := StrToInt(sl1[iPos]);
    iOrd     := Ord(sChar) - (128+IUltId);
    sNewChar := Chr(iOrd);
    sNewTexto:= sNewTexto + sNewChar;
    sl1[iPos]:= IntToStr(iUltId+1);
  end;

  Result := sNewTexto;

End;

Function ExtraiPonto(sTexto: String): String;
Var
   wConta, wLenTexto: Word;
Begin
   Result := '';
   wConta := 1;
   wLenTexto := Length(sTexto);
   While wConta <= wLenTexto Do
   Begin
      If Pos(sTexto[wConta],' 0123456789ABCDEDFGHIJKLMNOPQRSTUVXYWZ') > 0 Then
         Result := Result + sTexto[wConta];
      Inc(wConta);
   End;
End;

Function DelphiCarregado: Boolean;
begin
  Result := (JanelaExiste('TPropertyInspector', 'Object Inspector'));
end;

Function JanelaExiste(Classe, Janela: String): Boolean;
var
 PClasse, PJanela: Array [0 .. 79] Of Char;
begin
 If Classe = '' Then
  PClasse[0] := #0
 Else
  StrPCopy(PClasse, Classe);
 If Janela = '' Then
  PJanela[0] := #0
 Else
  StrPCopy(PJanela, Janela);
 Result := (FindWindow(PClasse, PJanela) <> 0);
end;

Function AnoStr(sData: String): String;
Begin
 If Length(sData) = 10 Then
  Result := RightStr(sData, 4)
 Else
  Result := LeftStr(sData, 4);
End;

Function MesStr(sData: String): String;
Begin
 If Length(sData) = 10 Then
  Result := Copy(sData, 4, 2)
 Else
  Result := RightStr(sData, 2);
End;

Function DiaMesStr(sData: String): String;
Begin
 Result := LeftStr(sData, 2);
End;

Function PutSpacesRight(sTexto: String; wLenText: Word): String;
Begin
 Result := '';
 While Length(sTexto) < wLenText Do
  sTexto := sTexto + ' ';
 Result := sTexto;
End;

Function PutCharRight(sTexto,sChar: String; wLenText: Word): String;
Begin
 Result := '';
 While Length(sTexto) < wLenText Do
  sTexto := sTexto + sChar;
 Result := sTexto;
End;

Function Iif(bExpressao: Boolean; sRet1, sRet2: String): String;
Begin
 If bExpressao = True Then
  Result := sRet1
 Else
  Result := sRet2;
End;
{
  Function ColoreGrid(oField: TField; oFont: TFont; oBackGround: TColor; bHighlight: Boolean): TFont;
  Begin
  If (oField.DataSet.RecNo mod 2 = 0) Then
  Background := $00D2DDE1;
  If HighLight then
  Begin
  AFont.Color := clBlack;
  If TRxDBGrid(Sender).Focused Then
  Background := $0068D9FF
  Else
  Background := $00ABE2FD;
  end;
  End; }

Function VerTeclasNoGrid(wKey: Word; tTable: TClientDataSet): Word;
Begin
 If wKey in [35, 36, 38, 40] Then
 Begin
  Case wKey of
   35:
    tTable.Last;
   36:
    tTable.First;
   38:
    tTable.Prior;
   40:
    tTable.Next;
  End;
  Result := 0;
 End
 Else
  Result := wKey;
End;

{ Procedure ColorGrid(Sender: TObject; Field: TField; AFont: TFont; Background: TColor; Highlight: Boolean);
  Begin
  If (Field.DataSet.RecNo mod 2 = 0) Then
  Background := $00D2DDE1;
  If HighLight then
  Begin
  AFont.Color := clBlack;
  If TRxDBGrid(Sender).Focused Then
  Background := $0077D9FF
  Else
  Background := $00ABE2FD;
  end;
  End; }

Function CalcDigVerificador(sNumero: String): String;
Var
 iTotNum: Integer;
 xDivisao: Extended;
 bPosPonto: Byte;
 iConta: Integer;
 iUltNum: Integer;
Begin

 Result := '';
 If Empty(sNumero) Then Exit;

 iUltNum := Length(sNumero) + 1;
 For iConta := 1 To Length(sNumero) Do
 Begin
  iTotNum := iTotNum + (StrToInt(sNumero[iConta]) * (iUltNum - 1));
  Dec(iUltNum);
 End;

 Result := IntToStr(iTotNum Mod 10);
 {
   xDivisao  := iTotNum / 10;
   bPosPonto := Pos('.',CurrToStr(xDivisao));
   If bPosPonto = 0 Then
   bPosPonto := Pos(',',CurrToStr(xDivisao));
   Result    := Copy(CurrToStr(xDivisao),bPosPonto+1,1);
 }
End;

Function CentralizaForm_Horizontal(iLargura: Integer): Integer;
Var
   x: Extended;
begin
   x := (glb_iWidth - iLargura) / 2;
   Result := Inteiro(x);
End;

Function CentralizaForm_Vertical(iAltura: Integer): Integer;
Var
   x: Extended;
begin
   x := 0;
   x := (glb_iHeight - iAltura) / 2;
   Result := Inteiro(x - 38);
   if Result < 0 then
      Result := Result + 15;
End;

Function ValidaUF(sTexto: String): Boolean;
Var
 sEstados: String;
Begin
 Result := True;
 If Empty(sTexto) Then
  Exit;
 sEstados := 'AC_AM_AP_PA_RO_RR_TO_DF_' + 'MA_PI_CE_PB_RN_PE_AL_SE_BA_' +
   'GO_MT_MS_' + 'RJ_ES_SP_MG_' + 'PR_SC_RS';
 Result := (Pos(sTexto, sEstados) > 0);
End;

Function TiraAcentos(Texto: string): string;
var
  iConta, iPosicao: Integer;
  sAcentos, sTiraAcentos: string;
  sChar, sChar2: string[1];
begin

 // texto   = 'PREFEITURA MUNICIPAL DE S√O SEBASTI√O DA BOA VISTA '
 //            123456789012345678901234567890123456789012345678901
 // conta   = 51
 // Char    = ' '
 // Posicao = 51
 // Char2   = ' '
 // result  = 'PR

 sAcentos     := '™∫Á«·‰‡„‚¡ƒ¿√¬ÈÎËÍ…À» ÌÔÏÓÕœÃŒÛˆÚıÙ”÷“’‘˙¸˘˚⁄‹Ÿ€ ';
 sTiraAcentos := 'aocCaaaaaAAAAAeeeeEEEEiiiiIIIIoooooOOOOOuuuuUUUU ';
 Result := '';
 For iConta := 1 to Length(Texto) do
 begin
    sChar  := Copy(Texto, iConta, 1);
    iPosicao := Pos(sChar,sAcentos);
    If (iPosicao = 0) or (sChar = ' ') then
       Result := Result + sChar
    else
    begin
       sChar2 := Copy(sTiraAcentos, iPosicao, 1);
       Result := Result + sChar2;
    end;
 end;
end;

Function Maiusculas(sTexto: String): String;
var
 Contar, Posicao: Integer;
 sMinusculas, sMaiusculas: string;
Begin
 Result := '';
 sTexto := UpperCase(sTexto);
 sMinusculas := 'Á·‡„‚ÈËÍÌÛıÙ˙';
 sMaiusculas := '«¡¿√¬…» Õ”’‘⁄';
 For Contar := 1 to Length(sTexto) do
 begin
  Posicao := Pos(Copy(sTexto, Contar, 1), sMinusculas);
  If Posicao = 0 then
   Result := Result + Copy(sTexto, Contar, 1)
  else
   Result := Result + Copy(sMaiusculas, Posicao, 1);
 end;
End;

Function Minusculas(sTexto: String): String;
var
 Contar, Posicao: Integer;
 sMinusculas, sMaiusculas: string;
Begin
 sTexto := LowerCase(sTexto);
 sMaiusculas := '«¡¿√¬…» Õ”’‘⁄';
 sMinusculas := 'Á·‡„‚ÈËÍÌÛıÙ˙';
 For Contar := 1 to Length(sTexto) do
 begin
  Posicao := Pos(Copy(sTexto, Contar, 1), sMaiusculas);
  If Posicao = 0 then
   Result := Result + Copy(sTexto, Contar, 1)
  else
   Result := Result + Copy(sMinusculas, Posicao, 1);
 end;
End;

Function QuantDiasUteis(dataini, datafin: string): Integer;
var
 a, b, c: tdatetime;
 ct, s: Integer;
begin
 Result := 0;
 if StrToDate(datafin) < StrToDate(dataini) then
  Exit;
 ct := 0;
 s := 1;
 a := StrToDate(datafin);
 b := StrToDate(dataini);
 if a > b then
 begin
  c := a;
  a := b;
  b := c;
  s := 1;
 end;
 a := a + 1;
 while (dayofweek(a) <> 2) and (a <= b) do
 begin
  if dayofweek(a) in [2 .. 5] then
  begin
   Inc(ct);
  end;
  a := a + 1;
 end;
 ct := ct + round((5 * int((b - a) / 7)));
 a := a + (7 * int((b - a) / 7));
 while a <= b do
 begin
  if dayofweek(a) in [2 .. 5] then
  begin
   Inc(ct);
  end;
  a := a + 1;
 end;
 if ct < 0 then
 begin
  ct := 0;
 end;
 Result := (s * ct) + 1;
end;

Function ValidaCGC(sNumero: String; bMsgErro: Boolean): Boolean;
Var
 iSoma, iConta, iDigito1, iDigito2: Integer;
Begin
 Result := True;
 If Empty(sNumero) then
  Exit;
 iSoma := 0;
 for iConta := 1 to 12 do
 begin
  if iConta < 5 then
   Inc(iSoma, StrToInt(Copy(sNumero, iConta, 1)) * (6 - iConta))
  else
   Inc(iSoma, StrToInt(Copy(sNumero, iConta, 1)) * (14 - iConta));
 end;
 iDigito1 := 11 - (iSoma mod 11);
 if iDigito1 > 9 then
  iDigito1 := 0;

 iSoma := 0;
 for iConta := 1 to 13 do
 begin
  if iConta < 6 then
   Inc(iSoma, StrToInt(Copy(sNumero, iConta, 1)) * (7 - iConta))
  else
   Inc(iSoma, StrToInt(Copy(sNumero, iConta, 1)) * (15 - iConta));
 end;
 iDigito2 := 11 - (iSoma mod 11);
 if iDigito2 > 9 then
  iDigito2 := 0;

 { Checa os dois dÌgitos }
 if (iDigito1 = StrToInt(Copy(sNumero, 13, 1))) and
   (iDigito2 = StrToInt(Copy(sNumero, 14, 1))) then
  Result := True
 else
  Result := False;
 If (Not Result) And (bMsgErro) Then
  Mensagem('C.N.P.J. I n v · l i d o !', 'E r r o !!!',
   MB_ICONEXCLAMATION + MB_OK);
End;

Function DataExtenso(sData: String): String;
Begin
 Result := '';
 If EmptyData(sData) Then
  Exit;
 Result := LeftStr(sData, 2) + ' de ' + Trim
   (NomeMes(StrToInt(Copy(sData, 4, 2)))) + ' de ' + RightStr(sData, 4);
End;

Function Validapis(sNum: String; lMsg: Boolean): Boolean;
{ Testa se o n˙mero do pis È v·lido ou n„o }
var
 i, wsoma, Wm11, Wdv, wdigito: Integer;
begin
 if Empty(sNum) then
 begin
    Result := True;
    Exit;
 end;
 Result := False;
 sNum := ExtraiPonto(sNum);
 If Length(Trim(sNum)) <> 11 Then
 Begin
   If lMsg = True Then
    Mensagem('N∫ de PIS/PASEP inv·lido (Quant. de dÌgitos È diferente de 11) !',
     'E r r o !!!', MB_ICONEXCLAMATION + MB_OK);
   Exit;
 End;
 Wdv := StrToInt(Copy(sNum, 11, 1));
 wsoma := 0;
 Wm11 := 2;
 for i := 1 to 10 do
 begin
  wsoma := wsoma + (Wm11 * StrToInt(Copy(sNum, 11 - i, 1)));
  if Wm11 < 9 then
  begin
   Wm11 := Wm11 + 1
  end
  else
  begin
   Wm11 := 2;
  end;
 end;
 wdigito := 11 - (wsoma MOD 11);
 if wdigito > 9 then
  wdigito := 0;
 If Wdv = wdigito then
  Result := True
 Else
  Result := False;
 If (Result = False) And (lMsg = True) Then
  Mensagem('N∫ de PIS/PASEP inv·lido !', 'E r r o !!!',
   MB_ICONEXCLAMATION + MB_OK);
end;

Function ExtraiAnoMesData(sData: String): String;
Begin
 Result := '';
 If EmptyData(sData) Then
  Exit;
 Result := RightStr(sData, 4) + Copy(sData, 4, 2);
End;

Function ValidMatricula(sMatric: String; lDispMsg: Boolean): Boolean;
Var
 sDigMatric: String[1];
Begin
 sDigMatric := CalcDigVerificador(LeftStr(sMatric, 5));
 Result := True;
 If sDigMatric <> RightStr(sMatric, 1) Then
 Begin
  Result := False;
  If lDispMsg Then
   Mensagem('O DÌgito Verificador dessa MatrÌcula n„o È V·lido !',
    'E r r o !!!', MB_ICONEXCLAMATION + MB_OK);
 End;
End;

Function VerDataAdmissao(sDtAdmissao, sDtReadmissao: String): String;
Begin
 If EmptyData(sDtReadmissao) Then
  Result := sDtAdmissao
 Else
  Result := sDtReadmissao;
End;

Function PutSpacesLeft(sTexto: String; wLenText: Word): String;
Begin
 Result := '';
 While Length(sTexto) < wLenText Do
  sTexto := ' ' + sTexto;
 Result := sTexto;
End;

Function CalcDigProprietario(sNum: String): String;
Var
 iTotNum: Integer;
 xDivisao: Extended;
 bPosPonto: Byte;
Begin
 iTotNum := (StrToInt(sNum[6]) * 3) + (StrToInt(sNum[5]) * 4) +
   (StrToInt(sNum[4]) * 5) + (StrToInt(sNum[3]) * 6) + (StrToInt(sNum[2]) * 7)
   + (StrToInt(sNum[1]) * 8);
 Result := IntToStr(iTotNum Mod 10);
End;

Function CalcDigUnidConsumidora(sNum: String): String;
Var
 iTotNum: Integer;
 xDivisao: Extended;
 bPosPonto: Byte;
Begin
 iTotNum := (StrToInt(sNum[7]) * 3) + (StrToInt(sNum[6]) * 4) +
   (StrToInt(sNum[5]) * 5) + (StrToInt(sNum[4]) * 6) + (StrToInt(sNum[3]) * 7)
   + (StrToInt(sNum[2]) * 8) + (StrToInt(sNum[1]) * 9);
 Result := IntToStr(iTotNum Mod 10);
End;

Function LeftSpace(sTexto: String; wLen: Word): String;
Begin
 sTexto := RTrim(LTrim(sTexto));
 While Length(sTexto) < wLen Do
  sTexto := ' ' + sTexto;
 Result := sTexto;
End;

Function AnoMesAnterior(sAnoMes: String): String;
Var
 iMes, iAno: Integer;
Begin
 iMes := StrToInt(Copy(sAnoMes, 5, 2));
 iAno := StrToInt(Copy(sAnoMes, 1, 4));
 If iMes = 1 Then
 Begin
  Dec(iAno);
  iMes := 12;
 End
 Else
  Dec(iMes);
 Result := IntToStr(iAno) + Copy(IntToStr(iMes + 100), 2, 2);
End;

Function DescrSituacao(sSituac: String): String;
Begin
 If sSituac = '1' Then
  Result := 'ATIVO'
 Else If sSituac = '2' Then
  Result := 'CORTADO'
 Else
  Result := 'DESATIVADO';
End;

Function InverteAnoMes(sData, sOpcao: String): String;
Var
  sEspera: string[6];
Begin
  Result := '';
  If Trim(sData) = '' Then Exit;
  If sOpcao = '1' Then // mm/aaaa
     Result := RightStr(sData, 4) + LeftStr(sData, 2) // aaaa/mm
  Else // aaaa/mm
     Result := RightStr(sData, 2) + LeftStr(sData, 4); // mm/aaaa
  sEspera := Result;
End;

Function AnoAtual: String;
Begin
 Result := RightStr(DateToStr(date), 4);
End;

Function DescrCategoria(sCodigo: String): String;
Begin
 If sCodigo = '1' Then
  Result := 'RESIDENCIAL'
 Else If sCodigo = '2' Then
  Result := 'COMERCIAL'
 Else If sCodigo = '3' Then
  Result := 'INDUSTRIAL'
 Else
  Result := '';
End;

function kLoadJPEG(const psFileIN: PChar): TPicture;
var
 imgJPG: TJPEGImage;
 picReturn: TPicture;
begin

 imgJPG := TJPEGImage.Create;
 picReturn := TPicture.Create;

 try
  imgJPG.LoadFromFile(psFileIN);
  picReturn.Bitmap.Assign(imgJPG);
 except
  picReturn.Free;
  picReturn := nil;
 end;

 imgJPG.Free;
 Result := picReturn;

end; // function LoadJPEG

procedure SetMaskCPF_CGC(oMaskEdit1: TMaskEdit; sTipo: String);
Var
 sTeste1, sTeste2: String;
Begin
 If sTipo = 'F' Then
 Begin
  oMaskEdit1.EditMask := '999.999.999-99;0; ';
  // oMaskEdit1.MaxLength := 11;
 End
 Else
 Begin
  oMaskEdit1.EditMask := '99.999.999/9999-99;0; ';
  // oMaskEdit1.MaxLength := 14;
 End;
 sTeste1 := oMaskEdit1.Text;
 sTeste2 := oMaskEdit1.EditMask;
 sTipo := '';
End;

Function FormatCPF_CNPJ(sCPF_CNPJ: String; sTipo: String): String;
Begin
 If sTipo = 'F' Then
  Result := FormatString('999.999.999-99', sCPF_CNPJ)
 Else
  Result := FormatString('99.999.999/9999-99', sCPF_CNPJ);
End;

Function DataAdmissao(sDtAdmissao,sDtReadmisaao: String): String;
Begin
  Result := '';
  If (EmptyData(sDtAdmissao)) And (EmptyData(sDtReadmisaao)) Then Exit;
  If EmptyData(sDtReadmisaao) Then
     Result := sDtAdmissao
  Else
     Result := sDtReadmisaao;
End;

Function CalcIdade(dDataHoje, dDataNasc: TDate): String;
Var
  iQtdAnos,
  iQtdMeses,
  iQtdDias : Integer;
  iMesHoje,
  iMesNasc    : Integer;
  iDiaHoje,
  iDiaNasc    : Integer;
begin

  iQtdAnos := YearOf(dDataHoje) - YearOf(dDataNasc);     // 21/09/2010 - 19/04/1969 = 4105
                                                   // 11/03/2010 - 19/04/1969 = 41 - 1= 40
  iMesHoje    := MonthOf(dDataHoje);
  iMesNasc    := MonthOf(dDataNasc);
  iDiaHoje    := DayOf(dDataHoje);
  iDiaNasc    := DayOf(dDataNasc);

  if iMesHoje < iMesNasc  then
     Dec(iQtdAnos)
  else
     if (iMesHoje = iMesNasc) and (iDiaHoje < iDiaNasc) then
        Dec(iQtdAnos);

  iQtdMeses := MonthOf(dDataHoje) - MonthOf(dDataNasc);
  if iQtdMeses < 0 then
     iQtdMeses := iQtdMeses + 12
  else
  if iDiaHoje < iDiaNasc then
  begin
     if iQtdMeses < 0 then
        iQtdMeses := iQtdMeses + 12;
     Dec(iQtdMeses);
  end;

  Result := PreencheZeros(IntToStr(iQtdAnos),2)+
            PreencheZeros(IntToStr(iQtdMeses),2);

end;

Function CalcTempoContrato(dDtFim, dDtIni: TDate): String;
Var
  iDiaIni,
  iDiaFim,
  iMesIni,
  iMesFim: Integer;
  iQtdDiasIni,
  iQtdDiasFim: Integer;
  iQtdMeses,
  iQtdDias: Integer;
  iQtdDiasSobra: Integer;

begin

  iDiaIni := DayOf(dDtIni);
  iDiaFim := DayOf(dDtFim);
  iMesIni := MonthOf(dDtIni);
  iMesFim := MonthOf(dDtFim);

  if iDiaIni > 1 then
     iQtdDiasIni := 30 - iDiaIni
  else
     iQtdDiasIni := 0;
  if iDiaFim < 30 then
     iQtdDiasFim := iDiaFim
  else
     iQtdDiasFim := 0;

  iQtdDiasSobra := iQtdDiasIni+iQtdDiasFim;

  iQtdMeses := iMesFim - iMesIni;
  if iQtdDiasSobra > 0 then
  begin
     if iQtdDiasSobra > 30 then
     begin
        Inc(iQtdMeses);
        iQtdDiasSobra := iQtdDiasSobra - 30;
     end;
  end;

  Result := PreencheZeros(IntToStr(iQtdMeses),2)+
    PreencheZeros(IntToStr(iQtdDiasSobra),2);

end;


Function ValidaPeriodo(sIni,sFim,sOrdem: string): Boolean;
begin
   Result := True;
   if (Trim(sIni) = '/') and ((Trim(sFim) = '/')) then exit;
   Result := False;
   if sOrdem = '1' then
   begin
     if Trim(sIni) = '/' then
        Mensagem('Falta o MÍs/Ano Inicial ...','A v i s o !',MB_OK+MB_ICONWARNING)
     else
     if (StrToInt(LeftStr(sIni,2)) < 1) or
        (StrToInt(LeftStr(sIni,2)) > 16) then
        Mensagem('MÍs Inicial, inv·lido ...','E r r o !',MB_OK+MB_ICONERROR)
     else
     if (StrToInt(RightStr(sIni,4)) < 1969) or
        (StrToInt(RightStr(sIni,4)) > 2039) then
        Mensagem('Ano Inicial, inv·lido ...','E r r o !',MB_OK+MB_ICONERROR)
     else
        Result := True;
   end else
   begin
     if Trim(sFim) = '/' then
        Mensagem('Falta o MÍs/Ano Final ...','A v i s o !',MB_OK+MB_ICONWARNING)
     else
     if (StrToInt(LeftStr(sFim,2)) < 1) or
        (StrToInt(LeftStr(sFim,2)) > 16) then
        Mensagem('MÍs Inicial, inv·lido ...','E r r o !',MB_OK+MB_ICONERROR)
     else
     if (StrToInt(RightStr(sFim,4)) < 1969) or
        (StrToInt(RightStr(sFim,4)) > 2039) then
        Mensagem('Ano Inicial, inv·lido ...','E r r o !',MB_OK+MB_ICONERROR)
     else
     if InverteAnoMes(sFim,'1') < InverteAnoMes(sIni,'1') then
        Mensagem('MÍs/Ano final menor que MÍs/Ano inicial ...','E r r o !',MB_OK+MB_ICONERROR)
     else
        Result := True;
   end;
end;

Function ValidaPeriodo2(sIni,sFim,sOrdem: string): Boolean;
begin
   Result := True;
   if EmptyData(sIni) or EmptyData(sFim) then exit;
   Result := False;
   if sOrdem = '1' then
   begin
     if Trim(sIni) = '/  /' then
        Mensagem('Falta a Data Inicial ...','A v i s o !',MB_OK+MB_ICONWARNING)
     else
        Result := True;
   end else
   begin
     if Trim(sFim) = '/  /' then
        Mensagem('Falta a Data Final ...','A v i s o !',MB_OK+MB_ICONWARNING)
     else
     if StrToDate(sFim) < StrToDate(sIni) then
        Mensagem('Data Final È menor que a Data Inicial ...','E r r o !',MB_OK+MB_ICONERROR)
     else
        Result := True;
   end;
end;

Function ExtraiBarrasDate(dData: TDate): String;
Var
   sDataTemp: String[10];
Begin
   sDataTemp := DateToStr(dData);
   If (EmptyData(sDataTemp)) Or
      (dData < StrToDate('01/01/1900')) Then
   Begin
      Result := '00000000';
      Exit;
   End;
   sDataTemp:= DateToStr(dData);
   Result   := LeftStr(sDataTemp,2)+Copy(sDataTemp,4,2)+RightStr(sDataTemp,4);
End;

Function BarrasDateParaPonto(dData: TDate): String;
Var
   sDataTemp: String[10];
Begin
   sDataTemp := DateToStr(dData);
   If (EmptyData(sDataTemp)) Or
      (dData < StrToDate('01/01/1900')) Then
   Begin
      Result := '00.00.0000';
      Exit;
   End;
   sDataTemp:= DateToStr(dData);
   Result   := LeftStr(sDataTemp,2)+'.'+Copy(sDataTemp,4,2)+'.'+RightStr(sDataTemp,4);
End;


Function AjustaZeros(crValor: Currency;wTam: Word): String;
Var
   sValor: String[30];
Begin
   sValor := FormatFloat('000000000000000000000000000.00',crValor);
   Result := Copy(sValor,1,Pos(',',sValor)-1)+Copy(sValor,Pos(',',sValor)+1,2);
   Result := RightStr(Result,wTam);
End;


Function DescrMesParcela(sAnoMes,sParcela: String): String;
Var
  sDescrTemp: String;
begin
  sDescrTemp := '';
  sDescrTemp := Maiusculas(Trim(NomeMes(StrToInt(RightStr(sAnoMes,2)))));
  sDescrTemp := sDescrTemp + ' / ' + AnoStr(sAnoMes);
  case StrToInt(sParcela) of
     0: sDescrTemp := sDescrTemp + ' - NORMAL';
     1: sDescrTemp := sDescrTemp + ' - COMPLEMENTAR';
     2: sDescrTemp := sDescrTemp + ' - AUX. ALIMENT.';
  end;
  Result := sDescrTemp;
end;

Function ExtraiUnidGestoraNaoPermitida(sUnidsGestoras: String): String;
Var
   iX1: Integer;
   sUnidGestTemp,
   sNovoTexto: string;
   sChar1: String[1];
begin
   iX1 := Length(sUnidsGestoras);
   if LeftStr(sUnidsGestoras,1)=';' then
      sUnidsGestoras := copy(sUnidsGestoras,2,iX1-1);
   if RightStr(sUnidsGestoras,1)=';' then
      sUnidsGestoras := LeftStr(sUnidsGestoras,iX1-2);
   sUnidGestTemp:= '';
   sNovoTexto   := ';';
   for iX1 := 1 to Length(sUnidsGestoras) do
   begin
      sChar1 := sUnidsGestoras[iX1];
//      if sChar1 = ';' then
//      begin
//         if UnidGestoraPermiteUsuario(StrToInt(sUnidGestTemp),0,0,'','') then
//            sNovoTexto := sNovoTexto + sUnidGestTemp + ';';
//         sUnidGestTemp := '';
//       end else
//      begin
//         sUnidGestTemp := sUnidGestTemp + sChar1;
//      end;
   end;
   Result := sNovoTexto + ';';
end;

Function AjustaTextoParamVarios(sTexto: String): String;
begin
  if (not Empty(sTexto)) and
     (sTexto<>'0') then
  begin
     if LeftStr(Trim(sTexto),1) <> ';'  then
        sTexto := ';'+Trim(sTexto);
     if RightStr(Trim(sTexto),1) <> ';'  then
        sTexto := Trim(sTexto)+';';
  end else
     sTexto := '0';
  Result := sTexto;
end;

Function GetPathRel: WideString;
begin
  Result := ini_le_secao('Rel')+'\';
end;

Function GetPathDataBase: WideString;
Var
  sPahtAplicacao,
  sServidor,
  sBaseDados,
  sBaseDados2,
  sSecao : WideString;
  tfArq: TextFile;

  lMultiOrgao: Boolean;

Begin

  sServidor := '';
  if LeftStr(glb_sMultiOrgao,1) = 'S' then
     sBaseDados := ini_le_secao('Ult_orgao');

  sPahtAplicacao := ExtractFilePath(ParamStr(0));
  If FileExists(sPahtAplicacao + REMUNERATUS_INI) Then
  Begin
     AssignFile(tfArq,sPahtAplicacao + REMUNERATUS_INI);
     Reset(tfArq);
     while not eof(tfArq) do
     begin
       Readln(tfArq,sSecao);
       if UpperCase(sSecao) = '[SERVIDOR]' then
          Readln(tfArq,sServidor)
       else
       if UpperCase(sSecao) = '[DATABASE]' then
       begin
          if LeftStr(glb_sMultiOrgao,1) <> 'S' then
          begin
             while True do
             begin
                Readln(tfArq,sBaseDados);
                if LeftStr(sBaseDados,3) = '***' then
                   continue;
                break;
             end;
          end;
       end;
     end;
     CloseFile(tfArq);
  End;

  if (sServidor = EmptyStr) then
     Result := sBaseDados
  else
     Result := Trim(sServidor)+':'+sBaseDados;
end;

Function GetPathAtualizaVer: WideString;
Begin
   Result := Ini_le_secao('Atualiza');
end;

Function GetUltAnoMes: String;
begin
   Result := ini_le_secao('Ult_ano_mes');
end;

Function GetUltmaVersao(sExe: string): String;
Var
  sPathAtualizaExe: WideString;
  tfArq: TextFile;
  sLinReg,
  sNovaVersao: string;
begin
  sPathAtualizaExe := GetPathAtualizaVer;

  try
      Result := Versao_Executavel(sPathAtualizaExe+'\'+sExe+'.EXE');
  except
      Result := '00000';
  end;

{
  If FileExists(sPathAtuaizaExe+'\VERSAO_ATUALIZA.INI') Then
  Begin
     AssignFile(tfArq,sPathAtuaizaExe+'\VERSAO_ATUALIZA.INI');
     Reset(tfArq);
     while not eof(tfArq) do
     begin
       Readln(tfArq,sLinReg);
       if sLinReg = '['+UpperCase(sExe)+']' then
       begin
          Readln(tfArq,sLinReg);
          sNovaVersao := sLinReg;
          if Length(Trim(sNovaVersao)) = 7 then
             Result := sNovaVersao
          else
             Result := '';
          break;
       end;
     end;
     CloseFile(tfArq);
  End;
}
end;

Function CurrToStrZeros(crValor: Currency; iLen: Integer): String;
Var
   sValor: String;
   sMask: String;
Begin
   Result := Replicate('0',iLen);
   If crValor = 0 Then Exit;
   sMask := '';
   While Length(sMask) <= (iLen-3) Do
      sMask := sMask + '0';
   sMask := sMask + '.00';
   sValor := FormatFloat(sMask,crValor);
   Result := Copy(sValor,1,Pos(',',sValor)-1)+Copy(sValor,Pos(',',sValor)+1,2);
End;

Function CurrToStrZeros2(crValor: Currency; iLen: Integer): String;
Var
   sValor: String;
   sMask: String;
Begin
   Result := Replicate('0',iLen);
   If crValor = 0 Then Exit;
   sMask := '';
   While Length(sMask) <= (iLen-3) Do
      sMask := sMask + '0';
   sMask := sMask + '.00';
   sValor := FormatFloat(sMask,crValor);
   Result := sValor;
End;

Function LZerosValor(crValor: Currency; wTam: Word): String;
Var
   sValor: String[30];
Begin
   sValor := FormatFloat('000000000000000000000000000.00',crValor);
   Result := Copy(sValor,1,Pos(',',sValor)-1)+Copy(sValor,Pos(',',sValor)+1,2);
   Result := RightStr(Result,wTam);
End;

function Versao_Executavel(sArquivo: String): String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  wHandle : Dword;
  iLen : Integer;
  cDate : Pchar;
  pBuffer : Pointer;
  wSize : Dword;
  cFile: Pchar;
  sFile : String;
  sVerTemp: string;
  iConta: integer;
begin
  sFile := sArquivo;
  cFile := StrAlloc(Length(sFile) + 1);
  StrPcopy(cFile, sFile);
  iLen := GetFileVersionInfoSizeW(cFile, wHandle);
  Result := '';

  if iLen > 0 then
  begin

    cDate:=StrAlloc(iLen+1);
    if GetFileVersionInfo(cFile,wHandle,iLen,cDate) then
    begin
      VerQueryValue(cDate, '\',pBuffer,wSize);
      F := PFFI(pBuffer);
      Result := Format('%d.%d.%d.%d',
      [HiWord(F^.dwFileVersionMs),
      LoWord(F^.dwFileVersionMs),
      HiWord(F^.dwFileVersionLs),
      Loword(F^.dwFileVersionLs)]
      );
    end;

    StrDispose(cDate);
  end;

  StrDispose(cFile);

  sVerTemp := RightStr(Result,2);
  if LeftStr(sVerTemp,1) = '.' then
  begin
     sVerTemp := LeftStr(Result,6)+'0'+RightStr(sVerTemp,1);
     Result := sVerTemp;
  end

end;

Function CalcDigito(sCodigo: String): String;
Var
   iTotNum: Integer;
Begin
   Try
     iTotNum  := (StrToInt(sCodigo[6]) * 3) +
                 (StrToInt(sCodigo[5]) * 4) +
                 (StrToInt(sCodigo[4]) * 5) +
                 (StrToInt(sCodigo[3]) * 6) +
                 (StrToInt(sCodigo[2]) * 7) +
                 (StrToInt(sCodigo[1]) * 8);
     Result  := IntToStr(iTotNum Mod 10);
   Except
     Result   := '0';
   End;

   //Mensagem(IntToStr(iTotNum),'Teste',MB_OK+MB_ICONEXCLAMATION);

End;

function FormatId(Id_: String; Factor: Integer=0): String;
var
  _i: Integer;
begin
  Result := Trim(Id_);

  if (Result = EmptyStr)or(Length(Result) >= Factor) then
    Exit;

  for _i := Length(Trim(Id_)) to Factor-1 do
    Result := '0'+Result;
end;

Function DescrParcela(sParcela,sComplementar: string): string;
begin
  if (sParcela = '0') and (sComplementar = 'N') then
     result  := 'NORMAL'
  else
  if (sParcela = '0') and (sComplementar = 'S') then
     result  := 'COMPLEMENTAR'
  else
     result  := 'COMPLEMENTAR';
end;

procedure Atualiza_Executavel(sExe: string);
var
  tfAutoAtualiza: TextFile;
  sPathAtualizaExe: WideString;
begin

  Screen.Cursor := crHourGlass;

  //sPathAtualizaExe := Pesquisa('PASTA_PADRAO','ID','1','ATUALIZA_EXE','');
  sPathAtualizaExe := GetPathAtualizaVer;

  AssignFile(tfAutoAtualiza,sExe+'.bat');
  ReWrite(tfAutoAtualiza);

  WriteLn(tfAutoAtualiza,':1');
  WriteLn(tfAutoAtualiza, 'Del "'+sExe+'.exe'+'"');
  WriteLn(tfAutoAtualiza, 'If exist "'+sExe+'.exe'+'" goto 1');
  WriteLn(tfAutoAtualiza,':2');
  WriteLn(tfAutoAtualiza, 'Copy "'+IncludeTrailingPathDelimiter(sPathAtualizaExe)+
     sExe+'.exe'+'" "'+
     IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))+'"');
  if sExe = 'REMUNERATUS' then
  begin
     WriteLn(tfAutoAtualiza,':3');
     WriteLn(tfAutoAtualiza, 'if exist "'+sExe+'.exe" then goto 4 else goto 3');
     WriteLn(tfAutoAtualiza,':4');
     WriteLn(tfAutoAtualiza,'"'+sExe+'.exe"');
  end;

  //WriteLn(tfAutoAtualiza,'Del '+sNomeBat+'.bat');

  CloseFile(tfAutoAtualiza);

  ShellExecute(glb_hHND_Principal,'Open',PChar(sExe+'.bat'),nil,nil,SW_HIDE);

  Screen.Cursor := crDefault;

end;

function CategTrabalhador(sIdSituacTCM,sEfetivo: string): string;
begin
   if (Trim(sIdSituacTCM) = '') then
   begin
      if (sEfetivo = 'S') then
         Result := '21'
      else
         Result := '20';
   end else
   begin
      if (sIdSituacTCM = '10') then
         Result := '20'
      else if (sIdSituacTCM = '20') then
         Result := '21'
      else if ((sIdSituacTCM >= '31') and (sIdSituacTCM <= '34')) then
         Result := '19'
      else
         Result := '12';
   end
end;

Function DtPerAquisitivo(sOpcao, sAno: String;
   dDtAdm: TDate): TDate;
Var
  iAno: Integer;
  sDtTemp: string[10];
begin
  if sOpcao = '1' then
  begin
     iAno := StrToInt(sAno)-1;
     sDtTemp := LeftStr(DateToStr(dDtAdm),6)+IntToStr(iAno);
  end else
  begin
     iAno := StrToInt(sAno);
     sDtTemp := LeftStr(DateToStr(dDtAdm),6)+IntToStr(iAno);
  end;
  Result := StrToDate(sDtTemp);

end;

function ExecAndWait(const FileName, Params: string;
  const WindowState: Word): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto È necess·rio devido
    aos espaÁos contidos em nomes longos }
  //CmdLine := '"' + Filename + '"' + Params;
  CmdLine := Filename + ' ' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);

  { Aguarda atÈ ser finalizado }
  if Result then
  begin
     WaitForSingleObject(ProcInfo.hProcess, INFINITE);
     { Libera os Handles }
     CloseHandle(ProcInfo.hProcess);
     CloseHandle(ProcInfo.hThread);
  end;
end;

function ini_le_secao(sNomeSecao: string): string;
Var
  sl1: TStringList;
  sPathExe: string;
  iConta: Integer;
  sLinha: string;
begin
  sNomeSecao := '['+sNomeSecao+']';
  sPathExe := ExtractFilePath(Application.ExeName);
  sl1 := TStringList.Create;
  sl1.LoadFromFile(sPathExe + '\' + REMUNERATUS_INI);
  Result := '';
  for iConta := 0 to sl1.Count - 1 do
  begin
    sLinha := Trim(sl1[iConta]);
    if (sLinha = sNomeSecao) then
    begin
       Result := sl1[iConta+1];
       Break;
    end;
  end;

  if Trim(Result) <> '' then
     Result := Trim(Result);
  FreeAndNil(sl1);

end;

function AlteraIni(sl1: TStringList; sSecao, sTextoNovo: String): Boolean;
Var
  iConta: Integer;
  sTextoAtual: string;
begin

  Result := False;
  for iConta := 0 to sl1.Count - 1 do
  begin
    if UpperCase(sl1[iConta]) = '['+sSecao+']' then
    begin
       sTextoAtual := sl1[iConta+1];
       if sTextoNovo <> sTextoAtual then
       begin
          sl1[iConta+1] := sTextoNovo;
          Result := True;
       end;
    end;
  end;

end;

Function MarcaRegInicial(oCds: TClientDataSet; sIds: string): Integer;
begin

   Result := 0;
   if sIds = '0' then exit;

   oCds.DisableControls;
   oCds.First;
   while not oCds.eof do
   begin
      if Pos(';'+oCds.FieldByName('ID').AsString+';',sIds) > 0 then
      begin
         oCds.Edit;
         oCds.FieldByName('MARCADO').Value := 'S';
         oCds.Post;
         Inc(Result);
      end;
      oCds.Next;
   end;
   oCds.EnableControls;
   oCds.First;

end;

Function ConvertTempoEmAnosMesesDias(iTempo: Integer): String;
Var
  iQtdAnos,
  iQtdMeses,
  iQtdDias : Integer;
  x1  : Extended;
  s1  : string;
  i1  : Integer;
begin

  // iTempo - meses, dias e anos
  x1 := 0;
  s1 := '0';
  i1 := 0;
  if iTempo > 365 then
  begin
    x1 := iTempo / 365;
    s1 := CurrToStr(x1);
    i1 := Pos(',',s1);
    iQtdAnos := StrToInt(LeftStr(s1,i1-1));
    i1 := iQtdAnos * 365;
    iTempo := iTempo - i1;  // meses e dias
  end;

  x1 := iTempo / 30;
  s1 := CurrToStr(x1);
  i1 := Pos(',',s1);
  if i1 > 0 then
  begin
    s1 := LeftStr(s1,i1-1);
    iQtdMeses := StrToInt(LeftStr(s1,i1-1));
  end else
  begin
    iQtdMeses := Inteiro(x1);
  end;

  i1 := iQtdMeses * 30;
  iTempo := iTempo - i1;  // dias
  if iTempo > 0 then
     iQtdDias := iTempo
  else
     iQtdDias := 0;

  Result := PreencheZeros(IntToStr(iQtdAnos),2)+
            PreencheZeros(IntToStr(iQtdMeses),2)+
            PreencheZeros(IntToStr(iQtdDias),2);

end;

Function PeriodoImplantacao: Boolean;
Var
  sTemp: string;
  sDt1, sDt2: String[10];
begin

  Result := False;
  Try
//    sTemp := Pesquisa('CONFIG_SISTEMA','ID','1','PERIODO_IMPLANTACAO','');
    if Trim(sTemp) = EmptyStr then
       sTemp := '01/01/1901 - 31/01/1901';
  except
    sTemp := '01/01/1901 - 31/01/1901';
  End;

  sDt1 := LeftStr(sTemp,10);
  sDt2 := RightStr(sTemp,10);

  if (Date >= StrToDate(sDt1)) and (Date <= StrToDate(sDt2)) then
     Result := True;

end;

function CriptLiberaPrazoLicenca(sQuadrimLiberado,sAnoMesTrava: string): string;
Var
   sCNPJ: string[14];
   sChar1,
   sChar2,
   sChar3,
   sChar4,
   sChar5: string[2];
begin

//   sCNPJ := Pesquisa('CONFIG_ORGAO','ID','1','CNPJ','');
   sCNPJ := Criptografa(sCNPJ,'2',14);

   sChar1 := Copy(sCNPJ,8,1);    // 5 - 8a PosiÁ„o
   sChar2 := Copy(sCNPJ,2,1);    // 2 - 2a PosiÁ„o
   sChar3 := Copy(sCNPJ,5,2);    // 1 - 5a e 6a posiÁıes
   sChar4 := RightStr(sCNPJ,2);  // 3 - DÌgitos (13a e 14a posiÁıes)
   sChar5 := Copy(sCNPJ,7,1);    // 4 - 7a posiÁ„o

   //04780953000179
   //12345678901234

   {'0 '+                               2
    leftStr(sQuadrimLiberado,4)+        4
    '09'+                               2
    RightStr(sAnoMesTrava,2)+           2
    Copy(sAnoMesTrava,3,2)+             2
    '13 '+                              3
    LeftStr(sAnoMesTrava,2)+            2
    '5'+                                1
    Copy(sQuadrimLiberado,5,1)          1
  }

   Result := sChar3+
             leftStr(sQuadrimLiberado,4)+
             sChar4+
             RightStr(sAnoMesTrava,2)+
             Copy(sAnoMesTrava,3,2)+
             sChar2+
             sChar5+
             ' '+
             LeftStr(sAnoMesTrava,2)+
             sChar1+
             Copy(sQuadrimLiberado,5,1);

   {
   5a e 6a do CNPJ (2)
   Ano do quadrimestre (4)
   DÌgitos do CNPJ [13a e 14a] (2)
   MÍs do Travamento (2)
   3o e 4o Characteres do Ano (2)
   2a posiÁ„o do cnpj (1)
   7a posiÁ„o do cnpj (1)
   1o e 2o Characteres do Ano (2)
   8a posiÁ„o do CNPJ (1)
   5a posiÁ„o do AnoQuad (1)
   }

// 0-QQQQ09MMaa13-AA5Q-
// 12345678901234567890

end;

Function AltSeparadorData(sData,sNovoSeparador: string): String;
Var
   sTemp: string;
begin
   sTemp := LeftStr(sData,2)+sNovoSeparador+Copy(sData,4,2)+sNovoSeparador+
      RightStr(sData,4);
   Result := sTemp;
end;

Function FormataDataSaveDirect(dData: TDate): String;
Var
   sTemp: string;
begin
   sTemp := 'cast('+QuotedStr(AltSeparadorData(DateToStr(dData),'.'))+' as date)';
   Result := sTemp;
end;

Function QtdMeses(sAnoMesIni,sAnoMesFim: String): String;
Var
  sAnoMesTemp: string[6];
  iConta     : Integer;
begin

  iConta      := 0;
  sAnoMesTemp := sAnoMesIni;
  while sAnoMesTemp <= sAnoMesFim do
  begin
     Inc(iConta);
     sAnoMesTemp := IncMesAno(RightStr(sAnoMesTemp,2)+LeftStr(sAnoMesTemp,4));
     sAnoMesTemp := RightStr(sAnoMesTemp,4)+LeftStr(sAnoMesTemp,2);
  end;

  Result := IntToStr(iConta);

end;

Function ConvertCurrSaveDirect(crVal: Currency): String;
Var
   sVal: string;
begin

   Try
     sVal   := CurrToStr(crVal);
     Result := StringReplace(sVal,',','.',[rfIgnoreCase]);
   except
     Result := 'Null';
   End;
   if Trim(Result) = '' then
      Result := 'Null';

end;

Function ConvertStringSaveDirect(sText: string): String;
begin

   Try
     Result := QuotedStr(sText);
   except
     Result := 'Null';
   End;
   if Trim(Result) = '' then
      Result := 'Null';

end;

Function ConvertIntegerSaveDirect(iVal: Integer): String;
begin

   Try
     Result := IntToStr(iVal);
   except
     Result := 'Null';
   End;
   if Trim(Result) = '' then
      Result := 'Null';

end;


End.

