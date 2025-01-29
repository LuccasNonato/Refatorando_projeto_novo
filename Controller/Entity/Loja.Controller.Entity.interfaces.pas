unit Loja.Controller.Entity.interfaces;

interface

uses
  Data.DB;

type

     iControllerEntity = interface
       ['{23C9631F-592E-4ACA-93DD-C38268A30608}']
       function Lista(aDataSource : TDatasource) : iControllerEntity;
     end;

     iControllerEntityFactory = interface
       ['{4BE9312D-E34C-4F0D-9F4E-22C14A1D864E}']
       function Veiculos : iControllerEntity;
       function Pecas    : iControllerEntity;
       function PecasCompativeis : iControllerEntity;
     end;

implementation

end.
