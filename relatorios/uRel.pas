unit uRel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, frxGradient, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF, uniButton, uniGUIBaseClasses, uniURLFrame,
  uniTreeView, uniTreeMenu, uniBitBtn, uniSpeedButton, uniPanel, Uni;

type
  TfrmRel = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
    UniContainerPanel1: TUniContainerPanel;
    btClose: TUniSpeedButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Relatorio, Titulo, detalhe : string;
    Parametros: array [0..10] of string;
    Dados : TUniQuery;
  end;

function frmRel: TfrmRel;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ufrDM;

function frmRel: TfrmRel;
begin
  Result := TfrmRel(MM.GetFormInstance(TfrmRel));
end;

procedure TfrmRel.UniButton1Click(Sender: TObject);
begin

  Close;

end;

procedure TfrmRel.UniFormBeforeShow(Sender: TObject);
var
  frdm : TfrDM;
  RepUrl : string;
begin

  frdm := TfrDM.Create(nil);

  try

    Dados.Prepare;
    Dados.ParamCheck := True;
    RepUrl := frdm.GenReportPDF(relatorio, Titulo, Detalhe, Parametros, Dados);

  finally

    frdm.Free;

  end;

  UniURLFrame1.URL := RepUrl;

end;

procedure TfrmRel.btCloseClick(Sender: TObject);
begin

  Dados.Params.Clear;
  Close;

end;

end.
