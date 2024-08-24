unit DataModule.Pedido;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client,
  System.JSON;

type
  TDmPedido = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar(MemTable: TFDMemTable; filtro: string);
    procedure ListarId(MemTable: TFDMemTable; id_pedido: integer);
  end;

var
  DmPedido: TDmPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmPedido.Listar(MemTable: TFDMemTable;
                           filtro: string);
var
    resp: IResponse;
begin
    resp := TRequest.New.BaseURL('http://localhost:3000')
                    .Resource('/pedidos')
                    .AddParam('filtro', filtro)
                    .Accept('application/json')
                    .Adapters(TDataSetSerializeAdapter.New(MemTable))
                    .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);
end;

procedure TDmPedido.ListarId(MemTable: TFDMemTable;
                                     id_pedido: integer);
var
    resp: IResponse;
begin
    resp := TRequest.New.BaseURL('http://localhost:3000')
                    .Resource('/pedidos')
                    .ResourceSuffix(id_pedido.ToString)
                    .Accept('application/json')
                    .Adapters(TDataSetSerializeAdapter.New(MemTable))
                    .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);
end;


end.
