unit Controllers.Usuario;

interface

uses Horse,
     System.SysUtils,
     System.JSON,
     DataModule.Global;

procedure RegistrarRotas;
procedure Login(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure RegistrarRotas;
begin
    THorse.Post('/usuarios/login', Login);
end;

procedure Login(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    Dm: TDm;
    body, json: TJSONObject;
    email, senha: string;
begin
    try
        try
            Dm := TDm.Create(nil);

            body := Req.Body<TJSONObject>;
            email := body.GetValue<string>('email', '');
            senha := body.GetValue<string>('senha', '');

            json := Dm.UsuarioLogin(email, senha);

            if json.Size = 0 then
            begin
                Res.Send('E-mail ou senha inválida').Status(401);
                FreeAndNil(json);
            end
            else
                Res.Send<TJsonObject>(json);

        except on ex:exception do
            Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
        end;
    finally
        FreeAndNil(Dm);
    end;
end;

end.
