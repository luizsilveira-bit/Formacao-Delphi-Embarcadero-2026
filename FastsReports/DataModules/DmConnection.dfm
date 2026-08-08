object DmConn: TDmConn
  OnCreate = DataModuleCreate
  Height = 480
  Width = 774
  object FdConn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Projects\SrPolezi\Formacao-Delphi-Embarcadero-2026\F' +
        'astsReports\DB\Database.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 120
    Top = 8
  end
  object FDQLideres: TFDQuery
    Active = True
    BeforeOpen = FDQLideresBeforeOpen
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    L.ID_LIDER,'
      '    L.NOME,'
      '    L.CIDADE,'
      '    L.GINASIO,'
      '    L.INSIGNIA,'
      '    L.ESPECIALIDADE,'
      '    L.ORDEM_LIGA'
      'FROM LIDER L'
      'ORDER BY'
      '    L.ORDEM_LIGA')
    Left = 24
    Top = 88
  end
  object Report: TfrxReport
    Version = '2026.2.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46242.408066956000000000
    ReportOptions.LastChange = 46242.479393020830000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 512
    Top = 8
  end
  object FDQPokemons: TFDQuery
    Active = True
    MasterSource = dsLideres
    MasterFields = 'ID_LIDER'
    Connection = FdConn
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT'
      '    P.ID_POKEMON,'
      '    P.ID_LIDER,'
      '    P.NOME,'
      '    P.TIPO_PRIMARIO,'
      '    P.TIPO_SECUNDARIO,'
      '    P.NIVEL,'
      '    P.POSICAO_EQUIPE,'
      '    P.OBSERVACAO,'
      '    P.DESTAQUE,'
      ''
      '    CASE'
      '        WHEN P.TIPO_SECUNDARIO IS NULL'
      '          OR TRIM(P.TIPO_SECUNDARIO) = '#39#39
      '        THEN P.TIPO_PRIMARIO'
      '        ELSE P.TIPO_PRIMARIO || '#39' / '#39' || P.TIPO_SECUNDARIO'
      '    END AS TIPOS,'
      ''
      '    CASE'
      '        WHEN P.DESTAQUE = 1'
      '        THEN '#39'Principal Pok'#233'mon'#39
      '        ELSE '#39'Pok'#233'mon da equipe'#39
      '    END AS DESCRICAO_DESTAQUE'
      ''
      'FROM POKEMON P'
      'WHERE P.ID_LIDER = :ID_LIDER'
      'ORDER BY'
      '    P.POSICAO_EQUIPE,'
      '    P.NOME')
    Left = 24
    Top = 152
    ParamData = <
      item
        Name = 'ID_LIDER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 8
      end>
  end
  object dsLideres: TDataSource
    DataSet = FDQLideres
    Left = 104
    Top = 88
  end
  object FDQRelatorios: TFDQuery
    Connection = FdConn
    Left = 320
    Top = 8
  end
  object PDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    PDFColorSpace = csDeviceRGB
    Left = 256
    Top = 8
  end
  object dsPokemons: TDataSource
    DataSet = FDQPokemons
    Left = 104
    Top = 152
  end
  object FDQGolpes: TFDQuery
    Active = True
    MasterSource = dsPokemons
    MasterFields = 'ID_POKEMON'
    Connection = FdConn
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT'
      '    G.ID_GOLPE,'
      '    G.ID_POKEMON,'
      '    G.NOME,'
      '    G.TIPO,'
      '    G.CATEGORIA,'
      '    G.PODER,'
      '    G.PRECISAO,'
      '    G.PP,'
      '    G.OBSERVACAO,'
      ''
      '    CASE'
      '        WHEN G.PODER IS NULL'
      '        THEN '#39#8212#39
      '        ELSE CAST(G.PODER AS TEXT)'
      '    END AS PODER_FORMATADO,'
      ''
      '    CASE'
      '        WHEN G.PRECISAO IS NULL'
      '        THEN '#39#8212#39
      '        ELSE CAST(G.PRECISAO AS TEXT) || '#39'%'#39
      '    END AS PRECISAO_FORMATADA'
      ''
      'FROM GOLPE G'
      'WHERE G.ID_POKEMON = :ID_POKEMON'
      'ORDER BY'
      '    G.CATEGORIA,'
      '    G.NOME')
    Left = 24
    Top = 216
    ParamData = <
      item
        Name = 'ID_POKEMON'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
  end
  object FDQLocais: TFDQuery
    Active = True
    MasterSource = dsPokemons
    MasterFields = 'ID_POKEMON'
    Connection = FdConn
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT'
      '    LP.ID_LOCAL,'
      '    LP.ID_POKEMON,'
      '    LP.ROTA,'
      '    LP.CIDADE,'
      '    LP.LOCAL_DESCRICAO,'
      '    LP.COMPLEMENTO,'
      '    LP.OBSERVACAO,'
      ''
      '    CASE'
      '        WHEN LP.ROTA IS NULL'
      '          OR TRIM(LP.ROTA) = '#39#39
      '        THEN LP.CIDADE || '#39' - '#39' || LP.LOCAL_DESCRICAO'
      '        ELSE LP.ROTA || '#39' - '#39' ||'
      '             LP.CIDADE || '#39' - '#39' ||'
      '             LP.LOCAL_DESCRICAO'
      '    END AS LOCAL_COMPLETO'
      ''
      'FROM LOCAL_POKEMON LP'
      'WHERE LP.ID_POKEMON = :ID_POKEMON'
      'ORDER BY'
      '    LP.CIDADE,'
      '    LP.ROTA,'
      '    LP.LOCAL_DESCRICAO')
    Left = 24
    Top = 280
    ParamData = <
      item
        Name = 'ID_POKEMON'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
  end
  object FDQResumoGeral: TFDQuery
    Active = True
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    QTDE_LIDERES,'
      '    QTDE_POKEMONS,'
      '    MEDIA_NIVEL,'
      '    MAIOR_NIVEL,'
      '    MENOR_NIVEL'
      'FROM VW_RESUMO_GERAL')
    Left = 24
    Top = 344
  end
  object FDQGraficoLideres: TFDQuery
    Active = True
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    ID_LIDER,'
      '    ORDEM_LIGA,'
      '    LIDER,'
      '    ESPECIALIDADE,'
      '    QUANTIDADE,'
      '    MEDIA_NIVEL,'
      '    MAIOR_NIVEL'
      'FROM VW_GRAFICO_LIDERES'
      'ORDER BY'
      '    QUANTIDADE DESC,'
      '    LIDER')
    Left = 288
    Top = 344
  end
  object FDQGraficoTipos: TFDQuery
    Active = True
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    TIPO,'
      '    QUANTIDADE,'
      '    PERCENTUAL'
      'FROM VW_GRAFICO_TIPOS'
      'ORDER BY'
      '    QUANTIDADE DESC,'
      '    TIPO')
    Left = 128
    Top = 344
  end
  object FDQGraficoComparativo: TFDQuery
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    ID_LIDER,'
      '    ORDEM_LIGA,'
      '    LIDER,'
      '    QUANTIDADE,'
      '    MEDIA_NIVEL,'
      '    MAIOR_NIVEL'
      'FROM VW_GRAFICO_COMPARATIVO'
      'ORDER BY'
      '    ORDEM_LIGA')
    Left = 360
    Top = 344
  end
  object FDQGraficoTiposLider: TFDQuery
    MasterSource = dsLideres
    MasterFields = 'ID_LIDER'
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    P.ID_LIDER,'
      '    P.TIPO_PRIMARIO AS TIPO,'
      '    COUNT(P.ID_POKEMON) AS QUANTIDADE,'
      '    ROUND(AVG(P.NIVEL), 2) AS MEDIA_NIVEL,'
      '    MAX(P.NIVEL) AS MAIOR_NIVEL'
      'FROM POKEMON P'
      'WHERE P.ID_LIDER = :ID_LIDER'
      'GROUP BY'
      '    P.ID_LIDER,'
      '    P.TIPO_PRIMARIO'
      'ORDER BY'
      '    QUANTIDADE DESC,'
      '    P.TIPO_PRIMARIO')
    Left = 24
    Top = 408
    ParamData = <
      item
        Name = 'ID_LIDER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object FDQResumoLider: TFDQuery
    MasterSource = dsLideres
    MasterFields = 'ID_LIDER'
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    L.ID_LIDER,'
      '    L.NOME AS LIDER,'
      '    L.CIDADE,'
      '    L.GINASIO,'
      '    L.INSIGNIA,'
      '    L.ESPECIALIDADE,'
      ''
      '    COUNT(P.ID_POKEMON) AS QTDE_POKEMONS,'
      '    ROUND(AVG(P.NIVEL), 2) AS MEDIA_NIVEL,'
      '    MAX(P.NIVEL) AS MAIOR_NIVEL,'
      '    MIN(P.NIVEL) AS MENOR_NIVEL,'
      ''
      '    ('
      '        SELECT PX.NOME'
      '        FROM POKEMON PX'
      '        WHERE PX.ID_LIDER = L.ID_LIDER'
      '        ORDER BY'
      '            PX.DESTAQUE DESC,'
      '            PX.NIVEL DESC,'
      '            PX.POSICAO_EQUIPE'
      '        LIMIT 1'
      '    ) AS POKEMON_PRINCIPAL'
      ''
      'FROM LIDER L'
      'LEFT JOIN POKEMON P'
      '       ON P.ID_LIDER = L.ID_LIDER'
      'WHERE L.ID_LIDER = :ID_LIDER'
      'GROUP BY'
      '    L.ID_LIDER,'
      '    L.NOME,'
      '    L.CIDADE,'
      '    L.GINASIO,'
      '    L.INSIGNIA,'
      '    L.ESPECIALIDADE')
    Left = 112
    Top = 408
    ParamData = <
      item
        Name = 'ID_LIDER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object FDQResumoGolpes: TFDQuery
    MasterSource = dsPokemons
    MasterFields = 'ID_POKEMON'
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    P.ID_POKEMON,'
      '    P.NOME AS POKEMON,'
      ''
      '    COUNT(G.ID_GOLPE) AS QTDE_GOLPES,'
      ''
      '    ROUND('
      '        AVG('
      '            CASE'
      '                WHEN G.PODER IS NOT NULL'
      '                THEN G.PODER'
      '            END'
      '        ),'
      '        2'
      '    ) AS PODER_MEDIO,'
      ''
      '    MAX(G.PODER) AS MAIOR_PODER,'
      ''
      '    ('
      '        SELECT GX.NOME'
      '        FROM GOLPE GX'
      '        WHERE GX.ID_POKEMON = P.ID_POKEMON'
      '          AND GX.PODER IS NOT NULL'
      '        ORDER BY'
      '            GX.PODER DESC,'
      '            GX.NOME'
      '        LIMIT 1'
      '    ) AS GOLPE_MAIS_FORTE'
      ''
      'FROM POKEMON P'
      'LEFT JOIN GOLPE G'
      '       ON G.ID_POKEMON = P.ID_POKEMON'
      'WHERE P.ID_POKEMON = :ID_POKEMON'
      'GROUP BY'
      '    P.ID_POKEMON,'
      '    P.NOME')
    Left = 192
    Top = 408
    ParamData = <
      item
        Name = 'ID_POKEMON'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object FDQResumoLocais: TFDQuery
    MasterSource = dsPokemons
    MasterFields = 'ID_POKEMON'
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    P.ID_POKEMON,'
      '    P.NOME AS POKEMON,'
      ''
      '    COUNT(G.ID_GOLPE) AS QTDE_GOLPES,'
      ''
      '    ROUND('
      '        AVG('
      '            CASE'
      '                WHEN G.PODER IS NOT NULL'
      '                THEN G.PODER'
      '            END'
      '        ),'
      '        2'
      '    ) AS PODER_MEDIO,'
      ''
      '    MAX(G.PODER) AS MAIOR_PODER,'
      ''
      '    ('
      '        SELECT GX.NOME'
      '        FROM GOLPE GX'
      '        WHERE GX.ID_POKEMON = P.ID_POKEMON'
      '          AND GX.PODER IS NOT NULL'
      '        ORDER BY'
      '            GX.PODER DESC,'
      '            GX.NOME'
      '        LIMIT 1'
      '    ) AS GOLPE_MAIS_FORTE'
      ''
      'FROM POKEMON P'
      'LEFT JOIN GOLPE G'
      '       ON G.ID_POKEMON = P.ID_POKEMON'
      'WHERE P.ID_POKEMON = :ID_POKEMON'
      'GROUP BY'
      '    P.ID_POKEMON,'
      '    P.NOME')
    Left = 264
    Top = 408
    ParamData = <
      item
        Name = 'ID_POKEMON'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object frxDBLideres: TfrxDBDataset
    UserName = 'Lideres'
    CloseDataSource = False
    DataSet = FDQLideres
    BCDToCurrency = False
    DataSetOptions = []
    Left = 512
    Top = 72
    FieldDefs = <
      item
        FieldName = 'ID_LIDER'
      end
      item
        FieldName = 'NOME'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'CIDADE'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'GINASIO'
        FieldType = fftString
        Size = 150
      end
      item
        FieldName = 'INSIGNIA'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'ESPECIALIDADE'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'ORDEM_LIGA'
      end>
  end
  object frxDBPokemons: TfrxDBDataset
    UserName = 'Pokemons'
    CloseDataSource = False
    DataSet = FDQPokemons
    BCDToCurrency = False
    DataSetOptions = []
    Left = 512
    Top = 136
    FieldDefs = <
      item
        FieldName = 'ID_POKEMON'
      end
      item
        FieldName = 'ID_LIDER'
      end
      item
        FieldName = 'NOME'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'TIPO_PRIMARIO'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'TIPO_SECUNDARIO'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'NIVEL'
      end
      item
        FieldName = 'POSICAO_EQUIPE'
      end
      item
        FieldName = 'OBSERVACAO'
        FieldType = fftString
        Size = 500
      end
      item
        FieldName = 'DESTAQUE'
      end
      item
        FieldName = 'TIPOS'
        FieldType = fftString
        Size = 32767
      end
      item
        FieldName = 'DESCRICAO_DESTAQUE'
        FieldType = fftString
        Size = 32767
      end>
  end
  object frxDBGolpes: TfrxDBDataset
    UserName = 'Golpes'
    CloseDataSource = False
    DataSet = FDQGolpes
    BCDToCurrency = False
    DataSetOptions = []
    Left = 472
    Top = 200
    FieldDefs = <
      item
        FieldName = 'ID_GOLPE'
      end
      item
        FieldName = 'ID_POKEMON'
      end
      item
        FieldName = 'NOME'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'TIPO'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'CATEGORIA'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'PODER'
      end
      item
        FieldName = 'PRECISAO'
      end
      item
        FieldName = 'PP'
      end
      item
        FieldName = 'OBSERVACAO'
        FieldType = fftString
        Size = 500
      end
      item
        FieldName = 'PODER_FORMATADO'
        FieldType = fftString
        Size = 32767
      end
      item
        FieldName = 'PRECISAO_FORMATADA'
        FieldType = fftString
        Size = 32767
      end>
  end
  object frxDBLocais: TfrxDBDataset
    UserName = 'Locais'
    CloseDataSource = False
    DataSet = FDQLocais
    BCDToCurrency = False
    DataSetOptions = []
    Left = 552
    Top = 200
    FieldDefs = <
      item
        FieldName = 'ID_LOCAL'
      end
      item
        FieldName = 'ID_POKEMON'
      end
      item
        FieldName = 'ROTA'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'CIDADE'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'LOCAL_DESCRICAO'
        FieldType = fftString
        Size = 150
      end
      item
        FieldName = 'COMPLEMENTO'
        FieldType = fftString
        Size = 250
      end
      item
        FieldName = 'OBSERVACAO'
        FieldType = fftString
        Size = 500
      end
      item
        FieldName = 'LOCAL_COMPLETO'
        FieldType = fftString
        Size = 32767
      end>
  end
  object frxDBResumoGeral: TfrxDBDataset
    UserName = 'ResumoGeral'
    CloseDataSource = False
    DataSet = FDQResumoGeral
    BCDToCurrency = False
    DataSetOptions = []
    Left = 440
    Top = 256
    FieldDefs = <
      item
        FieldName = 'QTDE_LIDERES'
      end
      item
        FieldName = 'QTDE_POKEMONS'
      end
      item
        FieldName = 'MEDIA_NIVEL'
      end
      item
        FieldName = 'MAIOR_NIVEL'
      end
      item
        FieldName = 'MENOR_NIVEL'
      end>
  end
  object frxDBGraficoLideres: TfrxDBDataset
    UserName = 'GraficoLideres'
    CloseDataSource = False
    DataSet = FDQGraficoLideres
    BCDToCurrency = False
    DataSetOptions = []
    Left = 496
    Top = 256
    FieldDefs = <
      item
        FieldName = 'ID_LIDER'
      end
      item
        FieldName = 'ORDEM_LIGA'
      end
      item
        FieldName = 'LIDER'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'ESPECIALIDADE'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'QUANTIDADE'
      end
      item
        FieldName = 'MEDIA_NIVEL'
      end
      item
        FieldName = 'MAIOR_NIVEL'
      end>
  end
  object frxDBGraficoTipos: TfrxDBDataset
    UserName = 'GraficoTipos'
    CloseDataSource = False
    DataSet = FDQGraficoTipos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 544
    Top = 256
    FieldDefs = <
      item
        FieldName = 'TIPO'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'QUANTIDADE'
      end
      item
        FieldName = 'PERCENTUAL'
      end>
  end
  object frxDBGraficoComparativo: TfrxDBDataset
    UserName = 'GraficoComparativo'
    CloseDataSource = False
    DataSet = FDQGraficoComparativo
    BCDToCurrency = False
    DataSetOptions = []
    Left = 592
    Top = 256
    FieldDefs = <
      item
        FieldName = 'ID_LIDER'
      end
      item
        FieldName = 'ORDEM_LIGA'
      end
      item
        FieldName = 'LIDER'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'QUANTIDADE'
      end
      item
        FieldName = 'MEDIA_NIVEL'
      end
      item
        FieldName = 'MAIOR_NIVEL'
      end>
  end
end
