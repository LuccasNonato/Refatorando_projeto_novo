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
    ds1: TDataSource;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TViewCadastroVeiculos.btn1Click(Sender: TObject);
var
  UltimoID: Integer;
begin
  ultimoID := 0;

  if Edita = 'Edita' then
  begin
    lbledt2.Enabled := False;
    ds1.DataSet.Edit;
    ds1.DataSet.FieldByName('Modelo').AsString := lbledt3.Text;
    ds1.DataSet.FieldByName('Montadora').AsString := lbledt4.Text;
    ds1.DataSet.FieldByName('Versao').AsString := lbledt5.Text;
    ds1.DataSet.UpdateRecord;
    Close;
  end;



  ds1.DataSet.Edit;
  if ds1.DataSet.Locate('Codigo', lbledt2.Text, []) then
  begin
    ShowMessage('Codigo já existe com o Código ' + lbledt2.Text + ' Já Existe');
    lbledt2.SetFocus;
    exit;
  end;

  if not ds1.DataSet.IsEmpty then
  begin
    ds1.DataSet.Last;
    UltimoID := ds1.DataSet.FieldByName('ID').AsInteger;
  end;


  ds1.DataSet.Append;
  UltimoID := 1;

    if not ds1.DataSet.IsEmpty then
      UltimoID := ds1.DataSet.RecordCount + 1;

  ds1.DataSet.FieldByName('ID').AsInteger := UltimoID;
  ds1.DataSet.Edit;
  ds1.DataSet.FieldByName('Codigo').AsString := lbledt2.Text;
  ds1.DataSet.FieldByName('Modelo').AsString := lbledt3.Text;
  ds1.DataSet.FieldByName('Montadora').AsString := lbledt4.Text;
  ds1.DataSet.FieldByName('Versao').AsString := lbledt5.Text;
  ds1.DataSet.Post;

  ShowMessage('Cadastro Efetuado com Sucesso: ');

  Close;
end;

procedure TViewCadastroVeiculos.FormCreate(Sender: TObject);
begin
  Fentity := TControllerEntityFactory.New.Veiculos.Lista(ds1);

  if Edita = 'Edita' then
  begin
    lbledt2.Enabled := False;
  end;
end;

end.
