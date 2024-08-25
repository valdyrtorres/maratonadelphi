unit DataModule.Geral;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client,
  System.JSON;

type
  TDmGeral = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisaGlobal(MemTable: TFDMemTable; tipo_pesquisa,
                             filtro: string);
  end;

var
  DmGeral: TDmGeral;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmGeral.DataModuleCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
  TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
end;

procedure TDmGeral.PesquisaGlobal(MemTable: TFDMemTable;
                                  tipo_pesquisa, filtro: string);
var
    resp: IResponse;
begin
    resp := TRequest.New.BaseURL('http://localhost:3000')
                    .Resource('/pesquisas')
                    .ResourceSuffix(tipo_pesquisa)
                    .AddParam('filtro', filtro)
                    .Accept('application/json')
                    .Adapters(TDataSetSerializeAdapter.New(MemTable))
                    .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);
end;


end.
