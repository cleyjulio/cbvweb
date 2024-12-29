unit uCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uPadrao, uniEdit, uniDBEdit, Data.DB, DBAccess,
  Uni, uniGUIBaseClasses, uniImageList, uniScrollBox, uniSplitter, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, uniPanel,
  IdhashMessageDigest, uniCheckBox, uniDBCheckBox, uniRadioGroup,
  uniDBRadioGroup;

type
  TfrmCadUsuarios = class(TfrmPadrao)
    UniDBEdit1: TUniDBEdit;
    edEmail: TUniDBEdit;
    edSenha: TUniEdit;
    edSenha2: TUniEdit;
    UniDBRadioGroup1: TUniDBRadioGroup;
    procedure btNewClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
  private
    { Private declarations }
    function ValidaCampos : String;
  public
    { Public declarations }
  end;

function frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDM, uFuncoes;

function frmCadUsuarios: TfrmCadUsuarios;
begin
  Result := TfrmCadUsuarios(UniMainModule.GetFormInstance(TfrmCadUsuarios));
end;

procedure TfrmCadUsuarios.btNewClick(Sender: TObject);
begin
  inherited;
  edSenha.Text := '';
  edSenha2.Text := '';
  DSPadrao.DataSet.FieldByName('adm').AsInteger := 0;

end;

procedure TfrmCadUsuarios.btSaveClick(Sender: TObject);
var Md5 : TidHashMessageDigest5;
    Str : String;
begin

  if ValidaCampos = '' then
  begin

    //cadastra
    if (DSPadrao.DataSet.State in [dsInsert]) then
    begin

      if (edSenha.Text <> '') and (Length(edSenha.Text) >= 4) then
      begin

        if (edSenha.Text = edSenha2.Text) then
        begin

          try

            Md5 := TidHashMessageDigest5.Create;
            Str := Md5.HashStringAsHex(edSenha.text);

            DSPadrao.DataSet.FieldByName('senha').AsString := Str;
            inherited;
            edSenha.Text := '';
            edSenha2.Text := '';

          finally

            Md5.Free;

          end;

        end
        else
        begin

          ShowMessage('Atenção: as senhas não conferem!');
          Exit;

        end;

      end
      else
      begin

        ShowMessage('Atenção: a senha deve conter de 4 a 10 caracteres!');
        Exit;

      end;

    end
    else
    begin

      if (edSenha.Text <> '') or (edSenha2.Text <> '') then
      begin

        if (edSenha.Text <> '') and (Length(edSenha.Text) >= 4) then
        begin

          if (edSenha.Text = edSenha2.Text) then
          begin

            try

              Md5 := TidHashMessageDigest5.Create;
              Str := Md5.HashStringAsHex(edSenha.text);

              DSPadrao.DataSet.FieldByName('senha').AsString := Str;
              inherited;
              edSenha.Text := '';
              edSenha2.Text := '';

            finally

              Md5.Free;

            end;

          end
          else
          begin

            ShowMessage('Atenção: as senhas não conferem!');
            Exit;

          end;

        end
        else
        begin

          ShowMessage('Atenção: a senha deve conter de 4 a 10 caracteres!');
          Exit;

        end;

      end
      else
      begin

        inherited;
        edSenha.Text := '';
        edSenha2.Text := '';

      end;

    end;

  end;

end;

function TfrmCadUsuarios.ValidaCampos: String;
begin

  Result := 'Erro ao validar campos!';

  //verifica nome
  if (UniDBEdit1.Text <> '') and (Length(UniDBEdit1.Text) > 4) then
    Result := ''
  else
  begin

    Result := 'Preencha o seu nome!';
    exit;

  end;

  //valida email
  if not MM.ValidaEmail(edEmail.Text) then
  begin

    Result := 'Email Inválido!';
    Exit;

  end
  else
    Result := '';

  //verifica email no sistema
  if (DSPadrao.DataSet.State in [dsInsert]) then
  begin

    if MM.VerificaEmailUsuario(edEmail.Text) = '' then
      Result := ''
    else
    begin

      Result := 'Email já cadastrado no sistema!';
      Exit;

    end;

  end;

end;


end.
