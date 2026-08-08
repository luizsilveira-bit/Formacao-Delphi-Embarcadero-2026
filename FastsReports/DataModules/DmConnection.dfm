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
    BeforeOpen = FDQLideresBeforeOpen
    AfterOpen = FDQLideresAfterOpen
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
    ReportOptions.LastChange = 46242.408066956000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 512
    Top = 8
    Datasets = <
      item
        DataSet = frxDBLideres
        DataSetName = 'Lideres'
      end
      item
        DataSet = frxDBPokemons
        DataSetName = 'Pokemons'
      end
      item
        DataSet = frxDBGolpes
        DataSetName = 'Golpes'
      end
      item
        DataSet = frxDBLocais
        DataSetName = 'Locais'
      end
      item
        DataSet = frxDBResumoGeral
        DataSetName = 'ResumoGeral'
      end
      item
        DataSet = frxDBGraficoLideres
        DataSetName = 'GraficoLideres'
      end
      item
        DataSet = frxDBGraficoTipos
        DataSetName = 'GraficoTipos'
      end
      item
        DataSet = frxDBGraficoComparativo
        DataSetName = 'GraficoComparativo'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object pgDashboard: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Color = 15000804
      Frame.Typ = []
      MirrorMode = []
      object ReportTitleDashboard: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559058160000000000
          Top = 3.779528240000000000
          Width = 1031.811698360000000000
          Height = 75.590601670000000000
          Fill.BackColor = 15790320
          Frame.Color = 14671839
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 258.897806980000000000
          Top = 11.338590000000000000
          Width = 529.134200730000000000
          Height = 30.236240000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DOSS'#205#202' ANAL'#205'TICO DA LIGA POK'#201'MON')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 258.897806980000000000
          Top = 45.354360000000000000
          Width = 529.134200730000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'An'#225'lise geral dos l'#237'deres, equipes, tipos e n'#237'veis')
          ParentFont = False
        end
      end
      object MasterDataDashboard: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 472.441250000000000000
        Top = 162.519790000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBResumoGeral
        DataSetName = 'ResumoGeral'
        RowCount = 0
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Left = 94.488247350000000000
          Top = 7.559059750000000000
          Width = 113.385908360000000000
          Height = 113.385894040000000000
          Frame.Color = clSilver
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Left = 283.464750000000000000
          Top = 7.559060000000000000
          Width = 113.385908360000000000
          Height = 113.385894040000000000
          Frame.Color = clSilver
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 7.559060000000000000
          Width = 113.385908360000000000
          Height = 113.385894040000000000
          Frame.Color = clSilver
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Left = 661.417750000000000000
          Top = 7.559060000000000000
          Width = 113.385908360000000000
          Height = 113.385894040000000000
          Frame.Color = clSilver
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Left = 850.394250000000000000
          Top = 7.559060000000000000
          Width = 113.385908360000000000
          Height = 113.385894040000000000
          Frame.Color = clSilver
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object MemoResumoGeralQTDE_LIDERES: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 111.496136530000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'QTDE_LIDERES'
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ResumoGeral."QTDE_LIDERES"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 300.472639180000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'QTDE_POKEMONS'
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ResumoGeral."QTDE_POKEMONS"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 489.449139180000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'MEDIA_NIVEL'
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ResumoGeral."MEDIA_NIVEL"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 678.425639180000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'MAIOR_NIVEL'
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ResumoGeral."MAIOR_NIVEL"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 867.402139180000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'MENOR_NIVEL'
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[ResumoGeral."MENOR_NIVEL"]')
          ParentFont = False
        end
        object Chart1: TfrxChartView
          AllowVectorExport = True
          Left = 34.015763880000000000
          Top = 136.063086360000000000
          Width = 502.677490730000000000
          Height = 321.260044040000000000
          HighlightColor = clBlack
          Frame.Typ = []
          Chart = {
            5450463006544368617274054368617274044C656674020003546F7002000557
            696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
            697369626C65081F4C6567656E642E53796D626F6C2E4772616469656E742E45
            6E64436F6C6F72044466A300194C6567656E642E5469746C652E546578742E53
            7472696E677301140C0000004DC3A9646961204E6976656C00125469746C652E
            546578742E537472696E677301141B0000004DC389444941204445204EC38D56
            454C20504F52204CC38D444552000D4672616D652E56697369626C6508165669
            657733444F7074696F6E732E526F746174696F6E02000A426576656C4F757465
            72070662764E6F6E6505436F6C6F720707636C57686974650D44656661756C74
            43616E766173060E54474449506C757343616E76617311436F6C6F7250616C65
            747465496E646578020D000F54486F72697A4261725365726965730753657269
            6573310B4C6567656E642E54657874140C0000004DC3A9646961204E6976656C
            0B4C6567656E645469746C65140C0000004DC3A9646961204E6976656C1B4261
            7242727573682E4772616469656E742E446972656374696F6E070B67644C6566
            7452696768741A42617242727573682E4772616469656E742E456E64436F6C6F
            72042B406B001942617242727573682E4772616469656E742E56697369626C65
            090E436F6C6F7245616368506F696E7409074461726B50656E038200114D6172
            6B732E466F6E742E48656967687402F70D4D61726B732E56697369626C650814
            4D61726B732E43616C6C6F75742E4C656E67746802040F4D61726B732E447261
            77457665727902020B4D61726B732E4F6E546F7009055469746C65140C000000
            4DC3A9646961204E6976656C084261725374796C65070E627352656374477261
            6469656E740F426172576964746850657263656E740255124772616469656E74
            2E446972656374696F6E070B67644C6566745269676874114772616469656E74
            2E456E64436F6C6F72042B406B00104772616469656E742E56697369626C6509
            084D756C746942617207066D624E6F6E650C5856616C7565732E4E616D650603
            4261720D5856616C7565732E4F7264657207066C6F4E6F6E650C5956616C7565
            732E4E616D650601590D5956616C7565732E4F72646572070B6C6F417363656E
            64696E67000000}
          ChartElevation = 345
          SeriesData = <
            item
              DataType = dtDBData
              DataSet = frxDBGraficoLideres
              DataSetName = 'GraficoLideres'
              SortOrder = soNone
              TopN = 0
              XType = xtText
              Source1 = 'GraficoLideres."LIDER"'
              Source2 = 'GraficoLideres."MEDIA_NIVEL"'
              XSource = 'GraficoLideres."LIDER"'
              YSource = 'GraficoLideres."MEDIA_NIVEL"'
            end>
        end
        object Chart2: TfrxChartView
          AllowVectorExport = True
          Left = 563.149953830000000000
          Top = 136.063075340000000000
          Width = 453.543631250000000000
          Height = 321.260044040000000000
          HighlightColor = clBlack
          Frame.Typ = []
          Chart = {
            5450463006544368617274054368617274044C656674020003546F7002000557
            696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
            697369626C6508194C6567656E642E5469746C652E546578742E537472696E67
            730106055469706F7300125469746C652E546578742E537472696E6773011421
            000000444953545249425549C387C3834F20504F52205449504F205052494DC3
            8152494F000B4178697356697369626C65080D4672616D652E56697369626C65
            08175669657733444F7074696F6E732E456C65766174696F6E033B0118566965
            7733444F7074696F6E732E4F7274686F676F6E616C08195669657733444F7074
            696F6E732E50657273706563746976650200165669657733444F7074696F6E73
            2E526F746174696F6E0368010B56696577334457616C6C73080A426576656C4F
            75746572070662764E6F6E6505436F6C6F720707636C57686974650D44656661
            756C7443616E766173060E54474449506C757343616E76617311436F6C6F7250
            616C65747465496E646578020D000A5450696553657269657307536572696573
            31114D61726B732E466F6E742E48656967687402F70D4D61726B732E56697369
            626C6508144D61726B732E43616C6C6F75742E4C656E6774680200114D61726B
            732E5461696C2E4D617267696E02020D5856616C7565732E4F72646572070B6C
            6F417363656E64696E670C5956616C7565732E4E616D6506035069650D595661
            6C7565732E4F7264657207066C6F4E6F6E651A4672616D652E496E6E65724272
            7573682E4261636B436F6C6F720705636C526564224672616D652E496E6E6572
            42727573682E4772616469656E742E456E64436F6C6F720706636C4772617922
            4672616D652E496E6E657242727573682E4772616469656E742E4D6964436F6C
            6F720707636C5768697465244672616D652E496E6E657242727573682E477261
            6469656E742E5374617274436F6C6F720440404000214672616D652E496E6E65
            7242727573682E4772616469656E742E56697369626C65091B4672616D652E4D
            6964646C6542727573682E4261636B436F6C6F720708636C59656C6C6F772346
            72616D652E4D6964646C6542727573682E4772616469656E742E456E64436F6C
            6F720482828200234672616D652E4D6964646C6542727573682E477261646965
            6E742E4D6964436F6C6F720707636C5768697465254672616D652E4D6964646C
            6542727573682E4772616469656E742E5374617274436F6C6F720706636C4772
            6179224672616D652E4D6964646C6542727573682E4772616469656E742E5669
            7369626C65091A4672616D652E4F7574657242727573682E4261636B436F6C6F
            720707636C477265656E224672616D652E4F7574657242727573682E47726164
            69656E742E456E64436F6C6F720440404000224672616D652E4F757465724272
            7573682E4772616469656E742E4D6964436F6C6F720707636C57686974652446
            72616D652E4F7574657242727573682E4772616469656E742E5374617274436F
            6C6F720708636C53696C766572214672616D652E4F7574657242727573682E47
            72616469656E742E56697369626C65090B4672616D652E57696474680204194F
            74686572536C6963652E4C6567656E642E56697369626C6508000000}
          ChartElevation = 315
          SeriesData = <
            item
              DataType = dtDBData
              DataSet = frxDBGraficoTipos
              DataSetName = 'GraficoTipos'
              SortOrder = soNone
              TopN = 0
              XType = xtText
              Source1 = 'GraficoTipos."TIPO"'
              Source2 = 'GraficoTipos."QUANTIDADE"'
              XSource = 'GraficoTipos."TIPO"'
              YSource = 'GraficoTipos."QUANTIDADE"'
            end>
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 107.716606160000000000
          Top = 15.118120000000000000
          Width = 86.929190730000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'L'#237'deres')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 296.693108810000000000
          Top = 15.118120000000000000
          Width = 86.929190730000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Pokemons')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 483.779843815000000000
          Top = 15.118120000000000000
          Width = 90.708720730000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'M'#233'dia N'#237'vel')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 668.976813810000000000
          Top = 15.118120000000000000
          Width = 98.267780730000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Maior N'#237'vel')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 859.843078815000000000
          Top = 15.118120000000000000
          Width = 94.488250730000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBResumoGeral
          DataSetName = 'ResumoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Menor N'#237'vel')
          ParentFont = False
        end
      end
      object PageFooterDashboard: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 695.433520000000000000
        Width = 1046.929810000000000000
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559058160000000000
          Top = -3.779530000000000000
          Width = 1031.811698360000000000
          Height = 22.677181670000000000
          Fill.BackColor = 15790320
          Frame.Color = 14671839
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 959.780150000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Forma'#231#227'o Embarcadero - Fasts Reports')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 10.559060000000000000
          Width = 75.590600000000000000
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
            'Emitido em [Date] '#224's [Time]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
  end
  object FDQPokemons: TFDQuery
    MasterSource = dsLideres
    MasterFields = 'ID_LIDER'
    Connection = FdConn
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
        Value = 1
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
    MasterSource = dsPokemons
    MasterFields = 'ID_POKEMON'
    Connection = FdConn
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
        Value = 1
      end>
  end
  object FDQLocais: TFDQuery
    MasterSource = dsPokemons
    MasterFields = 'ID_POKEMON'
    Connection = FdConn
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
        Value = 1
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
