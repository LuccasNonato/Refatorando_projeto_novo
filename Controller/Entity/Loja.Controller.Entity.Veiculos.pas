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
    end;
implementation

uses
  Loja.Controller.Conexoes.DataSet, Menus.Model.Entity.Factory;

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

end.
