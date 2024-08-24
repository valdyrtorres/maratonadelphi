unit Controllers.Pedido;

interface

uses Horse,
     System.SysUtils,
     System.JSON,
     DataModule.Global;

procedure RegistrarRotas;
procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure ListarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure RegistrarRotas;
begin
    THorse.Get('/pedidos', Listar);
    THorse.Get('/pedidos/:id_pedido', ListarId);
    THorse.Post('/pedidos', Inserir);
    THorse.Put('/pedidos/:id_pedido', Editar);
    THorse.Delete('/pedidos/:id_pedido', Excluir);
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    Dm: TDm;
    filtro: string;
begin
    try
        try
            Dm := TDm.Create(nil);

            filtro := Req.Query['filtro'];

            Res.Send<TJsonArray>(Dm.PedidoListar(filtro));

        except on ex:exception do
            Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
        end;
    finally
        FreeAndNil(Dm);
    end;
end;

procedure ListarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    Dm: TDm;
    id_pedido: integer;
begin
    try
        try
            Dm := TDm.Create(nil);

            try
                id_pedido := Req.Params['id_pedido'].ToInteger;
            except
                id_pedido := 0;
            end;

            Res.Send<TJsonObject>(Dm.PedidoListarId(id_pedido));

        except on ex:exception do
            Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
        end;
    finally
        FreeAndNil(Dm);
    end;
end;

procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    Dm: TDm;
    body: TJSONObject;
    id_usuario, id_cliente: integer;
    dt_pedido: string;
    vl_total: double;
    itens: TJSONArray;
begin
    try
        try
            Dm := TDm.Create(nil);

            body := Req.Body<TJSONObject>;
            id_usuario := body.GetValue<integer>('id_usuario', 0);
            id_cliente := body.GetValue<integer>('id_cliente', 0);
            dt_pedido := body.GetValue<string>('dt_pedido', ''); // yyyy-mm-dd
            vl_total := body.GetValue<double>('vl_total', 0);
            itens := body.GetValue<TJSONArray>('itens');

            Res.Send<TJsonObject>(Dm.PedidoInserir(id_usuario, id_cliente,
                                                 dt_pedido, vl_total,
                                                 itens)).Status(201);

        except on ex:exception do
            Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
        end;
    finally
        FreeAndNil(Dm);
    end;
end;

procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    Dm: TDm;
    body: TJSONObject;
    id_pedido, id_cliente: integer;
    dt_pedido: string;
    vl_total: double;
    itens: TJSONArray;
begin
    try
        try
            //->> http://localhost:3000/pedidos/10
            //-->  Corpo: dados do pedido

            Dm := TDm.Create(nil);

            try
                id_pedido := Req.Params['id_pedido'].ToInteger;
            except
                id_pedido := 0;
            end;

            body := Req.Body<TJSONObject>;
            id_cliente := body.GetValue<integer>('id_cliente', 0);
            dt_pedido := body.GetValue<string>('dt_pedido', ''); // yyyy-mm-dd
            vl_total := body.GetValue<double>('vl_total', 0);
            itens := body.GetValue<TJSONArray>('itens');

            Res.Send<TJsonObject>(Dm.PedidoEditar(id_pedido, id_cliente,
                                                  dt_pedido, vl_total, itens));

        except on ex:exception do
            Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
        end;
    finally
        FreeAndNil(Dm);
    end;
end;

procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    Dm: TDm;
    id_pedido: integer;
begin
    try
        try
            //->> http://localhost:3000/pedidos/10

            Dm := TDm.Create(nil);

            try
                id_pedido := Req.Params['id_pedido'].ToInteger;
            except
                id_pedido := 0;
            end;

            Res.Send<TJsonObject>(Dm.PedidoExcluir(id_pedido));

        except on ex:exception do
            Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
        end;
    finally
        FreeAndNil(Dm);
    end;
end;

end.
