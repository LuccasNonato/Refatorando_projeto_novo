unit Menus.Model.Entity.PecasCompativeis;

interface

uses
  Menus.Model.Entity.interfaces, System.Classes, Loja.Model.Conexao.Interfaces;

Type

  TModelEntityPecasCompativeis = class(TInterfacedObject, iModelEntity)
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
  FTableName = 'PecasCompativeis';

{ TModelEntityPecasCompativeis }

constructor TModelEntityPecasCompativeis.Create(DataSet : iDataSet);
begin
    FDataSet := DataSet;
end;

destructor TModelEntityPecasCompativeis.Destroy;
begin

  inherited;
end;

function TModelEntityPecasCompativeis.Listar: TComponent;
begin
  Result := FDataSet.Open(FTableName).DataSet;
end;

class function TModelEntityPecasCompativeis.New(DataSet : iDataSet) : iModelEntity;
begin
  Result := Self.Create(Dataset);
end;

end.
