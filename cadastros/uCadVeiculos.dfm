inherited frmCadVeiculos: TfrmCadVeiculos
  ClientHeight = 508
  ClientWidth = 619
  Caption = 'Cadastro de Ve'#237'culos'
  BorderStyle = bsSizeable
  BorderIcons = [biSystemMenu]
  ExplicitWidth = 635
  ExplicitHeight = 547
  TextHeight = 15
  inherited BtnGroup2: TUniContainerPanel
    Width = 619
    ExplicitWidth = 619
    inherited BtnGroupAlign2: TUniContainerPanel
      Width = 619
      ExplicitWidth = 619
    end
  end
  inherited UniDBGrid1: TUniDBGrid
    Width = 619
    Columns = <
      item
        FieldName = 'placa'
        Title.Caption = 'placa'
        Width = 64
      end
      item
        FieldName = 'modelo'
        Title.Caption = 'modelo'
        Width = 304
      end
      item
        FieldName = 'eixos'
        Title.Caption = 'eixos'
        Width = 64
      end>
  end
  inherited UniSplitter1: TUniSplitter
    Width = 619
    ExplicitWidth = 619
  end
  inherited UniScrollBox1: TUniScrollBox
    Width = 619
    Height = 220
    ExplicitWidth = 619
    ExplicitHeight = 220
    ScrollHeight = 158
    ScrollWidth = 239
    object UniDBEdit1: TUniDBEdit
      Left = 16
      Top = 24
      Width = 93
      Height = 22
      Hint = ''
      DataField = 'placa'
      DataSource = DSPadrao
      CharCase = ecUpperCase
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      FieldLabel = 'Placa'
      FieldLabelAlign = laTop
    end
    object edModelo: TUniDBEdit
      Left = 16
      Top = 80
      Width = 223
      Height = 22
      Hint = ''
      DataField = 'modelo'
      DataSource = DSPadrao
      CharCase = ecUpperCase
      TabOrder = 1
      FieldLabel = 'Modelo'
      FieldLabelAlign = laTop
    end
    object UniDBNumberEdit1: TUniDBNumberEdit
      Left = 16
      Top = 136
      Width = 43
      Height = 22
      Hint = ''
      DataField = 'eixos'
      DataSource = DSPadrao
      MaxLength = 1
      TabOrder = 2
      MaxValue = 9.000000000000000000
      MinValue = 2.000000000000000000
      FieldLabel = 'Eixos'
      FieldLabelAlign = laTop
      DecimalPrecision = 0
      DecimalSeparator = ','
    end
  end
  inherited DSPadrao: TUniDataSource
    DataSet = DM.qVeiculos
  end
end
