//AllFeatures: Calendar,Calendar Panel,icon-calendar-panel
unit uCalendario;

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
  Dialogs,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIRegClasses,
  uniguiclasses,
  uniGUIForm,
  uniToolBar,
  uniGUIBaseClasses,
  uniCalendarPanel,
  uniPanel,
  uniCalendar,
  uniStatusBar,
  ImgList,
  uniTimer,
  uniImageList,
  uniButton,
  DateUtils,
  uniPageControl,
  uniBitBtn,
  uniSplitter,
  uniBasicGrid,
  uniDBGrid,
  Data.DB,
  DBAccess,
  Uni,
  uniLabel,
  uniDBText,
  uniDateTimePicker,
  uniGroupBox,
  Vcl.Menus,
  uniMainMenu,

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
  uniCanvas,
  uniScrollBox,
  uniTreeView,
  uniFileUpload, MemDS;

type
  TfrmCalendario = class(TUniForm)
    UniNativeImageList1: TUniNativeImageList;
    DSPadrao: TUniDataSource;
    UniContainerPanel2: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    TabMes: TUniTabSheet;
    UniCalendarPanel1: TUniCalendarPanel;
    TabDia: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    UniSplitter1: TUniSplitter;
    BtnGroup2: TUniContainerPanel;
    BtnGroupAlign2: TUniContainerPanel;
    btNew: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    LbData: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    UniCalendar1: TUniCalendar;
    UniSplitter2: TUniSplitter;
    UniGroupBox1: TUniGroupBox;
    UniContainerPanel15: TUniContainerPanel;
    UniContainerPanel16: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniContainerPanel17: TUniContainerPanel;
    UniContainerPanel18: TUniContainerPanel;
    UniContainerPanel19: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniContainerPanel20: TUniContainerPanel;
    UniContainerPanel21: TUniContainerPanel;
    UniContainerPanel22: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniContainerPanel23: TUniContainerPanel;
    UniPopupMenu1: TUniPopupMenu;
    DefinircomoRealizado1: TUniMenuItem;
    CancelarAgendamento1: TUniMenuItem;
    UniPopupMenu2: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    N1: TUniMenuItem;
    N2: TUniMenuItem;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    N3: TUniMenuItem;
    AgendamentoVERIFICADO1: TUniMenuItem;
    procedure UniCalendar1Click(Sender: TObject);
    procedure UniCalendarPanel1DateChange(Sender: TUniCalendarPanel; StartDate,
      ViewStart, ViewEnd: TDateTime);
    procedure UniFormCreate(Sender: TObject);
    procedure UniCalendarPanel1DayClick(Sender: TUniCalendarPanel;
      ADate: TDateTime; Allday: Boolean);
    procedure UniCalendarPanel1EventClick(Sender: TUniCalendarPanel;
      AEventId: Integer; AEvent: TUniCalendarEvent);
    procedure AgendaMes(Inicio, Fim : TDateTime);
    procedure AgendaDia(Data: TDateTime);
    procedure UniPageControl1Change(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniDBGrid1CellContextClick(Column: TUniDBGridColumn; X,
      Y: Integer);
    procedure DefinircomoRealizado1Click(Sender: TObject);
    procedure CancelarAgendamento1Click(Sender: TObject);
    procedure UniMenuItem1Click(Sender: TObject);
    procedure btNewClick(Sender: TObject);
      procedure MemoDbGrid(Sender: TField; var Text: string; DisplayText: Boolean); Virtual;
    procedure MemoAsText(DataSet: TDataSet); virtual;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure AgendamentoVERIFICADO1Click(Sender: TObject);
  private
    { Private declarations }
    var mes, ano :smallint;
  public
    { Public declarations }
  end;

function frmCalendario: TfrmCalendario;

implementation

{$R *.dfm}

uses
  uniGUIVars, uniGUIApplication, MainModule, ServerModule, uEditAgenda, uDM,
  uAgendamento, uBusca, uFuncoes;

function frmCalendario: TfrmCalendario;
begin

  Result  :=  TfrmCalendario(UniMainModule.GetFormInstance(TfrmCalendario));

end;

procedure TfrmCalendario.AgendaDia(Data: TDateTime);
begin

  UniCalendar1.Date := Data;

  LbData.Caption := DateToStr(Data);

  DM.qAgendamentos.Close;
  DM.qAgendamentos.Params[0].AsDate := data;
  DM.qAgendamentos.Params[1].AsDate := data;
  DM.qAgendamentos.Open;
  DM.qAgendamentos.Refresh;

  UniPageControl1.ActivePage := TabDia;

end;

procedure TfrmCalendario.AgendamentoVERIFICADO1Click(Sender: TObject);
begin

  MessageDlg('Deseja definir o agendamento como VERIFICADO?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin

      if Res = mrYes then
      begin

        DSPadrao.DataSet.Edit;
        DSPadrao.DataSet.FieldByName('verificado_por').AsString := MM.username;
        DSPadrao.DataSet.FieldByName('verificado').AsDateTime := TimeStamp;
        DSPadrao.DataSet.Post;
        DM.qAgendamentos.ApplyUpdates;
        DSPadrao.DataSet.Refresh;

      end;

    end
  );

end;

procedure TfrmCalendario.AgendaMes(Inicio, Fim: TDateTime);
var
  E : TUniCalendarEvent;
  dia : smallint;
begin

  UniCalendarPanel1.Events.Clear;

  ano := YearOf(Inicio);
  mes := MonthOf(Fim);

  DM.qAgendamentos.Close;
  DM.qAgendamentos.Params[0].AsDate := inicio;
  DM.qAgendamentos.Params[1].AsDate := fim;
  DM.qAgendamentos.Open;
  DM.qAgendamentos.First;

  if DM.qAgendamentos.RecordCount > 0 then
  begin

    dia := 0;

    while DM.qAgendamentos.Eof = False do
    begin

      if (dia <> UIntPtr(DayOf(DM.qAgendamentosdata.AsDateTime))) or (dia = 0) then
      begin

        E := UniCalendarPanel1.Events.Add;
        E.CalendarId := 0;
        E.Title := 'AGENDAMENTOS';
        E.StartDate := DM.qAgendamentosdata.AsDateTime + (DM.qAgendamentoshora.AsDateTime);
        E.EndDate := DM.qAgendamentosdata.AsDateTime + (DM.qAgendamentoshora.AsDateTime);
        E.IsAllDay := True;

        dia := DayOf(DM.qAgendamentosdata.AsDateTime);

      end;

      DM.qAgendamentos.Next;

    end;

  end;

end;

procedure TfrmCalendario.btNewClick(Sender: TObject);
begin

  frmAgendamento.ShowModal(
    procedure(Sender: TComponent; Result:Integer)
    begin

       DSPadrao.DataSet.Refresh;

    end
  );

end;

procedure TfrmCalendario.CancelarAgendamento1Click(Sender: TObject);
begin

  MessageDlg('Deseja cancelar o agendamento', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin

      if Res = mrYes then
      begin

        DSPadrao.DataSet.Edit;
        DSPAdrao.DataSet.FieldByName('situacao').AsInteger := 2;
        DSPadrao.DataSet.FieldByName('cancelado_por').AsString := MM.username;
        DSPadrao.DataSet.FieldByName('cancelado').AsDateTime := TimeStamp;
        DSPadrao.DataSet.Post;
        DM.qAgendamentos.ApplyUpdates;
        DSPadrao.DataSet.Refresh;

      end;

    end
  );

end;

procedure TfrmCalendario.DefinircomoRealizado1Click(Sender: TObject);
begin

  MessageDlg('Deseja definir o agendamento como realizado?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin

      if Res = mrYes then
      begin

        DSPadrao.DataSet.Edit;
        DSPAdrao.DataSet.FieldByName('situacao').AsInteger := 3;
        DSPadrao.DataSet.Post;
        DM.qAgendamentos.ApplyUpdates;
        DSPadrao.DataSet.Refresh;

      end;

    end
  );

end;

procedure TfrmCalendario.MemoAsText(DataSet: TDataSet);
var
  i: Integer;
begin

  for i := 0 to DataSet.FieldCount - 1 do
    if DataSet.Fields[i].DataType in [ftMemo, ftWideMemo] then
      DataSet.Fields[i].OnGetText := MemoDbGrid;

end;

procedure TfrmCalendario.MemoDbGrid(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin

  Text := Trim(Sender.AsString);

end;

procedure TfrmCalendario.UniBitBtn1Click(Sender: TObject);
begin

  DM.qAgendamentos.Filtered := False;

end;

procedure TfrmCalendario.UniBitBtn2Click(Sender: TObject);
begin

  DM.qAgendamentos.Filtered := True;
  frmBusca.ShowModal;

end;

procedure TfrmCalendario.UniCalendar1Click(Sender: TObject);
begin

  AgendaDia(UniCalendar1.Date);

end;

procedure TfrmCalendario.UniCalendarPanel1DateChange(Sender: TUniCalendarPanel;
  StartDate, ViewStart, ViewEnd: TDateTime);
begin

  UniCalendar1.Date := UniCalendarPanel1.StartDate;

  //if (ano <> UIntPtr(YearOf(ViewStart))) and (mes <> UIntPtr(MonthOf(ViewEnd))) then
    AgendaMes(ViewStart, ViewEnd);

end;

procedure TfrmCalendario.UniCalendarPanel1DayClick(Sender: TUniCalendarPanel;
  ADate: TDateTime; Allday: Boolean);
begin

  AgendaDia(ADate);

end;

procedure TfrmCalendario.UniCalendarPanel1EventClick(Sender: TUniCalendarPanel;
  AEventId: Integer; AEvent: TUniCalendarEvent);
begin

  AgendaDia(AEvent.StartDate);

end;

procedure TfrmCalendario.UniDBGrid1CellContextClick(Column: TUniDBGridColumn; X,
  Y: Integer);
begin

  if DSPadrao.DataSet.FieldByName('situacao').AsInteger = 1 then
    UniPopupMenu1.Popup(X, Y, UniDBGrid1)
  else
    UniPopupMenu2.Popup(X, Y, UniDBGrid1)

end;

procedure TfrmCalendario.UniDBGrid1DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin

  case (Sender as TUniDBGrid).DataSource.DataSet.fieldbyname('situacao').AsInteger of

    1 : Attribs.Color := $00FCCB70;

    2 : Attribs.Color := $006FC0FD;

    3 : Attribs.Color := $00AEFD6F;

  end;

end;

procedure TfrmCalendario.UniFormBeforeShow(Sender: TObject);
begin

  if MM.adm = 2 then
    btNew.Enabled := False
  else
    btNew.Enabled := True;

end;

procedure TfrmCalendario.UniFormCreate(Sender: TObject);
var
  inicio, fim : TDatetime;
begin

  UniCalendar1.Date := Date;
  UniCalendarPanel1.StartDate := Date;

  ano := YearOf(Now());
  mes := MonthOf(Now());

  inicio := EncodeDateTime(ano, mes, 1,0,0,0,0);
  Fim := EndOfTheMonth(EncodeDateTime(ano, mes, 1,0,0,0,0));

  AgendaMes(inicio, fim);
  MemoAsText(DSPadrao.DataSet);

  UniPageControl1.ActivePageIndex := 0;

  LbData.Caption := DateToStr(Now());

//        E.CalendarId := 0;
//        E.Title := 'AGENDAMENTO';//'Ped.: ' + DM.qAgendamentospedido.AsString + ' - Placa: ' + Dm.qAgendamentosplaca.AsString;
//        //E.Title := 'Ped.: ' + DM.qAgendamentospedido.AsString + ' - Placa: ' + Dm.qAgendamentosplaca.AsString;
//        E.StartDate := DM.qAgendamentosdata.AsDateTime + (DM.qAgendamentoshora.AsDateTime);
//        E.EndDate := DM.qAgendamentosdata.AsDateTime + (DM.qAgendamentoshora.AsDateTime);
//        //E.EndDate := DM.qAgendamentosdata.AsDateTime + (DM.qAgendamentoshora.AsDateTime + StrToTime('00:25:00'));
//        E.IsAllDay := True;
//
//        dia := DayOf(DM.qAgendamentosdata.AsDateTime);


end;

procedure TfrmCalendario.UniMenuItem1Click(Sender: TObject);
begin

  MessageDlg('Deseja Redefinir o agendamento', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin

      if Res = mrYes then
      begin

        DSPadrao.DataSet.Edit;
        DSPAdrao.DataSet.FieldByName('situacao').AsInteger := 1;
        DSPadrao.DataSet.Post;
        DM.qAgendamentos.ApplyUpdates;
        DSPadrao.DataSet.Refresh;

      end;

    end
  );

end;

procedure TfrmCalendario.UniPageControl1Change(Sender: TObject);
var inicio, fim : TDateTime;
begin

  if UniPageControl1.ActivePage = TabDia then
  begin

    AgendaDia(UniCalendar1.Date);

  end
  else
  begin

    UniCalendarPanel1.StartDate := UniCalendar1.Date;
    ano := YearOf(UniCalendarPanel1.StartDate);
    mes := MonthOf(UniCalendarPanel1.StartDate);

    inicio := EncodeDateTime(ano, mes, 1,0,0,0,0);
    Fim := EndOfTheMonth(EncodeDateTime(ano, mes, 1,0,0,0,0));

    AgendaMes(inicio, fim);

  end;

end;

initialization
  RegisterMainFormClass(TfrmCalendario);

end.
