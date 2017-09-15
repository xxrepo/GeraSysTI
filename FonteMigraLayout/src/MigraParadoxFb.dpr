program MigraParadoxFb;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmPrincipal},
  dmTabAliquotas in 'dmTabAliquotas.pas' {dmTabAliquotas_: TDataModule},
  udmPrincipal in 'udmPrincipal.pas' {dmPrincipal: TDataModule},
  udmTabDiversas in 'udmTabDiversas.pas' {dmTabDiversas: TDataModule},
  udmCadLanctos in 'udmCadLanctos.pas' {dmCadLanctos: TDataModule},
  DispTabMigrada in 'DispTabMigrada.pas' {frmDispTabMigrada},
  FolhaFuncs in 'FolhaFuncs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmTabAliquotas_, dmTabAliquotas_);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TdmTabDiversas, dmTabDiversas);
  Application.CreateForm(TdmCadLanctos, dmCadLanctos);
  Application.CreateForm(TfrmDispTabMigrada, frmDispTabMigrada);
  Application.Run;
end.
