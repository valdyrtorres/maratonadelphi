unit UnitBusca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, DataModule.Geral,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TExecuteOnClose = procedure(id: integer; descricao: string; extra: double) of object;

  TFrmBusca = class(TForm)
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    lblTitulo: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel3: TPanel;
    btnSelecionar: TSpeedButton;
    grid: TDBGrid;
    TabBusca: TFDMemTable;
    dsBusca: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
  private
    campo_id, campo_descricao, campo_extra: string;
    procedure SetupLayout;
    procedure RefreshBusca;
    procedure Selecionar;
    { Private declarations }
  public
    { Public declarations }
    tipo_pesquisa: string;
    ExecuteOnClose: TExecuteOnClose;
  end;

var
  FrmBusca: TFrmBusca;

implementation

{$R *.dfm}


procedure TFrmBusca.btnBuscaClick(Sender: TObject);
begin
  RefreshBusca;
end;

procedure TFrmBusca.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmBusca.btnSelecionarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TFrmBusca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  FrmBusca:= nil;
end;

procedure TFrmBusca.RefreshBusca;
begin
  DmGeral.PesquisaGlobal(TabBusca, tipo_pesquisa, edtbusca.text);
end;

procedure TFrmBusca.SetupLayout;
var
  col: TColumn;
begin
  grid.Columns.Clear;

  if tipo_pesquisa = 'cliente' then
  begin
    TabBusca.FieldDefs.Clear;
    TabBusca.FieldDefs.Add('id_cliente', ftInteger, 0, False);
    TabBusca.FieldDefs.Add('nome', ftString, 100, False);

    col:= grid.Columns.Add;
    col.FieldName:= 'id_cliente';
    col.Title.Caption:= 'Id. Cliente';
    col.width:= 100;

    col:= grid.Columns.Add;
    col.FieldName:= 'nome';
    col.Title.Caption:= 'Nome';
    col.width:= 550;

    campo_id:= 'id_cliente';
    campo_descricao:= 'nome';
    campo_extra:= 'id_cliente';

  end
  else
  if tipo_pesquisa = 'produto' then
  begin
    TabBusca.FieldDefs.Clear;
    TabBusca.FieldDefs.Add('id_produto', ftInteger, 0, False);
    TabBusca.FieldDefs.Add('descricao', ftString, 100, False);
    TabBusca.FieldDefs.Add('preco', ftCurrency, 0, False);

    col:= grid.Columns.Add;
    col.FieldName:= 'id_produto';
    col.Title.Caption:= 'Id. Produto';
    col.width:= 100;

    col:= grid.Columns.Add;
    col.FieldName:= 'descricao';
    col.Title.Caption:= 'Descri��o';
    col.width:= 500;

    col:= grid.Columns.Add;
    col.FieldName:= 'preco';
    col.Title.Caption:= 'Pre�o';
    col.width:= 100;

    campo_id:= 'id_produto';
    campo_descricao:= 'descricao';
    campo_extra:= 'preco';
  end;
end;

procedure TFrmBusca.FormShow(Sender: TObject);
begin
  SetupLayout;
  RefreshBusca;
end;

procedure TFrmBusca.Selecionar;
begin
  if TabBusca.RecordCount = 0 then
    exit;

  if Assigned(ExecuteOnClose) then
    ExecuteOnClose(TabBusca.FieldByName(campo_id).AsInteger,
                   TabBusca.FieldByName(campo_descricao).AsString,
                   TabBusca.FieldByName(campo_extra).AsFloat);

  close;
end;

procedure TFrmBusca.gridDblClick(Sender: TObject);
begin
  Selecionar;
end;

end.
