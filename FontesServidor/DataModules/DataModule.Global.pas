unit DataModule.Global;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client,

  DataSet.Serialize.Config, DataSet.Serialize,
  System.JSON, FireDAC.DApt, uMD5;

type
  TDm = class(TDataModule)
    Conn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConnBeforeConnect(Sender: TObject);
  private
    procedure CarregarConfigDB(Connection: TFDConnection);
  public
    function ClienteListar(filtro: string): TJsonArray;
    function ClienteListarId(id_cliente: integer): TJsonObject;
    function ClienteInserir(nome, endereco, complemento, bairro, cidade,
                            uf: string): TJsonObject;
    function ClienteEditar(id_cliente: integer; nome, endereco, complemento,
                          bairro, cidade, uf: string): TJsonObject;
    function ClienteExcluir(id_cliente: integer): TJsonObject;
    function ProdutoListar(filtro: string): TJsonArray;
    function UsuarioLogin(email, senha: string): TJsonObject;
    function PedidoEditar(id_pedido, id_cliente: integer; dt_pedido: string;
      vl_total: double; itens: TJSONArray): TJsonObject;
    function PedidoExcluir(id_pedido: integer): TJsonObject;
    function PedidoInserir(id_usuario, id_cliente: integer;
                           dt_pedido: string;
                           vl_total: double;
                           itens: TJSONArray): TJsonObject;
    function PedidoListar(filtro: string): TJsonArray;
    function PedidoListarId(id_pedido: integer): TJsonObject;
    function PesquisaGlobal(tipo_pesquisa, filtro: string): TJsonArray;
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDm.CarregarConfigDB(Connection: TFDConnection);
begin
    Connection.DriverName := 'SQLite';

    with Connection.Params do
    begin
        Clear;
        Add('DriverID=SQLite');

        // Mudar para sua pasta!!!!!!!!
        //Add('Database=D:\EasyPedido\FontesServidor\DB\banco.db');
        //Add('Database=C:\VALDIR\devcode\delphi\delphi12\projects\EasyPedido\FontesServidor\DB\banco.db');
        Add('Database=C:\Users\valdirtorres\devcode\delphi\delphi12\maratonadelphi\FontesServidor\DB\banco.db');
        Add('User_Name=');
        Add('Password=');
        Add('Port=');
        Add('Server=');
        Add('Protocol=');
        Add('LockingMode=Normal');
    end;
end;

procedure TDm.ConnBeforeConnect(Sender: TObject);
begin
    CarregarConfigDB(Conn);
end;

procedure TDm.DataModuleCreate(Sender: TObject);
begin
    TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
    TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
    Conn.Connected := true;
end;

function TDm.ClienteListar(filtro: string): TJsonArray;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('select *');
        qry.SQL.Add('from cliente');

        if filtro <> '' then
        begin
            qry.SQL.Add('where nome like :filtro');
            qry.ParamByName('filtro').Value := '%' + filtro + '%';
        end;

        qry.SQL.Add('order by nome');
        qry.Active := true;

        Result := qry.ToJSONArray;

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.ClienteListarId(id_cliente: integer): TJsonObject;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('select *');
        qry.SQL.Add('from cliente');
        qry.SQL.Add('where id_cliente = :id_cliente');
        qry.ParamByName('id_cliente').Value := id_cliente;
        qry.Active := true;

        Result := qry.ToJSONObject;

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.ClienteInserir(nome, endereco, complemento,
                            bairro, cidade, uf: string): TJsonObject;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('insert into cliente(nome, endereco, complemento,');
        qry.SQL.Add('bairro, cidade, uf)');
        qry.SQL.Add('values(:nome, :endereco, :complemento,');
        qry.SQL.Add(':bairro, :cidade, :uf);');
        qry.SQL.Add('select last_insert_rowid() as id_cliente');
        //  returning id_cliente

        qry.ParamByName('nome').Value := nome;
        qry.ParamByName('endereco').Value := endereco;
        qry.ParamByName('complemento').Value := complemento;
        qry.ParamByName('bairro').Value := bairro;
        qry.ParamByName('cidade').Value := cidade;
        qry.ParamByName('uf').Value := uf;
        qry.Active := true;

        Result := qry.ToJSONObject;

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.ClienteEditar(id_cliente: integer;
                           nome, endereco, complemento,
                           bairro, cidade, uf: string): TJsonObject;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('update cliente set nome=:nome, endereco=:endereco,');
        qry.SQL.Add('complemento=:complemento, bairro=:bairro, cidade=:cidade, uf=:uf');
        qry.SQL.Add('where id_cliente = :id_cliente');

        qry.ParamByName('id_cliente').Value := id_cliente;
        qry.ParamByName('nome').Value := nome;
        qry.ParamByName('endereco').Value := endereco;
        qry.ParamByName('complemento').Value := complemento;
        qry.ParamByName('bairro').Value := bairro;
        qry.ParamByName('cidade').Value := cidade;
        qry.ParamByName('uf').Value := uf;
        qry.ExecSQL;

        Result := TJSONObject.Create(TJsonPair.Create('id_cliente', id_cliente)); {"id_cliente": 123}

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.ClienteExcluir(id_cliente: integer): TJsonObject;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('delete from cliente');
        qry.SQL.Add('where id_cliente = :id_cliente');
        qry.ParamByName('id_cliente').Value := id_cliente;
        qry.ExecSQL;

        Result := TJSONObject.Create(TJsonPair.Create('id_cliente', id_cliente)); {"id_cliente": 123}

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.ProdutoListar(filtro: string): TJsonArray;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('select *');
        qry.SQL.Add('from produto');

        if filtro <> '' then
        begin
            qry.SQL.Add('where descricao like :filtro');
            qry.ParamByName('filtro').Value := '%' + filtro + '%';
        end;

        qry.SQL.Add('order by descricao');
        qry.Active := true;

        Result := qry.ToJSONArray;

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.UsuarioLogin(email, senha: string): TJsonObject;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('select id_usuario, nome, email');
        qry.SQL.Add('from usuario');
        qry.SQL.Add('where email = :email and senha = :senha');
        qry.ParamByName('email').Value := email;
        qry.ParamByName('senha').Value :=  SaltPassword(senha);
        qry.Active := true;

        Result := qry.ToJSONObject;

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.PedidoListar(filtro: string): TJsonArray;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('select p.*, c.nome, c.cidade, u.nome as usuario');
        qry.SQL.Add('from pedido p');
        qry.SQL.Add('join cliente c on (c.id_cliente = p.id_cliente)');
        qry.SQL.Add('join usuario u on (u.id_usuario = p.id_usuario)');

        if filtro <> '' then
        begin
            qry.SQL.Add('where c.nome like :filtro');
            qry.ParamByName('filtro').Value := '%' + filtro + '%';
        end;

        qry.SQL.Add('order by p.id_pedido desc');
        qry.Active := true;

        Result := qry.ToJSONArray;

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.PedidoListarId(id_pedido: integer): TJsonObject;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('select p.*, c.nome, c.cidade, u.nome as usuario');
        qry.SQL.Add('from pedido p');
        qry.SQL.Add('join cliente c on (c.id_cliente = p.id_cliente)');
        qry.SQL.Add('join usuario u on (u.id_usuario = p.id_usuario)');
        qry.SQL.Add('where p.id_pedido = :id_pedido');
        qry.ParamByName('id_pedido').Value := id_pedido;
        qry.Active := true;

        Result := qry.ToJSONObject;

        // tratamento dos itens...
        qry.Active := false;
        qry.SQL.Clear;
        qry.SQL.Add('select i.id_item, i.id_produto, p.descricao, i.qtd, i.vl_unitario, i.vl_total');
        qry.SQL.Add('from pedido_item i');
        qry.SQL.Add('join produto p on (p.id_produto = i.id_produto)');
        qry.SQL.Add('where i.id_pedido = :id_pedido');
        qry.ParamByName('id_pedido').Value := id_pedido;
        qry.Active := true;

        Result.AddPair('itens', qry.ToJSONArray);

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.PedidoInserir(id_usuario, id_cliente: integer;
                           dt_pedido: string;
                           vl_total: double;
                           itens: TJSONArray): TJsonObject;
var
    qry: TFDQuery;
    id_pedido, i: integer;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('insert into pedido(id_usuario, id_cliente, dt_pedido, vl_total)');
        qry.SQL.Add('values(:id_usuario, :id_cliente, :dt_pedido, :vl_total);');
        qry.SQL.Add('select last_insert_rowid() as id_pedido'); // SQLite...
        //qry.SQL.Add('returning id_pedido'); // Firebird...
        qry.ParamByName('id_usuario').Value := id_usuario;
        qry.ParamByName('id_cliente').Value := id_cliente;
        qry.ParamByName('dt_pedido').Value := dt_pedido;  //yyyy-mm-dd
        qry.ParamByName('vl_total').Value := vl_total;
        qry.Active := true;

        id_pedido:= qry.FieldByName('id_pedido').AsInteger;

        // Itens...
        for i := 0 to itens.Size - 1 do
        begin
          qry.SQL.Clear;
          qry.SQL.Add('insert into pedido_item(id_pedido, id_produto, qtd, vl_unitario, vl_total)');
          qry.SQL.Add('values(:id_pedido, :id_produto, :qtd, :vl_unitario, :vl_total);');
          qry.SQL.Add('select last_insert_rowid() as id_pedido'); // SQLite...

          qry.ParamByName('id_pedido').Value := id_pedido;
          qry.ParamByName('id_produto').Value := itens[i].GetValue<integer>('id_produto', 0);
          qry.ParamByName('qtd').Value := itens[i].GetValue<integer>('qtd', 0);  //yyyy-mm-dd
          //qry.ParamByName('vl_unitario').Value := itens[i].GetValue<integer>('vl_unitario', 0);
          //qry.ParamByName('vl_total').Value := itens[i].GetValue<integer>('vl_total', 0);

          qry.ParamByName('vl_unitario').Value := itens[i].GetValue<double>('vl_unitario', 0);
          qry.ParamByName('vl_total').Value := itens[i].GetValue<double>('vl_total', 0);
          qry.ExecSQL;
        end;

        Result := TJSONObject.Create(TJSONPair.Create('id_pedido', id_pedido)); {"id_pedido": 123}

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.PedidoEditar(id_pedido, id_cliente: integer;
                          dt_pedido: string;
                          vl_total: double;
                          itens: TJSONArray): TJsonObject;
var
    qry: TFDQuery;
    i: integer;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('update pedido set id_cliente=:id_cliente,');
        qry.SQL.Add('dt_pedido=:dt_pedido, vl_total=:vl_total');
        qry.SQL.Add('where id_pedido = :id_pedido');

        qry.ParamByName('id_pedido').Value := id_pedido;
        qry.ParamByName('id_cliente').Value := id_cliente;
        qry.ParamByName('dt_pedido').Value := dt_pedido;  //yyyy-mm-dd
        qry.ParamByName('vl_total').Value := vl_total;
        qry.ExecSQL;

        qry.SQL.Clear;
        qry.SQL.Add('delete from pedido_item ');
        qry.SQL.Add('where id_pedido = :id_pedido');
        qry.ParamByName('id_pedido').Value := id_pedido;
        qry.ExecSQL;

        // Itens...
        for i := 0 to itens.Size - 1 do
        begin
          qry.SQL.Clear;
          qry.SQL.Add('insert into pedido_item(id_pedido, id_produto, qtd, vl_unitario, vl_total)');
          qry.SQL.Add('values(:id_pedido, :id_produto, :qtd, :vl_unitario, :vl_total);');
          qry.SQL.Add('select last_insert_rowid() as id_pedido'); // SQLite...

          qry.ParamByName('id_pedido').Value := id_pedido;
          qry.ParamByName('id_produto').Value := itens[i].GetValue<integer>('id_produto', 0);
          qry.ParamByName('qtd').Value := itens[i].GetValue<integer>('qtd', 0);  //yyyy-mm-dd
          //qry.ParamByName('vl_unitario').Value := itens[i].GetValue<integer>('vl_unitario', 0);
          //qry.ParamByName('vl_total').Value := itens[i].GetValue<integer>('vl_total', 0);

          qry.ParamByName('vl_unitario').Value := itens[i].GetValue<double>('vl_unitario', 0);
          qry.ParamByName('vl_total').Value := itens[i].GetValue<double>('vl_total', 0);

          qry.ExecSQL;
        end;

        Result := TJSONObject.Create(TJSONPair.Create('id_pedido', id_pedido)); {"id_pedido": 123}

    finally
        FreeAndNil(qry);
    end;
end;

function TDm.PedidoExcluir(id_pedido: integer): TJsonObject;
var
    qry: TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Conn;

        qry.SQL.Add('delete from pedido_item');
        qry.SQL.Add('where id_pedido = :id_pedido');
        qry.ParamByName('id_pedido').Value := id_pedido;
        qry.ExecSQL;

        qry.SQL.Clear;
        qry.SQL.Add('delete from pedido');
        qry.SQL.Add('where id_pedido = :id_pedido');
        qry.ParamByName('id_pedido').Value := id_pedido;
        qry.ExecSQL;

        Result := TJSONObject.Create(TJsonPair.Create('id_pedido', id_pedido));

    finally
        FreeAndNil(qry);
    end;
end;

// tipo_pesquisa: produto, cliente, etc.
function TDm.PesquisaGlobal(tipo_pesquisa, filtro: string): TJsonArray;
begin
  if tipo_pesquisa = 'cliente' then
    Result:= ClienteListar(filtro)
  else if tipo_pesquisa = 'produto' then
    Result:= ProdutoListar(filtro)
  else
    raise Exception.Create('Tipo de pesquisa inv�lido');
end;

end.
