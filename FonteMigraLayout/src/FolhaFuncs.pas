unit FolhaFuncs;

interface

Uses
   SysUtils, WinTypes, WinProcs, Classes, Messages, Controls,
   Forms, Dialogs, stdCtrls, DB, DBTables, DBGrids, ExtCtrls,
   Graphics, Variants, DbiProcs, DBClient, StrUtils;

Function PreencheZeros(sTexto: String; iTam: Integer): String;
Function IncNumToStr(sNum: String): String;
function ValidData(sData: String): Boolean;
Function Empty(sText: String): Boolean;
Function RTrim(sString: String): String;
Function LTrim(sString: String): String;
Function CharEspeciais(sString: String): Boolean;
Procedure Mensagem(sTexto: String; sCaption: String);
Function Confirma(sTexto: String): Boolean;
Function _Left(sString: String; bNumChars: Byte): String;
Function _Right(sString: String; bNumChars: Byte): String;
Function IncMesAno(sMesAno: String): String;
Function DecMesAno(sMesAno: String): String;
Function Situacao(sSituac: String): String;
Function EmptyData(sData: String): Boolean;
Function NomeMes(bMes: Byte): String;
Function Seleciona(sTitulo,sNomeTab,sCampoDisp,sCampoRet: String): Boolean;
Function Pesquisa(sPesq,sTabela,sCampoPesq,sCampoRet,sMensagem: String): String;
Function UltimoDiaMes(sMesAno: String): TDate;
Function CalcTempoServico(dDtAdm, dDtBase: TDate): String;
Function VerNivel(sTempoServ, sQuantRef: String): String;
Function VerReferencia(sTempoServ, sCodRef: String): String;
Function Arredonda(xValor: Extended; bQtDecimais: Byte): Extended;
Function FormatString(sMask,sString: String): String;
Function PeriodoValido(sDtInicial, sDtFinal: String; sDefault: String): Boolean;
Function Replicate(cChar: Char; iNumVezes: Integer): String;
Function Decimal(crValor: Currency): Integer;
Function Inteiro(crValor: Extended): Integer;
Function ValidMesAno(sMesAno: String): Boolean;
Function ValData(sData: String): String;
Function ValidCPF(sCPF: String): Boolean;
Function Criptografa(sTexto: String): String;
Function ExtraiPonto(sTexto: String): String;
Function DelphiCarregado : Boolean;
Function JanelaExiste(Classe,Janela:String) :Boolean;
Function AnoStr(sData: String): String;
Function MesStr(sData: String): String;
Function DiaMesStr(sData: String): String;
Function PutSpacesRight(sTexto: String; wLenText: Word): String;
Function VerVencBase(sCodCargoAtual, sReferencia: String): Currency;
Function Iif(bExpressao: Boolean; sRet1, sRet2: String): String;
Function ValidLanVencDesc(sCodVD, sCodCargo: String; crQuant: Currency): Boolean;
Function VerTeclasNoGrid(wKey: Word; tTable: TDataSet): Word;
Function NewCodigo(sTabela, sCampoCod: String; wLen: Word; bLeftZeros: Boolean): String;
Function PutSpacesLeft(sTexto: String; wLenText: Word): String;
Procedure ColoreGrid(Sender: TObject; Field: TField; AFont: TFont;
                     var Background: TColor; Highlight: Boolean);
Function VerFuncIniCCustos(sCodCCustos,sVerifica: String): String;
Function ValidFuncCCustos(sMatricula,sCodCCustos,sVerifica: String): Boolean;
Procedure PesquisaIncremental(sTexto: String; pTabela: TTable; sCampoPesq: String);
procedure PesquisaEmTabTemp(sTexto, sCampo: String; oDataSet: TDataSet);
Function ExtraiAnoMesData(sData: String): String;
Function IncAnoMes(sAnoMes: String): String;
Function SituacaoFuncional(sSituac, sCodSituacTCM: String): String;
Function DescParentescoDependete(sCodigo: String): String;
Function CentralizaForm_Horizontal(iLargura: Integer): Integer;
Function CentralizaForm_Vertical(iAltura: Integer): Integer;
Function QuantRegistros(sPesquisa,sCampo,sTabela: String): Integer;
Function ExtraiBarrasDate(dData: TDate): String;
Function ExtraiPontosHora(dHora: TTime): String;
Function AnoMesMovimentacao(oTab: TClientDataSet; sMatric, sCodMovim: String): String;
Function InverteAnoMes(sData, sOpcao: String): String;
Procedure DelLanMovimINSS(sMatric,sLancto: String; oTbMovim: TTable);
Function Validapis(Dado: String; lMsg: Boolean): Boolean;
Function QuantFuncComSalNoMes(oTab: TDataSet): Integer;
Function TiraAcentos(Texto: string ): string;
{
Procedure CalcGuiaPrevidencia(sAnoMes,sCCustos,sSetor: String;
   crAliqPatronal,crAliqSAT: Currency; mTbGuiaTemp: TDataSet);
}
Function DecAnoMes(sAnoMes: String): String;
Function ConvertBooleanToString(lValor: Boolean): String;
Function DataPorExtenso(sData: String): String;
Function Maiusculas(sTexto: String): String;
Function Minusculas(sTexto: String): String;
Function DescrOrdenDespesa(sCodigo: String): String;
Function QuantDiasEntreDatas(sData1,sData2: String): Integer;
Function ValidaCGC(sNumero: String; bMsgErro: Boolean): Boolean;
Function DataAdmissao(sDtAdmissao,sDtReadmisaao: String): String;
Procedure SetIndice(oTab: TClientDataSet; oDbg: TDBGrid; wCol: Word; sFieldIndex: String;
                    oCorColNomral,oCorColAtiva: TColor);
Function SalvaTransacao(oTab: TClientDataSet): Boolean;
Function MovimCCustosEncerado(sAnoMes,sCCustos: String): Boolean;
Function Valid_UF(sTexto: String): Boolean;
Function DescrTipoMovimSituacao(sCodigo: String): String;
Function IncDecAnoData(sData,sIncDec: String): String;
Procedure DestacaTitColuna(oDbgList: TDBGrid; iCol: Integer);
Procedure AddInsconsistencia(sCCustos,sTexto,sTipo: String);
//Procedure AtualizaTotEventosCCustos(sAnoMes,sMatric,sCCustos,sSituacao: String);
Procedure SubtraiTotCCustos(sAnoMes,sMatric,sCodCCustos,sCodDepto,sEfetivo,sCodSituac: String);
Procedure AtualizaTotCCustos(sAnoMes,sCodCCustos,sCodDepto,sCodVD,sEfetivo,sCodSituacao: String;
                             crValor: Currency; lAddEdit: Boolean);
Function AliquotaFAP: Currency;
Function DataPagto(sAnoMes,sCCustos,sBanco: String): String;
Function PagtoBancoConta(sAnoMes,sMatric,sCCustos: String): String;
Procedure ExluiDepositoBancario(sAnoMes,sMatric: String);
Procedure RecalcTotaisCCustos(sCodCCustos,sCodSituacDemitido: String);
Function UnidadeGestora(sCodCCustos,sCampoRet: String): String;
Function gAnoMesImplantIPM: String;
Function gCCustosComDescIPM(sAnoMes,sCCustos: String): Boolean;
Function gAliquotaPatronal(sAnoMes,sCCustos: String): TStringList;
Function gCalcPrevPatronal(crBCPrevid,crAliqtPatronal,crAliqtSAT,crAliqtFAP: Currency): Currency;
Function gTetoBC_INSS(sAnoMes: String; crBCPrevid: Currency): Currency;

procedure kListFiles(ListFiles: TStringList;
  const Extension: string = '*.*'; const Directory: string = '');

implementation

Uses VarGlobais, Math;

Function PreencheZeros(sTexto: String; iTam: Integer): String;
Begin
   While Length(sTexto) < iTam do
      sTexto := '0' + sTexto;
   Result := sTexto;
End;

Function IncNumToStr(sNum: String): String ;
Var
   iCodeErro: Integer;
   iNum: Integer;
Begin
   If sNum = '' Then sNum := '0';
   Val(sNum,iNum,iCodeErro);
   Inc(iNum);
   Result := IntToStr(iNum);
End;

function ValidData(sData: String): Boolean;
Begin
  Result := True;
  If EmptyData(sData) Then Exit;
  Try
    StrToDate(sData);
  Except
    On E:EConvertError do
    Begin
       Application.MessageBox('Data inv·lida ...','Erro !',mb_Ok);
       Result := False;
    End;
  End;
  If Length(RTrim(sData)) < 10 Then
  Begin
     Mensagem('O Ano dever ter 4 dÌgitos !','Erro !');
     Result := False;
  End;
End;

Function Empty(sText: String): Boolean;
Var
  bIndex: Byte;
Begin
  bIndex := 1;
  Result := True;
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
         sString := Copy(sString,1,iConta);
      End Else
         lSpace := False;
   Result := sString;
End;

Function LTrim(sString: String): String;
Var
   iConta, iLenString: Integer;
   lSpace: Boolean;
Begin
   lSpace     := True;
   iLenString := Length(sString);
   iConta     := 1;
   While (lSpace) And (iConta <= iLenString) do
      If (sString[iConta] = ' ') Then
         Inc(iConta)
      Else
         lSpace := False;
   Result := Copy(sString,iConta,(iLenString-iConta)+1);
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
     If cLetra in ['¡','¬','√','¿','«','…',' ','”','’','‘','Õ','⁄','‹',
                   '·','‚','„','‡','Á','È','Í','Û','ı','Ù','Ì','˙','¸'] Then
     Begin
        Result := True;
        bInd := 0;
     End Else
        Inc(bInd);
  End;
End;

Procedure Mensagem(sTexto: String; sCaption: String);
Begin
   Application.MessageBox(PChar(sTexto),PChar(sCaption),mb_Ok);
   //MessageDlg(sTexto, mtInformation, [mbOk], 0);
End;

Function Confirma(sTexto: String): Boolean;
Var
   iButton: Integer;
Begin
   iButton := Application.MessageBox(PChar(sTexto),'Confirma !',mb_YesNo);
   If iButton = IDYES Then
      Result := True
   Else
      Result := False;
End;

Function _Left(sString: String; bNumChars: Byte): String;
Begin
   Result := Copy(sString,1,bNumChars);
End;

Function _Right(sString: String; bNumChars: Byte): String;
Var
   bLenString, bPosIni: Byte;
Begin
   bLenString := Length(sString);
   bPosIni    := (bLenString-bNumChars)+1;
   Result     := Copy(sString,bPosIni,bNumChars);
End;

Function IncMesAno(sMesAno: String): String;
Var
   iMes, iAno: Integer;
Begin
   Result := '';
   If (Empty(sMesAno)) Or (Not ValidMesAno(sMesAno)) Then Exit;
   iMes := StrToInt(_Left(sMesAno,2));
   iAno := StrToInt(_Right(sMesAno,4));
   If iMes = 14 Then
   Begin
      iMes := 1;
      Inc(iAno);
   End Else
      Inc(iMes);
   Result := PreencheZeros(IntToStr(iMes),2)+IntToStr(iAno);
End;

Function DecMesAno(sMesAno: String): String;
Var
   iMes, iAno: Integer;
Begin
   Result := '';
   If (Empty(sMesAno)) Or (Not ValidMesAno(sMesAno)) Then Exit;
   iMes := StrToInt(_Left(sMesAno,2));
   iAno := StrToInt(_Right(sMesAno,4));
   If iMes = 1 Then
   Begin
      iMes := 13;
      Dec(iAno);
   End Else
      Dec(iMes);
   Result := PreencheZeros(IntToStr(iMes),2)+IntToStr(iAno);
End;

Function Situacao(sSituac: String): String;
Begin
   If sSituac = '1' Then
      Result := 'Efetivo'
   Else If sSituac = '2' Then
      Result := 'Temporario'
   Else
      Result := '';
End;

Function EmptyData(sData: String): Boolean;
Begin
   Result := (sData = '') Or
             (sData = '  /  /    ') Or
             (sData = '  /  /  ') Or
             (sData = '31/12/1899');
End;

Function NomeMes(bMes: Byte): String;
Var
   sMeses: String;
Begin
   sMeses := 'Janeiro   Fevereiro MarÁo     Abril     Maio      Junho     '+
             'Julho     Agosto    Setembro  Outubro   Novembro  Dezembro  '+
             'Dec.Terc. Abono     SimulaÁ„o AbonoPASEP';
   Result := RTrim(Copy(sMeses,(10*bMes)-9,10));
End;

Function Seleciona(sTitulo,sNomeTab,sCampoDisp,sCampoRet: String): Boolean;
Begin
{
   Result := True;
   frmSeleciona.sCaption  := sTitulo;
   frmSeleciona.sTableName:= sNomeTab;
   frmSeleciona.sFieldDisp:= sCampoDisp;
   frmSeleciona.sFieldRet := sCampoRet;
   frmSeleciona.ShowModal;
   If glb_sCodigo = '' Then Result := False;
   }
End;

Function Pesquisa(sPesq,sTabela,sCampoPesq,sCampoRet,sMensagem: String): String;
Var
   oTab: TQuery;
Begin
   Result := '';
   If Empty(sPesq) Then Exit;
   Try
      oTab := TQuery.Create(Nil);
      oTab.DataBaseName := glb_sAlias;
      oTab.SQL.Add('SELECT '+sCampoPesq+','+sCampoRet);
      oTab.SQL.Add('FROM '+sTabela);
      oTab.SQL.Add('ORDER BY '+sCampoPesq);
      oTab.Open;
      If oTab.Locate(sCampoPesq,sPesq,[]) Then
      Begin
      //Result := qryTemp.Locate('CodCCusto;Matricula',VarArrayof([sCodCCustos,sMatricula]),[]);
         If Not oTab.FieldByName(sCampoRet).IsNull Then
            Result := oTab.FieldByName(sCampoRet).AsString;
{
         Try
            Result := oTab.FieldByName(sCampoRet).Value
         Except
            Result := '';
         End;
}
      End Else
         If sMensagem <> '' Then
            Mensagem(sMensagem+' N√O ENCONTRADO(A) !','Erro !!!');
      oTab.Close;
   Finally
      oTab.Free;
   End;
End;

Function UltimoDiaMes(sMesAno: String): TDate;
Var
   wAno, wMes, wDia: Word;
   sMes, sMes2: String[2];
   sAno: String[4];
   dDataTemp: TDate;
   sUltDia: String[2];
Begin
   sMes      := Copy(sMesAno,1,2);
   sMes2     := sMes;
   sAno      := Copy(sMesAno,3,4);
   dDataTemp := StrToDate('28/'+sMes+'/'+sAno);
   While sMes2 = sMes do
   Begin
      dDataTemp := dDataTemp + 1;
      DecodeDate(dDataTemp,wAno,wMes,wDia);
      sMes2 := Copy(IntToStr(wMes+100),2,2);
   End;
   sUltDia := Copy(DateToStr(dDataTemp-1),1,2);
   Result := dDataTemp - 1;
End;

Function CalcTempoServico(dDtAdm, dDtBase: TDate): String;
Var
   wAnoBase, wAnoAdm, wMesBase, wMesAdm, wDiaBase, wDiaAdm: Word;
   wQtAnos, wQtMeses, wQtDias: Word;
Begin
   DecodeDate(dDtAdm,wAnoAdm,wMesAdm,wDiaAdm);
   DecodeDate(dDtBase,wAnoBase,wMesBase,wDiaBase);
   wQtAnos := wAnoBase - wAnoAdm;
   If wMesBase < wMesAdm Then
   Begin
      Dec(wQtAnos);
      wQtMeses := 12 - (wMesAdm - wMesBase);
      If wDiaBase < wDiaAdm Then
      Begin
         Dec(wQtMeses);
         wQtDias := (30 - wDiaAdm) + wDiaBase;
      End Else
         wQtDias := wDiaBase - wDiaAdm;
   End Else
   If wMesBase > wMesAdm Then
   Begin
      wQtMeses := wMesBase - wMesAdm;
      If wDiaBase < wDiaAdm Then
      Begin
         Dec(wQtMeses);
         wQtDias := (30 - wDiaAdm) + wDiaBase;
      End Else
         wQtDias := wDiaBase - wDiaAdm;
   End Else
   Begin
      If wDiaBase < wDiaAdm Then
      Begin
         Dec(wQtAnos);
         wQtMeses := 11;
         wQtDias  := (30 - wDiaAdm) + wDiaBase;
      End Else
      Begin
         wQtMeses := 0;
         wQtDias  := wDiaBase - wDiaAdm;
      End;
   End;
   Result := PreencheZeros(IntToStr(wQtAnos),2) +
             PreencheZeros(IntToStr(wQtMeses),2) +
             PreencheZeros(IntToStr(wQtDias),2);
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
Var
   oTbProgSal: TTable;
   iTSTemp   : Integer;
   iTSTemp2  : Integer;
   wConta    : Word;
   iQuantRef : Integer;
Begin
   Result := '';
   Try
      oTbProgSal := TTable.Create(Nil);
      oTbProgSal.DataBaseName:= glb_sAlias;
      oTbProgSal.TableName   := 'TabProgSalarial';
      oTbProgSal.Open;
      oTbProgSal.FindKey([sCodRef]);
      iQuantRef := oTbProgSal.FieldByName('Quantidade').AsInteger;
      iTSTemp := 0;
      iTSTemp2:= oTbProgSal.FieldByName('Tempo').AsInteger;
      For wConta := 1 To iQuantRef Do
      Begin
         If (_Left(sTempoServ,2) >= Copy(IntToStr(iTSTemp+100),2,2)) And
            (_Left(sTempoServ,2) < Copy(IntToStr(iTSTemp2+100),2,2)) Then
         Begin
            Result := Copy(IntToStr(wConta+100),2,2);
            Break;
         End Else
         Begin
            iTSTemp := iTSTemp + oTbProgSal.FieldByName('Tempo').AsInteger;
            iTSTemp2:= iTSTemp2 + oTbProgSal.FieldByName('Tempo').AsInteger;
         End;
      End;
      If (iQuantRef > 1) And (wConta > iQuantRef) And (Result = '') Then
         Result := Copy(IntToStr(iQuantRef+100),2,2);
      oTbProgSal.Close;
   Finally
      oTbProgSal.Free;
   End;
   If Result = '' Then Result := '01';
End;

Function Arredonda(xValor: Extended; bQtDecimais: Byte): Extended;
Var
   sValor: String;
Begin
   Result := 0;
   If xValor = 0 Then Exit;
   sValor := FormatFloat('###########0.00',xValor);
   //sValor := _Left(sValor,Pos(',',sValor)-1)+'.'+
   //          Copy(sValor,Pos(',',sValor)+1,2);
   Result := StrToCurr(sValor);
   {Str(xValor:14:bQtDecimais,sValor);
   Result := StrToCurr(sValor);}
End;

Function FormatString(sMask,sString: String): String;
Var
   i, i2: Integer;
Begin
   Result := '';
   If Empty(sString) Then Exit;
   i  := 1;
   i2 := i;
   While i <= Length(sMask) Do
   Begin
      If sMask[i] in ['.',',','-','/',':',';'] Then
         Result := Result + sMask[i]
      Else
      Begin
         Result := Result + sString[i2];
         Inc(i2);
      End;
      Inc(i);
   End;
End;

Function PeriodoValido(sDtInicial, sDtFinal: String; sDefault: String): Boolean;
Var
  dDtInicial, dDtFinal: TDate;
Begin
   Result := True;
   If (EmptyData(sDtInicial)) Or (EmptyData(sDtFinal)) Then Exit;
   If Length(sDtInicial) = 10 Then
   Begin
      If (Not ValidData(sDtInicial)) Or (Not ValidData(sDtFinal)) Then Exit;
      dDtInicial := StrToDate(sDtInicial);
      dDtFinal   := StrToDate(sDtFinal);
      If dDtInicial > dDtFinal Then
      Begin
         Mensagem('A data final È menor que a inicial !','Erro !!!');
         Result := False;
      End;
   End Else
   Begin
      If InverteAnoMes(sDtInicial,'1') > InverteAnoMes(sDtFinal,'1') Then
      Begin
         Mensagem('A data final È menor que a inicial !','Erro !!!');
         Result := False;
      End;
   End;
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
   bPosPonto := Pos(',',CurrToStr(crValor));
   If bPosPonto > 0 Then
      Result := StrToInt(Copy(CurrToStr(crValor),bPosPonto+1,10))
   Else
      Result := 0;
End;

Function Inteiro(crValor: Extended): Integer;
Var
   bPosPonto: Byte;
Begin
   bPosPonto := Pos(',',FloatToStr(crValor));
   If bPosPonto > 0 Then
      Result := StrToInt(Copy(FloatToStr(crValor),1,bPosPonto-1))
   Else
      Result := StrToInt(FloatToStr(crValor));
End;

{
Function PeriodoValido(sData1,sData2: String): Boolean;
Begin
   Result := False;
   If (EmptyData(sData1)) Or (EmptyData(sData2)) Or
      (Not ValidData(sData1)) Or (Not ValidData(sData2))Then Exit;
   If StrToDate(sData1) > StrToDate(sData2) Then
      Mensagem('PerÌodo inv·lido, Data Final inferior a Data Inicial !,'Erro !!!')
   Else
      Result := True;
End;
}

Function ValidMesAno(sMesAno: String): Boolean;
Begin
   Result := True;
   If (Empty(sMesAno)) Or
      (Pos(_Left(sMesAno,2),'01_02_03_04_05_06_07_08_09_10_11_12_13_14_15')>0) And
      (_Right(sMesAno,4)<=_Left(glb_sAnoMesTrab,4)) Then Exit;
   Mensagem('MÍs/Ano inv·lido !','E r r o !!!');
   Result := False;
End;

Function ValData(sData: String): String;
Begin
   Result := iIf(EmptyData(sData),'',sData);
End;

Function ValidCPF(sCPF: String): Boolean;
Var
   iN1, iN2, iN3, iN4, iN5, iN6, iN7, iN8, iN9: Integer;
   iD1, iD2: Integer;
   sDigitado, sCalculado: String;
Begin
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
   iD1 := (iN9*2)+(iN8*3)+(iN7*4)+(iN6*5)+(iN5*6)+(iN4*7)+(iN3*8)+
          (iN2*9)+(iN1*10);
   iD1 := 11 - (iD1 Mod 11);
   If iD1 >= 10 Then iD1 := 0;
   iD2 := (iD1*2)+(iN9*3)+(iN8*4)+(iN7*5)+(iN6*6)+(iN5*7)+(iN4*8)+(iN3*9)+
          (iN2*10)+(iN1*11);
   iD2 := 11 - (iD2 Mod 11);
   If iD2 >= 10 Then iD2 := 0;
   sCalculado:= IntToStr(iD1)+IntToStr(iD2);
   sDigitado := _Right(sCPF,2);
   Result    := (sCalculado = sDigitado);
End;

Function Criptografa(sTexto: String): String;
Var
   sNewTexto: String;
   iConta: Integer;
Begin
   sNewTexto := '';
   For iConta := 1 To Length(sTexto) Do
     sNewTexto := sNewTexto +
                  Char(Ord(sTexto[iConta])+(47+(11-iConta)));
   Result := sNewTexto;
End;

Function ExtraiPonto(sTexto: String): String;
Var
   wConta,
   wLenTexto: Word;
Begin
   Result:= '';
   wConta:= 1;
   wLenTexto:= Length(sTexto);
   While wConta <= wLenTexto Do
   Begin
      If Pos(sTexto[wConta],'0123456789ABCDEDFGHIJKLMNOPQRSTUVXYWZ') > 0 Then
         Result:= Result+sTexto[wConta];
      Inc(wConta);
   End;
End;

Function DelphiCarregado : Boolean;
begin
   Result := (JanelaExiste('TPropertyInspector','Object Inspector'));
end;

Function JanelaExiste(Classe,Janela:String) :Boolean;
var
   PClasse,PJanela : Array[0..79] Of char;
begin
   If Classe = '' Then
      PClasse[0] := #0
   Else StrPCopy(PClasse,Classe);
   If Janela = '' Then
      PJanela[0] := #0
   Else StrPCopy(PJanela,Janela);
      Result := (FindWindow(PClasse,PJAnela) <> 0);
end;

Function AnoStr(sData: String): String;
Begin
   Result := '';
   If Trim(sData) = '' Then Exit;
   If Length(sData) = 10 Then
      Result := _Right(sData,4)  // dd/mm/aaaa
   Else
      Result := _Left(sData,4);  // aaaa/mm
End;

Function MesStr(sData: String): String;
Begin
   Result := '';
   If Trim(sData) = '' Then Exit;
   If Length(sData) = 10 Then
      Result := Copy(sData,4,2)  // dd/mm/aaaa
   Else
      Result := _Right(sData,2);  // aaaa/mm
End;

Function DiaMesStr(sData: String): String;
Begin
   Result := _Left(sData,2);
End;

Function PutSpacesRight(sTexto: String; wLenText: Word): String;
Begin
   Result := '';
   While Length(sTexto) < wLenText Do
      sTexto := sTexto + ' ';
   Result := sTexto;
End;

Function VerVencBase(sCodCargoAtual, sReferencia: String): Currency;
Var
   oTbRefSalarios: TTable;
Begin
   Try
      oTbRefSalarios := TTable.Create(Nil);
      oTbRefSalarios.DatabaseName:= glb_sAlias;
      oTbRefSalarios.TableName   := 'RefSalarios.DB';
      oTbRefSalarios.Open;
      oTbRefSalarios.FindKey([sCodCargoAtual,sReferencia]);
      Result := oTbRefSalarios.FieldByName('Valor').Value;
      oTbRefSalarios.Close;
   Finally
      oTbRefSalarios.Free;
   End;
End;

Function Iif(bExpressao: Boolean; sRet1, sRet2: String): String;
Begin
   If bExpressao = True Then
      Result := sRet1
   Else
      Result := sRet2;
End;

Function ValidLanVencDesc(sCodVD, sCodCargo: String; crQuant: Currency): Boolean;
Var
   oTbCargos: TTable;
Begin
   Try
      oTbCargos := TTable.Create(Nil);
      oTbCargos.DatabaseName   := glb_sAlias;
      oTbCargos.TableName      := 'Cargos.DB';
      oTbCargos.IndexFieldNames:= 'CodCargo';
      oTbCargos.Open;
      oTbCargos.FindKey([sCodCargo]);
      If (oTbCargos.FieldByName('TipoSalario').Value = '1') And
         (sCodVD = '001') And
         (crQuant > 30) Then
      Begin
         Mensagem('Quantidade do Vencimento Base, inv·lida p/ este Funcion·rio !','E r r o !!!');
         Result := False;
      End Else
         Result := True;
      oTbCargos.Close;
   Finally
      oTbCargos.Free;
   End;
End;

Function VerTeclasNoGrid(wKey: Word; tTable: TDataSet): Word;
Begin
   If wKey in [35,36,38,40] Then
   Begin
     Case wKey of
        35: tTable.Last;
        36: tTable.First;
        38: tTable.Prior;
        40: tTable.Next;
     End;
     Result := 0;
   End Else
     Result := wKey;
End;


Function NewCodigo(sTabela, sCampoCod: String; wLen: Word; bLeftZeros: Boolean): String;
Var
   oTab: TTable;
Begin
   Try
     oTab := TTable.Create(Nil);
     oTab.DatabaseName   := glb_sAlias;
     oTab.TableName      := sTabela;
     oTab.IndexFieldNames:= sCampoCod;
     oTab.Open;
     oTab.Last;
     Try
        Result:= oTab.FieldByName(sCampoCod).Value;
     Except
        Result:= '';
     End;
     If Result = '' Then
        Result := '1'
     Else
        Result := IntToStr(StrToInt(Result)+1);
     If bLeftZeros Then
        Result := PreencheZeros(Result,wLen);
   Finally
     oTab.Free;
   End;
End;

Function PutSpacesLeft(sTexto: String; wLenText: Word): String;
Begin
   Result := '';
   While Length(sTexto) < wLenText Do
      sTexto := ' ' + sTexto;
   Result := sTexto;
End;

procedure ColoreGrid(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{
  If (Field.DataSet.RecNo mod 2 = 0) Then
     Background := $00D2DDE1;
  If HighLight then
  Begin
     AFont.Color := clBlack;
     If TRxDBGrid(Sender).Focused Then
        Background := $0068D9FF  // $0037D9FC
     Else
        Background := $00ABE2FD  // $00ACB29D;
  end;
}  
end;

Function VerFuncIniCCustos(sCodCCustos,sVerifica: String): String;
Var
   qryTemp: TQuery;
Begin
   qryTemp:= TQuery.Create(Nil);
   qryTemp.DataBaseName := glb_sAlias;
   qryTemp.SQL.Clear;
   If sVerifica = '1' Then
   Begin
      qryTemp.SQL.Add('SELECT D.Matricula, D.Nome, D.CodCCusto, D1.Codigo');
      qryTemp.SQL.Add('FROM "CADFUNCIONARIOS" D, "SITUACOES" D1');
      qryTemp.SQL.Add('WHERE (D.CodCCusto = :sCCusto) AND');
      qryTemp.SQL.Add('(D1.Codigo = D.CodSituacao) AND (D1.Inicializa = True)');
      qryTemp.SQL.Add('ORDER BY D.CodCCusto, D.Nome');
      qryTemp.Params[0].Value := sCodCCustos;
   End Else
   Begin
      qryTemp.SQL.Add('SELECT D.Matricula, D.CodCCusto, D1.Nome');
      qryTemp.SQL.Add('FROM "BasesCalculos_Mes" D, "CadFuncionarios" D1');
      qryTemp.SQL.Add('WHERE (D.AnoMes = :sAnoMes) AND (D.CodCCusto = :sCCustos)'+
                      'AND (D1.Matricula = D.Matricula)');
      qryTemp.SQL.Add('ORDER BY D.CodCCusto, D1.Nome');
      qryTemp.ParamByName('sAnoMes').Value := glb_sAnoMesTrab;
      qryTemp.ParamByName('sCCustos').Value:= sCodCCustos;
   End;
   Result := '';
   qryTemp.Open;
   If qryTemp.RecordCount > 0 Then
      Result := qryTemp.FieldByName('Matricula').Value;
   qryTemp.Close;
   qryTemp.Free;
End;

Function ValidFuncCCustos(sMatricula,sCodCCustos,sVerifica: String): Boolean;
Var
   qryTemp: TQuery;
Begin
   Try
      qryTemp:= TQuery.Create(Nil);
      qryTemp.DataBaseName := glb_sAlias;
      qryTemp.SQL.Clear;
      If sVerifica = '1' Then
      Begin
         qryTemp.SQL.Add('SELECT D.Matricula, D.CodCCusto, D1.Codigo');
         qryTemp.SQL.Add('FROM "CADFUNCIONARIOS" D, "SITUACOES" D1');
         qryTemp.SQL.Add('WHERE (D.CodCCusto = :sCCusto) AND');
         qryTemp.SQL.Add('(D1.Codigo = D.CodSituacao)');
         qryTemp.SQL.Add('ORDER BY D.CodCCusto, D.Matricula');
         qryTemp.Params[0].Value := sCodCCustos;
      End Else
      Begin
         qryTemp.SQL.Add('SELECT Matricula, CodCCusto');
         qryTemp.SQL.Add('FROM "BasesCalculos_Mes"');
         qryTemp.SQL.Add('WHERE (AnoMes = :sAnoMes) AND (CodCCusto = :sCCustos)');
         qryTemp.SQL.Add('ORDER BY CodCCusto, Matricula');
         qryTemp.ParamByName('sAnoMes').Value := glb_sAnoMesTrab;
         qryTemp.ParamByName('sCCustos').Value:= sCodCCustos;
      End;
      qryTemp.Open;
      Result := qryTemp.Locate('CodCCusto;Matricula',VarArrayof([sCodCCustos,sMatricula]),[]);
      If Result = False Then
         Mensagem('Este Funcion·rio N√O È deste Centro de Custos ou N√O est· ativo','E r r o !!!');
      qryTemp.Close;
   Finally
      qryTemp.Free;
   End;
End;

Procedure PesquisaIncremental(sTexto: String; pTabela: TTable; sCampoPesq: String);
Begin
   With pTabela Do
   Begin
      If Empty(sTexto) Then
      Begin
         First;
         Exit;
      End;
      DisableControls;
      SetKey;
      FieldByName(sCampoPesq).Value := sTexto;
      GoToNearest;
      EnableControls;
   End;
End;

procedure PesquisaEmTabTemp(sTexto, sCampo: String; oDataSet: TDataSet);
Var
   lFound: Boolean;
   bLenPesq: Byte;
begin
   lFound := False;
   With oDataSet do
   Begin
      DisableControls;
      First;
      If Empty(sTexto) Then
         lFound := True
      Else
         bLenPesq := Length(RTrim(sTexto));
      While (Not EOF) And (Not lFound) do
         If Copy(FieldByName(sCampo).Value,1,bLenPesq) =
            RTrim(sTexto) Then lFound := True
         Else
            Next;
      EnableControls;
   End;
end;

Function ExtraiAnoMesData(sData: String): String;
Begin
   Result := '';
   If EmptyData(sData) Then Exit;
   Result := _Right(sData,4)+Copy(sData,4,2);
End;

Function IncAnoMes(sAnoMes: String): String;
Var
   iMes, iAno: Integer;
Begin
   iMes := StrToInt(_Right(sAnoMes,2));
   iAno := StrToInt(_Left(sAnoMes,4));
   If iMes = 13 Then
   Begin
      iMes := 1;
      Inc(iAno);
   End Else
      Inc(iMes);
   Result := IntToStr(iAno)+PreencheZeros(IntToStr(iMes),2);
End;

Function DecAnoMes(sAnoMes: String): String;
Var
   iMes, iAno: Integer;
Begin
   iMes := StrToInt(_Right(sAnoMes,2));
   iAno := StrToInt(_Left(sAnoMes,4));
   If iMes = 1 Then
   Begin
      iMes := 13;
      Dec(iAno);
   End Else
      Dec(iMes);
   Result := IntToStr(iAno)+PreencheZeros(IntToStr(iMes),2);
End;

Function SituacaoFuncional(sSituac, sCodSituacTCM: String): String;
Begin
   If (sSituac = '1') And (sCodSituacTCM = '10') Then
      Result := 'EFETIVO/COMISSIONADO'
   Else Begin
      Try
         Result := Pesquisa(sCodSituacTCM,'TABSITUACOESTCM','CODIGO','DESCRICAO','');
      Except
         Result := '';
      End;
   End;         
End;

Function DescParentescoDependete(sCodigo: String): String;
Begin
   Result := '';
   If sCodigo = '1' Then
      Result := 'FILHO(A)'
   Else If sCodigo = '1' Then
      Result := 'C‘NJUGE'
   Else
      Result := 'OUTROS';
End;

Function CentralizaForm_Horizontal(iLargura: Integer): Integer;
Var
   x: Extended;
begin
   x := (glb_iWidth-iLargura)/2;
   Result := Inteiro(x);
End;

Function CentralizaForm_Vertical(iAltura: Integer): Integer;
Var
   x: Extended;
begin
   x := (glb_iHeight-iAltura)/2;
   Result := Inteiro(x-38);
End;

Function QuantRegistros(sPesquisa,sCampo,sTabela: String): Integer;
Var
   oQry: TQuery;
Begin
   Screen.Cursor:= crHourGlass;
   oQry := TQuery.Create(Nil);
   oQry.DatabaseName:= glb_sAlias;
   oQry.SQL.Add('SELECT '+sCampo);
   oQry.SQL.Add('FROM '+sTabela);
   oQry.SQL.Add('WHERE '+sCampo+' = :sTexto');
   oQry.ParamByName('sTexto').Value := sPesquisa;
   oQry.Open;
   Result := oQry.RecordCount;
   oQry.Free;
   Screen.Cursor:= crDefault;
End;

Function ExtraiBarrasDate(dData: TDate): String;
Var
   sDataTemp: String[10];
Begin
   sDataTemp := DateToStr(dData);
   If (EmptyData(DateToStr(dData))) Or
      (dData < StrToDate('01/01/1900')) Then
   Begin
      Result := '00000000';
      Exit;
   End;
   sDataTemp:= DateToStr(dData);
   Result   := _Left(sDataTemp,2)+Copy(sDataTemp,4,2)+_Right(sDataTemp,4);
End;

Function ExtraiPontosHora(dHora: TTime): String;
Var
   sHoraTemp: String[8];
Begin
   sHoraTemp:= TimeToStr(dHora);
   Result   := _Left(sHoraTemp,2)+Copy(sHoraTemp,4,2)+_Right(sHoraTemp,2);
End;

Function AnoMesMovimentacao(oTab: TClientDataSet; sMatric, sCodMovim: String): String;
Begin
   Result := '';
   If oTab.FindKey([sMatric,sCodMovim]) Then
      Result := oTab.FieldByName('DataMovimento').AsString;
End;

Function InverteAnoMes(sData, sOpcao: String): String;
Begin
   Result := '';
   If Trim(sData) = '' Then Exit;
   If sOpcao = '1' Then    // mm/aaaa
      Result := _Right(sData,4)+_Left(sData,2)  // aaaa/mm
   Else                    // aaaa/mm
      Result := _Right(sData,2)+_Left(sData,4); // mm/aaaa
End;

Procedure DelLanMovimINSS(sMatric,sLancto: String; oTbMovim: TTable);
Var
   dDtMovDel : TDate;
   oTbFunc   : TTable;
   oQryMovim : TQuery;
Begin
   oQryMovim:= TQuery.Create(Nil);
   oQryMovim.DatabaseName:= glb_sAlias;
   oQryMovim.SQL.Add('SELECT * FROM MOVIMINSS WHERE MATRICULA = :SMATRIC');
   oQryMovim.SQL.Add('ORDER BY DATAMOVIMENTO, LANCAMENTO');
   oQryMovim.ParamByName('SMATRIC').Value:= sMatric;
   oQryMovim.Open;
   oTbFunc  := TTable.Create(Nil);
   oTbFunc.DatabaseName:= glb_sAlias;
   oTbFunc.TableName:= 'CADFUNCIONARIOS';
   oTbFunc.IndexFieldNames:= '';
   oTbFunc.Open;
   Try
      dDtMovDel := otbMovim.FieldByName('DataMovimento').Value;
   Except
      dDtMovDel := 0;
   End;
   If dDtMovDel <> 0 Then
   Begin
     oTbFunc.FindKey([sMatric]);
     oTbFunc.Edit;
     If (otbMovim.FieldByName('CodSituacao').Value = '01') And
        (otbMovim.FieldByName('Readmissao').Value = 'S') Then
        oTbFunc.FieldByName('DtReAdmissao').AsString := '';
     If oQryMovim.RecordCount = 1 Then
        oTbFunc.FieldByName('CodSituacao').Value := '01'
     Else Begin
        oQryMovim.Locate('DATAMOVIMENTO;LANCAMENTO',VarArrayOf([dDtMovDel,sLancto]),[]);
        If oQryMovim.RecNo = oQryMovim.RecordCount Then   // ⁄ltimo Lancto
           oQryMovim.Prior                                // Volta p/ o anterior
        Else
           oQryMovim.Last;                                // Vai p/ o ˙ltimo
        oTbFunc.FieldByName('CodSituacao').Value := oQryMovim.FieldByName('CodSituacao').Value;
        oTbFunc.Post;
     End;
   End;
   oTbMovim.Delete;
   oQryMovim.Close;
   oQryMovim.Free;
   oTbFunc.Close;
   oTbFunc.Free;
End;

Function Validapis(Dado: String; lMsg: Boolean): Boolean;
{Testa se o n˙mero do pis È v·lido ou n„o}
var
   i, wsoma, Wm11, Wdv,wdigito : Integer;
begin
   Result := False;
   If Length(Trim(Dado)) <> 11 Then
   Begin
      If lMsg = True Then
         Mensagem('N∫ de PIS/PASEP inv·lido (Quant. de dÌgitos È diferente de 11) !','E r r o !!!');
      Exit;
   End;
   wdv := strtoint(copy(Dado, 11, 1));
   wsoma := 0;
   wm11 := 2;
   for i := 1 to 10 do
   begin
      wsoma := wsoma + (wm11 *strtoint(copy(Dado,11 - I, 1)));
      if wm11 < 9 then
         begin
           wm11 := wm11+1
         end
      else
         begin
           wm11 := 2;
         end;
   end;
   wdigito := 11 - (wsoma MOD 11);
   if wdigito > 9 then
      wdigito := 0;
   If wdv = wdigito then
      Result := true
   Else
      Result := false;
   If (Result=False) And (lMsg=True) Then
      Mensagem('N∫ de PIS/PASEP inv·lido !','E r r o !!!');
end;

Function QuantFuncComSalNoMes(oTab: TDataSet): Integer;
Begin
   Result := 0;
   oTab.First;
   While Not oTab.EOF Do
   Begin
      If oTab.FieldByName('TOTVENCIMENTOS').Value > 0 Then
         Result := Result + 1;
      oTab.Next;
   End;
End;

Function TiraAcentos(Texto: string ): string;
var
  Contar, Posicao: integer;
  Acentos, TiraAcentos: string;
begin
  Acentos    := '™∫Á«·‰‡„‚¡ƒ¿√¬ÈÎËÍ…À» ÌÔÏÓÕœÃŒÛˆÚıÙ”÷“’‘˙¸˘˚⁄‹Ÿ€-.|,¶/';
  TiraAcentos:= 'aocCaaaaaAAAAAeeeeEEEEiiiiIIIIoooooOOOOOuuuuUUUU      ';
  Result     := '';
  For Contar:=1 to Length(Texto) do
  begin
    Posicao:=Pos(Copy(Texto,Contar,1),Acentos);
    If Posicao = 0 then
       Result := Result + Copy(Texto,Contar,1)
    else
       Result := Result + Copy(TiraAcentos,Posicao,1);
  end;
end;

{
Procedure Reindexar(DataBase : TDatabase; Tabela : TTable);
var
   List : TStrings;
   i    : Integer;
begin
   try
     Database.Connected:=true;
   except
   Raise;
     Exit;
   end;
   List:=TStringList.create;
   session.GetTableNames(DataBase.aliasName, '', true, false,List);
   for i:= 0 to List.Count - 1 do
   begin
      if (Entidade2) then
         break;
      application.ProcessMessages;
      Tabela.close;
      Tabela.TableName:=List[i];
      Try
        Tabela.open;
        Check(dbiRegenIndexes(Tabela.Handle));
      except
      Raise;
      end;
   end;
   List.Free;
   Database.Connected:=false;
end;
}

{
Para executar a rotina vocÍ pode incluir quando sua aplicaÁ„o esta sendo iniciada
Adicionando a seguinte linha.
No evento oncreate do Datamodulo
Reindexar(Dados,Table1);
Dados nome sugerido ao componente Database e Table1 o componente inserido na aplicaÁ„o.
}

{
Procedure CalcGuiaPrevidencia(sAnoMes,sCCustos,sSetor: String;
   crAliqPatronal,crAliqSAT: Currency; mTbGuiaTemp: TDataSet);
Var
   oTbBCalcMes,
   oTbMovimINSS,
   oTbEventos   : TTable;
   oQryLancCalc,
   oQryLicMatern: TQuery;
   sCategEvento : String[2];
   crContribDescEmpreg1,
   crContribDescEmpreg2,
   crBCalcEmpregador1,
   crBCalcEmpregador2,
   crSalFamilia1,
   crSalFamilia2      : Currency;
   crSalLicMatern1,
   crSalLicMatern2,
   crValSAT1,
   crValSAT2,
   crValEmpresa1,
   crValEmpresa2      : Currency;
   sSituacao          : String[1];
   crValorTemp1,
   crValorTemp2        : Currency;
Begin
   Screen.Cursor := crHourGlass;
   crContribDescEmpreg1:=0;
   crContribDescEmpreg2:=0;
   crBCalcEmpregador1  :=0;
   crBCalcEmpregador2  :=0;
   crSalFamilia1       :=0;
   crSalFamilia2       :=0;
   crSalLicMatern1     :=0;
   crSalLicMatern2     :=0;
   crValSAT1           :=0;
   crValSAT2           :=0;
   crValEmpresa1       :=0;
   crValEmpresa2       :=0;
   oTbBCalcMes  := TTable.Create(Nil);
   oTbBCalcMes.DatabaseName := glb_sAlias;
   oTbBCalcMes.TableName      := 'BASESCALCULOS_MES';
   oTbBCalcMes.IndexFieldNames:= 'AnoMes;Matricula';
   oTbBCalcMes.Open;
   oTbMovimINSS := TTable.Create(Nil);
   oTbMovimINSS.DatabaseName := glb_sAlias;
   oTbMovimINSS.TableName     := 'MovimINSS';
   oTbMovimINSS.IndexFieldNames:='Matricula;DataMovimento';
   oTbMovimINSS.Open;
   oTbEventos   := TTable.Create(Nil);
   oTbEventos.DatabaseName   := glb_sAlias;
   oTbEventos.TableName       := 'VENCDESC';
   oTbEventos.IndexFieldNames := 'Codigo';
   oTbEventos.Open;
   oQryLancCalc := TQuery.Create(Nil);
   oQryLancCalc.DatabaseName := glb_sAlias;
   oQryLancCalc.SQL.Add('SELECT MATRICULA, CODVENCDESC, QUANTIDADE, VALOR');
   oQryLancCalc.SQL.Add('FROM LANCCALCULADOS1');
   oQryLancCalc.SQL.Add('WHERE (AnoMes = :sAnoMes)');
   oQryLancCalc.SQL.Add('ORDER BY CODVENCDESC,MATRICULA');
   oQryLancCalc.ParamByName('sAnoMes').Value:= sAnoMes;
   oQryLancCalc.Open;
   oQryLicMatern:= TQuery.Create(Nil);
   oQryLicMatern.DatabaseName:= glb_sAlias;
   oQryLicMatern.SQL.Add('SELECT MATRICULA, QUANTIDADE, VALOR');
   oQryLicMatern.SQL.Add('FROM CALCLICMATERNIDADE');
   oQryLicMatern.SQL.Add('WHERE ANOMES = :sANOMES');
   oQryLicMatern.ParamByName('SANOMES').Value := sAnoMes;
   oQryLicMatern.Open;
   While Not oQryLancCalc.EOF Do
   Begin
      If oTbBCalcMes.FindKey([sAnoMes,oQryLancCalc.FieldByName('Matricula').Value]) Then
      Begin
         sSituacao:= '2';
         If Not oTbBCalcMes.FieldByName('SITUACAO').IsNull Then
            sSituacao:= oTbBCalcMes.FieldByName('SITUACAO').Value;
         If oTbBCalcMes.FieldByName('CodCCusto').Value = sCCustos Then
         Begin
            If oTbEventos.FindKey([oQryLancCalc.FieldByName('CODVENCDESC').Value]) Then
            sCategEvento := '';
            If Not oTbEventos.FieldByName('CodCategoria').IsNull Then
               sCategEvento := oTbEventos.FieldByName('CodCategoria').Value;
            If (sCategEvento = '01') Or (sCategEvento = '08') Or (sCategEvento = '10') Then
            Begin
               Try
                  crValorTemp1 := oQryLancCalc.FieldByName('Valor').Value;
               Except
                  crValorTemp1 := 0;
               End;
               Try
                  crValorTemp2 := oTbBCalcMes.FieldByName('BCPrevidencia').Value;
               Except
                  crValorTemp2 := 0;
               End;
               If sSituacao = '1' Then
               Begin
                  crContribDescEmpreg1:= crContribDescEmpreg1 + crValorTemp1;
                  crBCalcEmpregador1  := crBCalcEmpregador1 + crValorTemp2;
               End Else
               Begin
                  crContribDescEmpreg2:= crContribDescEmpreg2 + crValorTemp1;
                  crBCalcEmpregador2  := crBCalcEmpregador2 + crValorTemp2;
               End;
            End Else
            If sCategEvento = '05' Then
            Begin
               Try
                  crValorTemp1 := oQryLancCalc.FieldByName('Valor').Value;
               Except
                  crValorTemp1 := 0;
               End;
               If sSituacao = '1' Then
                  crSalFamilia1 := crSalFamilia1 + crValorTemp1
               Else
                  crSalFamilia2 := crSalFamilia2 + crValorTemp1;
            End;
         End;
      End;
      oQryLancCalc.Next;
   End;
   crSalLicMatern1 := 0;
   crSalLicMatern2 := 0;
   If sAnoMes >= '200309' Then
   Begin
      oQryLicMatern.First;
      While Not oQryLicMatern.EOF Do
      Begin
         If (oTbBCalcMes.FindKey([sAnoMes,oQryLicMatern.FieldByName('Matricula').Value])) And
            (otbBCalcMes.FieldByName('CodCCusto').Value = sCCustos) Then
         Begin
            sSituacao:= '2';
            If Not oTbBCalcMes.FieldByName('SITUACAO').IsNull Then
               sSituacao:= oTbBCalcMes.FieldByName('SITUACAO').Value;
            If sSituacao = '1' Then
               crSalLicMatern1 := crSalLicMatern1 + oQryLicMatern.FieldByName('Valor').Value
            Else
               crSalLicMatern2 := crSalLicMatern2 + oQryLicMatern.FieldByName('Valor').Value;
         End;
         oQryLicMatern.Next;
      End;
   End;
   If (crBCalcEmpregador1+crBCalcEmpregador2+crContribDescEmpreg1+crContribDescEmpreg2) > 0 Then
   Begin
      mTbGuiaTemp.Append;
      mTbGuiaTemp.FieldByName('SETOR').Value           := sSetor;
      mTbGuiaTemp.FieldByName('CODCCUSTOS').Value      := sCCustos;
      mTbGuiaTemp.FieldByName('BCALCPREVIDENCIA1').Value:= crBCalcEmpregador1;
      mTbGuiaTemp.FieldByName('EMPREGADOS1').Value      := crContribDescEmpreg1;
      mTbGuiaTemp.FieldByName('SALFAMILIA1').Value      := crSalFamilia1;
      mTbGuiaTemp.FieldByName('LICMATERNIDADE1').Value  := crSalLicMatern1;
      mTbGuiaTemp.FieldByName('BCALCPREVIDENCIA2').Value:= crBCalcEmpregador2;
      mTbGuiaTemp.FieldByName('EMPREGADOS2').Value      := crContribDescEmpreg2;
      mTbGuiaTemp.FieldByName('SALFAMILIA2').Value      := crSalFamilia2;
      mTbGuiaTemp.FieldByName('LICMATERNIDADE2').Value  := crSalLicMatern2;
      If crAliqPatronal > 0 Then
      Begin
         crValSAT1     := Arredonda(mTbGuiaTemp.FieldByName('BCALCPREVIDENCIA1').Value*(crAliqSAT/100),2);
         crValEmpresa1 := Arredonda(mTbGuiaTemp.FieldByName('BCALCPREVIDENCIA1').Value*(crAliqPatronal/100),2);
         crValSAT2     := Arredonda(mTbGuiaTemp.FieldByName('BCALCPREVIDENCIA2').Value*(crAliqSAT/100),2);
         crValEmpresa2 := Arredonda(mTbGuiaTemp.FieldByName('BCALCPREVIDENCIA2').Value*(crAliqPatronal/100),2);
      End;
      mTbGuiaTemp.FieldByName('VALEMPRESA1').Value      := crValEmpresa1;
      mTbGuiaTemp.FieldByName('VALSAT1').Value          := crValSAT1;
      mTbGuiaTemp.FieldByName('VALEMPRESA2').Value      := crValEmpresa2;
      mTbGuiaTemp.FieldByName('VALSAT2').Value          := crValSAT2;
      mTbGuiaTemp.Post;
   End;
   oTbBCalcMes.Close;
   oTbMovimINSS.Close;
   oTbEventos.Close;
   oQryLancCalc.Close;
   oQryLicMatern.Close;
   oTbBCalcMes.Free;
   oTbMovimINSS.Free;
   oTbEventos.Free;
   oQryLancCalc.Free;
   oQryLicMatern.Free;
   Screen.Cursor := crDefault;
End;
}

Function ConvertBooleanToString(lValor: Boolean): String;
Begin
   Result := 'N';
   If lValor = Null Then Exit;
   Result := iIf(lValor=True,'S','N');
End;

Function DataPorExtenso(sData: String): String;
Begin
   Result := '';
   If EmptyData(sData) Then Exit;
   Result := _Left(sData,2)+' de '+Trim(NomeMes(StrToInt(Copy(sData,4,2))))+
             ' de '+_Right(sData,4);
End;

Function Maiusculas(sTexto: String): String;
var
  Contar, Posicao: integer;
  sMinusculas, sMaiusculas: string;
  sTextoConvertido: String;
Begin
  sTexto      := UpperCase(sTexto);
  sMinusculas := 'Á·‡„‚ÈËÍÌÛıÙ˙';
  sMaiusculas := '«¡¿√¬…» Õ”’‘⁄';
  sTextoConvertido:= '';
  For Contar:=1 to Length(sTexto) do
  begin
    Posicao:=Pos(Copy(sTexto,Contar,1),sMinusculas);
    If Posicao = 0 then
       sTextoConvertido := sTextoConvertido + Copy(sTexto,Contar,1)
    else
       sTextoConvertido := sTextoConvertido + Copy(sMaiusculas,Posicao,1);
  end;
  Result := sTextoConvertido;
End;

Function Minusculas(sTexto: String): String;
var
  Contar, Posicao: integer;
  sMinusculas, sMaiusculas: string;
Begin
  sTexto      := LowerCase(sTexto);
  sMaiusculas := '«¡¿√¬…» Õ”’‘⁄';
  sMinusculas := 'Á·‡„‚ÈËÍÌÛıÙ˙';
  For Contar:=1 to Length(sTexto) do
  begin
    Posicao:=Pos(Copy(sTexto,Contar,1),sMaiusculas);
    If Posicao = 0 then
       Result := Result + Copy(sTexto,Contar,1)
    else
       Result := Result + Copy(sMinusculas,Posicao,1);
  end;
End;

Function DescrOrdenDespesa(sCodigo: String): String;
Var
   oQryConfigPortDiarias: TQuery;
   sMatricOrdenDesp1,
   sMatricOrdenDesp2,
   sMatricOrdenDesp3: String[4];
   sDescrCargoOrdenDespesa1,
   sDescrCargoOrdenDespesa2,
   sDescrCargoOrdenDespesa3: String[25];
Begin
   Result := '';
   oQryConfigPortDiarias:= TQuery.Create(Nil);
   oQryConfigPortDiarias.DatabaseName:= glb_sAlias;
   oQryConfigPortDiarias.SQL.Add('SELECT * FROM ConfigPortDiarias');
   oQryConfigPortDiarias.Open;
   If sCodigo = '1' Then
      Result := oQryConfigPortDiarias.FieldByName('NomeOrdenDespesa1').Value+';'+
                oQryConfigPortDiarias.FieldByName('DescrCargoOrdenDespesa').Value
   Else
      Try
         Result := oQryConfigPortDiarias.FieldByName('NomeOrdenDespesa'+sCodigo).Value+';'+
                   oQryConfigPortDiarias.FieldByName('DescrCargoOrdenDespesa'+sCodigo).Value;
      Except
         Result := '';
      End;
   oQryConfigPortDiarias.Close;
   FreeAndNil(oQryConfigPortDiarias);
End;

Function QuantDiasEntreDatas(sData1,sData2: String): Integer;
Var
   xQtDias: Extended;
Begin
   Result := 0;
   If (EmptyData(sData1)) Or (EmptyData(sData2)) Then Exit;
   If (Not ValidData(sData1)) Or (Not ValidData(sData2)) Then Exit;
   If StrToDate(sData1) <= StrToDate(sData2) Then
   Begin
      xQtDias:= StrToDate(sData2)-StrToDate(sData1);
      Result := Inteiro(xQtDias+1);
   End;
End;

Function ValidaCGC(sNumero: String; bMsgErro: Boolean): Boolean;
Var
   iSoma,
   iConta,
   iDigito1,
   iDigito2: Integer;
Begin
   Result := True;
   If Empty(sNumero) then Exit;
   iSoma := 0;
   for iConta := 1 to 12 do
   begin
     if iConta < 5 then
       Inc(iSoma,StrToInt(Copy(sNumero,iConta,1))*(6-iConta))
     else
       Inc(iSoma,StrToInt(Copy(sNumero,iConta,1))*(14-iConta));
   end;
   iDigito1 := 11 - (iSoma mod 11);
   if iDigito1 > 9 then iDigito1 := 0;

   iSoma := 0;
   for iConta := 1 to 13 do
   begin
     if iConta < 6 then
       Inc(iSoma,StrToInt(Copy(sNumero,iConta,1))*(7-iConta))
     else
       Inc(iSoma,StrToInt(Copy(sNumero,iConta,1))*(15-iConta));
   end;
   iDigito2 := 11 - (iSoma mod 11);
   if iDigito2 > 9 then iDigito2 := 0;

   {Checa os dois dÌgitos}
   if (iDigito1 = StrToInt(Copy(sNumero,13,1))) and
      (iDigito2 = StrToInt(Copy(sNumero,14,1))) then
      Result := True
   else
      Result := False;
   If (Not Result) And (bMsgErro) Then
      Mensagem('C. G. C.  I n v · l i d o !','E r r o !!!');
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

Procedure SetIndice(oTab: TClientDataSet; oDbg: TDBGrid; wCol: Word; sFieldIndex: String; oCorColNomral,oCorColAtiva: TColor);
Var
   iConta: Integer;
   bmRegAtual: TBookmark;
Begin
   For iConta := 0 To oDbg.Columns.Count-1 Do
   Begin
      oDbg.Columns[iConta].Title.Font.Color:= oCorColNomral;
      oDbg.Columns[iConta].Title.Font.Style:= [fsBold];
   End;
   oTab.IndexFieldNames := sFieldIndex;
   oDbg.Columns[wCol].Title.Font.Color:= oCorColAtiva;
   oDbg.Columns[wCol].Title.Font.Style:= [fsBold];
End;

Function SalvaTransacao(oTab: TClientDataSet): Boolean;
Begin
   Result := True;
   oTab.Post;
   If oTab.ApplyUpdates(0) <> 0 Then
   Begin
      Mensagem('N„o foi possÌvel Gravar essa TransaÁ„o no Banco de Dados !','E r r o !!!');
      oTab.CancelUpdates;
      Result := False;
   End;
End;

Function MovimCCustosEncerado(sAnoMes,sCCustos: String): Boolean;
Var
   oQryProcessCCustos: TQuery;
Begin
   Result := False;
   oQryProcessCCustos:= TQuery.Create(Nil);
   oQryProcessCCustos.DatabaseName:= glb_sAlias;
   oQryProcessCCustos.SQL.Add('SELECT ENCERRADO FROM TabProcessCCustos'); 
   oQryProcessCCustos.SQL.Add('WHERE AnoMes = :sAnoMes AND CodCCustos = :sCCustos');
   oQryProcessCCustos.ParamByName('sAnoMes').Value := sAnoMes;
   oQryProcessCCustos.ParamByName('sCCustos').Value := sCCustos;
   Try
      oQryProcessCCustos.Open;
      If oQryProcessCCustos.RecordCount > 0 Then
         Result := (oQryProcessCCustos.FieldByName('Encerrado').Value='S');
   Finally
      oQryProcessCCustos.Close;
      oQryProcessCCustos.Free;
   End;         
End;

Function Valid_UF(sTexto: String): Boolean;
Begin
  Result := False;
  If Empty(sTexto) Then Exit;
  Result := Pos(UpperCase(sTexto),'AM_AP_AC_RR_RO_PA_TO_MA_PI_CE_RN_PB_PE_AL_SE_BA_GO_MG_ES_MT_MS_RJ_SP_PR_SC_RS')>0;
End;

Function DescrTipoMovimSituacao(sCodigo: String): String;
Begin
  If sCodigo = '0' Then Result := 'S/ EFEITO'
  Else If sCodigo = '1' Then Result := 'ADMISS√O/RETORNO'
  Else If sCodigo = '2' Then Result := 'DEMISS√O/AFASTAMENTO'
  Else Result := '';
End;

Function IncDecAnoData(sData,sIncDec: String): String;
Var
  iAno: Integer;
Begin
  Try
     iAno := StrToInt(RightStr(sData,4));
  Except
     iAno := 0;
  End;
  If iAno <> 0 Then
  Begin
     If sIncDec = '1' Then  // Incrementar
        Inc(iAno,1)
     Else
        Dec(iAno,1);
     Result := LeftStr(sData,6)+IntToStr(iAno);
  End Else
     Result := '';
End;

Procedure DestacaTitColuna(oDbgList: TDBGrid; iCol: Integer);
Var
   i: Integer;
Begin
   For i := 0 To oDbgList.Columns.Count - 1 Do
      oDbgList.Columns[i].Title.Font.Color := clWhite;
   oDbgList.Columns[iCol].Title.Font.Color := clYellow;
End;

Procedure AddInsconsistencia(sCCustos,sTexto,sTipo: String);
Begin
{
   With dmInconsistencias Do
   Begin
      mTbInsconsistencias.Append;
      mTbInsconsistencias.FieldByName('CODCCUSTOS').Value:= sCCustos;
      mTbInsconsistencias.FieldByName('DESCRICAO').Value := sTexto;
      mTbInsconsistencias.FieldByName('TIPO').Value      := sTipo;
      mTbInsconsistencias.Post;
   End;
}
End;

{
Procedure AtualizaTotEventosCCustos(sAnoMes,sMatric,sCCustos,sSituacao: String);
Var
   oQryAtualizaTotVDCC,
   oqryEventosCalc: TQuery;
   crValTemp1,
   crValTemp2: Currency;
Begin
   oQryAtualizaTotVDCC:= TQuery.Create(Nil);
   oQryAtualizaTotVDCC.DatabaseName:= glb_sAlias;
   oQryAtualizaTotVDCC.SQL.Add('UPDATE TotaisVencDesc SET Valor1 = Valor1 - :crVal1, Valor2 = Valor2 - :crVal2');
   oQryAtualizaTotVDCC.SQL.Add('WHERE (ANOMES = :sAnoMes) AND (CODCCUSTO=:sCCustos) AND (CODVENCDESC=:sCodVD)');
   oQryAtualizaTotVDCC.ParamByName('sAnoMes').Value := sAnoMes;
   oQryAtualizaTotVDCC.ParamByName('sCCustos').Value:= sCCustos;

   oqryEventosCalc:= TQuery.Create(Nil);
   oqryEventosCalc.DatabaseName:= glb_sAlias;
   oqryEventosCalc.SQL.Add('SELECT * FROM LANCCALCULADOS1');
   oqryEventosCalc.SQL.Add('WHERE (ANOMES = :sAnoMes) AND (Matricula = :sMatric)');
   oqryEventosCalc.ParamByName('sAnoMes').Value := sAnoMes;
   oqryEventosCalc.ParamByName('sMatric').Value:= sMatric;
   Try
      oqryEventosCalc.Open;
      While (Not oqryEventosCalc.EOF) Do
      Begin
        oQryAtualizaTotVDCC.ParamByName('sCodVD').Value := oqryEventosCalc.FieldByName('CodVencDesc').Value;
        oQryAtualizaTotVDCC.ParamByName('crVal1').Value := 0;
        oQryAtualizaTotVDCC.ParamByName('crVal2').Value := 0;
        If sSituacao = '1' Then
           oQryAtualizaTotVDCC.ParamByName('crVal1').Value:= oqryEventosCalc.FieldByName('Valor').Value
        Else
           oQryAtualizaTotVDCC.ParamByName('crVal2').Value:= oqryEventosCalc.FieldByName('Valor').Value;
        oQryAtualizaTotVDCC.ExecSQL;
        oqryEventosCalc.Next;
      End;
      oQryAtualizaTotVDCC.Close;
      oQryAtualizaTotVDCC.SQL.Clear;
      oQryAtualizaTotVDCC.SQL.Add('UPDATE TotaisVencDescDemitidos SET Valor1 = Valor1 - :crVal1, Valor2 = Valor2 - :crVal2');
      oQryAtualizaTotVDCC.SQL.Add('WHERE (ANOMES = :sAnoMes) AND (CODCCUSTO=:sCCustos) AND (CODVENCDESC=:sCodVD)');
      oQryAtualizaTotVDCC.ParamByName('sAnoMes').Value:= sAnoMes;
      oQryAtualizaTotVDCC.ParamByName('sCCustos').Value:= sCCustos;
      oqryEventosCalc.First;
      While (Not oqryEventosCalc.EOF) Do
      Begin
         oQryAtualizaTotVDCC.ParamByName('sCodVD').Value := oqryEventosCalc.FieldByName('CodVencDesc').Value;
         oQryAtualizaTotVDCC.ParamByName('crVal1').Value:= 0;
         oQryAtualizaTotVDCC.ParamByName('crVal2').Value:= 0;
         If sSituacao = '1' Then
            oQryAtualizaTotVDCC.ParamByName('crVal1').Value:= oqryEventosCalc.FieldByName('Valor').Value
         Else
            oQryAtualizaTotVDCC.ParamByName('crVal2').Value:= oqryEventosCalc.FieldByName('Valor').Value;
         oQryAtualizaTotVDCC.ExecSQL;
         oqryEventosCalc.Next;
      End;
   Finally
      oQryAtualizaTotVDCC.Close;
      oQryAtualizaTotVDCC.Free;
      oqryEventosCalc.Close;
      oqryEventosCalc.Free;
   End;
End;
}

Procedure SubtraiTotCCustos(sAnoMes,sMatric,sCodCCustos,sCodDepto,sEfetivo,sCodSituac: String);
Var
   oTbLanctoCalc: TTable;
Begin

   oTbLanctoCalc:= TTable.Create(Nil);
   oTbLanctoCalc.DatabaseName := glb_sAlias;
   oTbLanctoCalc.TableName := 'Lancamentos1';
   oTbLanctoCalc.IndexFieldNames := 'AnoMes;Matricula;CodVencDesc';

   Try
      Try
         oTbLanctoCalc.Open;
         otbLanctoCalc.FindKey([sAnoMes,sMatric]);
         While (Not otbLanctoCalc.EOF) And
               (otbLanctoCalc.FieldByName('AnoMes').Value = sAnoMes) And
               (otbLanctoCalc.FieldByName('Matricula').Value = sMatric) Do
         Begin
            AtualizaTotCCustos(sAnoMes,sCodCCustos,sCodDepto,otbLanctoCalc.FieldByName('CodVencDesc').Value,
                               sEfetivo,sCodSituac,otbLanctoCalc.FieldByName('Valor').Value,False);

            otbLanctoCalc.Next;
         End;
      Except
      End;
   Finally
      otbLanctoCalc.Close;
      FreeAndNil(otbLanctoCalc);
   End;

End;

Procedure AtualizaTotCCustos(sAnoMes,sCodCCustos,sCodDepto,sCodVD,sEfetivo,sCodSituacao: String;
   crValor: Currency; lAddEdit: Boolean);
Var
   oTbTotVDCCustos: TTable;
   oTbConfig      : TTable;
   iErro          : Integer;
Begin

   oTbTotVDCCustos:= TTable.Create(Nil);
   oTbTotVDCCustos.DatabaseName:= glb_sAlias;
   oTbTotVDCCustos.TableName := 'TotaisVencDesc';
   oTbTotVDCCustos.IndexFieldNames := 'AnoMes;CodCCusto;CodDepto;CodVencDesc';

   oTbConfig:= TTable.Create(Nil);
   oTbConfig.DatabaseName:= glb_sAlias;
   oTbConfig.TableName := 'Outros';
   oTbConfig.IndexFieldNames := '';

   Try
      Try
         oTbTotVDCCustos.Open;
         If Not oTbTotVDCCustos.FindKey([sAnoMes,sCodCCustos,sCodDepto,sCodVD]) Then
         Begin
            oTbTotVDCCustos.Append;
            oTbTotVDCCustos.FieldByName('AnoMes').Value     := sAnoMes;
            oTbTotVDCCustos.FieldByName('CodCCusto').Value  := sCodCCustos;
            oTbTotVDCCustos.FieldByName('CodDepto').Value   := sCodDepto;
            oTbTotVDCCustos.FieldByName('CodVencDesc').Value:= sCodVD;
            oTbTotVDCCustos.FieldByName('Valor1').Value     := 0;
            oTbTotVDCCustos.FieldByName('Valor2').Value     := 0;
         End Else
            oTbTotVDCCustos.Edit;
         If sEfetivo = '1' Then
         Begin
            If lAddEdit Then
               oTbTotVDCCustos.FieldByName('Valor1').Value:= oTbTotVDCCustos.FieldByName('Valor1').Value + crValor
            Else
               oTbTotVDCCustos.FieldByName('Valor1').Value:= oTbTotVDCCustos.FieldByName('Valor1').Value - crValor;
         End Else
         Begin
            If lAddEdit Then
               oTbTotVDCCustos.FieldByName('Valor2').Value:= oTbTotVDCCustos.FieldByName('Valor2').Value + crValor
            Else
               oTbTotVDCCustos.FieldByName('Valor2').Value:= oTbTotVDCCustos.FieldByName('Valor2').Value - crValor;
         End;
         oTbTotVDCCustos.Post;
      Except
         iErro := 1;
      End;
   Finally
      oTbTotVDCCustos.Close;
      FreeAndNil(oTbTotVDCCustos);
   End;

   Try
      oTbConfig.Open;
      If (iErro = 1) Or (sCodSituacao <> oTbConfig.FieldByName('CodSituacDemitido').Value) Then
      Begin
         Exit;
      End;
   Finally
      oTbConfig.Close;
      FreeAndNil(oTbConfig);
   End;

   oTbTotVDCCustos:= TTable.Create(Nil);
   oTbTotVDCCustos.DatabaseName:= glb_sAlias;
   oTbTotVDCCustos.TableName := 'TotaisVencDescDemitidos';
   oTbTotVDCCustos.IndexFieldNames := 'AnoMes;CodCCusto;CodDepto;CodVencDesc';

   Try
      Try
         oTbTotVDCCustos.Open;
         If Not oTbTotVDCCustos.FindKey([sAnoMes,sCodCCustos,sCodDepto,sCodVD]) Then
         Begin
            oTbTotVDCCustos.Append;
            oTbTotVDCCustos.FieldByName('AnoMes').Value     := sAnoMes;
            oTbTotVDCCustos.FieldByName('CodCCusto').Value  := sCodCCustos;
            oTbTotVDCCustos.FieldByName('CodDepto').Value   := sCodDepto;
            oTbTotVDCCustos.FieldByName('CodVencDesc').Value:= sCodVD;
         End Else
            oTbTotVDCCustos.Edit;
         If sEfetivo = '1' Then
         Begin
            If lAddEdit Then
               oTbTotVDCCustos.FieldByName('Valor1').Value:= oTbTotVDCCustos.FieldByName('Valor1').Value + crValor
            Else
               oTbTotVDCCustos.FieldByName('Valor1').Value:= oTbTotVDCCustos.FieldByName('Valor1').Value - crValor;
         End Else
         Begin
            If lAddEdit Then
               oTbTotVDCCustos.FieldByName('Valor2').Value:= oTbTotVDCCustos.FieldByName('Valor2').Value + crValor
            Else
               oTbTotVDCCustos.FieldByName('Valor2').Value:= oTbTotVDCCustos.FieldByName('Valor2').Value - crValor;
         End;
         oTbTotVDCCustos.Post;
      Except
         iErro := 1;
      End;
   Finally
      oTbTotVDCCustos.Close;
      FreeAndNil(oTbTotVDCCustos);
   End;

End;

Function AliquotaFAP: Currency;
Var
   oTbConfig         : TTable;
Begin
   Result    := 0;
   oTbConfig := TTable.Create(Nil);
   oTbConfig.DatabaseName := glb_sAlias;
   oTbConfig.TableName := 'OUTROS';
   Try
      Try
        oTbConfig.Open;
        Result := oTbConfig.FieldByName('AliquotaFAP').Value;
      Except
      End;
   Finally
      oTbConfig.Close;
      FreeAndNil(oTbConfig);
   End;
End;

Function DataPagto(sAnoMes,sCCustos,sBanco: String): String;
Var
   oTbPagtoBanco: TTable;
Begin
   Result := '';
   oTbPagtoBanco := TTable.Create(Nil);
   oTbPagtoBanco.DatabaseName := glb_sAlias;
   oTbPagtoBanco.TableName := 'DatasDepositos';
   oTbPagtoBanco.IndexFieldNames := 'AnoMes;CodCCusto;CodBanco';
   Try
      Try
         oTbPagtoBanco.Open;
         If (oTbPagtoBanco.FindKey([sAnoMes,sCCustos,sBanco])) Or
            (oTbPagtoBanco.FindKey([sAnoMes,sCCustos])) Then
            Result := oTbPagtoBanco.FieldByName('DtProcessamento').AsString;
      Except
      End;
   Finally
      oTbPagtoBanco.Close;
      FreeAndNil(oTbPagtoBanco);
   End;
End;

Function PagtoBancoConta(sAnoMes,sMatric,sCCustos: String): String;
Var
   oQryDepositoBanco: TQuery;
Begin
   Result := '';
   oQryDepositoBanco := TQuery.Create(Nil);
   oQryDepositoBanco.DatabaseName := glb_sAlias;
   oQryDepositoBanco.SQL.Add('SELECT * FROM DepositosBancarios ');
   oQryDepositoBanco.SQL.Add('WHERE (ANOMES=:sAnoMes) AND (MATRICULA=:sMatric) AND (CODCCUSTO=:sCCustos)');
   oQryDepositoBanco.ParamByName('sAnoMes').Value := sAnoMes;
   oQryDepositoBanco.ParamByName('sMatric').Value := sMatric;
   oQryDepositoBanco.ParamByName('sCCustos').Value:= sCCustos;
   Try
      Try
         oQryDepositoBanco.Open;
         If oQryDepositoBanco.RecordCount > 0 Then
            Result := 'C/C: '+oQryDepositoBanco.FieldByName('NumConta').AsString+
                      ' / Banco: '+oQryDepositoBanco.FieldByName('CodBanco').AsString+
                      ' / Ag.: '+oQryDepositoBanco.FieldByName('Agencia').AsString;
      Except
      End;
   Finally
      oQryDepositoBanco.Close;
      FreeAndNil(oQryDepositoBanco);
   End;
End;

Procedure ExluiDepositoBancario(sAnoMes,sMatric: String);
Var
   oTbDepBancario: TTable;
Begin
   oTbDepBancario := TTable.Create(Nil);
   oTbDepBancario.DatabaseName := glb_sAlias;
   oTbDepBancario.TableName := 'DepositosBancarios';
   oTbDepBancario.IndexFieldNames := 'AnoMes;Matricula';
   Try
      Try
         oTbDepBancario.Open;
         If oTbDepBancario.FindKey([sAnoMes,sMatric]) Then
            oTbDepBancario.Delete;
      Except
      End;
   Finally
      oTbDepBancario.Close;
      FreeAndNil(oTbDepBancario);
   End;
End;

Procedure RecalcTotaisCCustos(sCodCCustos,sCodSituacDemitido: String);
Var
   sDepto,
   sCodVD    : String[3];
   crValor   : Currency;
   sMatricAnt: String[4];
   iQtFunc   : Integer;
   qryLanctosCalc : TQuery;
   tbTotVDCCusto  : TTable;
   tbTotVDCCusto2 : TTable;
   tbBasesCalculos: TTable;
Begin

   qryLanctosCalc := TQuery.Create(Nil);
   tbTotVDCCusto  := TTable.Create(Nil);
   tbTotVDCCusto2 := TTable.Create(Nil);
   tbBasesCalculos:= TTable.Create(Nil);

   qryLanctosCalc.DatabaseName := glb_sAlias;
   tbTotVDCCusto.DatabaseName  := glb_sAlias;
   tbTotVDCCusto2.DatabaseName := glb_sAlias;
   tbBasesCalculos.DatabaseName:= glb_sAlias;

   tbTotVDCCusto.TableName     := 'TotaisVencDesc';
   tbTotVDCCusto2.DatabaseName := 'TotaisVencDescDemitidos';
   tbBasesCalculos.DatabaseName:= 'BasesCalculos_Mes';

   tbTotVDCCusto.IndexFieldNames  := 'AnoMes;Matricula';
   tbTotVDCCusto2.IndexFieldNames := 'AnoMes;CodCCusto;CodDepto;CodVencDesc';
   tbBasesCalculos.IndexFieldNames:= 'AnoMes;CodCCusto;CodDepto;CodVencDesc';

   qryLanctosCalc.SQL.Add(
      'SELECT D.CodVencDesc, D.Valor,'+
      'D1.Matricula, D1.CodCCusto, D1.CodDepto, D1.Situacao,'+
      'D2.Tipo, D2.CodCategoria'
      );
   qryLanctosCalc.SQL.Add(
      'FROM LancCalculados1 D,'+
      'BasesCalculos_Mes D1,'+
      'VencDesc D2'
      );
   qryLanctosCalc.SQL.Add(
      'WHERE (D.ANOMES = :SANOMES) AND'+
      '(D1.Matricula = D.Matricula) AND'+
      '(D1.ANOMES = D.ANOMES) AND'+
      '(D1.CODCCUSTO = :SCCUSTOS) AND'+
      '(D2.Codigo = D.CodVencDesc)'
      );
   qryLanctosCalc.SQL.Add(
      'ORDER BY'+
      'D1.Matricula, d1.CodDepto, D.CodVencDesc'
      );
   qryLanctosCalc.ParamByName('SANOMES').Value  := glb_sAnoMesTrab;
   qryLanctosCalc.ParamByName('SCCUSTOS').Value := sCodCCustos;

   Try
      qryLanctosCalc.Open;

      tbTotVDCCusto.Open;
      tbTotVDCCusto2.Open;
      tbBasesCalculos.Open;

      While Not qryLanctosCalc.Eof Do
      Begin

         If Not tbBasesCalculos.FindKey([glb_sAnoMesTrab,
                                         qryLanctosCalc.FieldByName('Matricula').Value]) Then
         Begin
            qryLanctosCalc.Next;
            Continue;
         End;

         sDepto := qryLanctosCalc.FieldByName('CodDepto').Value;
         sCodVD := qryLanctosCalc.FieldByName('CodVencDesc').Value;
         crValor:= qryLanctosCalc.FieldByName('Valor').Value;
         If Not tbTotVDCCusto.FindKey([glb_sAnoMesTrab,sCodCCustos,sDepto,sCodVD]) Then
         Begin
            tbTotVDCCusto.Append;
            tbTotVDCCusto.FieldByName('AnoMes').Value     := glb_sAnoMesTrab;
            tbTotVDCCusto.FieldByName('CodCCusto').Value  := sCodCCustos;
            tbTotVDCCusto.FieldByName('CodDepto').Value   := sDepto;
            tbTotVDCCusto.FieldByName('CodVencDesc').Value:= sCodVD;
         End Else
            tbTotVDCCusto.Edit;
         If qryLanctosCalc.FieldByName('Situacao').Value = '1' Then
            tbTotVDCCusto.FieldByName('Valor1').Value := tbTotVDCCusto.FieldByName('Valor1').Value + crValor
         Else
            tbTotVDCCusto.FieldByName('Valor2').Value := tbTotVDCCusto.FieldByName('Valor2').Value + crValor;
         tbTotVDCCusto.Post;

         If tbBasesCalculos.FieldByName('CodSituacao').Value = sCodSituacDemitido Then
         Begin
            If Not tbTotVDCCusto2.FindKey([glb_sAnoMesTrab,sCodCCustos,sDepto,sCodVD]) Then
            Begin
               tbTotVDCCusto2.Append;
               tbTotVDCCusto2.FieldByName('AnoMes').Value     := glb_sAnoMesTrab;
               tbTotVDCCusto2.FieldByName('CodCCusto').Value  := sCodCCustos;
               tbTotVDCCusto2.FieldByName('CodDepto').Value   := sDepto;
               tbTotVDCCusto2.FieldByName('CodVencDesc').Value:= sCodVD;
            End Else
               tbTotVDCCusto2.Edit;
            If qryLanctosCalc.FieldByName('Situacao').Value = '1' Then
               tbTotVDCCusto2.FieldByName('Valor1').Value := tbTotVDCCusto2.FieldByName('Valor1').Value + crValor
            Else
               tbTotVDCCusto2.FieldByName('Valor2').Value := tbTotVDCCusto2.FieldByName('Valor2').Value + crValor;
            tbTotVDCCusto2.Post;
         End;

         qryLanctosCalc.Next;

      End;

   Finally

      tbTotVDCCusto.Close;
      tbTotVDCCusto2.Close;
      tbBasesCalculos.Close;
      qryLanctosCalc.Close;

      FreeAndNil(tbTotVDCCusto);
      FreeAndNil(tbTotVDCCusto2);
      FreeAndNil(tbBasesCalculos);
      FreeAndNil(qryLanctosCalc);

   End;

End;

Function UnidadeGestora(sCodCCustos,sCampoRet: String): String;
Var
   oQryUnidGestora,
   oQryUnidOrcament: TQuery;
   sCodUnidOrcament,
   sCodUnidGestora : String;
Begin

   oQryUnidGestora := TQuery.Create(Nil);
   oQryUnidGestora.DatabaseName:= glb_sAlias;
   oQryUnidOrcament:= TQuery.Create(Nil);
   oQryUnidOrcament.DatabaseName:= glb_sAlias;

   Try
      sCodUnidOrcament := Pesquisa(sCodCCustos,'CCustos','CodCCusto','CodUnidOrcament','');
      oQryUnidOrcament.SQL.Add('SELECT Cod_UG FROM UnidadesOrcamentarias WHERE Codigo = :sCodUnidOrcament');
      oQryUnidOrcament.ParamByName('sCodUnidOrcament').Value:= sCodUnidOrcament;
      Try
         oQryUnidOrcament.Open;
         sCodUnidGestora := oQryUnidOrcament.FieldByName('COD_UG').Value;
      Except
         sCodUnidGestora := '';
      End;

      oQryUnidGestora.SQL.Add('SELECT '+sCampoRet+' FROM UnidadesGestoras WHERE Codigo = :sCodUG');
      oQryUnidGestora.ParamByName('sCodUG').Value:= sCodUnidGestora;
      Try
         oQryUnidGestora.Open;
         Result := oQryUnidGestora.FieldByName(sCampoRet).AsString;
      Except
         Result := '';
      End;

      If UpperCase(sCampoRet) = 'DESCRICAODETALHADA' Then
      Begin
         If Result = '' Then
            Result := glb_sEmpresa;
      End;
   Finally
      oQryUnidGestora.Close;
      oQryUnidOrcament.Close;
      FreeAndNil(oQryUnidGestora);
      FreeAndNil(oQryUnidOrcament);
   End;

End;

Function gAnoMesImplantIPM: String;
Var
   oQryEmpresa: TQuery;
Begin
   Result := '';
   oQryEmpresa:= TQuery.Create(Nil);
   oQryEmpresa.DatabaseName:= glb_sAlias;
   oQryEmpresa.SQL.Add('SELECT AnoMesImplantIPM FROM Outros');
   Try
      oQryEmpresa.Open;
      Try
         if not oQryEmpresa.Fields[0].IsNull then
            Result := oQryEmpresa.Fields[0].Value;
      Except
         Result := '';
      End;
   Finally
      oQryEmpresa.Close;
      FreeAndNil(oQryEmpresa);
   End;
End;

Function gCCustosComDescIPM(sAnoMes,sCCustos: String): Boolean;
Var
   oQryLanctos: TQuery;
Begin
   Result := False;
   oQryLanctos:= TQuery.Create(Nil);
   oQryLanctos.DatabaseName:= glb_sAlias;
   oQryLanctos.SQL.Add('SELECT D.Valor1, D.Valor2, D2.Codigo As CodEvento');
   oQryLanctos.SQL.Add('FROM TotaisVencDesc D, VencDesc D2');
   oQryLanctos.SQL.Add('WHERE (D.AnoMes = :sAnoMes) AND ');
   oQryLanctos.SQL.Add('      (D.CodCCusto = :sCCustos) AND');
   oQryLanctos.SQL.Add('      (D2.Codigo = D.CodVencDesc) AND ');
   oQryLanctos.SQL.Add('      (D2.CodCategoria = :sCateg)');
   oQryLanctos.ParamByName('sAnoMes').Value := sAnoMes;
   oQryLanctos.ParamByName('sCCustos').Value:= sCCustos;
   oQryLanctos.ParamByName('sCateg').Value  := '10';  // IPM

   Try
      oQryLanctos.Open;
      Result := (oQryLanctos.RecordCount > 0);
   Finally
      oQryLanctos.Close;
      FreeAndNil(oQryLanctos);
   End;
End;

Function gAliquotaPatronal(sAnoMes,sCCustos: String): TStringList;
Var
   //sAnoMesImplantIPM: String[6];
   oQryCCustos,
   oQryEmpresa: TQuery;
   slTemp: TStringList;
Begin
   //sAnoMesImplantIPM := gAnoMesImplantIPM;

   slTemp := TStringList.Create;
   slTemp.Add('0');
   slTemp.Add('0');
   slTemp.Add('0');
   oQryCCustos := TQuery.Create(Nil);
   oQryCCustos.DatabaseName := glb_sAlias;
   oQryCCustos.SQL.Add('SELECT AliquotaPatronal, AliquotaSAT, Previdencia ');
   oQryCCustos.SQL.Add('FROM CCUSTOS WHERE CodCCusto = :sCCustos');
   oQryCCustos.ParamByName('sCCustos').Value:= sCCustos;
   oQryEmpresa := TQuery.Create(Nil);
   oQryEmpresa.DatabaseName := glb_sAlias;
   oQryEmpresa.SQL.Add('SELECT AliquotaFAP FROM OUTROS');
   Try
      oQryCCustos.Open;
      oQryEmpresa.Open;
      slTemp[0] := oQryCCustos.Fields[0].AsString;
      slTemp[1] := oQryCCustos.Fields[1].AsString;
      If oQryCCustos.Fields[2].AsString = '2' Then  // PrevidÍncia INSS
         slTemp[2] := oQryEmpresa.Fields[0].AsString; // AlÌquota FAP
   Finally
      oQryCCustos.Close;
      FreeAndNil(oQryCCustos);
      oQryEmpresa.Close;
      FreeAndNil(oQryEmpresa);
   End;
   If StrToCurr(slTemp[0]) = 0 Then
   Begin
      slTemp[1] := '0';
      slTemp[2] := '0';
   End;
   Result := slTemp;
End;

Function gCalcPrevPatronal(crBCPrevid,crAliqtPatronal,crAliqtSAT,crAliqtFAP: Currency): Currency;
Begin
   Result := 0;
   Try
      If crBCPrevid > 0 Then
      Begin
         If crAliqtPatronal > 0 Then
            Result := Arredonda((crBCPrevid*crAliqtPatronal)/100,2);
         If crAliqtSAT > 0 Then
            Result := Result + Arredonda((crBCPrevid*crAliqtSAT)/100,2);
         If crAliqtFAP > 0 Then
            Result := Result + Arredonda((crBCPrevid*crAliqtFAP)/100,2);
      End;
   Except
   End;
End;

function gTetoBC_INSS(sAnoMes: String; crBCPrevid: Currency): Currency;
var
   oQryAliquotaINSS: TQuery;
begin
   Result := 0;
   oQryAliquotaINSS := TQuery.Create(Nil);
   oQryAliquotaINSS.DatabaseName:= glb_sAlias;
   oQryAliquotaINSS.SQL.Add('SELECT ValFinal4 FROM TabDescINSS WHERE AnoMes = :sAnoMes');
   oQryAliquotaINSS.ParamByName('sAnoMes').Value:= sAnoMes;
   Try
      oQryAliquotaINSS.Open;
      Try
         If crBCPrevid >= oQryAliquotaINSS.Fields[0].Value Then
            Result := oQryAliquotaINSS.Fields[0].Value
         Else
            Result := crBCPrevid;
      Except
      End;
   Finally
      oQryAliquotaINSS.Close;
      FreeAndNil(oQryAliquotaINSS);
   End;
end;

procedure kListFiles(ListFiles: TStringList;
  const Extension: string = '*.*'; const Directory: string = '');
var
  rFile: TSearchRec;
  sPath: string;
  a: Integer;
begin

  if Directory = '' then
    sPath := ExtractFilePath(ParamStr(0))
  else
    sPath := Directory;

  if sPath[Length(sPath)] <> PathDelim then
    sPath := sPath + PathDelim;

  a := SysUtils.FindFirst(sPath+Extension, 0, rFile);

  try

    while a = 0 do
    begin
      ListFiles.Add(sPath+rFile.Name);
      a := SysUtils.FindNext(rFile);
    end;

  finally
    SysUtils.FindClose(rFile);
  end;

end;  // kListFiles

End.
