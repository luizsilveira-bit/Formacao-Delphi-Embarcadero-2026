unit DmConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxSmartMemo, frxClass, frxDBSet, frCoreClasses,
  frxExportBaseDialog, frxExportPDF, frxExportCSV,
  frxExportBaseImageSettingsDialog, frxExportXLS;

type
  TDmConn = class(TDataModule)
    FdConn: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDQLideres: TFDQuery;
    Report: TfrxReport;
    FDQPokemons: TFDQuery;
    dsLideres: TDataSource;
    FDQRelatorios: TFDQuery;
    PDFExport: TfrxPDFExport;
    dsPokemons: TDataSource;
    FDQGolpes: TFDQuery;
    FDQLocais: TFDQuery;
    FDQResumoGeral: TFDQuery;
    FDQGraficoLideres: TFDQuery;
    FDQGraficoTipos: TFDQuery;
    FDQGraficoComparativo: TFDQuery;
    FDQGraficoTiposLider: TFDQuery;
    FDQResumoLider: TFDQuery;
    FDQResumoGolpes: TFDQuery;
    FDQResumoLocais: TFDQuery;
    frxDBLideres: TfrxDBDataset;
    frxDBPokemons: TfrxDBDataset;
    frxDBGolpes: TfrxDBDataset;
    frxDBLocais: TfrxDBDataset;
    frxDBResumoGeral: TfrxDBDataset;
    frxDBGraficoLideres: TfrxDBDataset;
    frxDBGraficoTipos: TfrxDBDataset;
    frxDBGraficoComparativo: TfrxDBDataset;
    frxDBGraficosTiposLider: TfrxDBDataset;
    frxDBResumoLider: TfrxDBDataset;
    frxDBResumoGolpes: TfrxDBDataset;
    frxDBResumoLocais: TfrxDBDataset;
    CSVExport: TfrxCSVExport;
    XLSExport: TfrxXLSExport;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDQLideresBeforeOpen(DataSet: TDataSet);
    procedure FDQLideresAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure SalvarRelatorio(const ACodigo, ANome, ADescricao: string; ARelatorio: TfrxReport);
    function GetRelatorio(const ACodigo: string; ARelatorio: TfrxReport): Boolean;
    procedure ShowReport(ADesignMode: Boolean = False);
    procedure GerarPDF;
    procedure GerarCSV;
    procedure GerarXLS;
  end;

var
  DmConn: TDmConn;

implementation

uses
  frxChart;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDmConn.GetRelatorio(const ACodigo: string;
  ARelatorio: TfrxReport): Boolean;
var
  MemoryStream: TMemoryStream;
  Campo: TField;
begin
  Result := False;

  if not Assigned(ARelatorio) then
    raise Exception.Create('O relatório não foi informado.');

  FDQRelatorios.SQL.Text :=   'SELECT TEMPLATE_FR3 '     +
                              '  FROM RELATORIOS '       +
                              ' WHERE CODIGO = :CODIGO ' +
                              '   AND ATIVO = 1';

  FDQRelatorios.ParamByName('CODIGO').AsString := ACodigo;
  FDQRelatorios.Open;

  if FDQRelatorios.IsEmpty then
    Exit;

  Campo := FDQRelatorios.FieldByName('TEMPLATE_FR3');

  if Campo.IsNull then
    raise Exception.CreateFmt('O relatório "%s" não possui um template.', [ACodigo]);

  MemoryStream := TMemoryStream.Create;
  try
    TBlobField(Campo).SaveToStream(MemoryStream);
    MemoryStream.Position := 0;

    ARelatorio.LoadFromStream(MemoryStream);

    Result := True;
  finally
    MemoryStream.Free;
    FDQRelatorios.SQL.Text := EmptyStr;
    FDQRelatorios.Close;
  end;
end;

procedure TDmConn.DataModuleCreate(Sender: TObject);
var
  CaminhoBanco: string;
begin
  CaminhoBanco := ExtractFilePath(ParamStr(0)) + '..\..\DB\Database.db';
  CaminhoBanco := ExpandFileName(CaminhoBanco);

  if not FileExists(CaminhoBanco) then
    raise Exception.CreateFmt(
      'O banco de dados não foi encontrado.%s%s',
      [sLineBreak, CaminhoBanco]
    );

  FdConn.Close;
  FdConn.Params.Clear;
  FdConn.Params.Add('DriverID=SQLite');
  FdConn.Params.Add('Database=' + CaminhoBanco);
  FdConn.LoginPrompt := False;
  FdConn.Open;

  FdConn.ExecSQL('PRAGMA foreign_keys = ON');
end;

procedure TDmConn.SalvarRelatorio(const ACodigo, ANome, ADescricao: string;
  ARelatorio: TfrxReport);
var
  MemoryStream: TMemoryStream;
begin
  if not Assigned(ARelatorio) then
    raise Exception.Create('O relatório não foi informado.');

  MemoryStream := TMemoryStream.Create;
  try
    ARelatorio.SaveToStream(MemoryStream);
    MemoryStream.Position := 0;

    FDQRelatorios.SQL.Text := '''
                                UPDATE RELATORIOS
                                  SET NOME             = :NOME,
                                      DESCRICAO        = :DESCRICAO,
                                      TEMPLATE_FR3     = :TEMPLATE_FR3,
                                      DATA_ATUALIZACAO = CURRENT_TIMESTAMP
                                WHERE CODIGO           = :CODIGO
                              ''';

    FDQRelatorios.ParamByName('CODIGO').AsString    := ACodigo;
    FDQRelatorios.ParamByName('NOME').AsString      := ANome;
    FDQRelatorios.ParamByName('DESCRICAO').AsString := ADescricao;

    FDQRelatorios.ParamByName('TEMPLATE_FR3').LoadFromStream(MemoryStream, ftBlob);
    FDQRelatorios.ExecSQL;

    if FDQRelatorios.RowsAffected = 0 then
    begin
      MemoryStream.Position := 0;

      FDQRelatorios.Close;
      FDQRelatorios.SQL.Text :=
        'INSERT INTO RELATORIOS '                           +
        '  (CODIGO, NOME, DESCRICAO, TEMPLATE_FR3, ATIVO) ' +
        'VALUES '                                           +
        '  (:CODIGO, :NOME, :DESCRICAO, :TEMPLATE_FR3, 1)';

      FDQRelatorios.ParamByName('CODIGO').AsString    := ACodigo;
      FDQRelatorios.ParamByName('NOME').AsString      := ANome;
      FDQRelatorios.ParamByName('DESCRICAO').AsString := ADescricao;

      FDQRelatorios.ParamByName('TEMPLATE_FR3').LoadFromStream(MemoryStream, ftBlob);
      FDQRelatorios.ExecSQL;
    end;
  finally
    MemoryStream.Free;
    FDQRelatorios.SQL.Text := EmptyStr;
    FDQRelatorios.Close;
  end;
end;

procedure TDmConn.ShowReport(ADesignMode: Boolean = False);
begin
  //if not DmConn.GetRelatorio('CLIENTES_POR_EMPRESA', DmConn.Report) then
  Report.LoadFromFile('C:\Projects\SrPolezi\Formacao-Delphi-Embarcadero-2026\FastsReports\Reports\Aula_02\Dashboard_Pokemon_Subdatail_Dashboard.fr3');

  //Report.Variables['TITULO_VINDO_DELPHI'] := QuotedStr('MEU TITULO é TAL'); //Precisar ter variavel dentro do relatorio;

  if ADesignMode then
    Report.DesignReport
  else
    Report.ShowReport;
end;

procedure TDmConn.FDQLideresAfterOpen(DataSet: TDataSet);
begin
  FDQPokemons.Open;
  FDQResumoLider.Open;
  FDQGraficoTiposLider.Open;

  FDQGolpes.Open;
  FDQLocais.Open;
  FDQResumoGolpes.Open;
  FDQResumoLocais.Open;
end;

procedure TDmConn.FDQLideresBeforeOpen(DataSet: TDataSet);
begin
  FDQResumoLocais.Close;
  FDQResumoGolpes.Close;
  FDQLocais.Close;
  FDQGolpes.Close;
  FDQPokemons.Close;
  FDQResumoLider.Close;
  FDQGraficoTiposLider.Close;

  FDQGraficoComparativo.Close;
  FDQGraficoTipos.Close;
  FDQGraficoLideres.Close;
  FDQResumoGeral.Close;

  FDQResumoGeral.Open;
  FDQGraficoLideres.Open;
  FDQGraficoTipos.Open;
  FDQGraficoComparativo.Open;
end;

procedure TDmConn.GerarCSV;
begin
  var CaminhoRelatorio: string := ExpandFileName(
    ExtractFilePath(ParamStr(0)) +
    '..\..\Reports\Aula_02\ExportaCSV.fr3'
  );

  var CaminhoCSV := ExpandFileName(
    ExtractFilePath(ParamStr(0)) +
    '..\..\Reports\Aula_02\ExportaCSV.csv'
  );

  if not FileExists(CaminhoRelatorio) then
    raise Exception.CreateFmt(
      'O relatório não foi encontrado:%s%s',
      [sLineBreak, CaminhoRelatorio]
    );

  if not DirectoryExists(ExtractFilePath(CaminhoCSV)) then
    ForceDirectories(ExtractFilePath(CaminhoCSV));

  FDQLideres.Close;
  FDQLideres.Open;

  Report.LoadFromFile(CaminhoRelatorio);

  CSVExport.FileName       := CaminhoCSV;
  CSVExport.ShowDialog     := False;
  CSVExport.OpenAfterExport:= False;

  if not Report.PrepareReport(True) then
    raise Exception.Create('Não foi possível preparar o relatório para exportação.');

  Report.Export(CSVExport);
end;

procedure TDmConn.GerarPDF;
begin
  var CaminhoRelatorio: string := ExpandFileName(
    ExtractFilePath(ParamStr(0)) +
    '..\..\Reports\Aula_02\Dashboard_Pokemon_Subdatail_Dashboard.fr3'
  );

  var CaminhoPDF := ExpandFileName(
    ExtractFilePath(ParamStr(0)) +
    '..\..\Reports\Aula_02\Dashboard_Pokemon_Subdatail_Dashboard.pdf'
  );

  if not FileExists(CaminhoRelatorio) then
    raise Exception.CreateFmt(
      'O relatório não foi encontrado:%s%s',
      [sLineBreak, CaminhoRelatorio]
    );

  if not DirectoryExists(ExtractFilePath(CaminhoPDF)) then
    ForceDirectories(ExtractFilePath(CaminhoPDF));

  FDQLideres.Close;
  FDQLideres.Open;

  Report.LoadFromFile(CaminhoRelatorio);

  PDFExport.FileName       := CaminhoPDF;
  PDFExport.ShowDialog     := False;
  PDFExport.OpenAfterExport:= True;

  if not Report.PrepareReport(True) then
    raise Exception.Create('Não foi possível preparar o relatório para exportação.');

  Report.Export(PDFExport);
end;

procedure TDmConn.GerarXLS;
begin
  //Precisaa do Excel...
  var CaminhoRelatorio: string := ExpandFileName(
    ExtractFilePath(ParamStr(0)) +
    '..\..\Reports\Aula_02\Dashboard_Pokemon_Subdatail_Dashboard.fr3'
  );

  var CaminhoXLS := ExpandFileName(
    ExtractFilePath(ParamStr(0)) +
    '..\..\Reports\Aula_02\Dashboard_Pokemon_Subdatail_Dashboard.xls'
  );

  if not FileExists(CaminhoRelatorio) then
    raise Exception.CreateFmt(
      'O relatório não foi encontrado:%s%s',
      [sLineBreak, CaminhoRelatorio]
    );

  if not DirectoryExists(ExtractFilePath(CaminhoXLS)) then
    ForceDirectories(ExtractFilePath(CaminhoXLS));

  FDQLideres.Close;
  FDQLideres.Open;

  Report.LoadFromFile(CaminhoRelatorio);

  XLSExport.FileName       := CaminhoXLS;
  XLSExport.ShowDialog     := False;
  XLSExport.OpenAfterExport:= False;

  if not Report.PrepareReport(True) then
    raise Exception.Create('Não foi possível preparar o relatório para exportação.');

  Report.Export(XLSExport);
end;

end.
