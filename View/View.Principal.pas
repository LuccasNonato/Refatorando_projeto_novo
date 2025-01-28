unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Loja.Controller.Entity.interfaces, View.Cadastro.Pecas, View.Cadastro.Veiculos;

type
  TPrincipal = class(TForm)
    pnlPainelCentral: TPanel;
    dbgrdMostrarItem: TDBGrid;
    pnlPainelLateral: TPanel;
    pnlPecas: TPanel;
    edtBuscaItem: TEdit;
    lblBusca: TLabel;
    dsBusca: TDataSource;
    pnlPainelSuperior: TPanel;
    pnlVeiculos: TPanel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    procedure pnlPecasClick(Sender: TObject);
    procedure pnlVeiculosClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
    FEntity : iControllerEntity;
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses
  Loja.Model.Conexao.Firedac, Loja.Controller.Entity.Factory;

{$R *.dfm}

procedure TPrincipal.btn1Click(Sender: TObject);
var
  FrmCadastroVeiculos: TViewCadastroVeiculos;
begin
  FrmCadastroVeiculos := TViewCadastroVeiculos.Create(Self);
  try
    frmcadastroveiculos.lbledt2.Text := dsBusca.DataSet.FieldByName('Codigo').Value;
    frmcadastroveiculos.lbledt3.Text := dsBusca.DataSet.FieldByName('Modelo').Value;
    frmcadastroveiculos.lbledt4.Text := dsBusca.DataSet.FieldByName('Montadora').Value;
    frmcadastroveiculos.lbledt5.Text := dsBusca.DataSet.FieldByName('Versao').Value;
    frmcadastroveiculos.Edita := 'Edita';
    FrmCadastroVeiculos.ShowModal;
  finally
    FrmCadastroVeiculos.Free;
  end;
end;

procedure TPrincipal.btn2Click(Sender: TObject);
var
  FrmCadastroPecas: TViewCadastroPecas;
begin
  FrmCadastroPecas := TViewCadastroPecas.Create(Self);
  try
    FrmCadastroPecas.ShowModal;
  finally
    FrmCadastroPecas.Free;
  end;
end;

procedure TPrincipal.btn3Click(Sender: TObject);
begin
  if not (dsBusca.State = dsInactive) then
  begin
    dsBusca.DataSet.Edit;
    dsBusca.DataSet.FieldByName('Codigo').AsString := dsBusca.DataSet.FieldByName('Codigo').AsString;
    dsBusca.DataSet.FieldByName('Modelo').AsString := dsBusca.DataSet.FieldByName('Modelo').AsString;
    dsBusca.DataSet.FieldByName('Montadora').AsString := dsBusca.DataSet.FieldByName('Montadora').AsString;
    dsBusca.DataSet.FieldByName('Versao').AsString := dsBusca.DataSet.FieldByName('Versao').AsString;
    dsBusca.DataSet.Delete;
    dsBusca.Dataset.Refresh;
  end;
end;

procedure TPrincipal.btn4Click(Sender: TObject);
begin
 if not (dsBusca.State = dsInactive) then
  begin
  dsBusca.DataSet.Edit;
  dsBusca.DataSet.FieldByName('Codigo').AsString := dsBusca.DataSet.FieldByName('Codigo').AsString;
  dsBusca.DataSet.FieldByName('descricao').AsString := dsBusca.DataSet.FieldByName('descricao').AsString;
  dsBusca.DataSet.Delete;
  dsBusca.DataSet.Refresh;
  end;
end;

procedure TPrincipal.pnlPecasClick(Sender: TObject);
var
 Busca : String;
begin
  edtBuscaItem.Enabled := True;
  Busca := 'Pecas';
  FEntity := TControllerEntityFactory.New.Pecas;
  FEntity.Lista(dsBusca);
  pnlPecas.Color := clHighlight;
  pnlVeiculos.Color :=  clWindow;
end;

procedure TPrincipal.pnlVeiculosClick(Sender: TObject);
var
 Busca : String;
begin
  edtBuscaItem.Enabled := True;
  Busca := 'Veiculos';
  FEntity := TControllerEntityFactory.New.Veiculos;
  FEntity.Lista(dsBusca);
  dsbusca.DataSet.Refresh;
  pnlVeiculos.Color := clHighlight;
  pnlPecas.Color :=  clWindow;
end;

end.
