unit DispTabMigrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TfrmDispTabMigrada = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Executa(NomeTabAntiga, NomeTabNova: string);
  end;

var
  frmDispTabMigrada: TfrmDispTabMigrada;

implementation

uses udmPrincipal;

{$R *.dfm}

Procedure TfrmDispTabMigrada.Executa(NomeTabAntiga, NomeTabNova: string);
begin
  Caption := NomeTabAntiga+' >>> '+NomeTabNova;
  ShowModal;
end;

procedure TfrmDispTabMigrada.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

end.
