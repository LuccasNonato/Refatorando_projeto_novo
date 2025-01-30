unit Loja.Controller.Entity.Veiculos;

interface

uses
  Loja.Controller.Entity.interfaces, Loja.Model.Conexao.Interfaces, loja.Controller.Conexoes.Factory,
  Menus.Model.Entity.interfaces, Data.DB;

Type
  TControllerEntityVeiculos = class(TInterfacedObject, iControllerEntity)
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

{ TControllerEntityVeiculos }

constructor TControllerEntityVeiculos.Create;
begin
  FConexao := TControllerConexoesFactory.New.Conexao;
  FDataSet := TControllerConexaoFactoryDataSet.New.DataSet(FConexao);
  FEntity  := TModelEntityFactory.New.Veiculos(FDataSet);
end;

destructor TControllerEntityVeiculos.Destroy;
begin

  inherited;
end;

function TControllerEntityVeiculos.Lista(
  aDataSource: TDatasource): iControllerEntity;
begin
  Result := Self;
  aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityVeiculos.New: iControllerEntity;
begin
  Result := Self.Create;
end;

function TControllerEntityVeiculos.Salvar(
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

      raise Exception.Create('O DataSet n�o est� em modo de edi��o ou inser��o.');
    end;
  end
  else
  begin

    raise Exception.Create('DataSource ou DataSet n�o atribu�dos.');
  end;

  Result := Self;
end;

end.
