{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  GerenciamentoCBV;

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'core\ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'core\MainModule.pas' {UniMainModule: TUniGUIMainModule},
  uPadrao in 'core\uPadrao.pas' {frmPadrao: TUniForm},
  uDM in 'core\uDM.pas' {DM: TDataModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  uFuncoes_Unigui in 'core\uFuncoes_Unigui.pas',
  uCalendario in 'agendamento\uCalendario.pas' {frmCalendario: TUniForm},
  uEditAgenda in 'agendamento\uEditAgenda.pas' {frmEditAgenda: TUniForm},
  uLogin in 'uLogin.pas' {frmLogin: TUniLoginForm},
  uCadMotoristas in 'cadastros\uCadMotoristas.pas' {frmCadMotoristas: TUniForm},
  uCadUsuarios in 'cadastros\uCadUsuarios.pas' {frmCadUsuarios: TUniForm},
  uFuncionamento in 'funcionamento\uFuncionamento.pas' {frmFuncionamento: TUniForm},
  uAgendamento in 'agendamento\uAgendamento.pas' {frmAgendamento: TUniForm},
  uRel in 'relatorios\uRel.pas' {frmRel: TUniForm},
  ufrDM in 'relatorios\ufrDM.pas' {frDM: TDataModule},
  uCadVeiculos in 'cadastros\uCadVeiculos.pas' {frmCadVeiculos: TUniForm},
  uCadProdutos in 'cadastros\uCadProdutos.pas' {frmCadProdutos: TUniForm},
  uBusca in 'agendamento\uBusca.pas' {frmBusca: TUniForm},
  uParametros in 'parametros\uParametros.pas' {frmParametros: TUniForm},
  uFiltros in 'relatorios\uFiltros.pas' {frmFiltros: TUniForm},
  UnitFrame1 in 'core\UnitFrame1.pas' {UniFrame1: TUniFrame},
  uFuncoes in 'core\uFuncoes.pas';

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Title := 'Agendamento CBV';
  Application.Run;
{$endif}
end.
