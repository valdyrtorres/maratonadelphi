unit DataModule.Cliente;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client,
  System.JSON;

type
  TDmCliente = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure ListarClientes(MemTable: TFDMemTable; filtro: string);
    procedure ListarClienteId(MemTable: TFDMemTable; id_cliente: integer);
    procedure Inserir(nome, endereco, complemento, bairro, cidade, uf: string);
    procedure Editar(id_cliente: integer; nome, endereco, complemento, bairro,
                     cidade, uf: string);
    procedure Excluir(id_cliente: integer);
  end;

var
  DmCliente: TDmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmCliente.DataModuleCreate(Sender: TObject);
begin
    TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
    TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
end;

procedure TDmCliente.ListarClientes(MemTable: TFDMemTable;
                                     filtro: string);
var
    resp: IResponse;
begin
    resp := TRequest.New.BaseURL('http://localhost:3000')
                    .Resource('/clientes')
                    .AddParam('filtro', filtro)
                    .Accept('application/json')
                    .Adapters(TDataSetSerializeAdapter.New(MemTable))
                    .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);
end;

procedure TDmCliente.ListarClienteId(MemTable: TFDMemTable;
                                     id_cliente: integer);
var
    resp: IResponse;
begin
    resp := TRequest.New.BaseURL('http://localhost:3000')
                    .Resource('/clientes')
                    .ResourceSuffix(id_cliente.ToString)
                    .Accept('application/json')
                    .Adapters(TDataSetSerializeAdapter.New(MemTable))
                    .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);
end;

procedure TDmCliente.Inserir(nome, endereco, complemento, bairro,
                             cidade, uf: string);
var
    resp: IResponse;
    json: TJsonObject;
begin
    try
        json := TJsonObject.Create;
        json.AddPair('nome', nome);
        json.AddPair('endereco', endereco);
        json.AddPair('complemento', complemento);
        json.AddPair('bairro', bairro);
        json.AddPair('cidade', cidade);
        json.AddPair('uf', uf);

        resp := TRequest.New.BaseURL('http://localhost:3000')
                        .Resource('/clientes')
                        .AddBody(json.ToJSON)
                        .Accept('application/json')
                        .Post;

        if resp.StatusCode <> 201 then
            raise Exception.Create(resp.Content);
    finally
        FreeAndNil(json);
    end;
end;

procedure TDmCliente.Editar(id_cliente: integer;
                            nome, endereco, complemento, bairro,
                            cidade, uf: string);
var
    resp: IResponse;
    json: TJsonObject;
begin
    try
        json := TJsonObject.Create;
        json.AddPair('nome', nome);
        json.AddPair('endereco', endereco);
        json.AddPair('complemento', complemento);
        json.AddPair('bairro', bairro);
        json.AddPair('cidade', cidade);
        json.AddPair('uf', uf);

        resp := TRequest.New.BaseURL('http://localhost:3000')
                        .Resource('/clientes')
                        .ResourceSuffix(id_cliente.ToString)
                        .AddBody(json.ToJSON)
                        .Accept('application/json')
                        .Put;

        if resp.StatusCode <> 200 then
            raise Exception.Create(resp.Content);
    finally
        FreeAndNil(json);
    end;
end;

procedure TDmCliente.Excluir(id_cliente: integer);
var
    resp: IResponse;
begin
    resp := TRequest.New.BaseURL('http://localhost:3000')
                    .Resource('/clientes')
                    .ResourceSuffix(id_cliente.ToString)
                    .Accept('application/json')
                    .Delete;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);

end;

end.
