inherited frmCadUsuarios: TfrmCadUsuarios
  Caption = 'Cadastro de usu'#225'rios'
  TextHeight = 15
  inherited UniDBGrid1: TUniDBGrid
    Columns = <
      item
        FieldName = 'cod'
        Title.Caption = 'C'#243'd.'
        Width = 64
      end
      item
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 228
      end
      item
        FieldName = 'email'
        Title.Caption = 'Email'
        Width = 427
      end>
  end
  inherited UniScrollBox1: TUniScrollBox
    ScrollHeight = 267
    ScrollWidth = 385
    object UniDBEdit1: TUniDBEdit
      Left = 16
      Top = 32
      Width = 365
      Height = 22
      Hint = ''
      DataField = 'nome'
      DataSource = DSPadrao
      CharCase = ecUpperCase
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      FieldLabel = 'Nome'
      FieldLabelAlign = laTop
    end
    object edEmail: TUniDBEdit
      Left = 16
      Top = 88
      Width = 369
      Height = 22
      Hint = ''
      DataField = 'EMAIL'
      DataSource = DSPadrao
      CharCase = ecLowerCase
      TabOrder = 1
      FieldLabel = 'Email'
      FieldLabelAlign = laTop
    end
    object edSenha: TUniEdit
      Left = 16
      Top = 144
      Width = 157
      Hint = ''
      PasswordChar = '*'
      MaxLength = 10
      Text = ''
      TabOrder = 2
      FieldLabel = 'Senha'
      FieldLabelAlign = laTop
    end
    object edSenha2: TUniEdit
      Left = 228
      Top = 144
      Width = 157
      Hint = ''
      PasswordChar = '*'
      MaxLength = 10
      Text = ''
      TabOrder = 3
      FieldLabel = 'Confirma'#231#227'o de senha'
      FieldLabelAlign = laTop
    end
    object UniDBRadioGroup1: TUniDBRadioGroup
      Left = 16
      Top = 200
      Width = 369
      Height = 67
      Hint = ''
      DataField = 'adm'
      DataSource = DSPadrao
      Caption = 'Tipo de usu'#225'rio'
      TabOrder = 4
      Items.Strings = (
        'Portaria'
        'Faturamento'
        'Administrador')
      Columns = 3
      Values.Strings = (
        '0'
        '2'
        '1')
    end
  end
  inherited DSPadrao: TUniDataSource
    DataSet = DM.qUsuarios
  end
end
