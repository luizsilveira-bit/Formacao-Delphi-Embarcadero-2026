object DmConn: TDmConn
  OnCreate = DataModuleCreate
  Height = 385
  Width = 611
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
    Connection = FdConn
    SQL.Strings = (
      'SELECT'
      '    E.ID_EMPRESA,'
      '    E.NOME_FANTASIA AS LIDER_GINASIO,'
      '    E.RAZAO_SOCIAL AS GINASIO,'
      ''
      '    C.ID_CLIENTE,'
      '    C.NOME_RAZAO AS POKEMON,'
      '    C.CPF_CNPJ AS REGISTRO_POKEDEX,'
      '    CAST(C.LIMITE_CREDITO / 100 AS INTEGER) AS NIVEL,'
      ''
      '    EC.ID_ENDERECO,'
      '    EC.TIPO_ENDERECO,'
      '    EC.LOGRADOURO,'
      '    EC.NUMERO,'
      '    EC.COMPLEMENTO,'
      '    EC.BAIRRO,'
      '    EC.CIDADE,'
      '    EC.UF,'
      '    EC.CEP,'
      '    EC.PRINCIPAL'
      'FROM EMPRESAS E'
      'JOIN CLIENTES C'
      '  ON C.ID_EMPRESA = E.ID_EMPRESA'
      'LEFT JOIN ENDERECOS_CLIENTES EC'
      '  ON EC.ID_CLIENTE = C.ID_CLIENTE'
      'ORDER BY'
      '    E.ID_EMPRESA,'
      '    E.NOME_FANTASIA,'
      '    C.NOME_RAZAO,'
      '    EC.PRINCIPAL DESC,'
      '    EC.ID_ENDERECO')
    Left = 32
    Top = 240
  end
  object Report: TfrxReport
    Version = '2026.2.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46235.659690405100000000
    ReportOptions.LastChange = 46235.744904213000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 528
    Top = 104
    Datasets = <
      item
        DataSet = frxDBEmpresa
        DataSetName = 'Empresas'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object DetailEnderecos: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = frxDBEmpresa
        DataSetName = 'Empresas'
        RowCount = 0
        object MemoEmpresasLOGRADOURO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'CEP'
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Empresas."CEP"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 3.779530000000000000
          Width = 563.149970000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '['
            '  VarToStr(<Empresas."LOGRADOURO">) +'
            '  IIF('
            '    Trim(VarToStr(<Empresas."NUMERO">)) <> '#39#39','
            '    '#39', N'#186' '#39' + VarToStr(<Empresas."NUMERO">),'
            '    '#39#39
            '  ) +'
            '  '#39' - '#39' + VarToStr(<Empresas."COMPLEMENTO">) +'
            '  '#39' - '#39' + VarToStr(<Empresas."BAIRRO">) +'
            '  '#39' - '#39' + VarToStr(<Empresas."CIDADE">)'
            ']')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 687.874460000000000000
          Top = 3.779530000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'UF'
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Empresas."UF"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 461.102660000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
        end
      end
      object HeaderLiderGinasio: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        KeepWithData = False
        Condition = 'Empresas."ID_EMPRESA"'
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Left = 3.779539620000000000
          Top = 0.779534890000000000
          Width = 710.551640730000000000
          Height = 18.897644040000000000
          Fill.BackColor = 15790320
          Fill.ForeColor = clNone
          Frame.Color = clNone
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object MemoEmpresasLIDER_GINASIO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 1.000000000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'LIDER_GINASIO'
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Empresas."LIDER_GINASIO"]')
          ParentFont = False
        end
      end
      object FooterLiderGinasio: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        KeepWithData = False
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 1.000000000000000000
          Width = 710.551640730000000000
          Height = 18.897644040000000000
          Fill.BackColor = 15790320
          Fill.ForeColor = clNone
          Frame.Color = clNone
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 1.000000000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade Pokemons: [COUNT(DetailEnderecos)]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 279.685220000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Niv'#233'l Max. Permitido: [MAX(<Empresas."NIVEL">,DetailEnderecos)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 608.504330000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Totais Rotas: [COUNT(DetailEnderecos)]')
          ParentFont = False
        end
      end
      object HeaderPokemon: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        KeepWithData = False
        Condition = 'Empresas."ID_CLIENTE"'
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Left = 3.779523060000000000
          Top = 22.677196310000000000
          Width = 710.551640730000000000
          Height = 22.677174040000000000
          Fill.BackColor = 14211288
          Frame.Color = clNone
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object MemoEmpresasPOKEMON: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 1.000000000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Pokemon: [Empresas."POKEMON"], N'#237'vel: [Empresas."NIVEL"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 26.456710000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 26.456710000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 687.874460000000000000
          Top = 24.677180000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
      end
      object FooterPokemon: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        KeepWithData = False
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 0.779530000000000000
          Width = 710.551640730000000000
          Height = 18.897644040000000000
          Fill.BackColor = 15790320
          Fill.ForeColor = clNone
          Frame.Color = clNone
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 1.000000000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Encontros poss'#237'veis: [COUNT(DetailEnderecos)]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 3.779529830000000000
          Top = 7.559062450000000000
          Width = 710.551640730000000000
          Height = 45.354354040000000000
          Fill.BackColor = 15790320
          Frame.Color = clNone
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Memo2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 18.677180000000000000
          Width = 400.630180000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBEmpresa
          DataSetName = 'Empresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Endere'#231'os de Clientes por Empresa')
          ParentFont = False
        end
        object MemoNow: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 22.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Now]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 631.181510000000000000
          Top = 22.456710000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
        end
      end
    end
  end
  object frxDBEmpresa: TfrxDBDataset
    Description = 'Empresas'
    UserName = 'Empresas'
    CloseDataSource = False
    DataSet = FDQLideres
    BCDToCurrency = False
    DataSetOptions = []
    Left = 528
    Top = 168
    FieldDefs = <
      item
        FieldName = 'ID_EMPRESA'
      end
      item
        FieldName = 'LIDER_GINASIO'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'GINASIO'
        FieldType = fftString
        Size = 150
      end
      item
        FieldName = 'ID_CLIENTE'
      end
      item
        FieldName = 'POKEMON'
        FieldType = fftString
        Size = 150
      end
      item
        FieldName = 'REGISTRO_POKEDEX'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'NIVEL'
      end
      item
        FieldName = 'ID_ENDERECO'
      end
      item
        FieldName = 'TIPO_ENDERECO'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'LOGRADOURO'
        FieldType = fftString
        Size = 150
      end
      item
        FieldName = 'NUMERO'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'COMPLEMENTO'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'BAIRRO'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'CIDADE'
        FieldType = fftString
        Size = 100
      end
      item
        FieldName = 'UF'
        FieldType = fftString
      end
      item
        FieldName = 'CEP'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'PRINCIPAL'
      end>
  end
  object FDQPokemons: TFDQuery
    Connection = FdConn
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE ID_EMPRESA = :ID_EMPRESA')
    Left = 32
    Top = 312
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object frxDBClientes: TfrxDBDataset
    Description = 'Clientes'
    UserName = 'Clientes'
    CloseDataSource = False
    DataSet = FDQPokemons
    BCDToCurrency = False
    DataSetOptions = []
    Left = 528
    Top = 232
  end
  object DataSource: TDataSource
    Left = 144
    Top = 240
  end
  object FDQRelatorios: TFDQuery
    Connection = FdConn
    Left = 528
    Top = 40
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
    Left = 416
    Top = 168
  end
end
