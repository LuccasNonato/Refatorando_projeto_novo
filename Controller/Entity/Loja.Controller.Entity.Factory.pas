unit Loja.Controller.Entity.Factory;

interface

uses
  Loja.Controller.Entity.interfaces;

Type
  TControllerEntityFactory = class(TInterfacedObject, iControllerEntityFactory)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iControllerEntityFactory;

      function Veiculos : iControllerEntity;
      function Pecas    : iControllerEntity;


    end;
implementation

uses
  Loja.Controller.Entity.Veiculos, Loja.Controller.Entity.Pecas;

{ TControllerEntityFactory }

constructor TControllerEntityFactory.Create;
begin

end;

destructor TControllerEntityFactory.Destroy;
begin

  inherited;
end;

class function TControllerEntityFactory.New: iControllerEntityFactory;
begin
  Result := Self.Create;
end;

function TControllerEntityFactory.Pecas: iControllerEntity;
begin
  Result := TControllerEntityVeiculos.New;
end;

function TControllerEntityFactory.Veiculos: iControllerEntity;
begin
  Result := TControllerEntityPecas.New;
end;

end.
