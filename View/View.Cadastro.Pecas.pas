unit View.Cadastro.Pecas;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Loja.Controller.Entity.interfaces, Data.DB, System.TypInfo, System.Rtti,
  LojaUtils;
type
  TViewCadastroPecas = class(TForm)
    pnl1: TPanel;
    lbledtCodigo: TLabeledEdit;
    lbledtDescricao: TLabeledEdit;
    lbledtCodigoFabricante: TLabeledEdit;
    btnGravar: TButton;
    btneditar: TButton;
    btnIncluir: TButton;
    procedure btnGravarClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    FEntity: iControllerEntity;
    procedure AdicionarNovoItem(Incluir: string);
  public
    IncluirP : integer;
    { Public declarations }
  end;
var
  ViewCadastroPecas: TViewCadastroPecas;
implementation
uses
  Loja.Controller.Entity.Factory, View.Principal;
{$R *.dfm}

procedure TViewCadastroPecas.AdicionarNovoItem(Incluir: string);
var
  ViewPrincipal: TPrincipal;
begin
  ViewPrincipal := TPrincipal(Application.MainForm);


  if Assigned(ViewPrincipal.dsBusca.DataSet) and ViewPrincipal.dsBusca.DataSet.Active then
  begin

    if Incluir = 'Incluir' then
    begin
      ViewPrincipal.dsBusca.DataSet.Insert;
    end
    else
    begin
      if ViewPrincipal.dsBusca.DataSet.State = dsBrowse then
        ViewPrincipal.dsBusca.DataSet.Edit;

      lbledtCodigo.Text := ViewPrincipal.dsBusca.DataSet.FieldByName('codigo').AsString;
      lbledtDescricao.Text := ViewPrincipal.dsBusca.DataSet.FieldByName('descricao').AsString;
      lbledtCodigoFabricante.Text := ViewPrincipal.dsBusca.DataSet.FieldByName('codigofabricante').AsString;
    end;

  end
  else
  begin
    ShowMessage('DataSet não está ativo ou disponível.');
  end;
end;

procedure TViewCadastroPecas.btneditarClick(Sender: TObject);
var
  ViewPrincipal: TPrincipal;
begin
  ViewPrincipal := TPrincipal(Application.MainForm);

  incluirp := 0;

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

procedure TViewCadastroPecas.btnGravarClick(Sender: TObject);
var
  ViewPrincipal: TPrincipal;
  UltimoID: Integer;
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
    ShowMessage('O DataSet não está em modo de edição ou inserção.');
    Exit;
  end;

  try



    if ViewPrincipal.dsBusca.DataSet.State = dsBrowse then
      ViewPrincipal.dsBusca.DataSet.Edit;


    if IncluirP = 0 then
    begin
      ViewPrincipal.dsBusca.DataSet.Edit;
    end
    else
    begin
      FEntity := TControllerEntityFactory.New.Pecas;
      FEntity.Lista(ViewPrincipal.dsBusca);
      ViewPrincipal.dsBusca.DataSet.Last;
      UltimoID := ViewPrincipal.dsBusca.DataSet.FieldByName('id').AsInteger;
      ViewPrincipal.dsBusca.DataSet.Insert;
      ViewPrincipal.dsBusca.DataSet.FieldByName('id').AsInteger := UltimoID + 1;

    end;

    ViewPrincipal.dsBusca.DataSet.FieldByName('codigo').AsString := lbledtCodigo.Text;
    ViewPrincipal.dsBusca.DataSet.FieldByName('descricao').AsString := lbledtDescricao.Text;
    ViewPrincipal.dsBusca.DataSet.FieldByName('codigofabricante').AsString := lbledtCodigoFabricante.Text;


    ViewPrincipal.dsBusca.DataSet.Post;

    if Assigned(FEntity) then
    begin
      ViewPrincipal.dsBusca.Edit;
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


procedure TViewCadastroPecas.btnIncluirClick(Sender: TObject);
var
  ViewPrincipal: TPrincipal;
begin
  ViewPrincipal := TPrincipal(Application.MainForm);
  Incluirp := 1;

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
    ViewPrincipal.dsBusca.DataSet.Insert;

  AdicionarNovoItem('Incluir');

end;

procedure TViewCadastroPecas.FormCreate(Sender: TObject);
begin
  FEntity := TControllerEntityFactory.New.Pecas;
end;

end.
