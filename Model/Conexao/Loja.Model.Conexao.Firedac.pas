unit Loja.Model.Conexao.Firedac;

interface

uses
  Loja.Model.Conexao.Interfaces, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, FireDAC.Comp.UI,
  FireDAC.Comp.Client, System.Classes, FireDAC.DApt;

Type
  TConexao = class(TInterfacedObject, iConexao, iConexaoParametros)
    private
      FConexao : TFDConnection;
      FDPhysPgDriverLink1: TFDPhysPgDriverLink;
      FDGUIxWaitCursor1: TFDGUIxWaitCursor;

      FDataBase : string;
      FPassword : string;
      FDriveID : string;
      FServer : string;
      FPorta : Integer;
      FUserName : string;
    procedure LerParametros;

    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iConexao;

      function Connection : TComponent;
      function Parametros : iConexaoParametros;
      function DataBase(Value : string) : iConexaoParametros;
      function Password(Value : string) : iConexaoParametros;
      function DriveID(Value : string) : iConexaoParametros;
      function Server(Value : string) : iConexaoParametros;
      function Porta(Value : integer) : iConexaoParametros;
      function UserName(Value : string) : iConexaoParametros;
      function SetParametrosConexao: iConexao;
      function Conectar   : iConexao;

    end;
implementation

uses
  System.SysUtils;

{ TConexao }

function TConexao.Conectar: iConexao;
begin
  Result := Self;
  LerParametros;
  FConexao.Connected := True;
end;

function TConexao.Connection: TComponent;
begin
  Result := FConexao;
end;

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FDPhysPgDriverLink1 := TFDPhysPgDriverLink.Create(nil);
  FDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);


//  FConexao.Params.DriverID := 'PG';
//  FConexao.Params.Database := 'Loja';
//  FConexao.Params.Password := '1';
//  FConexao.Params.UserName := 'postgres';
//  FConexao.Params.Add('Port=5433');
end;

destructor TConexao.Destroy;
begin
  Freeandnil(FConexao);
  Freeandnil(FDPhysPgDriverLink1);
  Freeandnil(FDGUIxWaitCursor1);
  inherited;
end;

function TConexao.DataBase(Value: string): iConexaoParametros;
begin
  Result := Self;
  FDataBase := Value;
end;

function TConexao.DriveID(Value: string): iConexaoParametros;
begin
  Result := Self;
  FDriveID := Value;
end;

function TConexao.Parametros: iConexaoParametros;
begin
  Result := Self;
end;

function TConexao.Password(Value: string): iConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;

function TConexao.Porta(Value: integer): iConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TConexao.Server(Value: string): iConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

class function TConexao.New: iConexao;
begin
  Result := Self.Create;
end;

function TConexao.SetParametrosConexao: iConexao;
begin
  Result := Self;
end;

procedure TConexao.LerParametros;
begin
  FConexao.Params.DriverID := FDriveID;
  FConexao.Params.Database := FDataBase;
  FConexao.Params.Password := FPassword;
  FConexao.Params.UserName := FUsername;
  FConexao.Params.Add('Port=' + IntToStr(FPorta));
  FConexao.Connected := True;
end;

function TConexao.UserName(Value: string): iConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.
