unit ufrDM;

interface

uses
  SysUtils, Classes, frxClass, frxGradient, frxDBSet, frxExportBaseDialog,
  frxExportPDF, frxRich, Uni, frCoreClasses;

type
  TfrDM = class(TDataModule)
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    frxGradientObject1: TfrxGradientObject;
    frxReport1: TfrxReport;
    frxRichObject1: TfrxRichObject;
  private
    { Private declarations }
    procedure OpenDS(relatorio: string; Parametros: array of string; Dados: TUniQuery);
    procedure CloseDS(Dados: TUniQuery);
    procedure PreparaRel(relatorio, titulo, detalhe :String; Parametros: array of string);
  public
    { Public declarations }
    function GenReportPDF(relatorio, titulo, detalhe: string; Parametros: array of string; Dados: TUniQuery): string;
    var cod : integer;
  end;

//function frDM: TfrDM;

implementation

{$R *.dfm}

uses
  MainModule, ServerModule, uDM;

{ TfrDM }

function TfrDM.GenReportPDF(relatorio, titulo, detalhe: string; Parametros: array of string; Dados: TUniQuery): string;
begin

  OpenDS(relatorio, Parametros, Dados);

  try

    frxReport1.PrintOptions.ShowDialog := False;
    frxReport1.ShowProgress := false;

    frxReport1.EngineOptions.SilentMode := True;
    frxReport1.EngineOptions.EnableThreadSafe := True;
    frxReport1.EngineOptions.DestroyForms := False;

    frxReport1.LoadFromFile(UniServerModule.FilesFolderPath + 'relatorios\' + relatorio + '.fr3');

    PreparaRel(relatorio, titulo, detalhe, Parametros);

    frxPDFExport1.Background := True;
    frxPDFExport1.ShowProgress := False;
    frxPDFExport1.ShowDialog := False;
    frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', Result, True);
    frxPDFExport1.DefaultPath := '';

    frxReport1.PreviewOptions.AllowEdit := False;
    frxReport1.PrepareReport;
    frxReport1.Export(frxPDFExport1);

  finally

    CloseDS(Dados);

  end;

end;

procedure TfrDM.OpenDS(relatorio: string; Parametros: array of string; Dados: TUniQuery);
var
  I: Integer;
begin

  Dados.Close;

  //limpa parametros do banco
//  for i := 0 to Dados.Params.Count -1 Do
//    Dados.Params[i].AsString := '';

  for I := 0 to Dados.ParamCount - 1 do
  begin

    if Parametros[i] <> '' then
      Dados.Params[i].AsString := Parametros[i];

  end;

  Dados.Open;
  frxDBDataset1.DataSet := Dados;

end;

procedure TfrDM.PreparaRel(relatorio, titulo, detalhe :String; Parametros: array of string);
begin

  //Cabecalho
  //TfrxMemoView(frxReport1.FindObject('Linha1')).Text := DM.q1.FieldByName('linha1').AsString;
  //TfrxMemoView(frxReport1.FindObject('Linha2')).Text := DM.q1.FieldByName('linha2').AsString;


  //título
  try

    if titulo <> '' then
      TfrxMemoView(frxReport1.FindObject('Titulo')).Text := Titulo;

  except

  end;

  //Detalhe
  try

    if Detalhe <> '' then
      TfrxMemoView(frxReport1.FindObject('Detalhe')).Text := Detalhe;

  except

  end;
  //FIM Cabecalho

  //RODAPÉ

  //TfrxMemoView(frxReport1.FindObject('Usuario')).Text := 'Gerado por: ' + LowerCase(MM.username) + ' - email:' + MM.usermail + '  em: ';
  //TfrxMemoView(frxReport1.FindObject('Licenca')).Text := 'Licenciado para: ' + DM.q1.FieldByName('licenca').AsString;

  //FIM RODAPÉ

end;

procedure TfrDM.CloseDS(Dados: TUniQuery);
begin

  Dados.Close;

end;

end.
