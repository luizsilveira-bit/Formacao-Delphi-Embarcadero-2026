program FastsReports;

uses
  Vcl.Forms,
  VIew.Main in 'VIew.Main.pas' {FrMain},
  DmConnection in 'DataModules\DmConnection.pas' {DmConn: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrMain, FrMain);
  Application.CreateForm(TDmConn, DmConn);
  Application.Run;
end.
