unit Loja.Controller.Entity.Pecas;

interface

uses
  Loja.Controller.Entity.interfaces, Loja.Model.Conexao.Interfaces, loja.Controller.Conexoes.Factory,
  Menus.Model.Entity.interfaces, Data.DB;

Type
  TControllerEntityPecas = class(TInterfacedObject, iControllerEntity)
    private
     FConexao : iConexao;
     FDataSet : iDataSet;
     FEntity  : iModelEntity;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iControllerEntity;

      function Lista(aDataSource : TDatasource) : iControllerEntity;
      function Salvar(aDataSource : TDatasource) : iControllerEntity;

    end;
implementation

uses
  Loja.Controller.Conexoes.DataSet, Menus.Model.Entity.Factory,
  System.SysUtils;

{ TControllerEntityPecas }

constructor TControllerEntityPecas.Create;
begin
  FConexao := TControllerConexoesFactory.New.Conexao;
  FDataSet := TControllerConexaoFactoryDataSet.New.DataSet(FConexao);
  FEntity  := TModelEntityFactory.New.Pecas(FDataSet);
end;

destructor TControllerEntityPecas.Destroy;
begin

  inherited;
end;

function TControllerEntityPecas.Lista(
  aDataSource: TDatasource): iControllerEntity;
begin
  Result := Self;
  aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityPecas.New: iControllerEntity;
begin
  Result := Self.Create;
end;

function TControllerEntityPecas.Salvar(
  aDataSource: TDatasource): iControllerEntity;
begin
  if Assigned(aDataSource) and Assigned(aDataSource.DataSet) then
  begin
    if aDataSource.DataSet.State in [dsEdit, dsInsert] then
    begin
      aDataSource.DataSet.Post;
    end
    else
    begin
      raise Exception.Create('O DataSet não está em modo de edição ou inserção.');
    end;
  end
  else
  begin
    raise Exception.Create('DataSource ou DataSet não atribuídos.');
  end;

  Result := Self;
end;

end.

