unit Menus.Model.Entity.PecasCompativeis;

interface

uses
  Menus.Model.Entity.interfaces, System.Classes, Loja.Model.Conexao.Interfaces,
  Data.DB;

Type

  TModelEntityPecasCompativeis = class(TInterfacedObject, iModelEntity)
    private
     FDataSet : iDataSet;
    public
      constructor Create(DataSet : iDataSet);
      destructor  Destroy; override;
      class function New(DataSet : iDataSet) : iModelEntity;

      function Listar : TComponent;
      function Salvar : TDataSet;

    end;
implementation

uses
  System.SysUtils;

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

function TModelEntityPecasCompativeis.Salvar: TDataSet;
var
  DataSet: TDataSet;
begin

  if FDataSet.DataSet is TDataSet then
  begin
    DataSet := FDataSet.DataSet as TDataSet;

    if DataSet.State in [dsEdit, dsInsert] then
    begin
      DataSet.Post;
    end
    else
    begin

      raise Exception.Create('O DataSet não está em modo de edição ou inserção.');
    end;
  end
  else
  begin

    raise Exception.Create('O componente DataSet não é um TDataSet válido.');
  end;

  Result := DataSet;
end;


end.
