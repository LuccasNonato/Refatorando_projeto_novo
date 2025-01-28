unit Loja.Model.Interfaces;

interface

 type
  iPecas = interface
    ['{91E3851A-3923-4C0E-9236-65CC6293315F}']
    function CodigoInterno(value : integer): iPecas; overload;
    function CodigoInterno : Integer; overload;

    function Descricao(value : string): iPecas; overload;
    function Descricao: string; overload;

    function CodigoFabricante(value : string): iPecas; overload;
    function CodigoFabricante : string; overload;
  end;

  iVeiculos = interface
    ['{0BE8BFE2-9267-4D01-9138-B20442063618}']
    function CodigoInterno(Value : Integer): iVeiculos; overload;
    function CodigoInterno: Integer; overload;

    function Modelo(Value : string): iVeiculos; overload;
    function Modelo:string; overload;

    function Montadora(Value: string): iVeiculos; overload;
    function Montadora: string; overload;

    function Versao(Value : string): iVeiculos; overload;
    function Versao: string; overload;
  end;



implementation

end.
