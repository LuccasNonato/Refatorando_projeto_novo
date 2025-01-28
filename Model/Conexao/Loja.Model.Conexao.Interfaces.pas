unit Loja.Model.Conexao.Interfaces;

interface

uses
  Data.DB, System.Classes;

type
  iConexaoParametros  = interface;

  iConexao = interface
    ['{7CC76D75-1277-4ED2-84AB-83768577343F}']
    function Connection : TComponent;
    function Parametros : iConexaoParametros;
    function Conectar   : iConexao;
  end;

  iConexaoParametros  = interface
    ['{2A7FC6E3-32A6-43FE-97C2-0FE17D8D2D56}']
    function DataBase(Value : string) : iConexaoParametros;
    function Password(Value : string) : iConexaoParametros;
    function DriveID(Value : string) : iConexaoParametros;
    function Server(Value : string) : iConexaoParametros;
    function Porta(Value : integer) : iConexaoParametros;
    function UserName(Value : string) : iConexaoParametros;

    function SetParametrosConexao : iConexao;
  end;

  iDataSet = interface
    ['{655EDE13-9CA0-4815-81E2-2E234EC4D4F2}']
    function Open(Table : string ) : iDataSet;
    function DataSet : TComponent;
  end;

  iFactoryConexao = interface
    ['{1EE90A26-30B2-4B09-A3DE-74D3FC6D6664}']
    function Conexao : iConexao;
  end;

  iFactoryDataSet = interface
    ['{67AC18D5-1418-4A25-A865-8C90B95F93BA}']
    function DataSetFiredac(Conexao : iConexao) : iDataSet;
  end;



implementation

end.
