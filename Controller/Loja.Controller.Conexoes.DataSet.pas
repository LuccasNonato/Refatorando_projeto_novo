unit Loja.Controller.Conexoes.DataSet;

interface

uses
  Loja.Controller.Conexoes.interfaces, Loja.Model.Conexao.Interfaces;

Type
  TControllerConexaoFactoryDataSet = class(TInterfacedObject, iControllerFactoryDataset)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iControllerFactoryDataset;

      function DataSet(Conexao : iConexao) : iDataSet;

    end;
implementation

uses
  Loja.Model.Conexao.Factory, Loja.Model.Conexao.FactoryDataSet;

{ TControllerConexaoFactoryDataSet }

constructor TControllerConexaoFactoryDataSet.Create;
begin

end;

function TControllerConexaoFactoryDataSet.DataSet(Conexao : iConexao) : iDataSet;
begin
  Result := TFactoryDataSet.New.DataSetFiredac(Conexao);
end;

destructor TControllerConexaoFactoryDataSet.Destroy;
begin

  inherited;
end;

class function TControllerConexaoFactoryDataSet.New: iControllerFactoryDataset;
begin
  Result := Self.Create;
end;

end.
