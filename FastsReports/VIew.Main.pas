unit VIew.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrMain = class(TForm)
    btnEmpresas: TButton;
    Dados: TDBGrid;
    btnSalvar: TButton;
    btnPDF: TButton;
    procedure btnEmpresasClick(Sender: TObject);
    procedure DadosDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMain: TFrMain;

implementation

uses
  DmConnection;

{$R *.dfm}

procedure TFrMain.btnEmpresasClick(Sender: TObject);
begin
  DmConn.FDQLideres.Close;
  DmConn.DataSource.DataSet := DmConn.FDQLideres;

  Dados.DataSource := DmConn.DataSource;
  DmConn.FDQLideres.Open;
end;

procedure TFrMain.btnPDFClick(Sender: TObject);
begin
  DmConn.GerarPDF;
end;

procedure TFrMain.btnSalvarClick(Sender: TObject);
begin
  DmConn.SalvarRelatorio(
    'CLIENTES_POR_EMPRESA',
    'Clientes por empresa',
    'Relatório agrupado por líder de ginásio',
    DmConn.Report
  );

  ShowMessage('Relatório salvo no banco com sucesso.');
end;

procedure TFrMain.DadosDblClick(Sender: TObject);
var
  I: Integer;
  IdEmpresa: Integer;
begin
  DmConn.ShowReport;
end;

end.
