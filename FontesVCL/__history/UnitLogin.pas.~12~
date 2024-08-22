unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Loading, Vcl.Session, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    pLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    edtEmail: TEdit;
    Panel3: TPanel;
    edtSenha: TEdit;
    btnAcessar: TSpeedButton;
    TabUsuario: TFDMemTable;
    procedure btnAcessarClick(Sender: TObject);
  private
    procedure TerminateLogin(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UnitPrincipal, DataModule.Usuario;

procedure TFrmLogin.TerminateLogin(Sender: TObject);
begin
    TLoading.Hide;

    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    // Dados de acesso...
    TSession.ID_USUARIO := TabUsuario.FieldByName('id_usuario').AsInteger;
    TSession.EMAIL := TabUsuario.FieldByName('email').AsString;
    TSession.NOME := TabUsuario.FieldByName('nome').AsString;


    if NOT Assigned(FrmPrincipal) then
        Application.CreateForm(TFrmPrincipal, FrmPrincipal);

    FrmPrincipal.Show;
end;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
begin
    TLoading.Show(Self);

    TLoading.ExecuteThread(procedure
    begin
        Sleep(800);
        DmUsuario.Login(TabUsuario, edtEmail.Text, edtSenha.Text);
    end,
    TerminateLogin);
end;

end.
