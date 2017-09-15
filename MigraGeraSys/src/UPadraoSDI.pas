unit UPadraoSDI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPadraoSDI = class(TForm)
    btnConfirmar: TButton;
    btnCancelar: TButton;
    pnlTitulo: TPanel;
    pnlControle: TPanel;
    chkRotina: TCheckBox;
    procedure chkMarcarTodos(Sender: TObject);
    procedure chkDesmarcarTodos(Sender: TObject);
    procedure chkInverterTodos(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MarcarTodos;

    function ConfirmarProcesso : Boolean; virtual;
  end;

var
  frmPadraoSDI: TfrmPadraoSDI;

implementation

{$R *.dfm}

uses URecursos;

procedure TfrmPadraoSDI.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPadraoSDI.btnConfirmarClick(Sender: TObject);
begin
  if ConfirmarProcesso then
    ModalResult := mrOk;
end;

procedure TfrmPadraoSDI.chkDesmarcarTodos(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
    if (Self.Components[I] is TCheckBox) then
      if ( Sender <> Self.Components[I] ) then
        if TCheckBox(Self.Components[I]).Enabled then
          TCheckBox(Self.Components[I]).Checked := False;
end;

procedure TfrmPadraoSDI.chkInverterTodos(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
    if (Self.Components[I] is TCheckBox) then
      if ( Sender <> Self.Components[I] ) then
        if TCheckBox(Self.Components[I]).Enabled then
          TCheckBox(Self.Components[I]).Checked := not TCheckBox(Self.Components[I]).Checked;
end;

procedure TfrmPadraoSDI.chkMarcarTodos(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
    if (Self.Components[I] is TCheckBox) then
      if ( Sender <> Self.Components[I] ) then
        if TCheckBox(Self.Components[I]).Enabled then
          TCheckBox(Self.Components[I]).Checked := True;
end;

function TfrmPadraoSDI.ConfirmarProcesso: Boolean;
begin
  Result := True;
end;

procedure TfrmPadraoSDI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPadraoSDI.MarcarTodos;
begin

end;

end.
