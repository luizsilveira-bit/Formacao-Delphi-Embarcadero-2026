object FrMain: TFrMain
  Left = 0
  Top = 0
  Caption = 'FrMain'
  ClientHeight = 408
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object btnEmpresas: TButton
    Left = 8
    Top = 16
    Width = 81
    Height = 25
    Caption = 'Lideres'
    TabOrder = 0
    OnClick = btnEmpresasClick
  end
  object Dados: TDBGrid
    Left = 8
    Top = 56
    Width = 771
    Height = 345
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DadosDblClick
  end
  object btnSalvar: TButton
    Left = 698
    Top = 16
    Width = 81
    Height = 25
    Caption = 'Lideres'
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object btnPDF: TButton
    Left = 602
    Top = 16
    Width = 81
    Height = 25
    Caption = 'PDF'
    TabOrder = 3
    OnClick = btnPDFClick
  end
end
