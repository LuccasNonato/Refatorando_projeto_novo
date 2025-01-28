unit Menus.Model.Entity.Produtos;

interface

uses
  Menus.Model.Entity.interfaces, System.Classes, Loja.Model.Conexao.Interfaces;

Type

  TModelEntityVeiculos = class(TInterfacedObject, iModelEntity)
    private
     FDataSet : iDataSet;
    public
      constructor Create(DataSet : iDataSet);
      destructor  Destroy; override;
      class function New(DataSet : iDataSet) : iModelEntity;

      function Listar : TComponent;

    end;
implementation

const
  FTableName = 'Veiculos';

{ TModelEntityVeiculos }

constructor TModelEntityVeiculos.Create(DataSet : iDataSet);
begin
    FDataSet := DataSet;
end;

destructor TModelEntityVeiculos.Destroy;
begin

  inherited;
end;

function TModelEntityVeiculos.Listar: TComponent;
begin
  Result := FDataSet.Open(FTableName).DataSet;
end;

class function TModelEntityVeiculos.New(DataSet : iDataSet) : iModelEntity;
begin
  Result := Self.Create(Dataset);
end;

end.
