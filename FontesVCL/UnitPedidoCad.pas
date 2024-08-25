unit UnitPedidoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Navigation, vcl.Loading, DataModule.Pedido, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.Session, DataSet.Serialize,
  Vcl.Imaging.pngimage, UnitBusca;

type
  TFrmPedidoCad = class(TForm)
    lblTitulo: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    edtIdcliente: TEdit;
    edtCliente: TEdit;
    dtPedido: TDateTimePicker;
    Label1: TLabel;
    TabPedidoCad: TFDMemTable;
    TabPedidoCadid_pedido: TIntegerField;
    TabPedidoCadid_cliente: TIntegerField;
    TabPedidoCaddt_pedido: TDateField;
    TabPedidoCadvl_total: TFloatField;
    TabPedidoCadnome: TStringField;
    TabPedidoCadcidade: TStringField;
    TabPedidoCadusuario: TStringField;
    gridItens: TDBGrid;
    TabItens: TFDMemTable;
    dsItens: TDataSource;
    TabItensid_item: TIntegerField;
    TabItensid_produto: TIntegerField;
    TabItensdescricao: TStringField;
    TabItensqtd: TIntegerField;
    TabItensvl_unitario: TFloatField;
    TabItensvl_total: TFloatField;
    lblTotal: TLabel;
    Label3: TLabel;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    pItem: TPanel;
    Panel4: TPanel;
    btnSalvarItem: TSpeedButton;
    Panel5: TPanel;
    btnCancelarItem: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel3: TPanel;
    btnNovo: TSpeedButton;
    Panel6: TPanel;
    btnEditar: TSpeedButton;
    Panel7: TPanel;
    btnExcluir: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    imgBuscaCli: TImage;
    imgBuscaProd: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure imgBuscaCliClick(Sender: TObject);
    procedure imgBuscaProdClick(Sender: TObject);
  private
    total: Double;
    procedure TerminateLoad(Sender: TObject);
    procedure CalcularTotal;
    procedure TerminateSalvar(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedidoCad: TFrmPedidoCad;

implementation

{$R *.dfm}

procedure TFrmPedidoCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.CloseAndCancel(Self);
end;

procedure TFrmPedidoCad.TerminateLoad(Sender: TObject);
begin
    TLoading.Hide;
    CalcularTotal;
    gridItens.DataSource:= dsItens;
    TabItens.Active:= True;

    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    edtIdCliente.Text := TabPedidoCad.FieldByName('id_cliente').AsString;
    edtCliente.Text := TabPedidoCad.FieldByName('nome').AsString;
    dtPedido.Date:= TabPedidoCad.FieldByName('dt_pedido').AsDateTime;
end;

procedure TFrmPedidoCad.btnCancelarItemClick(Sender: TObject);
begin
  TabItens.Cancel;
  pItem.Visible:= False;
end;

procedure TFrmPedidoCad.btnEditarClick(Sender: TObject);
begin
  if TabItens.RecordCount = 0 then
    exit;

  TabItens.Edit;
  pItem.Visible:= True;
end;

procedure TFrmPedidoCad.btnExcluirClick(Sender: TObject);
begin
  if TabItens.RecordCount = 0 then
    exit;

  TabItens.Delete;
  CalcularTotal;
end;

procedure TFrmPedidoCad.btnNovoClick(Sender: TObject);
begin
  TabItens.Append;
  pItem.Visible:= True;
end;

procedure TFrmPedidoCad.TerminateSalvar(Sender: TObject);
begin
    TLoading.Hide;

    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    TNavigation.Close(Self);
end;

procedure TFrmPedidoCad.btnSalvarClick(Sender: TObject);
begin
  TLoading.Show;

  TLoading.ExecuteThread(procedure
  begin
    //sleep(800);

    if TNavigation.ParamInt = 0 then
      DmPedido.Inserir(TSession.ID_USUARIO, strtoint(edtIdCliente.Text),
                 dtPedido.Date, total,
                 TabItens.ToJSONArray)
    else
      DmPedido.Editar(TNavigation.ParamInt, strtoint(edtIdCliente.Text),
                 dtPedido.Date, total,
                 TabItens.ToJSONArray);

  end, TerminateSalvar);
end;

procedure TFrmPedidoCad.btnSalvarItemClick(Sender: TObject);
begin
  if TabItens.State in [dsEdit, dsInsert] then
  begin
    TabItens.Post;
    CalcularTotal;
  end;

  pItem.Visible:= False;
end;

procedure TFrmPedidoCad.CalcularTotal;
begin
  total:= 0;

  if TabItens.RecordCount = 0 then
    exit;

  TabItens.First;
  while NOT TabItens.Eof do
  begin
    total:= total + TabItens.FieldByName('vl_total').AsFloat;
    TabItens.Next;
  end;

  lblTotal.Caption:= 'Total: ' + FormatFloat('R$ #,##0.00', total);

end;

procedure TFrmPedidoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FrmPedidoCad := nil;
end;

procedure TFrmPedidoCad.FormShow(Sender: TObject);
begin
    if TNavigation.ParamInt > 0 then
    begin
        lblTitulo.Caption := 'Editar Pedido';
        gridItens.DataSource:= nil;

        TLoading.Show;
        TLoading.ExecuteThread(procedure
        begin
            //sleep(1000);
            DmPedido.ListarId(TabPedidoCad, TabItens, TNavigation.ParamInt);
        end, TerminateLoad);
    end
    else
      TabItens.Active:= True;
end;

procedure TFrmPedidoCad.imgBuscaCliClick(Sender: TObject);
begin
  if NOT Assigned(FrmBusca) then
    Application.CreateForm(TFrmBusca, FrmBusca);

  FrmBusca.tipo_pesquisa:= 'cliente';
  FrmBusca.Show;
end;

procedure TFrmPedidoCad.imgBuscaProdClick(Sender: TObject);
begin
  if NOT Assigned(FrmBusca) then
    Application.CreateForm(TFrmBusca, FrmBusca);

  FrmBusca.tipo_pesquisa:= 'produto';
  FrmBusca.Show;
end;

end.
