unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniSplitter,
  Vcl.Imaging.pngimage, uniImage, uniGUIBaseClasses, uniPanel,
  uniGenericControl, uniPropertyGrid, uniButton, uniBitBtn, uniMenuButton,
  Vcl.Menus, uniMainMenu, uniScreenMask, uniTreeView, uniTreeMenu, uniToolBar,
  uniImageList, uniGUIFrame,
  Dialogs, UnitFrame1, uniSpeedButton, uniPageControl, uniStatusBar,
  Vcl.Imaging.jpeg, Data.DB, DBAccess, Uni, uniMultiItem, uniComboBox,
  uniDBComboBox, uniURLFrame, uniLabel, uniTimer;

type
  TMainForm = class(TUniForm)
    UniNativeImageList1: TUniNativeImageList;
    UniPageControl1: TUniPageControl;
    Formulario: TUniTabSheet;
    UniFrameForm: TUniFrame1;
    Menu: TUniMenuItems;
    UniMenuItem1: TUniMenuItem;
    UniMenuItem4: TUniMenuItem;
    UniMenuItem19: TUniMenuItem;
    UniContainerTOPO: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniImage1: TUniImage;
    Financeiro1: TUniMenuItem;
    Configuraes1: TUniMenuItem;
    UniImage2: TUniImage;
    UniContainerPanel2: TUniContainerPanel;
    UniTreeMenuConta: TUniTreeMenu;
    Hor1: TUniMenuItem;
    Relatrios1: TUniMenuItem;
    CadastrodeProdutos1: TUniMenuItem;
    Agendamentosdodia1: TUniMenuItem;
    Histricodeagendamentos1: TUniMenuItem;
    Parmetros1: TUniMenuItem;
    TimerRelatorio: TUniTimer;
    AgendamentoCompleto1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure Dashborad1Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniMenuItem1Click(Sender: TObject);
    procedure AbreForm(nome : string; Form :TUniForm);
    procedure UniImage1Click(Sender: TObject);
    procedure UniMenuItem4Click(Sender: TObject);
    procedure Financeiro1Click(Sender: TObject);
    procedure Hor1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure Agendamentosdodia1Click(Sender: TObject);
    procedure Histricodeagendamentos1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure AgendamentoCompleto1Click(Sender: TObject);
    procedure TimerRelatorioTimer(Sender: TObject);

  private
    { Private declarations }
    var FormAtivo : TUniForm;
        NomeForm, relatorio : String;
  public
    { Public declarations }
    procedure Inicio;
    var D1, D2 : TDateTime;
       Situacao, produto : Integer;
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule, uDM, uCalendario,
  uCadMotoristas, uCadUsuarios, uFuncionamento, ufrDM, uRel, uCadProdutos,
  uFuncoes_Unigui, uParametros, uFiltros;

function MainForm: TMainForm;
begin
  Result := TMainForm(MM.GetFormInstance(TMainForm));
end;

procedure TMainForm.AbreForm(nome : string; Form :TUniForm);
begin

  try

    Menu.ScreenMask.Target := UniFrameForm;

    if (FormAtivo <> Nil) and (NomeForm <> nome) then
       FormAtivo.Close;


    MM.AjustaTela := True;
    Form.Parent := UniFrameForm;
    Form.Show();
    FormAtivo := Form;
    NomeForm := nome;

  except

  end;

end;

procedure TMainForm.AgendamentoCompleto1Click(Sender: TObject);
begin

  frmFiltros.ShowModal(
    procedure(Sender: TComponent; Result:Integer)
    begin

      if Result = 1  then
      begin

        MainForm.ShowMask('Gerando relatório...');
        Relatorio := 'detalhado';
        TimerRelatorio.Enabled := True;
        UniSession.Synchronize;

      end;

    end
    );

end;

procedure TMainForm.Agendamentosdodia1Click(Sender: TObject);
begin

  frmRel.Relatorio := 'agendamento_dia';
  frmRel.Parametros[0] := DatetoStr(DataAtual);
  frmRel.detalhe := DatetoStr(DataAtual);
  frmRel.Dados := DM.qRelAgendaDia;
  frmRel.ShowModal;

end;

procedure TMainForm.CadastrodeProdutos1Click(Sender: TObject);
begin

  if MM.adm = 1 then
     Abreform('frmCadProdutos', frmCadProdutos)
  else
    MM.ToastMessage('Agendamento CBV','Você não possui permissão para acessar este recurso do sistema!');

end;

procedure TMainForm.Dashborad1Click(Sender: TObject);
begin

  Inicio;

end;

procedure TMainForm.Inicio;
begin

  Abreform('frmCalendario', frmCalendario);

end;

procedure TMainForm.Parmetros1Click(Sender: TObject);
begin

  if MM.adm = 1 then
     Abreform('frmParametros', frmParametros)
  else
    MM.ToastMessage('Agendamento CBV','Você não possui permissão para acessar este recurso do sistema!');

end;

procedure TMainForm.TimerRelatorioTimer(Sender: TObject);
begin

  TimerRelatorio.Enabled := False;

  MM.LimparArrayRel;

  if relatorio = 'detalhado' then
  begin

    frmRel.Relatorio := relatorio;

    if situacao > 0 then
      frmRel.Parametros[0] := situacao.ToString
    else
      frmRel.Parametros[0] := '';
//
//    if MM.cod_func_sel > 0 then
//      frmRel.Parametros[1] := MM.cod_func_sel.ToString //funcionario
//    else
//      frmRel.Parametros[1] := '';

    frmRel.Parametros[2] := DateToStr(D1);
    frmRel.Parametros[3] := DateToStr(D2);


    if D1 <> D2 then
      frmRel.detalhe := 'Agendamentos de ' + DateToStr(D1) + ' a ' +  DateToStr(D2)
    else
      frmRel.detalhe := 'Agendamentos do dia: ' + DateToStr(D1);

    frmRel.Dados := DM.qRelAdendaDetalhado;

  end;

  frmRel.ShowModal;
  MainForm.HideMask;

end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin

  Close;

end;

procedure TMainForm.Financeiro1Click(Sender: TObject);
begin

  Abreform('frmCadUsuarios', frmCadUsuarios);

end;

procedure TMainForm.Histricodeagendamentos1Click(Sender: TObject);
begin

  frmRel.Relatorio := 'Carregamentos';
  frmRel.Dados := DM.qRelCarregamentos;
  frmRel.ShowModal;

end;

procedure TMainForm.Hor1Click(Sender: TObject);
begin

   if MM.adm = 1 then
     Abreform('frmFuncionamento', frmFuncionamento)
  else
    MM.ToastMessage('Agendamento CBV','Você não possui permissão para acessar este recurso do sistema!');

end;

procedure TMainForm.UniFormBeforeShow(Sender: TObject);
begin

  MainForm.ShowMask('Carregando...');

end;

procedure TMainForm.UniFormReady(Sender: TObject);
begin

  MainForm.HideMask;

end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin

  Inicio;

end;

procedure TMainForm.UniImage1Click(Sender: TObject);
begin

  Inicio;

end;

procedure TMainForm.UniMenuItem1Click(Sender: TObject);
begin

  Inicio;

end;


procedure TMainForm.UniMenuItem4Click(Sender: TObject);
begin

  Abreform('frmCadMotoristas', frmCadMotoristas);

end;

initialization
  RegisterAppFormClass(TMainForm);

end.
