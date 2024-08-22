unit Controllers.Produto;

interface

uses Horse,
     System.SysUtils,
     System.JSON,
     DataModule.Global;

procedure RegistrarRotas;
procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure RegistrarRotas;
begin
    THorse.Get('/produtos', Listar);
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

            Res.Send<TJsonArray>(Dm.ProdutoListar(filtro));

        except on ex:exception do
            Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
        end;
    finally
        FreeAndNil(Dm);
    end;
end;


end.
