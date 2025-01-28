unit Loja.Controller.Conexoes.interfaces;

interface

uses
  Loja.Model.Conexao.Interfaces;

type

  iControllerFactoryConexao = interface
    ['{2758492E-7A8D-4CBE-B470-1D87A23DA916}']
    function Conexao : iConexao;
  end;

  iControllerFactoryDataSet = interface
    ['{584A9497-DC19-46FC-AB18-976FB9FA4201}']
    function DataSet(Conexao : iConexao) : iDataSet;
  end;

implementation

end.
