object frmPadrao: TfrmPadrao
  Left = 0
  Top = 0
  ClientHeight = 689
  ClientWidth = 765
  Caption = 'CBV'
  Color = clWhite
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = UniFormClose
  BorderIcons = []
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Movable = False
  PageMode = True
  ScreenMask.Enabled = True
  ScreenMask.WaitData = True
  ScreenMask.Message = 'Carregando...'
  ScreenMask.Color = 8234333
  OnCreate = UniFormCreate
  TextHeight = 15
  object BtnGroup2: TUniContainerPanel
    AlignWithMargins = True
    Left = 0
    Top = 231
    Width = 765
    Height = 57
    Hint = ''
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = 13735506
    Align = alTop
    TabOrder = 0
    LayoutConfig.Cls = 'btn-group1'
    object BtnGroupAlign2: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 765
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
      LayoutConfig.Cls = 'btn-group-align'
      LayoutConfig.Padding = '1px 0'
      LayoutConfig.IgnorePosition = False
      object btNew: TUniBitBtn
        Left = 0
        Top = 0
        Width = 60
        Height = 57
        Hint = 'Novo'
        ShowHint = True
        ParentShowHint = False
        Caption = '<i class="fas fa-plus-circle"></i>'
        Align = alLeft
        TabOrder = 1
        OnClick = btNewClick
      end
      object btSave: TUniBitBtn
        Left = 60
        Top = 0
        Width = 60
        Height = 57
        Hint = 'Salvar'
        ShowHint = True
        ParentShowHint = False
        Caption = '<i class="far fa-save"></i>'
        Align = alLeft
        TabOrder = 2
        OnClick = btSaveClick
      end
      object btDelete: TUniBitBtn
        Left = 180
        Top = 0
        Width = 60
        Height = 57
        Hint = 'Excluir'
        ShowHint = True
        ParentShowHint = False
        Caption = '<i class="fas fa-trash-alt"></i>'
        Align = alLeft
        TabOrder = 3
        OnClick = btDeleteClick
      end
      object btEdit: TUniBitBtn
        Left = 120
        Top = 0
        Width = 60
        Height = 57
        Hint = 'Editar'
        ShowHint = True
        ParentShowHint = False
        Caption = '<i class="far fa-edit"></i>'
        Align = alLeft
        TabOrder = 4
        OnClick = btEditClick
      end
      object btCancel: TUniBitBtn
        Left = 240
        Top = 0
        Width = 60
        Height = 57
        Hint = 'Cancelar'
        ShowHint = True
        ParentShowHint = False
        Caption = '<i class="fas fa-ban"></i>'
        Align = alLeft
        TabOrder = 5
        OnClick = btCancelClick
      end
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 0
    Width = 765
    Height = 225
    Hint = ''
    DataSource = DSPadrao
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
    ReadOnly = True
    LoadMask.Message = 'Carregando dados...'
    ForceFit = True
    Align = alTop
    TabOrder = 1
    OnCellClick = UniDBGrid1CellClick
    OnTitleClick = UniDBGrid1TitleClick
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 225
    Width = 765
    Height = 6
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = 5665343
  end
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 288
    Width = 765
    Height = 401
    Hint = ''
    Align = alClient
    Color = 16121081
    TabOrder = 3
  end
  object UniNativeImageList1: TUniNativeImageList
    Width = 29
    Height = 29
    Left = 56
    Top = 72
    Images = {
      07000000FFFFFF1F0610000000706C75732D7371756172653B66615F3BFFFFFF
      1F060C000000666C6F7070792D6F3B66613BFFFFFF1F060A00000070656E6369
      6C3B66613BFFFFFF1F060900000074726173683B66613BFFFFFF1F0607000000
      62616E3B66613BFFFFFF1F060A0000007365617263683B66613BFFFFFF1F0614
      000000636C6F75642D75706C6F61642D616C743B66613B}
  end
  object DSPadrao: TUniDataSource
    Left = 56
    Top = 16
  end
end
