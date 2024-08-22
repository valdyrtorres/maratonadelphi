unit UnitClienteCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, Vcl.Loading, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmClienteCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    edtNome: TEdit;
    Label1: TLabel;
    edtEndereco: TEdit;
    edtComplemento: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtBairro: TEdit;
    edtUF: TEdit;
    Label5: TLabel;
    edtCidade: TEdit;
    Label6: TLabel;
    TabClienteCad: TFDMemTable;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    procedure TerminateLoad(Sender: TObject);
    procedure TerminateSalvar(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClienteCad: TFrmClienteCad;

implementation

{$R *.dfm}

uses DataModule.Cliente;

procedure TFrmClienteCad.btnCancelarClick(Sender: TObject);
begin
    TNavigation.CloseAndCancel(Self);
end;

procedure TFrmClienteCad.TerminateSalvar(Sender: TObject);
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


procedure TFrmClienteCad.btnSalvarClick(Sender: TObject);
begin
    TLoading.Show;

    TLoading.ExecuteThread(procedure
    begin
        sleep(800);

        if TNavigation.ParamInt = 0 then
            DmCliente.Inserir(edtNome.Text, edtEndereco.Text, edtComplemento.Text,
                              edtBairro.Text, edtCidade.Text, edtUF.Text)
        else
            DmCliente.Editar(TNavigation.ParamInt, edtNome.Text, edtEndereco.Text,
                              edtComplemento.Text, edtBairro.Text, edtCidade.Text, edtUF.Text);
    end, TerminateSalvar);
end;

procedure TFrmClienteCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmClienteCad := nil;
end;

procedure TFrmClienteCad.TerminateLoad(Sender: TObject);
begin
    TLoading.Hide;

    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    edtNome.Text := TabClienteCad.FieldByName('nome').AsString;
    edtEndereco.Text := TabClienteCad.FieldByName('endereco').AsString;
    edtComplemento.Text := TabClienteCad.FieldByName('complemento').AsString;
    edtBairro.Text := TabClienteCad.FieldByName('bairro').AsString;
    edtCidade.Text := TabClienteCad.FieldByName('cidade').AsString;
    edtUF.Text := TabClienteCad.FieldByName('uf').AsString;
end;

procedure TFrmClienteCad.FormShow(Sender: TObject);
begin
    if TNavigation.ParamInt > 0 then
    begin
        lblTitulo.Caption := 'Editar Cliente';

        TLoading.Show;
        TLoading.ExecuteThread(procedure
        begin
            sleep(2000);
            DmCliente.ListarClienteId(TabClienteCad, TNavigation.ParamInt);
        end, TerminateLoad);
    end;
end;

end.
