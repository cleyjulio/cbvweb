unit uLogin;

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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIRegClasses,
  uniGUIForm,
  uniSplitter,
  uniBitBtn,
  uniSpeedButton,
  Vcl.Imaging.pngimage,
  uniImage,
  uniButton,
  uniGUIBaseClasses,
  uniEdit,
  uniLabel,
  IdHashMessageDigest;

type
  TfrmLogin = class(TUniLoginForm)
    edtEmail: TUniEdit;
    edtSenha: TUniEdit;
    UniImage1: TUniImage;
    UniBitBtn1: TUniBitBtn;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniLoginFormShow(Sender: TObject);
    procedure edtEmailKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure UniLoginFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
    function PrimeiroUltimoNome(texto:string):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Main, uDM;

function frmLogin: TfrmLogin;
begin
  Result := TfrmLogin(MM.GetFormInstance(TfrmLogin));
end;

procedure TfrmLogin.edtEmailKeyPress(Sender: TObject; var Key: Char);
begin

   if Key = #13 then
   begin

    Key := #0;
    edtSenha.SetFocus;

   end;

end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin

   if Key = #13 then
   begin

     Key := #0;
     UniBitBtn1.Click;

   end;

end;

function TfrmLogin.PrimeiroUltimoNome(texto: string): string;
var
  retorno : String;
begin

  retorno := '';
  retorno := copy(texto,0,pos(' ',texto)-1);
  retorno := retorno + ' ' + copy(texto,LastDelimiter(' ',texto),length(texto) - LastDelimiter(' ',texto) + 1);

  Result := retorno;

end;

procedure TfrmLogin.UniBitBtn1Click(Sender: TObject);
var Md5 : TidHashMessageDigest5;
    Str : String;
begin

  {$IFDEF DEBUG}
  if  (edtEmail.Text = '') and (edtSenha.Text = '')  then
  begin

    try

      MM.cod_user := 1;//1;
      MM.username := PrimeiroUltimoNome('CLEY ANDERS DOS SANTOS JULIO');//'Suporte SysAGRO';
      MM.email := 'cley';//'ronaldo@agormarques.com.br';//'suporte@sysagro.app';
      MM.adm := 1;
      ModalResult := mrOK;
      Abort;

    finally

      //frmLogin.Free;

    end;

  end;
  {$ENDIF}

  if (edtEmail.Text <> '') and (edtSenha.Text <> '')  then
  begin

    Md5 := TidHashMessageDigest5.Create;

    Str := Md5.HashStringAsHex(edtSenha.Text);

    DM.q1.Close;
    DM.q1.SQL.Clear;
    DM.q1.SQL.Add('SELECT * FROM usuario ');
    DM.q1.SQL.Add('where email = ' + QuotedStr(edtEmail.Text) + ' and senha = ' + QuotedStr(Str) + ' and status = 1 ');
    DM.q1.Open;

    if DM.q1.RecordCount > 0 then
    begin

      MM.cod_user := DM.q1.FieldByName('cod').AsInteger;
      MM.username := PrimeiroUltimoNome(DM.q1.FieldByName('nome').AsString);
      MM.email := DM.q1.FieldByName('email').AsString;
      MM.adm := DM.q1.FieldByName('adm').AsInteger;

      Md5.Free();
      ModalResult := mrOk;

    end
    else
    begin

      ShowMessage('Email ou senha inválidos! Tente novamente!');
      ModalResult := mrNone;
      edtSenha.SetFocus;
      Md5.Free();
      abort;

    end;

  end
  else
  begin

    ShowMessage('Preencha seu email e sehha!');
    edtEmail.SetFocus;
    ModalResult := mrNone;
    abort;

  end;

end;

procedure TfrmLogin.UniLoginFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
begin

   frmLogin.Left := Round((Awidth / 2 ) - (frmLogin.width / 2));
   frmLogin.Top := Round((AHeight / 2 ) - (frmLogin.height / 2));

end;

procedure TfrmLogin.UniLoginFormShow(Sender: TObject);
begin

  edtEmail.SetFocus;

end;

initialization
  RegisterAppFormClass(TfrmLogin);

end.
