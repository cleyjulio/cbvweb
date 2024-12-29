object frmEditAgenda: TfrmEditAgenda
  Left = 0
  Top = 0
  ClientHeight = 368
  ClientWidth = 697
  Caption = 'Editar Agendamento'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = UniFormClose
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 697
    Height = 329
    Hint = ''
    Caption = 'Detalhes do agendamento:'
    Align = alTop
    TabOrder = 0
    object UniComboBox1: TUniComboBox
      Left = 24
      Top = 48
      Width = 145
      Hint = ''
      Text = 'UniComboBox1'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel1: TUniLabel
      Left = 24
      Top = 29
      Width = 59
      Height = 13
      Hint = ''
      Caption = 'Calendar Id'
      TabOrder = 2
    end
    object UniEdit1: TUniEdit
      Left = 24
      Top = 104
      Width = 201
      Hint = ''
      Text = 'UniEdit1'
      TabOrder = 3
    end
    object UniLabel2: TUniLabel
      Left = 24
      Top = 85
      Width = 49
      Height = 13
      Hint = ''
      Caption = 'Descri'#231#227'o'
      TabOrder = 4
    end
    object UniDateTimePicker1: TUniDateTimePicker
      Left = 304
      Top = 48
      Width = 220
      Hint = ''
      DateTime = 40700.044536666670000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniDateTime
      FirstDayOfWeek = dowLocaleDefault
      TabOrder = 5
      Color = clWhite
    end
    object UniLabel3: TUniLabel
      Left = 304
      Top = 29
      Width = 63
      Height = 13
      Hint = ''
      Caption = 'Data e hora:'
      TabOrder = 6
    end
  end
  object UniButton1: TUniButton
    Left = 614
    Top = 335
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    Default = True
  end
  object UniButton2: TUniButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancelar'
    Cancel = True
    ModalResult = 2
    TabOrder = 2
  end
end
