unit Loja.Model.Veiculos;

interface

uses
  Loja.Model.Interfaces;

Type
  TVeiculos = class(TInterfacedObject, iVeiculos)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iVeiculos;

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

{ TVeiculos }

function TVeiculos.CodigoInterno: Integer;
begin

end;

function TVeiculos.CodigoInterno(Value: Integer): iVeiculos;
begin

end;

constructor TVeiculos.Create;
begin

end;

destructor TVeiculos.Destroy;
begin

  inherited;
end;

function TVeiculos.Modelo: string;
begin

end;

function TVeiculos.Modelo(Value: string): iVeiculos;
begin

end;

function TVeiculos.Montadora: string;
begin

end;

function TVeiculos.Montadora(Value: string): iVeiculos;
begin

end;

class function TVeiculos.New: iVeiculos;
begin
  Result := Self.Create;
end;

function TVeiculos.Versao: string;
begin

end;

function TVeiculos.Versao(Value: string): iVeiculos;
begin

end;

end.
