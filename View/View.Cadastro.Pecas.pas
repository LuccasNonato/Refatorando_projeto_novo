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
    ds1: TDataSource;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TViewCadastroPecas.btn1Click(Sender: TObject);
var
  UltimoID: Integer;
begin
  ultimoID := 0;

  ds1.DataSet.Edit;
  if ds1.DataSet.Locate('Codigo', lbledtCodigo.Text, []) then
  begin
    ShowMessage('Codigo já existe com o Código ' + lbledtCodigo.Text + ' Já Existe');
    lbledtCodigo.SetFocus;
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
  ds1.DataSet.FieldByName('Codigo').AsString := lbledtCodigo.Text;
  ds1.DataSet.FieldByName('Descricao').AsString := lbledtDescricao.Text;
  ds1.DataSet.FieldByName('CodigoFabricante').AsString := lbledtCodigoFabricante.Text;
  ds1.DataSet.Post;

  ShowMessage('Cadastro Efetuado com Sucesso: ');

  Close;
end;

procedure TViewCadastroPecas.FormCreate(Sender: TObject);
begin
 Fentity := TControllerEntityFactory.New.Pecas.Lista(ds1);
end;

end.
