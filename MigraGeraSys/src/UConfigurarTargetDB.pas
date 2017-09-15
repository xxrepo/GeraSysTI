unit UConfigurarTargetDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmConfigurarTargetDB = class(TfrmPadraoSDI)
    lblTargetDB: TLabel;
    edTargetDB: TEdit;
    btnTargetDB: TButton;
    lblUsuario: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    lblSenha: TLabel;
    btnConectar: TButton;
    procedure btnTargetDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

var
  frmConfigurarTargetDB: TfrmConfigurarTargetDB;

implementation

{$R *.dfm}

uses URecursos, UConexaoTargetDB;

procedure TfrmConfigurarTargetDB.btnConectarClick(Sender: TObject);
begin
  ConfirmarProcesso;
  if dmConexaoTargetDB.ConectarTargetDB then
    MensagemInforme('Conexão', 'Conexão realizada com sucesso.');
end;

procedure TfrmConfigurarTargetDB.btnTargetDBClick(Sender: TObject);
var
  aFileName : TFileName;
begin
  if dmRecursos.SelecionarArquivoFDB(Self.Handle, aFileName) then
    edTargetDB.Text := aFileName;
end;

function TfrmConfigurarTargetDB.ConfirmarProcesso: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    gConfiguracao.WriteString('TargetDB', 'FileName', edTargetDB.Text);
    gConfiguracao.WriteString('TargetDB', 'UserName', edUsuario.Text);
    gConfiguracao.WriteString('TargetDB', 'Password', edSenha.Text);
    gConfiguracao.UpdateFile;

    aRetorno := True;
  finally
    Result := aRetorno;
  end;
end;

procedure TfrmConfigurarTargetDB.FormCreate(Sender: TObject);
begin
  inherited;
  edTargetDB.Text := gConfiguracao.ReadString('TargetDB', 'FileName', EmptyStr);
  edUsuario.Text  := gConfiguracao.ReadString('TargetDB', 'UserName', TARGET_DB_USER_NAME);
  edSenha.Text    := gConfiguracao.ReadString('TargetDB', 'Password', TARGET_DB_PASSWORD);
end;

initialization
  gFormularios.RegisterForm('frmConfigurarTargetDB', TfrmConfigurarTargetDB);

end.
