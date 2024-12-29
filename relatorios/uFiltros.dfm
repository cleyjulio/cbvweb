object frmFiltros: TfrmFiltros
  Left = 0
  Top = 0
  ClientHeight = 193
  ClientWidth = 524
  Caption = 'Filtros para relat'#243'rio'
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object Data1: TUniDateTimePicker
    Left = 24
    Top = 48
    Width = 120
    Hint = ''
    DateTime = 44493.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 0
    FieldLabel = 'Data inicial'
    FieldLabelAlign = laTop
  end
  object Data2: TUniDateTimePicker
    Left = 184
    Top = 48
    Width = 120
    Hint = ''
    DateTime = 44493.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 1
    FieldLabel = 'Data final'
    FieldLabelAlign = laTop
  end
  object BtnGroup2: TUniContainerPanel
    AlignWithMargins = True
    Left = 0
    Top = 136
    Width = 524
    Height = 57
    Hint = ''
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = 8234333
    Align = alBottom
    TabOrder = 2
    LayoutConfig.Cls = 'btn-group2'
    object BtnGroupAlign2: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 524
      Height = 57
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Color = 8234333
      Align = alClient
      TabOrder = 1
      LayoutConfig.Cls = 'btn-group-align2'
      LayoutConfig.Padding = '1px 0'
      LayoutConfig.IgnorePosition = False
      object btNew: TUniBitBtn
        Left = 0
        Top = 0
        Width = 60
        Height = 57
        Hint = 'Ok'
        ShowHint = True
        ParentShowHint = False
        Caption = '<i class="fas fa-check"></i>'
        Align = alLeft
        TabOrder = 1
        LayoutConfig.Cls = 'green'
        OnClick = btNewClick
      end
      object btCancel: TUniBitBtn
        Left = 60
        Top = 0
        Width = 60
        Height = 57
        Hint = 'Cancelar'
        ShowHint = True
        ParentShowHint = False
        Caption = '<i class="fas fa-ban"></i>'
        Align = alLeft
        TabOrder = 2
      end
    end
  end
  object CBSituacao: TUniComboBox
    Left = 344
    Top = 48
    Width = 145
    Hint = ''
    Text = ''
    Items.Strings = (
      'Todos'
      'Agendados'
      'Cancelados'
      'Realizados')
    TabOrder = 3
    FieldLabel = 'Status do agendamento'
    FieldLabelAlign = laTop
    IconItems = <>
  end
end
