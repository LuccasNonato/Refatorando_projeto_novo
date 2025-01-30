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
    btn3: TButton;
    btn4: TButton;
    pnl1: TPanel;
    dbgrdVeiculosCompativeis: TDBGrid;
    dsPecasCompativeis: TDataSource;
    rgFiltros: TRadioGroup;
    procedure pnlPecasClick(Sender: TObject);
    procedure pnlVeiculosClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edtBuscaItemExit(Sender: TObject);
  private
    { Private declarations }
    FEntity : iControllerEntity;
    FEntityPecasCompativeis : icontrollerEntity;
    procedure SalvarDados;
    procedure BuscaVeiculos;
    procedure BuscaPecas;
    procedure BuscaVinculos;
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses
  Loja.Model.Conexao.Firedac, Loja.Controller.Entity.Factory;

{$R *.dfm}

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

procedure TPrincipal.BuscaPecas;
var
  DescricaoBuscada: string;
begin
  pnlPecasClick(nil);

  DescricaoBuscada := edtBuscaItem.Text;
   if Assigned(dsBusca.DataSet) and dsBusca.DataSet.Active then
  begin
    if dsBusca.DataSet.FieldCount > 0 then
    begin

      if dsBusca.DataSet.FieldByName('descricao') <> nil then
      begin

        if dsBusca.DataSet.Locate('descricao', DescricaoBuscada, []) then
        begin
          ShowMessage('Descrição encontrada: ' + dsBusca.DataSet.FieldByName('descricao').AsString);

          dsBusca.DataSet.Filter := 'descricao = ''' + DescricaoBuscada + '''';
          dsBusca.DataSet.Filtered := True;
        end
        else
        begin

          ShowMessage('Descrição não encontrada.');


          dsBusca.DataSet.Filtered := False;
        end;
      end
      else
      begin
        ShowMessage('Campo "descricao" não encontrado no DataSet.');
      end;
    end
    else
    begin
      ShowMessage('O DataSet não contém campos.');
    end;
  end
  else
  begin
    ShowMessage('O DataSet não está ativo.');
  end;
end;

procedure TPrincipal.BuscaVeiculos;
var
  DescricaoBuscada: string;
begin
  pnlveiculosClick(nil);

  DescricaoBuscada := edtBuscaItem.Text;
   if Assigned(dsBusca.DataSet) and dsBusca.DataSet.Active then
  begin

    if dsBusca.DataSet.FieldCount > 0 then
    begin

      if dsBusca.DataSet.FieldByName('modelo') <> nil then
      begin

        if dsBusca.DataSet.Locate('modelo', DescricaoBuscada, []) then
        begin

          ShowMessage('Descrição encontrada: ' + dsBusca.DataSet.FieldByName('modelo').AsString);


          dsBusca.DataSet.Filter := 'modelo = ''' + DescricaoBuscada + '''';
          dsBusca.DataSet.Filtered := True;
        end
        else
        begin

          ShowMessage('Descrição não encontrada.');

          dsBusca.DataSet.Filtered := False;
        end;
      end
      else
      begin
        ShowMessage('Campo "descricao" não encontrado no DataSet.');
      end;
    end
    else
    begin
      ShowMessage('O DataSet não contém campos.');
    end;
  end
  else
  begin
    ShowMessage('O DataSet não está ativo.');
  end;
end;

procedure TPrincipal.BuscaVinculos;
var
  DescricaoBuscada: string;
begin
  pnlPecasClick(nil);

  DescricaoBuscada := edtBuscaItem.Text;
   if Assigned(dsPecasCompativeis.DataSet) and dsPecasCompativeis.DataSet.Active then
  begin
    if dsPecasCompativeis.DataSet.FieldCount > 0 then
    begin

      if dsPecasCompativeis.DataSet.FieldByName('descricaopeca') <> nil then
      begin

        if dsPecasCompativeis.DataSet.Locate('descricaopeca', DescricaoBuscada, []) then
        begin
          ShowMessage('Descrição encontrada: ' + dsPecasCompativeis.DataSet.FieldByName('descricaopeca').AsString);

          dsPecasCompativeis.DataSet.Filter := 'descricaopeca = ''' + DescricaoBuscada + '''';
          dsPecasCompativeis.DataSet.Filtered := True;
        end
        else
        begin

          ShowMessage('Descrição não encontrada.');


          dsPecasCompativeis.DataSet.Filtered := False;
        end;
      end
      else
      begin
        ShowMessage('Campo "descricao" não encontrado no DataSet.');
      end;
    end
    else
    begin
      ShowMessage('O DataSet não contém campos.');
    end;
  end
  else
  begin
    ShowMessage('O DataSet não está ativo.');
  end;
end;

procedure TPrincipal.edtBuscaItemExit(Sender: TObject);
begin
  if Trim(edtBuscaItem.Text) = '' then
  begin
    ShowMessage('Por favor, digite um valor para busca.');
    rgfiltros.SetFocus;
    Exit;
  end;

  case  rgFiltros.ItemIndex of
   0 : BuscaVeiculos;
   1 : BuscaPecas;
   2 : BuscaVinculos;
  end;

end;

procedure TPrincipal.pnlPecasClick(Sender: TObject);
var
 Busca : String;
begin
  dbgrdVeiculosCompativeis.Visible := True;
  btn4.Enabled := True;
  btn3.Enabled := False;

  edtBuscaItem.Enabled := True;
  Busca := 'Pecas';
  FEntity := TControllerEntityFactory.New.Pecas;
  FEntity.Lista(dsBusca);

  FEntityPecasCompativeis := TControllerEntityFactory.New.PecasCompativeis;
  FEntityPecasCompativeis.Lista(dsPecasCompativeis);

  pnlPecas.Color := clHighlight;
  pnlVeiculos.Color :=  clWindow;

  try
    ViewCadastroPecas.Parent := pnl1;
    ViewCadastroPecas.Align := alClient;
    ViewCadastroPecas.BorderStyle := bsNone;
    ViewCadastroPecas.Show;
  except
    FreeAndNil(ViewCadastroPecas);
    ShowMessage('Erro ao exibir a tela de Cadastro de Peças.');
  end;
end;

procedure TPrincipal.pnlVeiculosClick(Sender: TObject);
var
 Busca : String;
begin
  dbgrdVeiculosCompativeis.Visible := False;
  btn4.Enabled := False;
  btn3.Enabled := True;

  edtBuscaItem.Enabled := True;
  Busca := 'Veiculos';
  FEntity := TControllerEntityFactory.New.Veiculos;
  FEntity.Lista(dsBusca);
  dsbusca.DataSet.Refresh;
  pnlVeiculos.Color := clHighlight;
  pnlPecas.Color :=  clWindow;

  try
    ViewCadastroVeiculos.Parent := pnl1;
    ViewCadastroVeiculos.Align := alClient;
    ViewCadastroVeiculos.BorderStyle := bsNone;
    ViewCadastroVeiculos.Show;
  except
    FreeAndNil(ViewCadastroVeiculos);
    ShowMessage('Erro ao exibir a tela de Cadastro de Peças.');
  end;

end;

procedure TPrincipal.SalvarDados;
begin
  if dsBusca.DataSet.State in [dsEdit, dsInsert] then
  begin
    dsBusca.DataSet.Post;
    dsBusca.DataSet.Refresh;
    ShowMessage('Dados salvos com sucesso!');
  end
  else
  begin
    ShowMessage('O DataSet não está em modo de edição ou inserção.');
  end;
end;

end.
