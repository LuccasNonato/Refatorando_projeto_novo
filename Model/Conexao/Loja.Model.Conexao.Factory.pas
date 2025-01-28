unit Loja.Model.Conexao.Factory;

interface

uses
  Loja.Model.Conexao.Interfaces;

Type
  TConexaoFactory = class(TInterfacedObject, iFactoryConexao)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iFactoryConexao;

      function Conexao : iConexao;


    end;
implementation

uses
  Loja.Model.Conexao.Firedac, Loja.Model.Conexao.FactoryDataSet;

{ TConexaoFactory }

function TConexaoFactory.Conexao: iConexao;
begin
  Result := TConexao.new;
end;

constructor TConexaoFactory.Create;
begin

end;

destructor TConexaoFactory.Destroy;
begin

  inherited;
end;

class function TConexaoFactory.New: iFactoryConexao;
begin
  Result := Self.Create;
end;

end.
