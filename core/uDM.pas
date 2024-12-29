unit uDM;

interface

uses
  SysUtils, Classes, Data.DB, MemDS, DBAccess, Uni;

type
  TDM = class(TDataModule)
    q1: TUniQuery;
    qUsuarios: TUniQuery;
    qConta: TUniQuery;
    qContacod: TIntegerField;
    qContanome: TStringField;
    qContastatus: TSmallintField;
    qContacpf_cnpj: TStringField;
    qContarg: TStringField;
    qContauf_rg: TIntegerField;
    qContanacionalidade: TStringField;
    qContatipo: TStringField;
    qContasexo: TStringField;
    qContanascimento: TDateField;
    qContacod_escolaridade: TIntegerField;
    qContacod_estado_civil: TIntegerField;
    qContacod_profissao: TIntegerField;
    qContaendereco: TStringField;
    qContacomplemento: TStringField;
    qContacep: TStringField;
    qContacod_cidade: TIntegerField;
    qContafone: TStringField;
    qContafone2: TStringField;
    qContaemail: TStringField;
    qAgendamentos: TUniQuery;
    qMotorista: TUniQuery;
    qMotoristacod: TIntegerField;
    qMotoristacpf: TStringField;
    qMotoristanome: TStringField;
    qMotoristasenha: TStringField;
    qMotoristacelular: TStringField;
    qMotoristastatus: TSmallintField;
    qUsuarioscod: TIntegerField;
    qUsuariosnome: TStringField;
    qUsuariosemail: TStringField;
    qUsuariossenha: TStringField;
    qUsuariosstatus: TSmallintField;
    qUsuariosadm: TSmallintField;
    qFuncionamento: TUniQuery;
    qFuncionamentocod: TIntegerField;
    qFuncionamentodia_semana: TSmallintField;
    qFuncionamentohora_inicio: TTimeField;
    qFuncionamentohora_fim: TTimeField;
    qFuncionamentointervalo_inicio: TTimeField;
    qFuncionamentointervalo_fim: TTimeField;
    qFuncionamentosituacao: TSmallintField;
    qFuncionamentostatus: TSmallintField;
    qFuncionamentodia_da_semana: TMemoField;
    qVeiculos: TUniQuery;
    qVeiculoscod: TIntegerField;
    qVeiculosplaca: TStringField;
    qVeiculosdescricao: TMemoField;
    qAgendamentoM: TUniQuery;
    qAgendamentoscod: TIntegerField;
    qAgendamentospedido: TIntegerField;
    qAgendamentoscod_motorista: TIntegerField;
    qAgendamentoscod_veiculo: TIntegerField;
    qAgendamentosdata: TDateField;
    qAgendamentoshora: TTimeField;
    qAgendamentossituacao: TSmallintField;
    qAgendamentosstatus: TSmallintField;
    qAgendamentosnome: TStringField;
    qAgendamentoscelular: TStringField;
    qAgendamentosplaca: TStringField;
    qAgendamentoMcod: TIntegerField;
    qAgendamentoMpedido: TIntegerField;
    qAgendamentoMcod_motorista: TIntegerField;
    qAgendamentoMcod_veiculo: TIntegerField;
    qAgendamentoMdata: TDateField;
    qAgendamentoMhora: TTimeField;
    qAgendamentoMsituacao: TSmallintField;
    qAgendamentoMstatus: TSmallintField;
    qRelCarregamentos: TUniQuery;
    qRelCarregamentosdata: TDateField;
    qRelCarregamentoshora: TTimeField;
    qRelCarregamentospedido: TIntegerField;
    qRelCarregamentosnome: TStringField;
    qRelCarregamentosplaca: TStringField;
    qRelCarregamentostipo: TMemoField;
    qVeiculosmodelo: TStringField;
    qVeiculoseixos: TSmallintField;
    qVeiculosstatus: TSmallintField;
    qVeiculoscod_motorista: TIntegerField;
    qProdutos: TUniQuery;
    qProdutoscod: TIntegerField;
    qProdutosnome: TMemoField;
    qProdutosmaximo: TSmallintField;
    qProdutosstatus: TSmallintField;
    qProdutosdisponivel: TSmallintField;
    qAgendamentoscod_produto: TIntegerField;
    qAgendamentosproduto: TMemoField;
    qAgendamentoMcod_produto: TIntegerField;
    qAgendamentoMfeito_por: TMemoField;
    qAgendamentoMcriado: TDateTimeField;
    qAgendamentosfeito_por: TMemoField;
    qAgendamentoscriado: TDateTimeField;
    qRelAgendaDia: TUniQuery;
    DateField1: TDateField;
    TimeField1: TTimeField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    MemoField1: TMemoField;
    qRelAgendaDiafeito_por: TMemoField;
    qRelAgendaDiacriado: TDateTimeField;
    qRelCarregamentosfeito_por: TMemoField;
    qRelCarregamentoscriado: TDateTimeField;
    qAgendamentoscancelado_por: TMemoField;
    qAgendamentoscancelado: TDateTimeField;
    qAgendamentoMcancelado_por: TMemoField;
    qAgendamentoMcancelado: TDateTimeField;
    qFuncionamentohora_inicio2: TTimeField;
    qFuncionamentohora_fim2: TTimeField;
    qFuncionamentohora_inicio3: TTimeField;
    qFuncionamentohora_fim3: TTimeField;
    qParametros: TUniQuery;
    qParametrosintervalo_agenda: TSmallintField;
    qParametrosagenda_antecipa: TSmallintField;
    qRelAdendaDetalhado: TUniQuery;
    qRelAdendaDetalhadodata: TDateField;
    qRelAdendaDetalhadohora: TTimeField;
    qRelAdendaDetalhadopedido: TIntegerField;
    qRelAdendaDetalhadonome: TStringField;
    qRelAdendaDetalhadoplaca: TStringField;
    qRelAdendaDetalhadoproduto: TMemoField;
    qRelAdendaDetalhadotipo: TMemoField;
    qRelAdendaDetalhadofeito_por: TMemoField;
    qRelAdendaDetalhadocriado: TDateTimeField;
    qParametroscod: TIntegerField;
    qParametrosversao: TStringField;
    qParametrosmsg_ver: TStringField;
    qParametrosforca_updt: TSmallintField;
    qParametrosagenda_no_dia: TSmallintField;
    qParametroshoras_agenda_no_dia: TTimeField;
    qAgendamentosverificado_por: TMemoField;
    qAgendamentosverificado: TDateTimeField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DM: TDM;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function DM: TDM;
begin
  Result := TDM(UniMainModule.GetModuleInstance(TDM));
end;


initialization
  RegisterModuleClass(TDM);

end.
