program Servidor;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  Controllers.Cliente in 'Controllers\Controllers.Cliente.pas',
  DataModule.Global in 'DataModules\DataModule.Global.pas' {Dm: TDataModule},
  Controllers.Pedido in 'Controllers\Controllers.Pedido.pas',
  Controllers.Produto in 'Controllers\Controllers.Produto.pas',
  Controllers.Usuario in 'Controllers\Controllers.Usuario.pas',
  uMD5 in 'Utils\uMD5.pas',
  Controllers.Geral in 'Controllers\Controllers.Geral.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
