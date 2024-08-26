unit DataModule.Pedido;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client,
  System.JSON, DataSet.Serialize, Vcl.Constants;

type
  TDmPedido = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar(MemTable: TFDMemTable; filtro: string);
    procedure ListarId(MemPed, MemItens: TFDMemTable; id_pedido: integer);
    procedure Inserir(id_usuario, id_cliente: integer; dt_pedido: TDate;
      vl_total: double; itens: TJSONArray);
    procedure Editar(id_pedido, id_cliente: integer; dt_pedido: TDate;
      vl_total: double; itens: TJSONArray);
    procedure Excluir(id_pedido: integer);

  end;

var
  DmPedido: TDmPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmPedido.DataModuleCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
  TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
end;

procedure TDmPedido.Listar(MemTable: TFDMemTable;
                           filtro: string);
var
    resp: IResponse;
begin
    resp := TRequest.New.BaseURL(BASE_URL)
                    .Resource('/pedidos')
                    .AddParam('filtro', filtro)
                    .Accept('application/json')
                    .Adapters(TDataSetSerializeAdapter.New(MemTable))
                    .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);
end;

procedure TDmPedido.ListarId(MemPed, MemItens: TFDMemTable;
                             id_pedido: integer);
var
    resp: IResponse;
    json: TJSONObject;
    itens: TJSONArray;
begin
    resp := TRequest.New.BaseURL(BASE_URL)
                    .Resource('/pedidos')
                    .ResourceSuffix(id_pedido.ToString)
                    .Accept('application/json')
                    //.Adapters(TDataSetSerializeAdapter.New(MemTable))
                    .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);

    json:= TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(resp.Content), 0) as TJSONObject;
    itens:= json.GetValue<TJSONArray>('itens');

    MemItens.LoadFromJSON(itens, false); // false para n�o destruir
    MemPed.LoadFromJSON(json);
end;

procedure TDmPedido.Inserir(id_usuario, id_cliente: integer;
                           dt_pedido: TDate;
                           vl_total: double;
                           itens: TJSONArray);
var
    resp: IResponse;
    json: TJsonObject;
begin
    try
        json := TJsonObject.Create;
        json.AddPair('id_usuario', id_usuario);
        json.AddPair('id_cliente', id_cliente);
        json.AddPair('dt_pedido', FormatDateTime('yyyy-mm-dd', dt_pedido));
        json.AddPair('vl_total', vl_total);
        json.AddPair('itens', itens);

        resp := TRequest.New.BaseURL(BASE_URL)
                        .Resource('/pedidos')
                        .AddBody(json.ToJSON)
                        .Accept('application/json')
                        .Post;

        if resp.StatusCode <> 201 then
            raise Exception.Create(resp.Content);
    finally
        FreeAndNil(json);
    end;
end;

procedure TDmPedido.Editar(id_pedido, id_cliente: integer;
                           dt_pedido: TDate;
                           vl_total: double;
                           itens: TJSONArray);
var
    resp: IResponse;
    json: TJsonObject;
begin
    try
        json := TJsonObject.Create;
        json.AddPair('id_cliente', id_cliente);
        json.AddPair('dt_pedido', FormatDateTime('yyyy-mm-dd', dt_pedido));
        json.AddPair('vl_total', vl_total);
        json.AddPair('itens', itens);

        resp := TRequest.New.BaseURL(BASE_URL)
                        .Resource('/pedidos')
                        .ResourceSuffix(id_pedido.ToString)
                        .AddBody(json.ToJSON)
                        .Accept('application/json')
                        .Put;

        if resp.StatusCode <> 200 then
            raise Exception.Create(resp.Content);
    finally
        FreeAndNil(json);
    end;
end;

procedure TDmPedido.Excluir(id_pedido: integer);
var
    resp: IResponse;
begin

  resp := TRequest.New.BaseURL(BASE_URL)
                        .Resource('/pedidos')
                        .ResourceSuffix(id_pedido.ToString)
                        .Accept('application/json')
                        .Delete;

  if resp.StatusCode <> 200 then
    raise Exception.Create(resp.Content);
end;

end.
