unit uFuncionamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uPadrao, uniCheckBox, uniDBCheckBox, uniEdit,
  uniDBEdit, Data.DB, DBAccess, Uni, uniGUIBaseClasses, uniImageList,
  uniScrollBox, uniSplitter, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  uniPanel, uniGroupBox;

type
  TfrmFuncionamento = class(TfrmPadrao)
    UniDBCheckBox1: TUniDBCheckBox;
    UniGroupBox1: TUniGroupBox;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniGroupBox2: TUniGroupBox;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniGroupBox3: TUniGroupBox;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmFuncionamento: TfrmFuncionamento;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDM;

function frmFuncionamento: TfrmFuncionamento;
begin
  Result := TfrmFuncionamento(UniMainModule.GetFormInstance(TfrmFuncionamento));
end;

end.
