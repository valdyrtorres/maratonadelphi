unit DataModule.Usuario;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D, DataSet.Serialize.Adapter.RESTRequest4D,
  FireDAC.Comp.Client, System.JSON;

type
  TDmUsuario = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure Login(MemTable: TFDMemTable;
                    email, senha: string);
  end;

var
  DmUsuario: TDmUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmUsuario.DataModuleCreate(Sender: TObject);
begin
    TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
    TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
end;

procedure TDmUsuario.Login(MemTable: TFDMemTable;
                           email, senha: string);
var
    resp: IResponse;
    json: TJsonObject;
begin
    try
        json := TJsonObject.Create;
        json.AddPair('email', email);
        json.AddPair('senha', senha);

        resp := TRequest.New.BaseURL('http://localhost:3000')
                        .Resource('/usuarios/login')
                        .AddBody(json.ToJSON)
                        .Accept('application/json')
                        .Adapters(TDataSetSerializeAdapter.New(MemTable))
                        .Post;

        if resp.StatusCode <> 200 then
            raise Exception.Create(resp.Content);
    finally
        FreeAndNil(json);
    end;
end;

end.
