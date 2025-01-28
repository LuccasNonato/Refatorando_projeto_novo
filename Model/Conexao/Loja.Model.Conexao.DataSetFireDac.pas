unit Loja.Model.Conexao.DataSetFireDac;

interface

uses
  Loja.Model.Conexao.Interfaces, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TDataSetFireDac = class(TInterfacedObject, iDataSetFiredac)
    private
     FQuery : TFDMemTable;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iDataSetFiredac;

      function DataSetFiredac : iDataSet;

    end;
implementation

uses
  System.SysUtils;

{ TDataSetFireDac }

constructor TDataSetFireDac.Create;
begin
  FQuery := TFDMemTable.Create(nil);
  {poderia passar self porém pode dar erro de memoryleak ao destruir por fato de ter uma conexao criada ou até no clear da memtable,
  daria para utilizar o [weak] para enfraquecer esse cara mas não seria exatamente uma chamada ciclica (1<2, 2<1)}
end;

function TDataSetFireDac.DataSetFiredac: iDataSet;
begin
  Result := Tconexao
end;

destructor TDataSetFireDac.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TDataSetFireDac.New: iDataSetFiredac;
begin
  Result := Self.Create;
end;



end.
