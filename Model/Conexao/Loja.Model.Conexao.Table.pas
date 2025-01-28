unit Loja.Model.Conexao.Table;

interface

uses
  Loja.Model.Conexao.Interfaces, System.Classes, FireDAC.Comp.Client;

Type
  TTable = class(TInterfacedObject, iDataSet)
    private
      FTable : TFDTable;
    public
      constructor Create(Conexao : iConexao);
      destructor  Destroy; override;
      class function New(Conexao : iConexao) : iDataSet;

      function Open(Table : string ) : iDataSet;
      function DataSet : TComponent;

    end;
implementation

uses
  System.SysUtils;

{ TTable }

constructor TTable.Create(Conexao : iConexao);
begin
  FTable := TFDTable.Create(nil);
  FTable.Connection := (Conexao.Connection as TFDConnection);
end;

function TTable.DataSet: TComponent;
begin
  Result := FTable;
end;

destructor TTable.Destroy;
begin
   FreeAndNil(FTable);
  inherited;
end;

class function TTable.New(Conexao : iConexao) : iDataSet;
begin
  Result := Self.Create(Conexao);
end;

function TTable.Open(Table: string): iDataSet;
begin
   Result := Self;
   FTable.Open(Table);
end;

end.
