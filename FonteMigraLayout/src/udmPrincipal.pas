unit udmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, DBClient, Provider, SqlExpr,
  DBTables, StrUtils, ExtCtrls, Grids, DBGrids, ComCtrls, Gauges, WideStrings,
  DBXInterbase, DBXFirebird;

type
  TdmPrincipal = class(TDataModule)
    DataSource1: TDataSource;
    spHabilitaTriggers: TSQLStoredProc;
    connectionGERA: TSQLConnection;
    qryMaxServidor: TSQLQuery;
    connectionLayOut: TSQLConnection;
    procedure SQLConnection1AfterConnect(Sender: TObject);
    procedure SQLConnection1BeforeDisconnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pb_HabilitaTriggers: Boolean;
    procedure Mensagem(sTexto, sCaption: String);
    Function Maiusculas(sTexto: String): String;
    function MaxIDServidor: Integer;
    procedure ListaMesTabela(ListaMes: TStringList);
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
   connectionLayOut.Connected := False;
end;

Function TdmPrincipal.Maiusculas(sTexto: String): String;
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

procedure TdmPrincipal.SQLConnection1AfterConnect(Sender: TObject);
begin

   if Not pb_HabilitaTriggers then exit;
   spHabilitaTriggers.Close;
   spHabilitaTriggers.Params[0].Value := 1;   // desabilita todas
   try
      try
         spHabilitaTriggers.ExecProc;
         spHabilitaTriggers.Close;
         spHabilitaTriggers.Params[0].Value := 3;   // desabilita todas
         try
            spHabilitaTriggers.ExecProc;
         except
            Mensagem('N„o foi PossÌvel Habilitar algumas Trigers do Banco ','E r r o !!!');
         end
      except
         Mensagem('N„o foi PossÌvel Desabilitar as Trigers do Banco ','E r r o !!!');
      end
   finally
      spHabilitaTriggers.Close;
   end;
end;

Procedure TdmPrincipal.Mensagem(sTexto: String; sCaption: String);
begin
   Application.MessageBox(PChar(sTexto),PChar(sCaption),mb_Ok);
end;

procedure TdmPrincipal.SQLConnection1BeforeDisconnect(Sender: TObject);
begin
   if Not pb_HabilitaTriggers then exit;
   try
      try
        spHabilitaTriggers.Close;
        spHabilitaTriggers.Params[0].Value := 2;   // Habilita todas
        try
           spHabilitaTriggers.ExecProc;
         except
            Mensagem('N„o foi PossÌvel Habilitar algumas Trigers do Banco ','E r r o !!!');
         end
      except
        Mensagem('N„o foi PossÌvel desabilitar as Trigers do Banco ','E r r o !!!');
      end;
   finally
      spHabilitaTriggers.Close;
   end;
end;

function TdmPrincipal.MaxIDServidor: Integer;
begin
  qryMaxServidor.Close;
  qryMaxServidor.Open;
  Result := qryMaxServidor.Fields[0].AsInteger;
end;

procedure TdmPrincipal.ListaMesTabela(ListaMes: TStringList);
var
  i: Integer;
  sTabelaName, sPrefixo: string;
  lTabelas: TStringList;
begin

  sPrefixo := 'SFP001';

  ListaMes.Clear;
  lTabelas := TStringList.Create;

  try

    connectionLayOut.GetTableNames(lTabelas);

    for i := 0 to lTabelas.Count - 1 do
    begin
      sTabelaName := lTabelas[i];
      if LeftStr(sTabelaName, 6) = sPrefixo then
      begin
             if sTabelaName = sPrefixo+'JAN' then ListaMes.Add('01-JANEIRO')
        else if sTabelaName = sPrefixo+'FEV' then ListaMes.Add('02-FEVEREIRO')
        else if sTabelaName = sPrefixo+'MAR' then ListaMes.Add('03-MAR«O')
        else if sTabelaName = sPrefixo+'ABR' then ListaMes.Add('04-ABRIL')
        else if sTabelaName = sPrefixo+'MAI' then ListaMes.Add('05-MAIO')
        else if sTabelaName = sPrefixo+'JUN' then ListaMes.Add('06-JUNHO')
        else if sTabelaName = sPrefixo+'JUL' then ListaMes.Add('07-JULHO')
        else if sTabelaName = sPrefixo+'AGO' then ListaMes.Add('08-AGOSTO')
        else if sTabelaName = sPrefixo+'SET' then ListaMes.Add('09-SETEMBRO')
        else if sTabelaName = sPrefixo+'OUT' then ListaMes.Add('10-OUTUBRO')
        else if sTabelaName = sPrefixo+'NOV' then ListaMes.Add('11-NOVEMBRO')
        else if sTabelaName = sPrefixo+'DEZ' then ListaMes.Add('12-DEZEMBRO');
      end;
    end;

    ListaMes.Sort();

  finally
    lTabelas.Free;
  end;

end;

end.
