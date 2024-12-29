unit uFiltros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniTimer, uniButton, uniBitBtn,
  uniPanel, uniDateTimePicker, uniMultiItem, uniComboBox;

type
  TfrmFiltros = class(TUniForm)
    Data1: TUniDateTimePicker;
    Data2: TUniDateTimePicker;
    BtnGroup2: TUniContainerPanel;
    BtnGroupAlign2: TUniContainerPanel;
    btNew: TUniBitBtn;
    btCancel: TUniBitBtn;
    CBSituacao: TUniComboBox;
    procedure btNewClick(Sender: TObject);
  private
    function ValidaCampos : String;
  public
    { Public declarations }
  end;

function frmFiltros: TfrmFiltros;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uRel, Main;

function frmFiltros: TfrmFiltros;
begin
  Result := TfrmFiltros(UniMainModule.GetFormInstance(TfrmFiltros));
end;

procedure TfrmFiltros.btNewClick(Sender: TObject);
begin

  if ValidaCampos = '' then
  begin

    MainForm.D1 := Data1.DateTime;
    MainForm.D2 := Data2.DateTime;
    MainForm.Situacao := CBSituacao.ItemIndex;
    ModalResult := mrOK

  end
  else
    ShowMessage('Selecione um intervalor de meses!');

end;

function TfrmFiltros.ValidaCampos: String;
begin

  try

    if Data1.DateTime > Data2.DateTime then
    begin

      Result := 'A data inicial não pode ser maior que a data final!';
      Exit;

    end
    else
      Result := '';

    if (Data1.Text = '') or (Data2.Text = '') then
    begin

      Result := 'Preencha corretamente o intervalo de datas!';
      Exit;

    end
    else
      Result := '';


  except

    Result := 'Preencha todos os campos corretamente!';

  end;


end;

end.
