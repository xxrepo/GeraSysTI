program MigraGeraSys;

uses
  MidasLib,
  Vcl.Forms,
  MyObserverInterface in 'src\MyObserverInterface.pas',
  FormFactoryU in 'src\FormFactoryU.pas',
  FuncoesFormulario in 'src\FuncoesFormulario.pas',
  URecursos in 'src\URecursos.pas' {dmRecursos: TDataModule},
  UConexaoTargetDB in 'src\UConexaoTargetDB.pas' {dmConexaoTargetDB: TDataModule},
  UPadraoSDI in 'src\UPadraoSDI.pas' {frmPadraoSDI},
  UMain in 'src\UMain.pas' {frmMain},
  UConfigurarTargetDB in 'src\UConfigurarTargetDB.pas' {frmConfigurarTargetDB},
  USourceDBInfoPublic in 'src\USourceDBInfoPublic.pas' {frmSourceDBInfoPublic},
  USourceDBInfoPublicTabelas in 'src\USourceDBInfoPublicTabelas.pas' {frmSourceDBInfoPublicTabelas},
  USourceDBFiorilli in 'src\USourceDBFiorilli.pas' {frmSourceDBFiorilli},
  UVersao in 'src\UVersao.pas',
  USourceDBFiorilliTabelas in 'src\USourceDBFiorilliTabelas.pas' {frmSourceDBFiorilliTabelas},
  ULimparDadosTargetDB in 'src\ULimparDadosTargetDB.pas' {frmLimparDadosTargetDB},
  USourceDBLayoutFB in 'src\USourceDBLayoutFB.pas' {frmSourceDBLayoutFB},
  USourceDBLayoutFBTabelas in 'src\USourceDBLayoutFBTabelas.pas' {frmSourceDBLayoutFBTabelas},
  USourceDBLayoutFBParametrizar in 'src\USourceDBLayoutFBParametrizar.pas' {frmSourceDBLayoutFBParametrizar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmRecursos, dmRecursos);
  Application.CreateForm(TdmConexaoTargetDB, dmConexaoTargetDB);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
