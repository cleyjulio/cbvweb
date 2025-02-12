unit uFuncoes;

interface

uses System.DateUtils,
     System.RegularExpressions,
     system.SysUtils,
     System.Classes,
     Vcl.Graphics,
     uniDBEdit,
     uniEdit,
     uniGUIApplication,
     Uni;

function CalculaIdade(DataIni, DataFim: TDateTime): string;
Function RetornaSoNumeros(texto: String): String;
function ValidaCPF(const cCPF: String): boolean;
function ValidaEmail(Email : String) : Boolean;
function ValidaPlaca(Placa : String) : Boolean;
function FormataValor(edit:TuniEdit):String;
function ValidaFone(celular : String) : Boolean;
procedure ToastMessage(Titulo, Mensagem : String);
function CPFDisponivel(cpf: String): Boolean;
function EmailDisponivel(email: String): Boolean;
function Funcionamento(data : TDateTime) : smallint;
function Horarios(data : TDateTime) : TStringList;
function HorariosRapidos(data : TDateTime) : TStringList;
function VerificaHorario(data, hora: TDateTime) : boolean;
function DataAtual: TDateTime;
function TimeStamp : TDateTime;
function PlacaDisponivel(placa: String; cod_motor : Integer): Boolean;

implementation

uses uDM, MainModule;

function PlacaDisponivel(placa: String; cod_motor : Integer): Boolean;
begin

  try

    DM.q1.Close;
    DM.q1.SQL.Clear;
    DM.q1.SQL.Add('select v.placa, v.status from veiculo v '
      + 'where v.status = 1 and v.cod_motorista = :cod and v.placa = :p ');
    DM.q1.Params[0].AsInteger := cod_motor;
    DM.q1.Params[1].AsString := placa;
    DM.q1.Open;

    if DM.q1.RecordCount = 0 then
      Result := True
    else
      Result := False;

  except

     Result := False;

  end;

end;

function ValidaPlaca(Placa: String): boolean;
begin

  if TRegEx.isMatch(Placa, ('^[A-Z]{3}[0-9][A-Z0-9][0-9]{2}$')) then
    Result := True
  else
    Result := False;

end;

function DataAtual: TDateTime;
var qRemoto : TUniQuery;
begin

  try

    qRemoto := TUniquery.Create(Nil);
    qRemoto.Connection := MM.Conexao;
    qRemoto.Close;
    qRemoto.SQL.Clear;

    qRemoto.SQL.Add('select CURRENT_DATE; ');
    qRemoto.Open;

    Result := qRemoto.Fields[0].AsDateTime;

    qRemoto.Close;
    qRemoto.DisposeOf;

  except

    //Result := StrToDate('');

  end;

end;

function TimeStamp: TDateTime;
var qRemoto : TUniQuery;
begin

  try

    qRemoto := TUniquery.Create(Nil);
    qRemoto.Connection := MM.Conexao;
    qRemoto.Close;
    qRemoto.SQL.Clear;

    qRemoto.SQL.Add('select current_timestamp; ');
    qRemoto.Open;

    Result := qRemoto.Fields[0].AsDateTime;

    qRemoto.Close;
    qRemoto.DisposeOf;

  except


  end;

end;

function Funcionamento(data : TDateTime) : smallint;
var dia_semana, dia, mes, ano : smallint;
    data_atual : TDateTime;
begin

  Result := -1; //erro

  try

    dia_semana := dayofweek(data);
    dia := dayof(data);
    mes := monthof(data);
    ano := yearof(data);

    data_atual := DataAtual;

    //verifica se não é uma data passada...
    if data >= data_atual then
    begin

      //verifica se é no prazo de antecedencia o agendamento
      DM.q1.Close;
      DM.q1.SQL.Clear;
      DM.q1.SQL.Add('SELECT agenda_antecipa, intervalo FROM parametros ');
      DM.q1.Open;

      MM.agenda_antecipa := DM.q1.FieldByName('agenda_antecipa').AsInteger;
      MM.intervalo_agenda := 4;//DM.q1.FieldByName('intervalo').AsDateTime;

      if (data <= (data_atual + MM.agenda_antecipa)) then
      begin

        //verifica se é um dia de atendimento
        DM.q1.Close;
        DM.q1.SQL.Clear;
        DM.q1.SQL.Add('SELECT * FROM funcionamento ');
        DM.q1.SQL.Add('where dia_semana = :dia and situacao = 1');
        DM.q1.Params[0].AsInteger := dia_semana;
        DM.q1.Open;

        if DM.q1.RecordCount > 0 then
        begin

          //guarda horarios de funcionamento
          MM.hora_inicio := DM.q1.FieldByName('hora_inicio').AsDateTime;
          MM.hora_fim := DM.q1.FieldByName('hora_fim').AsDateTime;
          MM.hora_inicio2 := DM.q1.FieldByName('hora_inicio2').AsDateTime;
          MM.hora_fim2 := DM.q1.FieldByName('hora_fim2').AsDateTime;
          MM.hora_inicio3 := DM.q1.FieldByName('hora_inicio3').AsDateTime;
          MM.hora_fim3 := DM.q1.FieldByName('hora_fim3').AsDateTime;
//          MM.intervalo_inicio := DM.q1.FieldByName('intervalo_inicio').AsDateTime;
//          MM.intervalo_fim := DM.q1.FieldByName('intervalo_fim').AsDateTime;

//          if (TimeToStr(MM.intervalo_inicio) = '') or (TimeToStr(MM.intervalo_inicio) = '00:00:00') then
//            MM.intervalo := False
//          else
//            MM.intervalo := true;

          //verifica se é feriado
          DM.q1.Close;
          DM.q1.SQL.Clear;
          DM.q1.SQL.Add('SELECT * FROM feriados ');
          DM.q1.SQL.Add('where dia = :dia and mes = :mes and status = 1');
          DM.q1.Params[0].AsInteger := dia;
          DM.q1.Params[1].AsInteger := mes;
          DM.q1.Open;

          if DM.q1.RecordCount = 0 then
          begin

            //verificar se é um dia de NÃO funcionamento
            DM.q1.Close;
            DM.q1.SQL.Clear;
            DM.q1.SQL.Add('SELECT * FROM n_funciona ');
            DM.q1.SQL.Add('where data = :data and status = 1');
            DM.q1.Params[0].AsDateTime := data;
            DM.q1.Open;

            if DM.q1.RecordCount = 0 then
              Result := 1//FUNCIONANDO
            else
              Result := 0; //não estará funcionando

          end
          else
            if (DM.q1.FieldByName('ano').AsString = '') or (DM.q1.FieldByName('ano').AsInteger = ano) then
              Result := 0; //não estará funcionando

        end
        else
          Result := 0; //não estará funcionando

      end
      else
         Result := 2; //fora do prazo de agendamento!

    end
    else
      Result := 0; //não estará funcionando

  except

     Result := -1; //erro

  end;

end;

function VerificaHorario(data, hora: TDateTime) : boolean;
begin

  DM.q1.Close;
  DM.q1.SQL.Clear;
  DM.q1.SQL.Add('SELECT * FROM agendamento ');
  DM.q1.SQL.Add('where data = :data and hora = :hora and situacao <> 3 and status = 1');
  DM.q1.SQL.Add('order by hora');
  DM.q1.Params[0].AsDateTime := data;
  DM.q1.Params[1].AsDateTime := hora;
  DM.q1.Open;

  if DM.q1.RecordCount > 0 then
    Result := True
  else
    Result := False;

end;

function HorariosRapidos(data: TDateTime): TStringList;
var ListaHorarios : TStringList;
hora : TDateTime;
begin

  try

    ListaHorarios := TStringList.Create;

    hora := MM.hora_inicio;

    //PRIMEIRO turno
    hora := MM.hora_inicio;

    while hora <= MM.hora_fim do
    begin

      ListaHorarios.Add(TimeToStr(hora));

      //soma o intervalo de agendamento à hora
      hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');

    end;

    //SEGUNDO turno
    hora := MM.hora_inicio2;

    while hora <= MM.hora_fim2 do
    begin

      ListaHorarios.Add(TimeToStr(hora));

      //soma o intervalo de agendamento à hora
      hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');

    end;

    //TERCEIRO turno
    hora := MM.hora_inicio3;

    while hora <= MM.hora_fim3 do
    begin

      ListaHorarios.Add(TimeToStr(hora));

      //soma o intervalo de agendamento à hora
      hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');

    end;

    Result := ListaHorarios;

  except

     Result := nil;

  end;

//  try
//
//    ListaHorarios := TStringList.Create;
//
//    hora := MM.hora_inicio;
//
//    //se não tem intervalo
//    if MM.intervalo = false then
//    begin
//
//      while hora <= MM.hora_fim do
//      begin
//
//        ListaHorarios.Add(TimeToStr(hora));
//
//        //soma o intervalo de agendamento à hora
//        hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');
//
//      end;
//
//    end
//    else
//    begin
//
//      while hora <= MM.intervalo_inicio do
//      begin
//
//        ListaHorarios.Add(TimeToStr(hora));
//
//        //soma o intervalo de agendamento à hora
//        hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');
//
//      end;
//
//      hora := MM.intervalo_fim;
//
//      while hora <= MM.hora_fim do
//      begin
//
//        ListaHorarios.Add(TimeToStr(hora));
//
//        //soma o intervalo de agendamento à hora
//        hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');
//
//      end;
//
//    end;
//
//    Result := ListaHorarios;
//
//  except
//
//     Result := nil;
//
//  end;

end;

function Horarios(data: TDateTime): TStringList;
var ListaHorarios : TStringList;
hora : TDateTime;
begin

  try

    ListaHorarios := TStringList.Create;

    //PRIMEIRO Turno
    hora := MM.hora_inicio;

    while hora <= MM.hora_fim do
    begin

      if not VerificaHorario(data, hora) then
        ListaHorarios.Add(TimeToStr(hora));

      //soma o intervalo de agendamento à hora
      hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');

    end;

    //SEGUNDO Turno
    hora := MM.hora_inicio2;

    while hora <= MM.hora_fim2 do
    begin

      if not VerificaHorario(data, hora) then
        ListaHorarios.Add(TimeToStr(hora));

      //soma o intervalo de agendamento à hora
      hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');

    end;

    //TERCEIRO Turno
    hora := MM.hora_inicio3;

    while hora <= MM.hora_fim3 do
    begin

      if not VerificaHorario(data, hora) then
        ListaHorarios.Add(TimeToStr(hora));

      //soma o intervalo de agendamento à hora
      hora := hora + StrToTime('00:'+ IntToStr(MM.intervalo_agenda)+':00');

    end;

    Result := ListaHorarios;

  except

     Result := nil;

  end;

end;

function ValidaFone(celular : String) : Boolean;
begin

  if TRegEx.isMatch(celular, ('^1\d\d(\d\d)?$|^(\(0?([1-9a-zA-Z][0-9a-zA-Z])?[1-9]\d\) ?|0?([1-9a-zA-Z][0-9a-zA-Z])?[1-9]\d[ .-]?)?(9|9[ .-])?[2-9]\d{3}[ .-]?\d{4}$')) then
    Result := True
  else
    Result := False;

end;

function EmailDisponivel(email: String): Boolean;
begin

  try

    DM.q1.Close;
    DM.q1.SQL.Clear;
    DM.q1.SQL.Add('SELECT u.email FROM usuario u ');
    DM.q1.SQL.Add('where u.email = ' + QuotedStr(email));
    DM.q1.Open;

    if DM.q1.RecordCount = 0 then
      Result := True
    else
      Result := False;

    DM.q1.Close;

  except

    Result := False;
    DM.q1.Close;

  end;

end;

function CPFDisponivel(cpf: String): Boolean;
begin

  try

    DM.q1.Close;
    DM.q1.SQL.Clear;
    DM.q1.SQL.Add('SELECT m.cpf FROM motorista m ');
    DM.q1.SQL.Add('where m.status = 1 and m.cpf = ' + QuotedStr(cpf));
    DM.q1.Open;

    if DM.q1.RecordCount = 0 then
      Result := True
    else
      Result := False;

    DM.q1.Close;

  except

    Result := False;
    DM.q1.Close;

  end;

end;


function FormataValor(edit:TuniEdit):String;
var
   s : string;
   v : double;
   I : integer;
begin
  try
   if edit.Text = EmptyStr then
      edit.Text := '0';

   {obter o texto do edit, SEM o ponto decimal}
   s := '';
   for I := 1 to length(edit.Text) do
   if (edit.Text[I] in ['0'..'9',',']) then
      s := s + edit.Text[I];

   if s = EmptyStr then
      s := '0';

   {fazer com que o conteúdo do edit apresente 2 casas decimais}
   v := strtofloat(s);

   {Formata o valor de (V) para aceitar valores do tipo 0,10}
   edit.Text := FormatFloat('0.00',v);

   edit.Color  := clWhite;
   except
    on e: exception do
      begin
        //ShowMessage('Este Campo só é permitido números.');
        edit.Text   := EmptyStr;
        edit.Color  := clYellow;
        edit.SetFocus;
      end;
  end;

end;

function CalculaIdade(DataIni, DataFim: TDateTime): string;
var
  qtdDias, qtdMeses, qtdAnos : Integer;
  strDias, strMeses, strAnos : string;

  dataAuxiliar: TDate;
begin

  qtdAnos := 0;

  qtdMeses := MonthsBetween(DataIni, IncDay(DataFim));

  if qtdMeses = 0 then
    qtdDias := DaysBetween(DataIni, DataFim)
  else
  begin

    dataAuxiliar := IncMonth(DataIni, qtdMeses);
    qtdDias := DaysBetween(dataAuxiliar,DataFim);

  end;

  if qtdMeses >= 12 then
  begin

    qtdAnos := Trunc(qtdMeses / 12);
    qtdMeses := qtdMeses - (qtdAnos * 12);

  end;

  if qtdMeses = 1 then
    strMeses := '1 mês'
  else if qtdMeses <> 0 then
    strMeses := Format('%d meses', [qtdMeses]);

  if qtdAnos = 1 then
    strAnos := '1 ano'
  else if qtdAnos <> 0 then
    strAnos := Format('%d anos', [qtdAnos]);

  if qtdDias = 1 then
    strDias := '1 dia'
  else if qtdDias <> 0 then
    strDias := Format('%d dias', [qtdDias]);

  if qtdAnos <> 0 then
    Result := strAnos;

  if qtdMeses <> 0 then
    Result := Result + ' ' + strMeses;

  if qtdDias <> 0 then
    Result := Result + ' ' + strDias;

end;

Function RetornaSoNumeros(texto: String): String;
var
  cont: Integer;
  temp: string;
Begin

  temp := '';

  for cont := 1 to length(texto) do     //CharInSet((texto[cont] in ['0' .. '9']) Then
    if CharInSet(texto[cont], ['0' .. '9']) Then
      temp := temp + texto[cont];

  Result := temp;

End;

function ValidaCPF(const cCPF: String): boolean;
var
  i, soma, multiplo: Integer;
  CPF: string;
begin

  Result := False;

  CPF := RetornaSoNumeros(trim(cCPF));

  if (length(CPF) <> 11) Then
    exit;

  soma := 0;

  for i := 9 downto 1 do
    soma := soma + strtoint(CPF[i]) * (11 - i);

  multiplo := soma mod 11;

  if multiplo <= 1 then
    multiplo := 0
  else
    multiplo := 11 - multiplo;

  if (multiplo <> strtoint(CPF[10])) then
    exit;

  soma := 0;

  for i := 10 downto 1 do
    soma := soma + strtoint(CPF[i]) * (12 - i);

  multiplo := soma mod 11;

  if multiplo <= 1 then
    multiplo := 11;

  result := strtoint(CPF[11]) = (11 - multiplo);

end;

function ValidaEmail(Email: String): Boolean;
begin

  if TRegEx.isMatch(Email, '[_a-zA-Z\d\-\.]+@([_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+)') then
    Result := True
  else
    Result := False;

end;

procedure ToastMessage(Titulo, Mensagem : String);
begin

  UniSession.AddJS('Ext.example.msg('+
                   quotedstr(Titulo) + ',' +
                   quotedstr(Mensagem)+');');

end;

end.
