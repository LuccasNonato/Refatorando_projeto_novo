unit Menus.Model.Entity.interfaces;

interface

uses
  System.Classes, Loja.Model.Conexao.Interfaces;

type

  iModelEntity = interface
    ['{8BB693B1-0D5C-410B-A23A-F39862891441}']
    function Listar : TComponent;
  end;

  iModelEntityFactory = interface
    ['{8C37B8B2-31F7-4FB0-8DD1-9EE3D3C7CABB}']
    function Veiculos(DataSet : iDataSet) : iModelEntity;
    function Pecas(DataSet : iDataSet)    : iModelEntity;
    function PecasCompativeis(DataSet : iDataSet)    : iModelEntity;
  end;

implementation

end.
