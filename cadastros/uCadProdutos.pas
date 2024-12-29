unit uCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uPadrao, Data.DB, DBAccess, Uni, uniGUIBaseClasses,
  uniImageList, uniScrollBox, uniSplitter, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, uniPanel, uniDBEdit, uniCheckBox, uniDBCheckBox, uniEdit, uniLabel;

type
  TfrmCadProdutos = class(TfrmPadrao)
    UniDBEdit1: TUniDBEdit;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBNumberEdit1: TUniDBNumberEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDM;

function frmCadProdutos: TfrmCadProdutos;
begin
  Result := TfrmCadProdutos(UniMainModule.GetFormInstance(TfrmCadProdutos));
end;

end.
