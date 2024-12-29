unit uCadMotoristas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uPadrao, Data.DB, DBAccess, Uni, uniGUIBaseClasses,
  uniImageList, uniScrollBox, uniSplitter, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, uniPanel, uniEdit, uniDBEdit,
  IdhashMessageDigest, uniGroupBox, uniDBNavigator, uniMultiItem, uniListBox,
  uniDBListBox, uniSpeedButton;

type
  TfrmCadMotoristas = class(TfrmPadrao)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    edFone: TUniDBEdit;
    edCpf: TUniDBEdit;
    edSenha: TUniEdit;
    edSenha2: TUniEdit;
    DSVeiculo: TUniDataSource;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniDBGrid2: TUniDBGrid;
    UniSpeedButton1: TUniSpeedButton;
    procedure btSaveClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure DSPadraoDataChange(Sender: TObject; Field: TField);
    procedure MemoAsText(DataSet: TDataSet);
    procedure MemoDbGrid(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure UniSpeedButton1Click(Sender: TObject);
    function ValidaCamposInsere : String;
    function ValidaCamposEdita : String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCadMotoristas: TfrmCadMotoristas;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDM, uFuncoes, uCadVeiculos;

function frmCadMotoristas: TfrmCadMotoristas;
begin
  Result := TfrmCadMotoristas(UniMainModule.GetFormInstance(TfrmCadMotoristas));
end;

procedure TfrmCadMotoristas.btCancelClick(Sender: TObject);
begin
  inherited;
  edSenha.Text := '';
  edSenha2.Text := '';
  UniDBGrid2.Enabled := False;

end;

procedure TfrmCadMotoristas.btEditClick(Sender: TObject);
begin
  inherited;
  edSenha.Text := '';
  edSenha2.Text := '';

  UniDBGrid2.Enabled := True;

end;

procedure TfrmCadMotoristas.btNewClick(Sender: TObject);
begin
  inherited;
  edSenha.Text := '';
  edSenha2.Text := '';

end;

procedure TfrmCadMotoristas.btSaveClick(Sender: TObject);
var Md5 : TidHashMessageDigest5;
    Str : String;
begin
//
//  try
//
//    if ValidaCampos = '' then
//    begin
//
//      //cadastra
//      if (DSPadrao.DataSet.State in [dsInsert]) then
//      begin
//
//        if (edSenha.Text <> '') and (Length(edSenha.Text) >= 4) then
//        begin
//
//          if (edSenha.Text = edSenha2.Text) then
//          begin
//
//            try
//
//              Md5 := TidHashMessageDigest5.Create;
//              Str := Md5.HashStringAsHex(edSenha.text);
//
//              DSPadrao.DataSet.FieldByName('senha').AsString := Str;
//              inherited;
//              edSenha.Text := '';
//              edSenha2.Text := '';
//
//            finally
//
//              Md5.Free;
//
//            end;
//
//          end
//          else
//          begin
//
//            ShowMessage('Atenção: as senhas não conferem!');
//            Exit;
//
//          end;
//
//        end
//        else
//        begin
//
//          ShowMessage('Atenção: a senha deve conter de 4 a 10 caracteres!');
//          Exit;
//
//        end;
//
//      end
//      else
//      begin
//
//        //Edita
//        if (DSPadrao.DataSet.State in [dsEdit]) then
//        begin
//
//          if (edSenha.Text <> '') or (edSenha2.Text <> '') then
//          begin
//
//            if (edSenha.Text <> '') and (Length(edSenha.Text) >= 4) then
//            begin
//
//              if (edSenha.Text = edSenha2.Text) then
//              begin
//
//                try
//
//                  Md5 := TidHashMessageDigest5.Create;
//                  Str := Md5.HashStringAsHex(edSenha.text);
//
//                  DSPadrao.DataSet.FieldByName('senha').AsString := Str;
//                  inherited;
//                  edSenha.Text := '';
//                  edSenha2.Text := '';
//
//                finally
//
//                Md5.Free;
//
//                end;
//
//              end
//              else
//              begin
//
//                ShowMessage('Atenção: as senhas não conferem!');
//                Exit;
//
//              end;
//
//            end
//            else
//            begin
//
//              ShowMessage('Atenção: a senha deve conter de 4 a 10 caracteres!');
//              Exit;
//
//            end;
//
//          end;
//
//        end
//        else
//        begin
//
//          inherited;
//          edSenha.Text := '';
//          edSenha2.Text := '';
//
//        end;
//
//      end;
//
//    end
//    else
//      ShowMessage(ValidaCampos);
//
//  except
//
//  end;

  try

    if (UniDBEdit1.Text <> '') and (Length(UniDBEdit1.Text) > 4) then
    begin

      if ValidaCPF(edCPF.Text) then
      begin

        if ValidaFone(edfone.text) then
        begin

          //cadastra
          if (DSPadrao.DataSet.State in [dsInsert]) then
          begin

            if CPFDisponivel(edCPF.Text) then
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

              ShowMessage('Esse CPF já está sendo utilizado em nosso aplicativo!');
              Exit;

            end;

          end
          else
          begin

            //Edita
            if (DSPadrao.DataSet.State in [dsEdit]) then
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

              end;

            end
            else
            begin

              inherited;
              edSenha.Text := '';
              edSenha2.Text := '';

            end;

          end;

        end
        else
        begin

          ShowMessage('Celular inválido!');
          Exit;

        end;

      end
      else
      begin

        ShowMessage('CPF inválido!');
        Exit;

      end;

    end
    else ShowMessage('Nome inválido!');

  except

  end;


  UniDBGrid2.Enabled := False;

end;

procedure TfrmCadMotoristas.DSPadraoDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  DSVeiculo.DataSet.Close;
  DM.qVeiculos.Close;
  if not (DSPadrao.DataSet.State in [dsInsert]) then
  begin

    if DSPadrao.DataSet.FieldByName('cod').AsString <> '' then
    begin

    try


    DM.qVeiculos.Params[0].AsString := DSPadrao.DataSet.FieldByName('cod').AsString;
    DSVeiculo.DataSet.Open;
    MemoAsText(DSVeiculo.DataSet);
    DSVeiculo.DataSet.Refresh;
    except

    end;
    end;

  end;

end;

procedure TfrmCadMotoristas.MemoAsText(DataSet: TDataSet);
var
  i: Integer;
begin

  for i := 0 to DataSet.FieldCount - 1 do
    if DataSet.Fields[i].DataType in [ftMemo, ftWideMemo] then
      DataSet.Fields[i].OnGetText := MemoDbGrid;

end;

procedure TfrmCadMotoristas.MemoDbGrid(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin

  Text := Trim(Sender.AsString);

end;

procedure TfrmCadMotoristas.UniSpeedButton1Click(Sender: TObject);
begin
  inherited;

  frmCadVeiculos.cod_motorista := DSPadrao.DataSet.FieldByName('cod').AsInteger;
  frmCadVeiculos.ShowModal;

end;

function TfrmCadMotoristas.ValidaCamposEdita: String;
begin

  Result := 'Erro';

  if (UniDBEdit1.Text <> '') and (Length(UniDBEdit1.Text) > 4) then
    Result := ''
  else
  begin

    Result := 'Nome inválido!';
    Exit;

  end;

  if (edSenha.Text <> '') and (Length(edSenha.Text) >= 4) then
    Result := ''
  else
  begin

    Result := 'Atenção: a senha deve conter de 4 a 10 caracteres!';
    Exit;

  end;

  if (edSenha.Text = edSenha2.Text) then
    Result := ''
  else
  begin

    Result := 'Atenção: as senhas não conferem!';
    Exit;

  end;

  if ValidaFone(edfone.text) then
    Result := ''
  else
  begin

    Result := 'Celular inválido!';
    Exit;

  end;

end;

function TfrmCadMotoristas.ValidaCamposInsere: String;
begin

  Result := 'Erro';

  if (UniDBEdit1.Text <> '') and (Length(UniDBEdit1.Text) > 4) then
    Result := ''
  else
  begin

    Result := 'Nome inválido!';
    Exit;

  end;

  if ValidaCPF(edCPF.Text) then
    Result := ''
  else
  begin

    Result := 'CPF inválido!';
    Exit;

  end;

  if CPFDisponivel(edCPF.Text) then
    Result := ''
  else
  begin

    Result := 'Esse CPF já está sendo utilizado em nosso aplicativo!';
    Exit;

  end;

  if (edSenha.Text <> '') and (Length(edSenha.Text) >= 4) then
    Result := ''
  else
  begin

    Result := 'Atenção: a senha deve conter de 4 a 10 caracteres!';
    Exit;

  end;

  if (edSenha.Text = edSenha2.Text) then
    Result := ''
  else
  begin

    Result := 'Atenção: as senhas não conferem!';
    Exit;

  end;

  if ValidaFone(edfone.text) then
    Result := ''
  else
  begin

    Result := 'Celular inválido!';
    Exit;

  end;

end;

end.
