unit Loja.Pecas.Model;

interface

uses
  Loja.Model.Interfaces;

Type
  TPecas = class(TInterfacedObject, iPecas)
    private
     FCodigoInterno : Integer;
     FDescricao : string;
     FCodigoFabricante : string;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iPecas;

     function CodigoInterno(value : integer): iPecas; overload;
     function CodigoInterno : Integer; overload;

     function Descricao(value : string): iPecas; overload;
     function Descricao: string; overload;

     function CodigoFabricante(value : string): iPecas; overload;
     function CodigoFabricante : string; overload;

    end;
implementation

{ TPecas }

function TPecas.CodigoFabricante(value: string): iPecas;
begin
   Result := Self;
   FCodigoFabricante := value;
end;

function TPecas.CodigoFabricante: string;
begin
  Result := FCodigoFabricante;
end;

function TPecas.CodigoInterno: Integer;
begin
  Result := FCodigoInterno;
end;

function TPecas.CodigoInterno(value: integer): iPecas;
begin
  Result := Self;
  FCodigoInterno := value;
end;

constructor TPecas.Create;
begin

end;

function TPecas.Descricao(value: string): iPecas;
begin
  Result := Self;
  FDescricao := value;
end;

function TPecas.Descricao: string;
begin

end;

destructor TPecas.Destroy;
begin

  inherited;
end;

class function TPecas.New: iPecas;
begin
  Result := Self.Create;
end;

end.
