program MigraBancoLayout;

uses
  Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  udmPrincipal in 'udmPrincipal.pas' {dmPrincipal: TDataModule},
  dmTabAliquotas in 'dmTabAliquotas.pas' {dmTabAliquotas_: TDataModule},
  DispTabMigrada in 'DispTabMigrada.pas' {frmDispTabMigrada},
  udmTabDiversas in 'udmTabDiversas.pas' {dmTabDiversas: TDataModule},
  FolhaFuncs in 'FolhaFuncs.pas',
  udmCadLanctos in 'udmCadLanctos.pas' {dmCadLanctos: TDataModule},
  dmMovimento in 'dmMovimento.pas' {dtmMovimento: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdmTabAliquotas_, dmTabAliquotas_);
  Application.CreateForm(TdmTabAliquotas_, dmTabAliquotas_);
  Application.CreateForm(TfrmDispTabMigrada, frmDispTabMigrada);
  Application.CreateForm(TdmTabDiversas, dmTabDiversas);
  Application.CreateForm(TdmCadLanctos, dmCadLanctos);
  Application.Run;
end.
