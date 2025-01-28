unit Loja.Controller.Conexoes.Factory;

interface

uses
  Loja.Controller.Conexoes.interfaces, Loja.Model.Conexao.Interfaces;

Type

   TControllerConexoesFactory = class(TInterfacedObject, iControllerFactoryConexao)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iControllerFactoryConexao;

      function Conexao : iConexao;
    end;
implementation

uses
  Loja.Model.Conexao.Factory;



{ TControllerConexaoesFactory }

function TControllerConexoesFactory.Conexao: iConexao;
begin
   Result := TConexaoFactory.New
                            .Conexao
                            .Parametros.DataBase('Loja')
                              .Password('1')
                              .DriveID('PG')
                              .Porta(5433)
                              .UserName('postgres')
                              .SetParametrosConexao
                              .Conectar;
end;

constructor TControllerConexoesFactory.Create;
begin

end;

destructor TControllerConexoesFactory.Destroy;
begin

  inherited;
end;

class function TControllerConexoesFactory.New: iControllerFactoryConexao;
begin
  Result := Self.Create;
end;

end.
