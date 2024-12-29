object frmCalendario: TfrmCalendario
  Left = 0
  Top = 0
  ClientHeight = 610
  ClientWidth = 853
  Caption = 'Agendamentos'
  BorderStyle = bsNone
  Position = poDesktopCenter
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  TextHeight = 15
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 658
    Height = 610
    Hint = ''
    ParentColor = False
    Color = clWhite
    Align = alClient
    TabOrder = 0
    object UniPageControl1: TUniPageControl
      Left = 0
      Top = 0
      Width = 658
      Height = 610
      Hint = ''
      ActivePage = TabDia
      Align = alClient
      TabOrder = 1
      OnChange = UniPageControl1Change
      object TabMes: TUniTabSheet
        Hint = ''
        Caption = 'Visualizar m'#234's'
        object UniCalendarPanel1: TUniCalendarPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 644
          Height = 576
          Hint = ''
          Align = alClient
          DayText = 'Dia'
          MonthText = 'M'#234's'
          ShowDayView = False
          ShowTodayText = False
          ShowWeekView = False
          TodayText = 'Hoje'
          WeekText = 'Semana'
          Calendars = <
            item
              CalendarId = 0
              Title = 'Calendar-1'
              DefaultColor = False
              Color = 16744448
            end
            item
              CalendarId = 1
              Title = 'Calendar-2'
              DefaultColor = False
              Color = 8507644
            end
            item
              CalendarId = 2
              Title = 'Calendar-3'
            end
            item
              CalendarId = 3
              Title = 'Calendar-4'
            end>
          StartDate = 44105.000000000000000000
          BorderStyle = ubsFrameLowered
          OnDayClick = UniCalendarPanel1DayClick
          OnDateChange = UniCalendarPanel1DateChange
          OnEventClick = UniCalendarPanel1EventClick
        end
      end
      object TabDia: TUniTabSheet
        Hint = ''
        Caption = 'Agendamentos do dia'
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 41
          Width = 650
          Height = 478
          Hint = ''
          DataSource = DSPadrao
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
          ReadOnly = True
          WebOptions.Paged = False
          WebOptions.PageSize = 1000000
          WebOptions.KeyNavigation = knDisabled
          WebOptions.FetchAll = True
          LoadMask.Message = 'Carregando dados...'
          Align = alClient
          TabOrder = 0
          OnCellContextClick = UniDBGrid1CellContextClick
          OnDrawColumnCell = UniDBGrid1DrawColumnCell
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
              Width = 146
            end
            item
              FieldName = 'verificado_por'
              Title.Caption = 'Verificado por'
              Width = 82
            end
            item
              FieldName = 'verificado'
              Title.Caption = '  Data/Hora Verificado'
              Width = 121
            end
            item
              FieldName = 'cancelado_por'
              Title.Caption = 'Cancelado por'
              Width = 87
            end
            item
              FieldName = 'cancelado'
              Title.Caption = '  Data/Hora Cancelamento'
              Width = 136
            end>
        end
        object UniSplitter1: TUniSplitter
          Left = 0
          Top = 519
          Width = 650
          Height = 6
          Cursor = crVSplit
          Hint = ''
          Align = alBottom
          ParentColor = False
          Color = 3970116
        end
        object BtnGroup2: TUniContainerPanel
          AlignWithMargins = True
          Left = 0
          Top = 525
          Width = 650
          Height = 57
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentColor = False
          Color = 13735506
          Align = alBottom
          TabOrder = 2
          LayoutConfig.Cls = 'btn-group1'
          object BtnGroupAlign2: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 650
            Height = 57
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 13735506
            Align = alClient
            TabOrder = 1
            LayoutConfig.Padding = '1px 0'
            LayoutConfig.IgnorePosition = False
            DesignSize = (
              650
              57)
            object btNew: TUniBitBtn
              Left = 218
              Top = 8
              Width = 214
              Height = 41
              Hint = 'Agendamento manual'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Agendamento manual'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Images = UniNativeImageList1
              ImageIndex = 4
              OnClick = btNewClick
            end
          end
        end
        object UniContainerPanel1: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 650
          Height = 41
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 3
          LayoutConfig.Cls = 'btn-group1'
          object LbData: TUniLabel
            AlignWithMargins = True
            Left = 5
            Top = 10
            Width = 134
            Height = 16
            Hint = ''
            Margins.Left = 5
            Margins.Top = 10
            Margins.Right = 5
            Margins.Bottom = 15
            AutoSize = False
            Caption = 'Data'
            Align = alLeft
            ParentFont = False
            Font.Height = -15
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object UniBitBtn1: TUniBitBtn
            AlignWithMargins = True
            Left = 264
            Top = 5
            Width = 97
            Height = 29
            Hint = ''
            Margins.Left = 10
            Margins.Top = 5
            Margins.Bottom = 7
            Caption = 'Limpar filtro'
            Align = alLeft
            TabOrder = 2
            Images = UniNativeImageList1
            ImageIndex = 6
            OnClick = UniBitBtn1Click
          end
          object UniBitBtn2: TUniBitBtn
            AlignWithMargins = True
            Left = 154
            Top = 5
            Width = 97
            Height = 29
            Hint = ''
            Margins.Left = 10
            Margins.Top = 5
            Margins.Bottom = 7
            Caption = 'Buscar'
            Align = alLeft
            TabOrder = 3
            Images = UniNativeImageList1
            ImageIndex = 5
            OnClick = UniBitBtn2Click
          end
        end
      end
    end
  end
  object UniContainerPanel4: TUniContainerPanel
    AlignWithMargins = True
    Left = 667
    Top = 3
    Width = 183
    Height = 604
    Hint = ''
    ParentColor = False
    Align = alRight
    TabOrder = 1
    object UniCalendar1: TUniCalendar
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 177
      Height = 206
      Hint = ''
      Date = 40699.000000000000000000
      FirstDayOfWeek = dowMonday
      TabStop = False
      TabOrder = 1
      Align = alTop
      OnClick = UniCalendar1Click
    end
    object UniGroupBox1: TUniGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 215
      Width = 177
      Height = 114
      Hint = ''
      Caption = 'Legenda'
      Align = alTop
      ParentColor = False
      Color = clWhite
      TabOrder = 2
      object UniContainerPanel15: TUniContainerPanel
        AlignWithMargins = True
        Left = 5
        Top = 22
        Width = 167
        Height = 21
        Hint = ''
        Margins.Top = 7
        ParentColor = False
        Align = alTop
        TabOrder = 1
        object UniContainerPanel16: TUniContainerPanel
          AlignWithMargins = True
          Left = 36
          Top = 3
          Width = 128
          Height = 15
          Hint = ''
          Margins.Left = 7
          ParentColor = False
          Align = alClient
          TabOrder = 1
          object UniLabel5: TUniLabel
            Left = 0
            Top = 0
            Width = 54
            Height = 13
            Hint = ''
            Caption = 'Agendado'
            Align = alClient
            TabOrder = 1
          end
        end
        object UniContainerPanel17: TUniContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 23
          Height = 15
          Hint = ''
          ParentColor = False
          Color = 16567152
          Align = alLeft
          TabOrder = 2
        end
      end
      object UniContainerPanel18: TUniContainerPanel
        AlignWithMargins = True
        Left = 5
        Top = 49
        Width = 167
        Height = 21
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 2
        object UniContainerPanel19: TUniContainerPanel
          AlignWithMargins = True
          Left = 36
          Top = 3
          Width = 128
          Height = 15
          Hint = ''
          Margins.Left = 7
          ParentColor = False
          Align = alClient
          TabOrder = 1
          object UniLabel6: TUniLabel
            Left = 0
            Top = 0
            Width = 54
            Height = 13
            Hint = ''
            Caption = 'Cancelado'
            Align = alClient
            TabOrder = 1
          end
        end
        object UniContainerPanel20: TUniContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 23
          Height = 15
          Hint = ''
          ParentColor = False
          Color = 7323901
          Align = alLeft
          TabOrder = 2
        end
      end
      object UniContainerPanel21: TUniContainerPanel
        AlignWithMargins = True
        Left = 5
        Top = 76
        Width = 167
        Height = 21
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object UniContainerPanel22: TUniContainerPanel
          AlignWithMargins = True
          Left = 36
          Top = 3
          Width = 128
          Height = 15
          Hint = ''
          Margins.Left = 7
          ParentColor = False
          Align = alClient
          TabOrder = 1
          object UniLabel7: TUniLabel
            Left = 0
            Top = 0
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Realizado'
            Align = alClient
            TabOrder = 1
          end
        end
        object UniContainerPanel23: TUniContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 23
          Height = 15
          Hint = ''
          ParentColor = False
          Color = 11468143
          Align = alLeft
          TabOrder = 2
        end
      end
    end
  end
  object UniSplitter2: TUniSplitter
    Left = 658
    Top = 0
    Width = 6
    Height = 610
    Hint = ''
    Align = alRight
    ParentColor = False
    Color = 14342874
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 368
    Top = 115
    Images = {
      07000000FFFFFF1F042601000089504E470D0A1A0A0000000D49484452000000
      100000001008060000001FF3FF61000000097048597300000EC300000EC301C7
      6FA864000000D849444154388D63601868C04848C1AB434D060C0C0CFB191818
      0490841788D9D5251234FDD5A1A68457879AFE7FBAB9F13F0CFCF9FEFEFFAB43
      4DFF616A585E1D6A3ACFC0C06080CB100E717D065E353F389F994300459E8581
      81C140C83417438258C084CD5452000B32E7C7CB8B0C9F6F6D224A23341C3E30
      210B7E7B748854072C801BF0FBE34386BF3F3E906AC044B801DF9F9E2455F301
      31BBBA074C0C0C0C0C7F7F7C60F8F9F626C9B633304063E1FBB353A46A7E2066
      57B7016EC08F9717493560218CC1C4C0C0C0F0FFCF0F520D3840AA069C000081
      914CB1696CC1670000000049454E44AE426082FFFFFF1F04B600000089504E47
      0D0A1A0A0000000D49484452000000100000001008060000001FF3FF61000000
      097048597300000EC300000EC301C76FA8640000006849444154388D6360A010
      30323030307446AEFE4F8EE6F2E5A18C2CC80265CB4288D2D815B506CE6622C7
      666430DC0C38BAF61A410DE86A58D025893104A70BC8012CE80284D202721AA0
      8A0B701AD015B506C336920C2016C0C2600103034302CC667497D0140000F35B
      1A8471E829520000000049454E44AE426082FFFFFF1F041B01000089504E470D
      0A1A0A0000000D49484452000000100000001008060000001FF3FF6100000009
      7048597300000EC300000EC301C76FA864000000CD49444154388D63FCFFFF3F
      032580055DE0DDC97AA24C14326F646460606060A2C87A9A182064DEC808731E
      31001E06DE759B12181818E63330307C6460607058EC4D8201E89AB736F95D60
      60F083BB025FC0B2206966606060E067606038EF5DB709AE606B931F5EEF901C
      884CEC02A82ED8DAE4B7006A23CC15895B9BFC1660D3CC26A8C1C0A316C9F0E5
      D672B818232C25A2792570B1F7D97C06060607640318993918B8143C19BE3DD8
      CE206852C98862003A7877B2FE3D03038300564906444A243B29C3C0204CCAA4
      0200564F3D7F6040271F0000000049454E44AE426082FFFFFF1F04FF00000089
      504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF61
      000000097048597300000EC300000EC301C76FA864000000B149444154388DED
      92BD09C33010853F190FE0349E231075064156F02852AF22036825436A073247
      AA6CA034BAA05C84C145BA7C8DE0E0BD773F828AC7F592D989A9841658E51D5D
      34DEFBDAF0099C534AF796C1A988053BBA7803C83967801042D3A42BE92BC0E8
      A229F5B535CE3CCF03B078EF8F6F8322B2D528D281D106D3347D99F492A87700
      18695F2863000CC0021C3E1274DB790359705F0BA46D9DBC45A70BEA74FB0DF6
      F237506714AA0FF37B5E3E9E65787CFC26C60000000049454E44AE426082FFFF
      FF1F061100000063616C656E6461722D616C743B66615F3BFFFFFF1F060B0000
      007365617263683B66615F3BFFFFFF1F061100000077696E646F772D636C6F73
      653B66615F3B}
  end
  object DSPadrao: TUniDataSource
    DataSet = DM.qAgendamentos
    Left = 376
    Top = 24
  end
  object UniPopupMenu1: TUniPopupMenu
    Left = 244
    Top = 208
    object DefinircomoRealizado1: TUniMenuItem
      Caption = 'Definir como Realizado'
      OnClick = DefinircomoRealizado1Click
    end
    object CancelarAgendamento1: TUniMenuItem
      Caption = 'Cancelar Agendamento'
      OnClick = CancelarAgendamento1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object AgendamentoVERIFICADO1: TUniMenuItem
      Caption = 'Agendamento VERIFICADO'
      OnClick = AgendamentoVERIFICADO1Click
    end
  end
  object UniPopupMenu2: TUniPopupMenu
    Left = 364
    Top = 208
    object N2: TUniMenuItem
      Caption = '-'
    end
    object UniMenuItem1: TUniMenuItem
      Caption = 'Redefinir Agendamento'
      OnClick = UniMenuItem1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
  end
end
