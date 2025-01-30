unit View.Cadastro.Veiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Loja.Controller.Entity.interfaces, Data.DB;

type
  TViewCadastroVeiculos = class(TForm)
    pnl1: TPanel;
    lbledtCodigoVeiculo: TLabeledEdit;
    lbledtModeloVeiculo: TLabeledEdit;
    lbledtMontadoraVeiculo: TLabeledEdit;
    lbledtVersaoVeiculo: TLabeledEdit;
    btnGravar: TButton;
    btnEditarVeiculos: TButton;
    btnIncluir: TButton;
    procedure btnEditarVeiculosClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    FEntity : iControllerEntity;
    procedure AdicionarNovoItem(Incluir: string);
  public
    Edita : string;
    UltimoID: Integer;
    CurrentID: Integer;
    Insert   : Integer;
    { Public declarations }
  end;


var
  ViewCadastroVeiculos: TViewCadastroVeiculos;
implementation

uses
  Loja.Controller.Entity.Factory, View.Principal, LojaUtils;

{$R *.dfm}


procedure TViewCadastroVeiculos.AdicionarNovoItem(Incluir: string);
var
  ViewPrincipal: TPrincipal;
begin
  ViewPrincipal := TPrincipal(Application.MainForm);

  if Assigned(ViewPrincipal.dsBusca.DataSet) and ViewPrincipal.dsBusca.DataSet.Active then
  begin
    if Incluir = 'Incluir' then
    begin

    end
    else
    begin
      if ViewPrincipal.dsBusca.DataSet.State = dsBrowse then
        ViewPrincipal.dsBusca.DataSet.Edit;

      lbledtCodigoVeiculo.Text := ViewPrincipal.dsBusca.DataSet.FieldByName('codigo').AsString;
      lbledtModeloVeiculo.Text := ViewPrincipal.dsBusca.DataSet.FieldByName('modelo').AsString;
      lbledtMontadoraVeiculo.Text := ViewPrincipal.dsBusca.DataSet.FieldByName('montadora').AsString;
      lbledtVersaoVeiculo.Text := ViewPrincipal.dsBusca.DataSet.FieldByName('versao').AsString;
    end;
  end
  else
  begin
    ShowMessage('DataSet não está ativo ou disponível.');
  end;
end;

procedure TViewCadastroVeiculos.btnEditarVeiculosClick(Sender: TObject);
var
  ViewPrincipal: TPrincipal;
begin
  insert := 0;
  ViewPrincipal := TPrincipal(Application.MainForm);
  if not (ViewPrincipal is TPrincipal) then
  begin
    ShowMessage('A View principal não é do tipo esperado.');
    Exit;
  end;
  TLojaUtils.HabilitarComponentes(Self, TLabeledEdit, True);
  if not (Assigned(ViewPrincipal.dsBusca.DataSet) and ViewPrincipal.dsBusca.DataSet.Active) then
  begin
    ShowMessage('O DataSet não está ativo.');
    Exit;
  end;
  if ViewPrincipal.dsBusca.DataSet.State = dsBrowse then
    ViewPrincipal.dsBusca.DataSet.Edit;
  AdicionarNovoItem('Editar');
end;

procedure TViewCadastroVeiculos.btnGravarClick(Sender: TObject);
var
  ViewPrincipal: TPrincipal;
begin
  ViewPrincipal := TPrincipal(Application.MainForm);
  if not (ViewPrincipal is TPrincipal) then
  begin
    ShowMessage('A View principal não está atribuída corretamente.');
    Exit;
  end;
  if not (Assigned(ViewPrincipal.dsBusca.DataSet) and ViewPrincipal.dsBusca.DataSet.Active) then
  begin
    ShowMessage('O DataSet não está ativo.');
    Exit;
  end;
  if not (ViewPrincipal.dsBusca.DataSet.State in [dsEdit, dsInsert]) then
  begin
    ViewPrincipal.dsBusca.DataSet.Edit;
  end;

  try
    FEntity.Lista(ViewPrincipal.dsBusca);
    ViewPrincipal.dsBusca.DataSet.Last;
    UltimoID := ViewPrincipal.dsBusca.DataSet.FieldByName('id').AsInteger;

    if Insert = 0 then
    begin
      ViewPrincipal.dsBusca.DataSet.Edit;
    end
    else
    begin
      ViewPrincipal.dsBusca.DataSet.Append;
      ViewPrincipal.dsBusca.DataSet.FieldByName('ID').AsInteger := UltimoID + 1;
    end;

    try
      ViewPrincipal.dsBusca.DataSet.FieldByName('codigo').AsString := lbledtCodigoVeiculo.Text;
      ViewPrincipal.dsBusca.DataSet.FieldByName('modelo').AsString := lbledtModeloVeiculo.Text;
      ViewPrincipal.dsBusca.DataSet.FieldByName('montadora').AsString := lbledtMontadoraVeiculo.Text;
      ViewPrincipal.dsBusca.DataSet.FieldByName('versao').AsString := lbledtVersaoVeiculo.Text;
      ViewPrincipal.dsBusca.DataSet.Post;
    except
      ViewPrincipal.dsBusca.DataSet.Cancel;
      TLojaUtils.HabilitarComponentes(Self, TLabeledEdit, False);
      TLojaUtils.LimparComponentes(Self, TLabeledEdit);
    end;

    if Assigned(FEntity) then
    begin
      viewPrincipal.dsBusca.Edit;
      FEntity.Salvar(ViewPrincipal.dsBusca);
    end
    else
    begin
      ShowMessage('O Entity não está atribuído corretamente.');
      Exit;
    end;

    ViewPrincipal.dsBusca.DataSet.Refresh;

    TLojaUtils.HabilitarComponentes(Self, TLabeledEdit, False);
    TLojaUtils.LimparComponentes(Self, TLabeledEdit);

    ShowMessage('Dados salvos com sucesso!');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao salvar os dados: ' + E.Message);
    end;
  end;
end;


procedure TViewCadastroVeiculos.btnIncluirClick(Sender: TObject);
var
  ViewPrincipal: TPrincipal;
begin
  Insert := 1;
  
  ViewPrincipal := TPrincipal(Application.MainForm);
  if not (ViewPrincipal is TPrincipal) then
  begin
    ShowMessage('A View principal não é do tipo esperado.');
    Exit;
  end;
  TLojaUtils.HabilitarComponentes(Self, TLabeledEdit, True);
  if not (Assigned(ViewPrincipal.dsBusca.DataSet) and ViewPrincipal.dsBusca.DataSet.Active) then
  begin
    ShowMessage('O DataSet não está ativo.');
    Exit;
  end;
  ViewPrincipal.dsBusca.DataSet.Last;
  ViewPrincipal.dsBusca.DataSet.Append;
  UltimoID := ViewPrincipal.dsBusca.DataSet.FieldByName('id').AsInteger;
  
  if ViewPrincipal.dsBusca.DataSet.State = dsBrowse then
    ViewPrincipal.dsBusca.DataSet.Edit;
  AdicionarNovoItem('Incluir');
  
end;

procedure TViewCadastroVeiculos.FormCreate(Sender: TObject);
begin
   FEntity := TControllerEntityFactory.New.Veiculos;
end;

end.
