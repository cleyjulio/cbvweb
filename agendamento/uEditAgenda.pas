unit uEditAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniGroupBox, uniButton,
  uniLabel, uniMultiItem, uniComboBox, uniDateTimePicker, uniEdit, uniCheckBox,
  uniCalendarPanel;

type
  TfrmEditAgenda = class(TUniForm)
    UniGroupBox1: TUniGroupBox;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniComboBox1: TUniComboBox;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel2: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    Event : TUniCalendarEvent;
  public
    { Public declarations }
    Calenedar: TUniCalendarPanel;
    procedure ClearEvent;
    procedure SetEvent(E: TUniCalendarEvent);
    procedure SetDate(A, B: TDateTime);
  end;

function frmEditAgenda: TfrmEditAgenda;

implementation

{$R *.dfm}

uses
  uniGUIApplication, MainModule;

function frmEditAgenda: TfrmEditAgenda;
begin
  Result := TfrmEditAgenda(UniMainModule.GetFormInstance(TfrmEditAgenda));
end;

procedure TfrmEditAgenda.ClearEvent;
begin

  Event := nil;
  UniDateTimePicker1.DateTime := Date;
  //UniDateTimePicker2.DateTime := Date;
  UniEdit1.Text := 'New Event';
  //UniEdit2.Text := '';
  UniComboBox1.Text := '1';

end;

procedure TfrmEditAgenda.SetEvent(E: TUniCalendarEvent);
begin

  Event := E;
  if Assigned(E) then
  begin

    UniDateTimePicker1.DateTime := E.StartDate;
    //UniDateTimePicker2.DateTime := E.EndDate;
    UniEdit1.Text := E.Title;
    //UniEdit2.Text := E.Reminder;
    UniComboBox1.Text := IntToStr(E.CalendarId);
    //UniCheckBox1.Checked := E.IsAllDay;

  end;

end;

procedure TfrmEditAgenda.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if ModalResult = mrOK then
  begin

      //delete
//    if UniCheckBox2.Checked then
//    begin
//      Event.Free;
//      Exit;
//    end;


      //verifica intervalo de datas
//    if (UniDateTimePicker1.DateTime = UniDateTimePicker2.DateTime) and (not UniCheckBox1.Checked) then
//    begin
//
//      ShowMessage('Start and stop date/time must be different.');
//      Action := caNone;
//      Exit;
//
//    end;

    if not Assigned(Event) then
      Event := Calenedar.Events.Add;

    Event.StartDate := UniDateTimePicker1.DateTime;
    //Event.EndDate := UniDateTimePicker2.DateTime;
    Event.Title := UniEdit1.Text;
    //Event.Reminder := UniEdit2.Text;

    if UniComboBox1.Text <> '' then
      Event.CalendarId := StrToIntDef(UniComboBox1.Text[1], 1);

    //Event.IsAllDay := UniCheckBox1.Checked;

  end;

end;

procedure TfrmEditAgenda.UniFormShow(Sender: TObject);
var
  I : Integer;
begin

  if Assigned(Calenedar) then
  begin

    UniComboBox1.Items.Clear;

    for I  :=  0 to Calenedar.Calendars.Count - 1 do
      UniComboBox1.Items.Add(IntToStr(Calenedar.Calendars[I].CalendarId));

  end;

end;

procedure TfrmEditAgenda.SetDate(A, B: TDateTime);
begin

  UniDateTimePicker1.DateTime := A;
  //UniDateTimePicker2.DateTime := B;

end;

end.
