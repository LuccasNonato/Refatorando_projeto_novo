unit Loja.Model.Conexao.DataSet;

interface

uses
  Loja.Model.Conexao.Interfaces, System.Classes;

Type
  TDataSet = class(TInterfacedObject, iDataSet)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iDataSet;

      function Open(Table : string ) : iDataSet;
      function DataSet : TComponent;

    end;
implementation

{ TDataSet }

constructor TDataSet.Create;
begin

end;

destructor TDataSet.Destroy;
begin

  inherited;
end;

class function TDataSet.New: iDataSet;
begin
  Result := Self.Create;
end;

end.
