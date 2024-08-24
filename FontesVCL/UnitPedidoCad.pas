unit UnitPedidoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Navigation;

type
  TFrmPedidoCad = class(TForm)
    lblTitulo: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    edtNome: TEdit;
    TabPedidoCad: TFDMemTable;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedidoCad: TFrmPedidoCad;

implementation

{$R *.dfm}

procedure TFrmPedidoCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.CloseAndCancel(Self);
end;

end.
