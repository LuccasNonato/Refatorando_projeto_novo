unit Loja.Controller.Entity.PecasCompativeis;

interface

uses
  Loja.Controller.Entity.interfaces, Loja.Model.Conexao.Interfaces, loja.Controller.Conexoes.Factory,
  Menus.Model.Entity.interfaces, Data.DB;

Type
  TControllerEntityPecasCompativeis = class(TInterfacedObject, iControllerEntity)
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

{ TControllerEntityPecasCompativeis }

constructor TControllerEntityPecasCompativeis.Create;
begin
  FConexao := TControllerConexoesFactory.New.Conexao;
  FDataSet := TControllerConexaoFactoryDataSet.New.DataSet(FConexao);
  FEntity  := TModelEntityFactory.New.PecasCompativeis(FDataSet);
end;

destructor TControllerEntityPecasCompativeis.Destroy;
begin

  inherited;
end;

function TControllerEntityPecasCompativeis.Lista(
  aDataSource: TDatasource): iControllerEntity;
begin
  Result := Self;
  aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityPecasCompativeis.New: iControllerEntity;
begin
  Result := Self.Create;
end;

function TControllerEntityPecasCompativeis.Salvar(
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
