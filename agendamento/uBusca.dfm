object frmBusca: TfrmBusca
  Left = 0
  Top = 0
  ClientHeight = 523
  ClientWidth = 842
  Caption = 'Busca'
  Color = 13735506
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 842
    Height = 89
    Hint = ''
    ParentColor = False
    Color = 13735506
    Align = alTop
    TabOrder = 0
    DesignSize = (
      842
      89)
    object UniComboBox1: TUniComboBox
      Left = 16
      Top = 32
      Width = 129
      Hint = ''
      Text = ''
      Items.Strings = (
        'Motorista'
        'Placa'
        'N'#186' Pedido'
        'Celular ')
      TabOrder = 1
      FieldLabel = 'Buscar por'
      FieldLabelAlign = laTop
      IconItems = <>
      OnChange = UniComboBox1Change
    end
    object UniEdit1: TUniEdit
      Left = 176
      Top = 32
      Width = 650
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      FieldLabel = 'Digite aqui sua busca'
      FieldLabelAlign = laTop
      OnChange = UniEdit1Change
    end
  end
  object UniDBGrid1: TUniDBGrid
    AlignWithMargins = True
    Left = 10
    Top = 99
    Width = 822
    Height = 353
    Hint = ''
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
    ReadOnly = True
    WebOptions.Paged = False
    WebOptions.PageSize = 1000000
    WebOptions.KeyNavigation = knDisabled
    WebOptions.FetchAll = True
    LoadMask.Message = 'Carregando dados...'
    Align = alClient
    TabOrder = 1
    OnDblClick = UniDBGrid1DblClick
    Columns = <
      item
        FieldName = 'data'
        Title.Caption = 'Data'
        Width = 76
      end
      item
        FieldName = 'hora'
        Title.Caption = 'Hora'
        Width = 74
        Font.Style = [fsBold]
      end
      item
        FieldName = 'pedido'
        Title.Caption = 'Pedido'
        Width = 64
      end
      item
        FieldName = 'nome'
        Title.Caption = 'Motorista'
        Width = 200
        ReadOnly = True
      end
      item
        FieldName = 'placa'
        Title.Caption = 'Placa'
        Width = 82
        ReadOnly = True
      end
      item
        FieldName = 'celular'
        Title.Caption = 'Celular'
        Width = 92
        ReadOnly = True
      end
      item
        FieldName = 'produto'
        Title.Caption = 'Produto'
        Width = 121
        ReadOnly = True
      end
      item
        FieldName = 'feito_por'
        Title.Caption = 'Agendado por'
        Width = 123
      end
      item
        FieldName = 'criado'
        Title.Caption = ' Data/Hora Agendamento'
        Width = 155
      end>
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 462
    Width = 842
    Height = 61
    Hint = ''
    ParentColor = False
    Color = 13735506
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      842
      61)
    object UniBitBtn1: TUniBitBtn
      Left = 383
      Top = 18
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'OK'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Images = UniNativeImageList1
      ImageIndex = 0
      OnClick = UniBitBtn1Click
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 368
    Top = 115
    Images = {01000000FFFFFF1F060A000000636865636B3B66615F3B}
  end
end
