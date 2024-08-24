unit UnitPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Loading, Vcl.Navigation, UnitPedidoCad,
  DataModule.Pedido;

type
  TFrmPedido = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    Panel1: TPanel;
    btnExcluir: TSpeedButton;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    btnEditar: TSpeedButton;
    gridPedidos: TDBGrid;
    TabPedido: TFDMemTable;
    dsPedido: TDataSource;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    TabPedidoid_pedido: TIntegerField;
    TabPedidoid_usuario: TIntegerField;
    TabPedidoid_cliente: TIntegerField;
    TabPedidodt_pedido: TDateField;
    TabPedidovl_total: TFloatField;
    TabPedidonome: TStringField;
    TabPedidocidade: TStringField;
    TabPedidousuario: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridPedidosDblClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    bookmark: TBookmark;
    procedure Editar;
    procedure OpenCadPedido(id_pedido: integer);
    procedure RefreshPedidos;
    procedure TerminateBusca(Sender: TObject);
    procedure TerminateDelete(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

{$R *.dfm}

procedure TFrmPedido.btnBuscaClick(Sender: TObject);
begin
  RefreshPedidos;
end;

procedure TFrmPedido.btnExcluirClick(Sender: TObject);
begin
  if TabPedido.RecordCount = 0 then
    exit;

  if MessageDlg('Deseja excluir o pedido selecionado?', TMsgDlgType.mtConfirmation,
                [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
        TLoading.Show;
        TLoading.ExecuteThread(procedure
        begin
          //DmPedido.Excluir(TabPedido.FieldByName('id_cliente').AsInteger);
        end, TerminateDelete);
    end;
end;

procedure TFrmPedido.btnNovoClick(Sender: TObject);
begin
  OpenCadPedido(0)
end;

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmPedido := nil;
end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
  RefreshPedidos;
end;

procedure TFrmPedido.gridPedidosDblClick(Sender: TObject);
begin
  Editar;
end;

procedure TFrmPedido.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TFrmPedido.OpenCadPedido(id_pedido: integer);
begin
    TNavigation.ExecuteOnClose := RefreshPedidos;
    TNavigation.ParamInt := id_pedido;
    TNavigation.OpenModal(TFrmPedidoCad, FrmPedidoCad);
end;

procedure TFrmPedido.TerminateDelete(Sender: TObject);
begin
    TLoading.Hide;

    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    RefreshPedidos;
end;

procedure TFrmPedido.TerminateBusca(Sender: TObject);
begin
    TLoading.Hide;
    gridPedidos.DataSource := dsPedido;


    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    if bookmark <> nil then
        try
            gridPedidos.DataSource.DataSet.GotoBookmark(bookmark);
            bookmark := nil;
        except
        end;
end;

procedure TFrmPedido.RefreshPedidos;
begin
    TLoading.Show;

    TLoading.ExecuteThread(procedure
    begin
        sleep(800);

        // Acessar o servidor...
        gridPedidos.DataSource := nil;
        DmPedido.Listar(TabPedido, edtBusca.Text);
    end,
    TerminateBusca);

end;

procedure TFrmPedido.Editar;
begin
    if TabPedido.RecordCount = 0 then
        exit;

    bookmark := gridPedidos.DataSource.DataSet.GetBookmark;
    OpenCadPedido(TabPedido.FieldByName('id_pedido').AsInteger);
end;


end.
