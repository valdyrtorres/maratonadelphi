unit Controllers.Geral;

interface

uses Horse,
     System.SysUtils,
     System.JSON,
     DataModule.Global;

procedure RegistrarRotas;
procedure Pesquisa(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure RegistrarRotas;
begin
    THorse.Get('/pesquisas/:tipo_pesquisa', Pesquisa);
end;

procedure Pesquisa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    Dm: TDm;
    tipo_pesquisa, filtro: string;
begin
    try
        try
            Dm := TDm.Create(nil);

            //--> http://localhost:3000/pesquisas/produto?filtro=monitor

            tipo_pesquisa:= Req.Params['tipo_pesquisa'];
            filtro := Req.Query['filtro'];

            Res.Send<TJsonArray>(Dm.PesquisaGlobal(tipo_pesquisa, filtro));

        except on ex:exception do
            Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);
        end;
    finally
        FreeAndNil(Dm);
    end;
end;


end.
