inherited frmCadMotoristas: TfrmCadMotoristas
  ClientWidth = 737
  Caption = 'Cadastro de Motoristas'
  ExplicitWidth = 753
  TextHeight = 15
  inherited BtnGroup2: TUniContainerPanel
    Width = 737
    ExplicitWidth = 737
    inherited BtnGroupAlign2: TUniContainerPanel
      Width = 737
      ExplicitWidth = 737
    end
  end
  inherited UniDBGrid1: TUniDBGrid
    Width = 737
    WebOptions.PageSize = 200
    Columns = <
      item
        FieldName = 'cod'
        Title.Caption = 'C'#243'd.'
        Width = 47
      end
      item
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 450
      end
      item
        FieldName = 'celular'
        Title.Caption = 'Celular'
        Width = 114
      end
      item
        FieldName = 'cpf'
        Title.Caption = 'CPF'
        Width = 100
      end>
  end
  inherited UniSplitter1: TUniSplitter
    Width = 737
    ExplicitWidth = 737
  end
  inherited UniScrollBox1: TUniScrollBox
    Width = 737
    ExplicitWidth = 737
    ScrollWidth = 409
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 409
      Height = 399
      Hint = ''
      ParentColor = False
      Color = 16121081
      Align = alLeft
      TabOrder = 0
      DesignSize = (
        409
        399)
      object UniDBEdit1: TUniDBEdit
        Left = 16
        Top = 24
        Width = 377
        Height = 22
        Hint = ''
        DataField = 'nome'
        DataSource = DSPadrao
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        FieldLabel = 'Nome'
        FieldLabelAlign = laTop
      end
      object edFone: TUniDBEdit
        Left = 16
        Top = 80
        Width = 157
        Height = 22
        Hint = ''
        DataField = 'celular'
        DataSource = DSPadrao
        CharCase = ecUpperCase
        TabOrder = 2
        FieldLabel = 'Celular'
        FieldLabelAlign = laTop
      end
      object edCpf: TUniDBEdit
        Left = 228
        Top = 80
        Width = 157
        Height = 22
        Hint = ''
        DataField = 'cpf'
        DataSource = DSPadrao
        CharCase = ecUpperCase
        TabOrder = 3
        InputMask.Mask = '999.999.999-99'
        InputMask.UnmaskText = True
        InputMask.RemoveWhiteSpace = True
        FieldLabel = 'CPF'
        FieldLabelAlign = laTop
      end
      object edSenha: TUniEdit
        Left = 16
        Top = 136
        Width = 157
        Hint = ''
        PasswordChar = '*'
        MaxLength = 10
        Text = ''
        TabOrder = 4
        FieldLabel = 'Senha'
        FieldLabelAlign = laTop
      end
      object edSenha2: TUniEdit
        Left = 228
        Top = 136
        Width = 157
        Hint = ''
        PasswordChar = '*'
        MaxLength = 10
        Text = ''
        TabOrder = 5
        FieldLabel = 'Confirma'#231#227'o de senha'
        FieldLabelAlign = laTop
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 409
      Top = 0
      Width = 326
      Height = 399
      Hint = ''
      ParentColor = False
      Color = 16121081
      Align = alClient
      TabOrder = 1
      object UniContainerPanel3: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 326
        Height = 185
        Hint = ''
        ParentColor = False
        Color = 16121081
        Align = alTop
        TabOrder = 1
        object UniContainerPanel4: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 326
          Height = 43
          Hint = ''
          ParentColor = False
          Color = 16121081
          Align = alTop
          TabOrder = 1
        end
        object UniContainerPanel5: TUniContainerPanel
          Left = 279
          Top = 43
          Width = 47
          Height = 142
          Hint = ''
          ParentColor = False
          Color = 16121081
          Align = alRight
          TabOrder = 2
          object UniSpeedButton1: TUniSpeedButton
            Left = 6
            Top = 0
            Width = 35
            Height = 35
            Hint = ''
            Caption = '<i class="fas fa-edit"></i>'
            ParentFont = False
            Font.Color = 10658385
            Font.Height = -16
            ParentColor = False
            Color = clWindow
            TabOrder = 1
            OnClick = UniSpeedButton1Click
          end
        end
        object UniContainerPanel6: TUniContainerPanel
          Left = 0
          Top = 43
          Width = 279
          Height = 142
          Hint = ''
          ParentColor = False
          Color = 16121081
          Align = alClient
          TabOrder = 3
          object UniDBGrid2: TUniDBGrid
            Left = 0
            Top = 0
            Width = 279
            Height = 142
            Hint = ''
            Enabled = False
            DataSource = DSVeiculo
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
            ReadOnly = True
            LoadMask.Message = 'Carregando dados...'
            ForceFit = True
            Align = alClient
            TabOrder = 1
            Columns = <
              item
                FieldName = 'descricao'
                Title.Caption = 'Ve'#237'culos'
                Width = 234
                ReadOnly = True
              end>
          end
        end
      end
    end
  end
  inherited DSPadrao: TUniDataSource
    DataSet = DM.qMotorista
    OnDataChange = DSPadraoDataChange
  end
  object DSVeiculo: TUniDataSource
    DataSet = DM.qVeiculos
    Left = 168
    Top = 80
  end
end
