object frmRel: TfrmRel
  Left = 0
  Top = 0
  ClientHeight = 561
  ClientWidth = 755
  Caption = 'Visualizador de Relat'#243'rios'
  WindowState = wsMaximized
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMaximize]
  KeyPreview = True
  MonitoredKeys.Keys = <>
  PageMode = True
  ScreenMask.WaitData = True
  ScreenMask.Color = clSilver
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object UniURLFrame1: TUniURLFrame
    Left = 0
    Top = 51
    Width = 755
    Height = 510
    Hint = ''
    Align = alClient
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
  end
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 51
    Hint = ''
    ParentColor = False
    Color = 8421631
    Align = alTop
    TabOrder = 1
    DesignSize = (
      755
      51)
    object btClose: TUniSpeedButton
      AlignWithMargins = True
      Left = 324
      Top = 6
      Width = 105
      Height = 40
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Constraints.MaxHeight = 40
      Constraints.MaxWidth = 105
      Constraints.MinHeight = 40
      Constraints.MinWidth = 105
      Caption = '<i class="fas fa-times-circle"></i> Fechar'
      Anchors = []
      ParentFont = False
      Font.Color = 185
      Font.Height = -13
      Font.Style = [fsBold]
      ParentColor = False
      Color = 8421631
      Transparency = toFuchsia
      TabOrder = 1
      OnClick = btCloseClick
    end
  end
end
