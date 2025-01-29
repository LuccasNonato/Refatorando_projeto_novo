unit View.Cadastro.Pecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Loja.Controller.Entity.interfaces, Data.DB;

type
  TViewCadastroPecas = class(TForm)
    pnl1: TPanel;
    lbledtCodigo: TLabeledEdit;
    lbledtDescricao: TLabeledEdit;
    lbledtCodigoFabricante: TLabeledEdit;
    btn1: TButton;
    btn2: TButton;
  private
    { Private declarations }
    FEntity : iControllerEntity;
  public
    { Public declarations }
  end;

var
  ViewCadastroPecas: TViewCadastroPecas;

implementation

uses
  Loja.Controller.Entity.Factory;

{$R *.dfm}

end.
