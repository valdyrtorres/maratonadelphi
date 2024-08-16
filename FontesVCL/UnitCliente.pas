unit UnitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation;

type
  TFrmCliente = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    Panel1: TPanel;
    btnAcessar: TSpeedButton;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    gridClientes: TDBGrid;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure OpenCadCliente(id_cliente: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses UnitClienteCad;

procedure TFrmCliente.OpenCadCliente(id_cliente: integer);
begin
    TNavigation.OpenModal(TFrmClienteCad, FrmClienteCad);
end;

procedure TFrmCliente.btnNovoClick(Sender: TObject);
begin
    OpenCadCliente(0);
end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmCliente := nil;
end;

end.
