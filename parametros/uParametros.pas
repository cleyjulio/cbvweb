unit uParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uPadrao, uniDBEdit, uniEdit, Data.DB, DBAccess,
  Uni, uniGUIBaseClasses, uniImageList, uniScrollBox, uniSplitter, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, uniPanel, uniCheckBox, uniDBCheckBox,
  uniLabel;

type
  TfrmParametros = class(TfrmPadrao)
    UniDBEdit1: TUniDBNumberEdit;
    UniDBNumberEdit1: TUniDBNumberEdit;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBEdit2: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmParametros: TfrmParametros;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDM;

function frmParametros: TfrmParametros;
begin
  Result := TfrmParametros(UniMainModule.GetFormInstance(TfrmParametros));
end;

end.
