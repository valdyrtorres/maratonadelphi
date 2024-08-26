program EasyPedido;

uses
  Vcl.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  Vcl.Loading in 'Utils\Vcl.Loading.pas',
  Vcl.Session in 'Utils\Vcl.Session.pas',
  Vcl.Navigation in 'Utils\Vcl.Navigation.pas',
  UnitPedido in 'UnitPedido.pas' {FrmPedido},
  UnitCliente in 'UnitCliente.pas' {FrmCliente},
  UnitClienteCad in 'UnitClienteCad.pas' {FrmClienteCad},
  DataModule.Cliente in 'DataModules\DataModule.Cliente.pas' {DmCliente: TDataModule},
  DataModule.Usuario in 'DataModules\DataModule.Usuario.pas' {DmUsuario: TDataModule},
  UnitPedidoCad in 'UnitPedidoCad.pas' {FrmPedidoCad},
  DataModule.Pedido in 'DataModules\DataModule.Pedido.pas' {DmPedido: TDataModule},
  UnitBusca in 'UnitBusca.pas' {FrmBusca},
  DataModule.Geral in 'DataModules\DataModule.Geral.pas' {DmGeral: TDataModule},
  Vcl.Constants in 'Utils\Vcl.Constants.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDmUsuario, DmUsuario);
  Application.CreateForm(TFrmPedidoCad, FrmPedidoCad);
  Application.CreateForm(TDmPedido, DmPedido);
  Application.CreateForm(TFrmBusca, FrmBusca);
  Application.CreateForm(TDmGeral, DmGeral);
  Application.Run;
end.
