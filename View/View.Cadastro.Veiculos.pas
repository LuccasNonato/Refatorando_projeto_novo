unit View.Cadastro.Veiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Loja.Controller.Entity.interfaces, Data.DB;

type
  TViewCadastroVeiculos = class(TForm)
    pnl1: TPanel;
    lbledt2: TLabeledEdit;
    lbledt3: TLabeledEdit;
    lbledt4: TLabeledEdit;
    lbledt5: TLabeledEdit;
    btn1: TButton;
    btn2: TButton;
  private
    { Private declarations }
    FEntity : iControllerEntity;
  public
    Edita : string;
    { Public declarations }
  end;

var
  ViewCadastroVeiculos: TViewCadastroVeiculos;

implementation

uses
  Loja.Controller.Entity.Factory;

{$R *.dfm}

end.
