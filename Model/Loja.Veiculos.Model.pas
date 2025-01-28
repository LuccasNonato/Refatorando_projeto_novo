unit Loja.Veiculos.Model;

interface

uses
  Loja.Model.Interfaces;

Type
  TVeiculos = class(TInterfacedObject, iVeiculos)
    private
    FCodigoInterno : Integer;
    FModelo: string;
    FMontadora: string;
    FVersao: string;

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
  Result := FCodigoInterno;
end;

function TVeiculos.CodigoInterno(Value: Integer): iVeiculos;
begin
  Result := Self;
  FCodigoInterno := Value;
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
  Result := FModelo;
end;

function TVeiculos.Modelo(Value: string): iVeiculos;
begin
  Result := Self;
  FModelo := Value;
end;

function TVeiculos.Montadora: string;
begin
  Result := FMontadora;
end;

function TVeiculos.Montadora(Value: string): iVeiculos;
begin
  Result := Self;
  FMontadora := Value;
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
  Result := Self;
  FVersao := Value;
end;

end.
