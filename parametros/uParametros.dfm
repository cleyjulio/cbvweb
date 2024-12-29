inherited frmParametros: TfrmParametros
  ClientHeight = 632
  Caption = 'Par'#226'metros'
  ExplicitHeight = 671
  TextHeight = 15
  inherited BtnGroup2: TUniContainerPanel
    inherited BtnGroupAlign2: TUniContainerPanel
      inherited btNew: TUniBitBtn
        Visible = False
      end
      inherited btDelete: TUniBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited UniDBGrid1: TUniDBGrid
    Columns = <
      item
        FieldName = 'intervalo_agenda'
        Title.Caption = 'Intervalo entre cargas'
        Width = 119
      end
      item
        FieldName = 'agenda_antecipa'
        Title.Caption = 'Dias de anteced'#234'ncia'
        Width = 118
      end>
  end
  inherited UniScrollBox1: TUniScrollBox
    Height = 344
    ExplicitHeight = 344
    ScrollHeight = 246
    ScrollWidth = 301
    object UniDBEdit1: TUniDBNumberEdit
      Left = 24
      Top = 48
      Width = 95
      Height = 22
      Hint = ''
      DataField = 'intervalo_agenda'
      DataSource = DSPadrao
      TabOrder = 0
      AllowBlank = False
      MaxValue = 60.000000000000000000
      MinValue = 1.000000000000000000
      FieldLabelAlign = laTop
      DecimalPrecision = 0
      DecimalSeparator = #0
    end
    object UniDBNumberEdit1: TUniDBNumberEdit
      Left = 24
      Top = 104
      Width = 95
      Height = 22
      Hint = ''
      DataField = 'agenda_antecipa'
      DataSource = DSPadrao
      TabOrder = 1
      AllowBlank = False
      MaxValue = 365.000000000000000000
      MinValue = 1.000000000000000000
      FieldLabelAlign = laTop
      DecimalPrecision = 0
      DecimalSeparator = #0
    end
    object UniDBCheckBox1: TUniDBCheckBox
      Left = 24
      Top = 160
      Width = 145
      Height = 17
      Hint = ''
      DataField = 'agenda_no_dia'
      DataSource = DSPadrao
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Permitir agendar no mesmo dia'
      TabOrder = 2
      ParentColor = False
      Color = clBtnFace
    end
    object UniDBEdit2: TUniDBEdit
      Left = 24
      Top = 224
      Width = 95
      Height = 22
      Hint = ''
      DataField = 'horas_agenda_no_dia'
      DataSource = DSPadrao
      TabOrder = 3
      FieldLabelAlign = laTop
    end
    object UniLabel1: TUniLabel
      Left = 24
      Top = 29
      Width = 165
      Height = 13
      Hint = ''
      Caption = 'Intervalo entre cargas (minutos):'
      TabOrder = 4
    end
    object UniLabel2: TUniLabel
      Left = 24
      Top = 85
      Width = 277
      Height = 13
      Hint = ''
      Caption = 'Permitir agendamento com anteced'#234'ncia de at'#233' (dias):'
      TabOrder = 5
    end
    object UniLabel3: TUniLabel
      Left = 24
      Top = 205
      Width = 247
      Height = 13
      Hint = ''
      Caption = 'Anteced'#234'ncia para agendamento no dia (horas):'
      TabOrder = 6
    end
  end
  inherited DSPadrao: TUniDataSource
    DataSet = DM.qParametros
  end
end
