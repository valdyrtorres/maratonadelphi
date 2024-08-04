unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Loading;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    pLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    edtEmail: TEdit;
    Panel2: TPanel;
    edtSenha: TEdit;
    Label4: TLabel;
    Panel3: TPanel;
    btnAcessar: TSpeedButton;
    procedure btnAcessarClick(Sender: TObject);
  private
    procedure TerminateLogin(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UnitPrincipal;

procedure TFrmLogin.TerminateLogin(Sender: TObject);
begin
  TLoading.Hide;

  if NOT Assigned(FrmPrincipal) then
    Application.CreateForm(TFrmPrincipal, FrmPrincipal);

  FrmPrincipal.Show;
end;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
begin
  TLoading.Show(Self);

  TLoading.ExecuteThread(procedure
  begin
    // Criar a requisicao para o servidor...
    Sleep(5000);
  end,
  TerminateLogin);

end;

end.
