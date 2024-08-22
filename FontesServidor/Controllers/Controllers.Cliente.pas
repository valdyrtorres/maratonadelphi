unit Controllers.Cliente;

interface

uses Horse, System.SysUtils, System.JSON, DataModule.Global;

procedure RegistrarRotas;
procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure ListarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure RegistrarRotas;
begin
  THorse.Get('/clientes', Listar);
  THorse.Get('/clientes/:id_cliente', ListarId);
  THorse.Post('/clientes', Inserir);
  THorse.Put('/clientes', Editar);
  THorse.Delete('/clientes', Excluir);
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Dm: TDm;
  filtro: string;
begin
  try
    try
      Dm:= TDm.Create(nil);

      filtro:= Req.Query['filtro'];

      Res.Send<TJsonArray>(Dm.ClienteListar(filtro));
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
  id_cliente: integer;
begin
  try
    try
      Dm:= TDm.Create(nil);

      try
        id_cliente:= Req.Params['id_cliente'].ToInteger;
      except
        id_cliente:= 0;
      end;

      Res.Send<TJsonObject>(Dm.ClienteListarId(id_cliente));
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
  nome, endereco, complemento, bairro, cidade, uf: string;
begin
  try
    try
      Dm:= TDm.Create(nil);

      body:= Req.Body<TJSONObject>;

      nome:= body.GetValue<string>('nome', '');
      endereco:= body.GetValue<string>('endereco', '');
      complemento:= body.GetValue<string>('complemento', '');
      bairro:= body.GetValue<string>('bairro', '');
      cidade:= body.GetValue<string>('cidade', '');
      uf:= body.GetValue<string>('uf', '');

      Res.Send<TJsonObject>(Dm.ClienteInserir(nome, endereco, complemento,
                                               bairro, cidade, uf)).Status(201);
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
  id_cliente: integer;
  nome, endereco, complemento, bairro, cidade, uf: string;
begin
  try
    try
      //->> http://localhost:3000/clientes/10
      //--> Corpo: dados do cliente
      Dm:= TDm.Create(nil);

      try
        id_cliente:= Req.Params['id_cliente'].ToInteger;
      except
        id_cliente:= 0;
      end;

      body:= Req.Body<TJSONObject>;

      nome:= body.GetValue<string>('nome', '');
      endereco:= body.GetValue<string>('endereco', '');
      complemento:= body.GetValue<string>('complemento', '');
      bairro:= body.GetValue<string>('bairro', '');
      cidade:= body.GetValue<string>('cidade', '');
      uf:= body.GetValue<string>('uf', '');

      Res.Send<TJsonObject>(Dm.ClienteEditar(id_cliente, nome, endereco, complemento,
                                               bairro, cidade, uf));
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
  id_cliente: integer;
begin
  try
    try
      //->> http://localhost:3000/clientes/10
      Dm:= TDm.Create(nil);

      try
        id_cliente:= Req.Params['id_cliente'].ToInteger;
      except
        id_cliente:= 0;
      end;

      Res.Send<TJsonObject>(Dm.ClienteExcluir(id_cliente));
    except on ex:exception do
      Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
    end;
  finally
    FreeAndNil(Dm);
  end;
end;

end.
