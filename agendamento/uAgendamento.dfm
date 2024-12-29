inherited frmAgendamento: TfrmAgendamento
  ClientHeight = 426
  ClientWidth = 732
  Caption = 'Agendamento manual'
  BorderIcons = [biSystemMenu]
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  ExplicitWidth = 748
  ExplicitHeight = 465
  TextHeight = 15
  inherited BtnGroup2: TUniContainerPanel
    Top = 167
    Width = 732
    ExplicitTop = 167
    ExplicitWidth = 732
    inherited BtnGroupAlign2: TUniContainerPanel
      Width = 732
      ExplicitWidth = 732
      inherited btDelete: TUniBitBtn
        Visible = False
      end
      inherited btEdit: TUniBitBtn
        Visible = False
      end
    end
  end
  inherited UniDBGrid1: TUniDBGrid
    Width = 732
    Height = 161
    Visible = False
  end
  inherited UniSplitter1: TUniSplitter
    Top = 161
    Width = 732
    Visible = False
    ExplicitTop = 161
    ExplicitWidth = 732
  end
  inherited UniScrollBox1: TUniScrollBox
    Top = 224
    Width = 732
    Height = 202
    ExplicitTop = 224
    ExplicitWidth = 732
    ExplicitHeight = 202
    ScrollHeight = 166
    ScrollWidth = 537
    object UniDBDateTimePicker1: TUniDBDateTimePicker
      Left = 24
      Top = 32
      Width = 120
      Hint = ''
      DataField = 'data'
      DataSource = DSPadrao
      DateTime = 45654.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
      FieldLabel = 'Data'
      FieldLabelAlign = laTop
      OnChange = UniDBDateTimePicker1Change
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 24
      Top = 88
      Width = 215
      Hint = ''
      ListField = 'nome'
      ListSource = DSMotorista
      KeyField = 'cod'
      ListFieldIndex = 0
      DataField = 'cod_motorista'
      DataSource = DSPadrao
      TabOrder = 3
      Color = clWindow
      FieldLabel = 'Motorista'
      FieldLabelAlign = laTop
      OnSelect = UniDBLookupComboBox1Select
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 264
      Top = 88
      Width = 273
      Hint = ''
      ListField = 'descricao'
      ListSource = DSVeiculo
      KeyField = 'cod'
      ListFieldIndex = 0
      DataField = 'cod_veiculo'
      DataSource = DSPadrao
      TabOrder = 4
      Color = clWindow
      FieldLabel = 'Placa'
      FieldLabelAlign = laTop
    end
    object UniDBEdit1: TUniDBEdit
      Left = 328
      Top = 32
      Width = 121
      Height = 22
      Hint = ''
      DataField = 'pedido'
      DataSource = DSPadrao
      TabOrder = 2
      FieldLabel = 'Pedido'
      FieldLabelAlign = laTop
    end
    object UniComboBox1: TUniComboBox
      Left = 179
      Top = 32
      Width = 120
      Hint = ''
      Text = ''
      TabOrder = 1
      FieldLabel = 'Hora'
      FieldLabelAlign = laTop
      IconItems = <>
      OnChange = UniComboBox1Change
    end
    object UniDBLookupComboBox3: TUniDBLookupComboBox
      Left = 24
      Top = 144
      Width = 273
      Hint = ''
      ListField = 'nome'
      ListSource = DSProduto
      KeyField = 'cod'
      ListFieldIndex = 0
      DataField = 'cod_produto'
      DataSource = DSPadrao
      TabOrder = 5
      Color = clWindow
      FieldLabel = 'Produto'
      FieldLabelAlign = laTop
    end
  end
  inherited DSPadrao: TUniDataSource
    DataSet = DM.qAgendamentoM
  end
  object DSMotorista: TUniDataSource
    DataSet = DM.qMotorista
    Left = 168
    Top = 24
  end
  object DSVeiculo: TUniDataSource
    DataSet = DM.qVeiculos
    Left = 168
    Top = 80
  end
  object TimerHorarios: TUniTimer
    Interval = 300
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = TimerHorariosTimer
    Left = 360
    Top = 24
  end
  object DSProduto: TUniDataSource
    DataSet = DM.qProdutos
    Left = 256
    Top = 80
  end
end
