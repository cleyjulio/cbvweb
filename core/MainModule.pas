unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  DBAccess, Uni, MemDS,
  System.RegularExpressions;

type
  TUniMainModule = class(TUniGUIMainModule)
    Conexao: TUniConnection;
    UniTransaction1: TUniTransaction;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleSessionTimeout(ASession: TObject; var ExtendTimeOut: Integer);
  private
    { Private declarations }
    procedure LoadCustomFiles;
  public

    //VALIDACOES
    function ValidaEmail(Email : String) : Boolean;

    //CONSULTAS E VERIFICACOES
    function VerificaEmailUsuario(Email : String) : String;

    procedure LimparArrayRel;
    procedure ToastMessage(Titulo, Mensagem : String);
    var cod_user, adm : integer;
        username, email : string;
        AjustaTela, mobile, intervalo : Boolean;
        agenda_antecipa, intervalo_agenda: Smallint;
        hora_inicio, hora_fim, hora_inicio2, hora_fim2, hora_inicio3, hora_fim3 : TDateTime;



  end;

function MM: TUniMainModule;
function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication, uRel, uDM;

function UniMainModule: TUniMainModule;
begin

  //try

   Result := TUniMainModule(UniApplication.UniMainModule)

  //except

  //end;

end;

function MM: TUniMainModule;
begin

   Result := TUniMainModule(UniApplication.UniMainModule)

end;

procedure TUniMainModule.LimparArrayRel;
var i : integer;
begin

  for i := 0 to High(frmRel.Parametros) Do
    frmRel.Parametros[i] := '';

end;

procedure TUniMainModule.LoadCustomFiles;
var Str : String;
begin

  Str := '?' + FormatDateTime('dhsz', now());

  UniServerModule.CustomFiles.Clear;
  UniServerModule.CustomFiles.Add('/files/css/custom.css' + Str);

end;

procedure TUniMainModule.ToastMessage(Titulo, Mensagem: String);
begin

  UniSession.AddJS('Ext.toast({html: ' + quotedstr(mensagem)
     + ', title: ' + quotedstr(titulo)
     + ', modal: true'
     + ', height: 100, width: 500'
     + ', shadow: true '
     + ', iconCls: ''far fa-comment'' '
     + ', autoCloseDelay: 2500, align: ''t'' '
     + ', bodyStyle: ''font-size: 18px; font-color:#D2691E; background:#D2691E;''  '
     //+ ', bodyStyle: ''background:#ffc;'' '
        //background-color: rgba(45,147,60, .5) !important; ' //background:#6A5ACD; font: 18px arial,helvetica,tahoma; '
     //+ ',iconAlign: ''right'' '
     //+ ', titleAlign: ''center'' '
     //+ ', closable : true'
     + '})');
     //+ ', bodyPadding: 20})' );


end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin

  cod_user := 0;
  username := '';
  email := '';

  LoadCustomFiles;

  AjustaTela := False;


  Conexao.Server := 'localhost';
  Conexao.Username := 'postgres';
  Conexao.Password := 'Caj239!VegaSys.agro1516#TrindadeSanta';

//  Conexao.Server := '34.236.40.241';
//  Conexao.Username := 'user_acbv';
//  Conexao.Password := '21Caj239!VegaSys.agro1516TrindadeSanta20';

  {$IFDEF DEBUG}
  Conexao.Server := '34.236.40.241';
  Conexao.Username := 'user_acbv';
  Conexao.Password := '21Caj239!VegaSys.agro1516TrindadeSanta20';
  {$ENDIF}

end;

procedure TUniMainModule.UniGUIMainModuleSessionTimeout(ASession: TObject; var ExtendTimeOut: Integer);
begin

  ExtendTimeOut := UniServerModule.SessionTimeOut;

end;

function TUniMainModule.ValidaEmail(Email: String): Boolean;
begin

  if TRegEx.isMatch(Email, '[_a-zA-Z\d\-\.]+@([_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+)') then
    Result := True
  else
    Result := False;

end;

function TUniMainModule.VerificaEmailUsuario(Email: String): String;
begin

  DM.q1.Close;
  DM.q1.SQL.Clear;
  DM.q1.SQL.Add('select nome from usuario where email = :email and status = 1');
  DM.q1.Params[0].AsString := Email;
  DM.q1.Open;

  if DM.q1.RecordCount > 0 then
    Result := DM.q1.FieldByName('nome').AsString
  else
    Result := '';

end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
