unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.ConsoleUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, FireDAC.Comp.Client, UniProvider,
  PostgreSQLUniProvider, DBAccess, Uni;

type
  TUniServerModule = class(TUniGUIServerModule)
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    UniTransaction1: TUniTransaction;
    procedure UniGUIServerModuleCreate(Sender: TObject);
    procedure UniGUIServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, MainModule;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin

  try

    MM.Conexao.Connected := True;
    MM.Conexao.StartTransaction;

  except

  end;

end;

procedure TUniServerModule.UniGUIServerModuleDestroy(Sender: TObject);
begin

  MM.Conexao.Close;

end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
