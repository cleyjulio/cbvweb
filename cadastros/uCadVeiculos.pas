unit uCadVeiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uPadrao, Data.DB, DBAccess, Uni, uniGUIBaseClasses,
  uniImageList, uniScrollBox, uniSplitter, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, uniPanel, uniDBEdit, uniEdit;

type
  TfrmCadVeiculos = class(TfrmPadrao)
    UniDBEdit1: TUniDBEdit;
    edModelo: TUniDBEdit;
    UniDBNumberEdit1: TUniDBNumberEdit;
    procedure btSaveClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
    function ValidaCampos : String;
  public
    { Public declarations }
    cod_motorista : integer;
  end;

function frmCadVeiculos: TfrmCadVeiculos;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDM, uFuncoes_Unigui;

function frmCadVeiculos: TfrmCadVeiculos;
begin
  Result := TfrmCadVeiculos(UniMainModule.GetFormInstance(TfrmCadVeiculos));
end;

procedure TfrmCadVeiculos.btCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadVeiculos.btSaveClick(Sender: TObject);
begin

  if ValidaCampos = '' then
  begin

    DSPadrao.DataSet.FieldByName('feito_por').AsString := MM.username;
    DSPadrao.DataSet.FieldByName('criado').AsDateTime := TimeStamp;
    DSPadrao.DataSet.FieldByName('cod_motorista').AsInteger := cod_motorista;
    inherited;
    Close;

  end
  else
    ShowMessage(ValidaCampos);

end;

procedure TfrmCadVeiculos.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
  DSPadrao.DataSet.Refresh;
end;

function TfrmCadVeiculos.ValidaCampos: String;
begin

  Result := 'Erro';

  if ValidaPlaca(UniDBEdit1.Text) then
  begin

    if PlacaDisponivel(UniDBEdit1.Text, cod_motorista) then
     Result := ''
    else
    begin

      Result := 'Placa já cadastrada para este motorista!';
      Exit;

    end;

  end
  else
  begin

    Result := 'Placa inválida!';
    Exit;

  end;

  if (edModelo.Text <> '') and (Length(UniDBEdit1.Text) > 4) then
    Result := ''
  else
  begin

    Result := 'Modelo inválido!';
    Exit;

  end;

end;

end.
