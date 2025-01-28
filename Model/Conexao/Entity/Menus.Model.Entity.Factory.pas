unit Menus.Model.Entity.Factory;

interface

uses
  Menus.Model.Entity.interfaces, Loja.Model.Conexao.Interfaces;

Type
  TModelEntityFactory = class(TInterfacedObject, iModelEntityFactory)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iModelEntityFactory;

     function Veiculos(DataSet : iDataSet) : iModelEntity;
     function Pecas(DataSet : iDataSet) : iModelEntity;

    end;
implementation

uses
  Menus.Model.Entity.Pecas, Menus.Model.Entity.Veiculos;

{ TModelEntityFactory }

constructor TModelEntityFactory.Create;
begin

end;

destructor TModelEntityFactory.Destroy;
begin

  inherited;
end;

class function TModelEntityFactory.New: iModelEntityFactory;
begin
  Result := Self.Create;
end;

function TModelEntityFactory.Pecas(DataSet: iDataSet): iModelEntity;
begin
  Result := TModelEntityVeiculos.new(DataSet);
end;

function TModelEntityFactory.Veiculos(DataSet: iDataSet): iModelEntity;
begin
   Result := TModelEntityPecas.New(DataSet);
end;

end.
