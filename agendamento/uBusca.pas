unit uBusca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniEdit,
  uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, uniBitBtn,
  uniImageList;

type
  TfrmBusca = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniComboBox1: TUniComboBox;
    UniEdit1: TUniEdit;
    UniDBGrid1: TUniDBGrid;
    UniContainerPanel2: TUniContainerPanel;
    UniNativeImageList1: TUniNativeImageList;
    UniBitBtn1: TUniBitBtn;
    procedure UniButton1Click(Sender: TObject);
    procedure UniComboBox1Change(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniEdit1Change(Sender: TObject);
    procedure UniDBGrid1DblClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    var campo : String;
  public
    { Public declarations }
  end;

function frmBusca: TfrmBusca;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uCalendario, uDM;

function frmBusca: TfrmBusca;
begin
  Result := TfrmBusca(UniMainModule.GetFormInstance(TfrmBusca));
end;

procedure TfrmBusca.UniBitBtn1Click(Sender: TObject);
begin

  Close;

end;

procedure TfrmBusca.UniButton1Click(Sender: TObject);
begin

  DM.qAgendamentos.Filter := campo + ' LIKE ' + QuotedStr('%'+UniEdit1.Text+'%');

end;

procedure TfrmBusca.UniComboBox1Change(Sender: TObject);
begin

  case UniComboBox1.ItemIndex of

    -1 : UniEdit1.Enabled := False;

    0 :
    begin

      UniEdit1.Enabled := True;
      campo := 'nome';

    end;

    1 :
    begin

      UniEdit1.Enabled := True;
      campo := 'placa';

    end;

    2 :
    begin

      UniEdit1.Enabled := True;
      campo := 'pedido';

    end;

    3 :
    begin

      UniEdit1.Enabled := True;
      campo := 'celular';

    end;

  end;

end;

procedure TfrmBusca.UniDBGrid1DblClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmBusca.UniEdit1Change(Sender: TObject);
begin
  DM.qAgendamentos.Filter := campo + ' LIKE ' + QuotedStr('%'+UniEdit1.Text+'%');
end;

procedure TfrmBusca.UniFormBeforeShow(Sender: TObject);
begin

  UniComboBox1.ItemIndex := -1;
  UniEdit1.Enabled := False;

  DM.qAgendamentos.Filter := 'nome LIKE ' + QuotedStr('%%');

end;

end.
