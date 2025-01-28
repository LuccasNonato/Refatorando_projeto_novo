unit Loja.Model.Conexao.FactoryDataSet;

interface

uses
  Loja.Model.Conexao.Interfaces, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TFactoryDataSet = class(TInterfacedObject, iFactoryDataSet)
    private
     FQuery : TFDMemTable;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iFactoryDataSet;

      function DataSetFiredac(Conexao : iConexao) : iDataSet;

    end;
implementation

uses
  System.SysUtils, Loja.Model.Conexao.Table;

{ TFactoryDataSet }

constructor TFactoryDataSet.Create;
begin
  FQuery := TFDMemTable.Create(nil);
  {poderia passar self porém pode dar erro de memoryleak ao destruir por fato de ter uma conexao criada ou até no clear da memtable,
  daria para utilizar o [weak] para enfraquecer esse cara mas não seria exatamente uma chamada ciclica (1<2, 2<1)}
end;

function TFactoryDataSet.DataSetFiredac(Conexao : iConexao) : iDataSet;
begin
  Result := TTable.New(Conexao);
end;

destructor TFactoryDataSet.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TFactoryDataSet.New: iFactoryDataSet;
begin
  Result := Self.Create;
end;



end.
