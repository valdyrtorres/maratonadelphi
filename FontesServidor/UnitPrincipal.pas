unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    lblServer: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Horse,
     Horse.Jhonson,
     Horse.CORS,
     Controllers.Cliente;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  THorse.Use(Jhonson());
  THorse.Use(CORS);

  Controllers.Cliente.RegistrarRotas;

  THorse.Listen(3000);
  lblServer.Caption := 'Servidor rodando na porta: ' +  Thorse.Port.ToString;
end;

end.
