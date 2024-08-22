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
  DataModule.Cliente in 'DataModules\DataModule.Cliente.pas' {DmCliente: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
