inherited frmFuncionamento: TfrmFuncionamento
  Caption = 'Hor'#225'rio de funcionamento do carregamento'
  TextHeight = 15
  inherited BtnGroup2: TUniContainerPanel
    Top = 212
    ExplicitTop = 212
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
    Height = 206
    Columns = <
      item
        FieldName = 'dia_da_semana'
        Title.Caption = 'Dia da semana'
        Width = 120
        ReadOnly = True
      end>
  end
  inherited UniSplitter1: TUniSplitter
    Top = 206
    ExplicitTop = 206
  end
  inherited UniScrollBox1: TUniScrollBox
    Top = 269
    Height = 420
    ExplicitTop = 269
    ExplicitHeight = 420
    ScrollHeight = 377
    ScrollWidth = 377
    object UniDBCheckBox1: TUniDBCheckBox
      Left = 16
      Top = 25
      Width = 121
      Height = 17
      Hint = ''
      DataField = 'situacao'
      DataSource = DSPadrao
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Em funcionamento'
      TabOrder = 0
      ParentColor = False
      Color = clBtnFace
    end
    object UniGroupBox1: TUniGroupBox
      Left = 16
      Top = 72
      Width = 361
      Height = 89
      Hint = ''
      Caption = '1'#170' Etapa de carregamento'
      TabOrder = 1
      object UniDBEdit1: TUniDBEdit
        Left = 24
        Top = 24
        Width = 113
        Height = 22
        Hint = ''
        DataField = 'hora_inicio'
        DataSource = DSPadrao
        TabOrder = 1
        FieldLabel = 'Hor'#225'rio de in'#237'cio'
        FieldLabelAlign = laTop
      end
      object UniDBEdit2: TUniDBEdit
        Left = 200
        Top = 24
        Width = 113
        Height = 22
        Hint = ''
        DataField = 'hora_fim'
        DataSource = DSPadrao
        TabOrder = 2
        FieldLabel = 'hor'#225'rio final'
        FieldLabelAlign = laTop
      end
    end
    object UniGroupBox2: TUniGroupBox
      Left = 16
      Top = 176
      Width = 361
      Height = 89
      Hint = ''
      Caption = '2'#170' Etapa de carregamento'
      TabOrder = 2
      object UniDBEdit3: TUniDBEdit
        Left = 24
        Top = 24
        Width = 113
        Height = 22
        Hint = ''
        DataField = 'hora_inicio2'
        DataSource = DSPadrao
        TabOrder = 1
        FieldLabel = 'Hor'#225'rio de in'#237'cio'
        FieldLabelAlign = laTop
      end
      object UniDBEdit4: TUniDBEdit
        Left = 200
        Top = 24
        Width = 113
        Height = 22
        Hint = ''
        DataField = 'hora_fim2'
        DataSource = DSPadrao
        TabOrder = 2
        FieldLabel = 'hor'#225'rio final'
        FieldLabelAlign = laTop
      end
    end
    object UniGroupBox3: TUniGroupBox
      Left = 16
      Top = 288
      Width = 361
      Height = 89
      Hint = ''
      Caption = '3'#170' Etapa de carregamento'
      TabOrder = 3
      object UniDBEdit5: TUniDBEdit
        Left = 24
        Top = 24
        Width = 113
        Height = 22
        Hint = ''
        DataField = 'hora_inicio3'
        DataSource = DSPadrao
        TabOrder = 1
        FieldLabel = 'Hor'#225'rio de in'#237'cio'
        FieldLabelAlign = laTop
      end
      object UniDBEdit6: TUniDBEdit
        Left = 200
        Top = 24
        Width = 113
        Height = 22
        Hint = ''
        DataField = 'hora_fim3'
        DataSource = DSPadrao
        TabOrder = 2
        FieldLabel = 'hor'#225'rio final'
        FieldLabelAlign = laTop
      end
    end
  end
  inherited DSPadrao: TUniDataSource
    DataSet = DM.qFuncionamento
  end
end
