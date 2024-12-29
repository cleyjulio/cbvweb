unit uPadrao;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Data.DB,
  DBAccess,
  Uni,
  uniGUIClasses,
  uniGUIForm,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIBaseClasses,
  uniImageList,
  uniSplitter,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniDBEdit,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniDBLookupComboBox,
  uniMemo,
  uniDBMemo,
  uniSpeedButton,
  uniRadioGroup,
  uniDBRadioGroup,
  uniCheckBox,
  uniDBCheckBox,
  uniDateTimePicker,
  uniDBDateTimePicker,
  uniCanvas,
  uniScrollBox,
  uniTreeView,
  uniFileUpload;

type
  TfrmPadrao = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniNativeImageList1: TUniNativeImageList;
    DSPadrao: TUniDataSource;
    UniSplitter1: TUniSplitter;
    BtnGroup2: TUniContainerPanel;
    BtnGroupAlign2: TUniContainerPanel;
    btNew: TUniBitBtn;
    btSave: TUniBitBtn;
    btDelete: TUniBitBtn;
    btEdit: TUniBitBtn;
    btCancel: TUniBitBtn;
    UniScrollBox1: TUniScrollBox;
    procedure UniFormCreate(Sender: TObject);
    procedure TrataErro(Sender: TObject; E: Exception);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure btNewClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniDBGrid1TitleClick(Column: TUniDBGridColumn);
    procedure HabilitaBotoes; virtual;
    procedure HabilitaCampos(Status: Boolean); virtual;

    private
    { Private declarations }
    procedure ChangeEnter(Sender: TObject);
    procedure ChangeExit(Sender: TObject);

    procedure CustomKeyDown;
    procedure MemoDbGrid(Sender: TField; var Text: string; DisplayText: Boolean); Virtual;
    procedure MemoAsText(DataSet: TDataSet); virtual;
    procedure Foco;
    procedure Delete(Sender: TComponent; Res: Integer);

  public
    { Public declarations }
  end;

function frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main;

function frmPadrao: TfrmPadrao;
begin
  Result := TfrmPadrao(MM.GetFormInstance(TfrmPadrao));
end;

procedure TfrmPadrao.btDeleteClick(Sender: TObject);
begin

  MessageDlg('Deseja Excluir o Registro', mtConfirmation, mbYesNo, Delete);

end;

procedure TfrmPadrao.btCancelClick(Sender: TObject);
begin

  //if (DSPadrao.DataSet.State in [dsInsert, dsEdit]) then
  //begin

    DSPadrao.DataSet.Cancel;
    HabilitaBotoes;
    HabilitaCampos(False);

  //end;

end;

procedure TfrmPadrao.btEditClick(Sender: TObject);
begin

  DSPadrao.dataset.edit;
  HabilitaBotoes;
  HabilitaCampos(True);

end;

procedure TfrmPadrao.btNewClick(Sender: TObject);
begin

  DSPAdrao.DataSet.Insert;
  HabilitaBotoes;
  HabilitaCampos(True);

end;

procedure TfrmPadrao.btSaveClick(Sender: TObject);
begin

  if (DSPadrao.DataSet.FindField('status') <> nil) then
    if DSPadrao.DataSet.State in [dsInsert] then
      DSPadrao.DataSet.FieldByName('status').AsInteger := 1;

  DSPadrao.dataset.post;

  DSPadrao.dataset.Refresh;

  HabilitaBotoes;
  HabilitaCampos(False);

  MM.ToastMessage('Agendamento CBV','Dados salvos com sucesso!');

end;

procedure TfrmPadrao.ChangeEnter(Sender: TObject);
begin

   if Sender is TUniDBEdit then
    TUniDBEdit(Sender).Color := $00BEE9D1//$00E6FED8
  else if Sender is TUniDBLookupComboBox then
    TUniDBLookupComboBox(Sender).Color := $00BEE9D1
  else if Sender is TUniDBComboBox then
    TUniDBComboBox(Sender).Color := $00BEE9D1
  else if Sender is TUniDBMemo then
    TUniDBMemo(Sender).Color := $00BEE9D1
  else if Sender is TUniDBDateTimePicker then
    TUniDBDateTimePicker(Sender).Color := $00BEE9D1
  else if Sender is TUniDBNumberEdit then
    TUniDBNumberEdit(Sender).Color := $00BEE9D1

end;

procedure TfrmPadrao.ChangeExit(Sender: TObject);
begin

  if Sender is TUniDBEdit then
    TUniDBEdit(Sender).Color := clWindow
  else if Sender is TUniDBLookupComboBox then
    TUniDBLookupComboBox(Sender).Color := clWindow
  else if Sender is TUniDBComboBox then
    TUniDBComboBox(Sender).Color := clWindow
  else if Sender is TUniDBMemo then
    TUniDBMemo(Sender).Color := clWindow
  else if Sender is TUniDBDateTimePicker then
    TUniDBDateTimePicker(Sender).Color := clWindow
  else if Sender is TUniDBNumberEdit then
    TUniDBNumberEdit(Sender).Color := clWindow

end;

procedure TfrmPadrao.CustomKeyDown;
var
  I: Integer;
  somentenumero, numeroevirgula : String;
begin

  somentenumero := 'function keydown(sender, e, eOpts) ' +
      '{ var event = e;  ' +
      'if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 || ' +
      '(event.keyCode == 65 && event.ctrlKey === true) || ' +
      '(event.keyCode >= 35 && event.keyCode <= 39)) { ' +
      'return; ' +
      '} else { ' +
      'if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) { ' +
      'event.preventDefault(); ' +
      '} } } ' ;

  numeroevirgula := 'function keydown(sender, e, eOpts) ' +
      '{ if (e.keyCode !=   8 && e.keyCode !=   9 && e.keyCode !=  45 && e.keyCode !=  46 && ' +
      'e.keyCode !=  39 && ' +
      'e.keyCode !=  33 && e.keyCode !=  35 && e.keyCode !=  36 && e.keyCode !=  188 && ' +
      'e.keyCode !=  37 && e.keyCode !=  38 && e.keyCode !=  44 && e.keyCode !=  40 && ' +
      'e.keyCode !=  48 && e.keyCode !=  49 && e.keyCode !=  50 && e.keyCode !=  51 && ' +
      'e.keyCode !=  52 && e.keyCode !=  53 && e.keyCode !=  54 && e.keyCode !=  55 && ' +
      'e.keyCode !=  56 && e.keyCode !=  57 && e.keyCode !=  96 && e.keyCode !=  97 && ' +
      'e.keyCode !=  98 && e.keyCode !=  99 && e.keyCode != 100 && e.keyCode != 101 && ' +
      'e.keyCode != 102 && e.keyCode != 103 && e.keyCode != 104 && e.keyCode != 105) ' +
      '{e.stopEvent();} } ' ;


  for I := 0 to ComponentCount - 1 do
  begin

    if ((Components[I] is TUniDBEdit) or (Components[I] is TUniEdit)) and (Components[I].Tag = 2)  then
    begin

      //somente números e vírgula como decimal
      TUniDBEdit(Components[I]).ClientEvents.ExtEvents.Values['keydown'] := 'function keydown(sender, e, eOpts) ' +
      '{ var event = e;  ' +
      'if (event.keyCode == 110) {event.keyCode = 188;} ' +
      'if (event.keyCode == 188 || event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 || ' +
      '(event.keyCode == 65 && event.ctrlKey === true) || ' +
      '(event.keyCode >= 35 && event.keyCode <= 39)) { ' +
      'return; ' +
      '} else { ' +
      'if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) { ' +
      'event.preventDefault(); ' +
      '} } } ' ;



//      TUniDBEdit(Components[I]).ClientEvents.ExtEvents.Values['keydown'] := 'function keydown(sender, e, eOpts) ' +
//      '{ if (e.keyCode !=   8 && e.keyCode !=   9 && e.keyCode !=  45 && e.keyCode !=  46 && ' +
//      'e.keyCode !=  39 && ' +
//      'e.keyCode !=  33 && e.keyCode !=  35 && e.keyCode !=  36 && e.keyCode !=  188 && ' +
//      'e.keyCode !=  37 && e.keyCode !=  38 && e.keyCode !=  44 && e.keyCode !=  40 && ' +
//      'e.keyCode !=  48 && e.keyCode !=  49 && e.keyCode !=  50 && e.keyCode !=  51 && ' +
//      'e.keyCode !=  52 && e.keyCode !=  53 && e.keyCode !=  54 && e.keyCode !=  55 && ' +
//      'e.keyCode !=  56 && e.keyCode !=  57 && e.keyCode !=  96 && e.keyCode !=  97 && ' +
//      'e.keyCode !=  98 && e.keyCode !=  99 && e.keyCode != 100 && e.keyCode != 101 && ' +
//      'e.keyCode != 102 && e.keyCode != 103 && e.keyCode != 104 && e.keyCode != 105) ' +
//      '{e.stopEvent();} } ' ;




    end
    else
    //somente números
    if ((Components[I] is TUniDBEdit) or (Components[I] is TUniEdit)) and (Components[I].Tag = 3)  then
    begin

      if (Components[I] is TUniDBEdit) then
        TUniDBEdit(Components[I]).ClientEvents.ExtEvents.Values['keydown'] := somentenumero;

      if (Components[I] is TUniEdit) then
        TUniEdit(Components[I]).ClientEvents.ExtEvents.Values['keydown'] := somentenumero;

    end;

  end;

end;

procedure TfrmPadrao.Delete(Sender: TComponent; Res: Integer);
begin

  if Res = mrYes then
  begin

    DSPadrao.dataset.Edit;
    DSPadrao.dataset.FieldByName('status').AsInteger := 0;
    DSPadrao.dataset.Post;
    DSPadrao.dataset.Refresh;
    HabilitaBotoes;
    HabilitaCampos(False);
    MM.ToastMessage('Agendamento CBV','Registro excluído com sucesso!');

  end;

end;

procedure TfrmPadrao.Foco;
var
  Ed: TComponent;
begin

  //Se tiver um UNIDBEdit na tela ele dá o foco.
  try

    Ed := TComponent.Create(Self);
    Ed := FindComponent('UniDBEdit1');

    if (Ed.ClassName = 'TUniDBEdit') or (Ed.ClassName = 'TUniDBNumberEdit') or
      (Ed.ClassName = 'TUniEdit') or (Ed.ClassName = 'TUniDBComboBox')  or (Ed.ClassName = 'TUniDBLookUpComboBox') then
      TUniDBEdit(Ed).SetFocus;

    //Ed.Free;

  except

  end;

end;

procedure TfrmPadrao.HabilitaBotoes;
begin

  BtNew.Enabled := not(DSPadrao.DataSet.State in [dsInsert, dsEdit]);
  BtSave.Enabled := (DSPadrao.DataSet.State in [dsInsert, dsEdit]);
  BtEdit.Enabled := (DSPadrao.DataSet.State in [dsBrowse]) and (DSPadrao.DataSet.RecordCount > 0);
  BtDelete.Enabled := (DSPadrao.DataSet.State in [dsBrowse, dsEdit]) and (DSPadrao.DataSet.RecordCount > 0);
  BtCancel.Enabled := True;

end;

procedure TfrmPadrao.HabilitaCampos(Status: Boolean);
var
  I: Integer;
begin

  for I := 0 to ComponentCount - 1 do
  begin

    if Components[I] is TUniDBEdit then
      TUniDBEdit(Components[I]).Enabled := Status
    else if (Components[I] is TUniDBLookupComboBox) and (Components[I].Tag <> 1) then
      TUniDBLookupComboBox(Components[I]).Enabled := Status
    else if Components[I] is TUniDBComboBox then
      TUniDBComboBox(Components[I]).Enabled := Status
    else if Components[I] is TUniDBMemo then
      TUniDBMemo(Components[I]).Enabled := Status
    else if Components[I] is TUniDBRadioGroup then
      TUniDBRadioGroup(Components[I]).Enabled := Status
    else if Components[I] is TUniDBCheckBox then
      TUniDBCheckBox(Components[I]).Enabled := Status
    else if Components[I] is TUniEdit then
      TUniEdit(Components[I]).Enabled := Status
    else if Components[I] is TUniDBDateTimePicker then
      TUniDBDateTimePicker(Components[I]).Enabled := Status
    else if (Components[I] is TUniSpeedButton) and (Components[I].Tag <> 1) then
      TUniSpeedButton(Components[I]).Enabled := Status
    else if (Components[I] is TUniTreeView) and (Components[I].Tag <> 1) then
      TUniTreeView(Components[I]).Enabled := Status
    else if (Components[I] is TUniFileUploadButton) and (Components[I].Tag <> 1) then
      TUniFileUploadButton(Components[I]).Enabled := Status
    else if (Components[I] is TUniDBNumberEdit) then
      TUniDBNumberEdit(Components[I]).Enabled := Status
    else if (Components[I] is TUniComboBox) then
      TUniComboBox(Components[I]).Enabled := Status

  end;

  Foco;

end;

procedure TfrmPadrao.MemoAsText(DataSet: TDataSet);
var
  i: Integer;
begin

  for i := 0 to DataSet.FieldCount - 1 do
    if DataSet.Fields[i].DataType in [ftMemo, ftWideMemo] then
      DataSet.Fields[i].OnGetText := MemoDbGrid;

end;

procedure TfrmPadrao.MemoDbGrid(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin

  Text := Trim(Sender.AsString);

end;

procedure TfrmPadrao.TrataErro(Sender: TObject; E: Exception);
begin

  Self.HideMask;
  UniSession.Synchronize;
  MM.ToastMessage('Agendamento CBV','Ocorreu um erro!' +#13+
              'Mensagem do erro: ' + E.Message +#13+
              'Classe: ' + E.ClassName);

end;

procedure TfrmPadrao.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin

  DSPadrao.DataSet.Cancel;
  HabilitaBotoes;
  HabilitaCampos(False);

end;

procedure TfrmPadrao.UniDBGrid1TitleClick(Column: TUniDBGridColumn);
var i : integer;
begin

  DSPadrao.DataSet.Cancel;
  HabilitaBotoes;
  HabilitaCampos(False);

  TUniQuery(DSPadrao.DataSet).Close;
  i := Pos('order by', ANSILOWERCASE(TUniQuery(DSPadrao.DataSet).SQL.Text));

  if i > 0 then
  begin

    TUniQuery(DSPadrao.DataSet).SQL.Text := Copy(TUniQuery(DSPadrao.DataSet).SQL.Text, 1, i -1);
    TUniQuery(DSPadrao.DataSet).SQL.Text := TUniQuery(DSPadrao.DataSet).SQL.Text +
      'order by ' + Column.FieldName;

  end;

  TUniQuery(DSPadrao.DataSet).Open;

end;

procedure TfrmPadrao.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin

  try

    DSPadrao.dataset.Cancel;
    DSPadrao.dataset.Close;

  except

  end;

end;

procedure TfrmPadrao.UniFormCreate(Sender: TObject);
var
  I: Integer;
begin

  //tratar erros
  Application.OnException := TrataErro;

  for I := 0 to ComponentCount - 1 do
  begin

    if Components[I] is TUniDBEdit then
    begin

      TUniDBEdit(Components[I]).OnEnter  := ChangeEnter;
      TUniDBEdit(Components[I]).OnExit   := ChangeExit;

    end
    else
    if Components[I] is TUniDBLookupComboBox then
    begin

      TUniDBLookupComboBox(Components[I]).OnEnter := ChangeEnter;
      TUniDBLookupComboBox(Components[I]).OnExit  := ChangeExit;

    end
    else
    if Components[I] is TUniDBComboBox then
    begin

      TUniDBComboBox(Components[I]).OnEnter := ChangeEnter;
      TUniDBComboBox(Components[I]).OnExit  := ChangeExit;

    end
    else
    if Components[I] is TUniDBMemo then
    begin

      TUniDBMemo(Components[I]).OnEnter   := ChangeEnter;
      TUniDBMemo(Components[I]).OnExit    := ChangeExit;

    end
    else
    if Components[I] is TUniDBDateTimePicker then
    begin

      TUniDBDateTimePicker(Components[I]).OnEnter   := ChangeEnter;
      TUniDBDateTimePicker(Components[I]).OnExit    := ChangeExit;

    end
    else
    if Components[I] is TUniDBNumberEdit then
    begin

      TUniDBNumberEdit(Components[I]).OnEnter   := ChangeEnter;
      TUniDBNumberEdit(Components[I]).OnExit    := ChangeExit;

    end

  end;

  CustomKeyDown;

  Try

    DSPadrao.DataSet.Open;
    MemoAsText(DSPadrao.DataSet);
    HabilitaBotoes;
    HabilitaCampos(False);

  except

    on e: Exception do
    begin

      MM.ToastMessage('Agendamento CBV', 'Erro ao conectar base de dados' +#13+
                  'Erro : ' + E.Message +#13+
                  'Classe : ' + E.ClassName);
    end;

  end;

end;

end.
