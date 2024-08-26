unit UnitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation,
  Vcl.Loading;

type
  TFrmCliente = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    Panel1: TPanel;
    btnExcluir: TSpeedButton;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    btnEditar: TSpeedButton;
    TabCliente: TFDMemTable;
    dsCliente: TDataSource;
    gridClientes: TDBGrid;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gridClientesDblClick(Sender: TObject);
  private
    bookmark: TBookmark;
    procedure OpenCadCliente(id_cliente: integer);
    procedure RefreshClientes;
    procedure TerminateBusca(Sender: TObject);
    procedure Editar;
    procedure TerminateDelete(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses UnitClienteCad, DataModule.Cliente;

procedure TFrmCliente.OpenCadCliente(id_cliente: integer);
begin
    TNavigation.ExecuteOnClose := RefreshClientes;
    TNavigation.ParamInt := id_cliente;
    TNavigation.OpenModal(TFrmClienteCad, FrmClienteCad);
end;

procedure TFrmCliente.TerminateDelete(Sender: TObject);
begin
    TLoading.Hide;

    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    RefreshClientes;
end;

procedure TFrmCliente.btnExcluirClick(Sender: TObject);
begin
    if TabCliente.RecordCount = 0 then
        exit;

    if MessageDlg('Deseja excluir o cliente selecionado?', TMsgDlgType.mtConfirmation,
                [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
        TLoading.Show;
        TLoading.ExecuteThread(procedure
        begin
            DmCliente.Excluir(TabCliente.FieldByName('id_cliente').AsInteger);
        end, TerminateDelete);
    end;
end;

procedure TFrmCliente.btnBuscaClick(Sender: TObject);
begin
    RefreshClientes;
end;

procedure TFrmCliente.btnNovoClick(Sender: TObject);
begin
    OpenCadCliente(0);
end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmCliente := nil;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
    RefreshClientes;
end;

procedure TFrmCliente.gridClientesDblClick(Sender: TObject);
begin
    Editar;
end;

procedure TFrmCliente.TerminateBusca(Sender: TObject);
begin
    TLoading.Hide;
    gridClientes.DataSource := dsCliente;
    //TabCliente.EnableControls;


    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    if bookmark <> nil then
        try
            gridClientes.DataSource.DataSet.GotoBookmark(bookmark);
            bookmark := nil;
        except
        end;
end;

procedure TFrmCliente.RefreshClientes;
begin
    TLoading.Show;

    TLoading.ExecuteThread(procedure
    begin
        //sleep(800);

        // Acessar o servidor...
        //TabCliente.DisableControls;
        gridClientes.DataSource := nil;
        DmCliente.ListarClientes(TabCliente, edtBusca.Text);
    end,
    TerminateBusca);

end;

procedure TFrmCliente.Editar;
begin
    if TabCliente.RecordCount = 0 then
        exit;

    bookmark := gridClientes.DataSource.DataSet.GetBookmark;
    OpenCadCliente(TabCliente.FieldByName('id_cliente').AsInteger);
end;

procedure TFrmCliente.btnEditarClick(Sender: TObject);
begin
    Editar;
end;

end.
