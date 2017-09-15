program MigraParadoxFb2;

uses
  Forms,
  Principal2 in 'Principal2.pas' {Form1},
  udmPrincipal in 'udmPrincipal.pas' {dmPrincipal: TDataModule},
  FolhaFuncs in 'FolhaFuncs.pas',
  VarGlobais in 'VarGlobais.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
