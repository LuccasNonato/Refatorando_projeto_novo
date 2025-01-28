unit Menus.Model.Entity.Pecas;

interface

uses
  Menus.Model.Entity.interfaces, System.Classes, Loja.Model.Conexao.Interfaces;

Type

  TModelEntityPecas = class(TInterfacedObject, iModelEntity)
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
  FTableName = 'Pecas';

{ TModelEntityPecas }

constructor TModelEntityPecas.Create(DataSet : iDataSet);
begin
    FDataSet := DataSet;
end;

destructor TModelEntityPecas.Destroy;
begin

  inherited;
end;

function TModelEntityPecas.Listar: TComponent;
begin
  Result := FDataSet.Open(FTableName).DataSet;
end;

class function TModelEntityPecas.New(DataSet : iDataSet) : iModelEntity;
begin
  Result := Self.Create(Dataset);
end;

end.
