inherited frmCadProdutos: TfrmCadProdutos
  ClientHeight = 688
  Caption = 'Cadastro de Produtos'
  ExplicitHeight = 727
  TextHeight = 15
  inherited UniDBGrid1: TUniDBGrid
    Columns = <
      item
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 64
      end
      item
        FieldName = 'maximo'
        Title.Caption = 'M'#225'ximo por dia'
        Width = 76
      end>
  end
  inherited UniScrollBox1: TUniScrollBox
    Height = 400
    ExplicitHeight = 400
    ScrollHeight = 193
    ScrollWidth = 299
    object UniDBEdit1: TUniDBEdit
      Left = 16
      Top = 24
      Width = 283
      Height = 22
      Hint = ''
      DataField = 'nome'
      DataSource = DSPadrao
      TabOrder = 0
      FieldLabel = 'Nome'
      FieldLabelAlign = laTop
    end
    object UniDBCheckBox1: TUniDBCheckBox
      Left = 16
      Top = 176
      Width = 97
      Height = 17
      Hint = ''
      DataField = 'disponivel'
      DataSource = DSPadrao
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Dispon'#237'vel'
      TabOrder = 1
      ParentColor = False
      Color = clBtnFace
      FieldLabelAlign = laTop
    end
    object UniDBNumberEdit1: TUniDBNumberEdit
      Left = 16
      Top = 88
      Width = 283
      Height = 22
      Hint = ''
      DataField = 'maximo'
      DataSource = DSPadrao
      TabOrder = 2
      FieldLabel = 'M'#225'ximo por dia (ZERO para agendamentos ilimitados)'
      FieldLabelWidth = 300
      FieldLabelAlign = laTop
      DecimalSeparator = ','
    end
  end
  inherited DSPadrao: TUniDataSource
    DataSet = DM.qProdutos
  end
end
