unit uAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uPadrao, Data.DB, DBAccess, Uni, uniGUIBaseClasses,
  uniImageList, uniScrollBox, uniSplitter, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, uniPanel, uniComboBox, uniEdit, uniDBEdit, uniMultiItem,
  uniDBComboBox, uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,
  uniTimer;

type
  TfrmAgendamento = class(TfrmPadrao)
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniDBLookupComboBox2: TUniDBLookupComboBox;
    UniDBEdit1: TUniDBEdit;
    UniComboBox1: TUniComboBox;
    DSMotorista: TUniDataSource;
    DSVeiculo: TUniDataSource;
    TimerHorarios: TUniTimer;
    DSProduto: TUniDataSource;
    UniDBLookupComboBox3: TUniDBLookupComboBox;
    procedure UniDBLookupComboBox1Select(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniDBDateTimePicker1Change(Sender: TObject);
    procedure TimerHorariosTimer(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure UniComboBox1Change(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);

  private
    { Private declarations }
    procedure MemoDbGrid(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure MemoAsText(DataSet: TDataSet);
     function ValidaCampos : String;
    var carregou : boolean;
  public
    { Public declarations }
  end;

function frmAgendamento: TfrmAgendamento;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDM, uFuncoes;

function frmAgendamento: TfrmAgendamento;
begin
  Result := TfrmAgendamento(UniMainModule.GetFormInstance(TfrmAgendamento));
end;

procedure TfrmAgendamento.btCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmAgendamento.btNewClick(Sender: TObject);
begin

  inherited;
  UniDBDateTimePicker1.SetFocus;

end;

procedure TfrmAgendamento.btSaveClick(Sender: TObject);
begin

  DSPadrao.DataSet.FieldByName('situacao').AsInteger := 1;
  DSPadrao.DataSet.FieldByName('feito_por').AsString := MM.username;
  DSPadrao.DataSet.FieldByName('criado').AsDateTime := TimeStamp;

  if UniComboBox1.Text <> '' then
  begin

    inherited;
    DSPadrao.DataSet.Close;
    Close;

  end
  else
    ShowMessage('Selecione um horário!');

end;

procedure TfrmAgendamento.MemoAsText(DataSet: TDataSet);
var
  i: Integer;
begin

  for i := 0 to DataSet.FieldCount - 1 do
    if DataSet.Fields[i].DataType in [ftMemo, ftWideMemo] then
      DataSet.Fields[i].OnGetText := MemoDbGrid;

end;

procedure TfrmAgendamento.MemoDbGrid(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin

  Text := Trim(Sender.AsString);

end;

procedure TfrmAgendamento.TimerHorariosTimer(Sender: TObject);
var ListaHorario : TStringList;
    i : integer;
begin

  UniSession.Synchronize;
  TimerHorarios.Enabled := False;

  ListaHorario := TStringList.Create;

  ListaHorario := HorariosRapidos(UniDBDateTimePicker1.DateTime);

  if ListaHorario.Count > 0 then
    for i := 0 to ListaHorario.Count-1 do
      UniComboBox1.Items.Add(ListaHorario.Strings[i]);

  frmAgendamento.HideMask;
  UniSession.Synchronize;

end;

procedure TfrmAgendamento.UniComboBox1Change(Sender: TObject);
begin
  inherited;

  if UniComboBox1.Text <> '' then
    DSPadrao.DataSet.FieldByName('hora').AsDateTime := StrToTime(UniComboBox1.Text);

end;

procedure TfrmAgendamento.UniDBDateTimePicker1Change(Sender: TObject);
begin

  UniComboBox1.Items.Clear;

  if (Carregou) and (DateToStr(UniDBDateTimePicker1.DateTime) <> '30/12/1899') then
  begin

    case Funcionamento(UniDBDateTimePicker1.DateTime) of

      -1: ShowMessage('Ocorreu um erro ao consultar a disponibilidade de data! Verifique sua conexão com a internet e tente novamente!');


      0: ShowMessage('Data indisponível para agendamento!! Selecione outra data e tente novamente!');


      1:
      begin


        frmAgendamento.ShowMask('Verificando horários...');
        TimerHorarios.Enabled := True;
        UniSession.Synchronize;

      end;

      2:
      begin

        ShowMessage('Só é possível agenda com até ' + MM.agenda_antecipa.ToString + ' dias de antecedência!');
        Exit;

      end;

    end;

  end;

end;

procedure TfrmAgendamento.UniDBLookupComboBox1Select(Sender: TObject);
begin

  inherited;

  DSVeiculo.DataSet.Close;
  DM.qVeiculos.Close;
  DM.qVeiculos.Params[0].AsString := (sender as TUniDBLookupComboBox).KeyValueStr;
  DSVeiculo.DataSet.Open;
  MemoAsText(DSVeiculo.DataSet);
  DSVeiculo.DataSet.Refresh;

end;

procedure TfrmAgendamento.UniFormAfterShow(Sender: TObject);
begin
  inherited;
  DSPadrao.DataSet.Cancel;
  DSPadrao.DataSet.Open;
  DSPadrao.DataSet.Insert;
  HabilitaBotoes;
  HabilitaCampos(True);
  btNew.Click();
  //UniDBDateTimePicker1.DateTime := Now;
  UniDBDateTimePicker1.SetFocus;
  Carregou := True;
end;

procedure TfrmAgendamento.UniFormBeforeShow(Sender: TObject);
begin
  inherited;
  DSPadrao.DataSet.Cancel;
  DSPadrao.DataSet.Close;
end;

procedure TfrmAgendamento.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  DSMotorista.DataSet.Close;
  DSVeiculo.DataSet.Close;
  DSProduto.DataSet.Close;

end;

procedure TfrmAgendamento.UniFormCreate(Sender: TObject);
begin

  Carregou := False;
  inherited;
  DSProduto.Dataset.Open;
  MemoAsText(DSProduto.DataSet);
  DSMotorista.DataSet.Open;

end;


function TfrmAgendamento.ValidaCampos: String;
begin

end;

end.
