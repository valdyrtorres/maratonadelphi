unit DataModule.Global;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat, Data.DB, FireDAC.Comp.Client,
  DataSet.Serialize.Config, DataSet.Serialize, System.JSON, FireDAC.DApt;

type
  TDm = class(TDataModule)
    Conn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConnBeforeConnect(Sender: TObject);
  private
    procedure CarregarConfigDB(Connection: TFDConnection);

    { Private declarations }
  public
    { Public declarations }
    function ClienteListar(filtro: string): TJsonArray;
    function ClienteListarId(id_cliente: integer): TJsonObject;
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

    Add('Database=C:\VALDIR\devcode\delphi\delphi12\projects\EasyPedido\FontesServidor\DB\banco.db');

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
  Conn.Connected := True;
end;

function TDm.ClienteListar(filtro: string): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry:= TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('select *');
    qry.SQL.Add('from cliente');

    if filtro <> '' then
    begin
      qry.SQL.Add('where nome like :filtro');
      qry.ParamByName('filtro').Value := '%' + filtro + '%';
    end;

    qry.SQL.Add('order by nome');
    qry.Active := True;

    Result:= qry.ToJSONArray;

  finally
    FreeAndNil(qry);
  end;
end;

function TDm.ClienteListarId(id_cliente: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry:= TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('select *');
    qry.SQL.Add('from cliente');
    qry.SQL.Add('where id_cliente = :id_cliente');
    qry.ParamByName('id_cliente').Value := id_cliente;
    qry.Active := True;

    Result:= qry.ToJSONObject;

  finally
    FreeAndNil(qry);
  end;
end;

end.
