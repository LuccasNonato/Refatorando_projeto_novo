program Loja;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {Principal},
  Loja.Model.Conexao.Interfaces in 'Model\Conexao\Loja.Model.Conexao.Interfaces.pas',
  Loja.Model.Conexao.Firedac in 'Model\Conexao\Loja.Model.Conexao.Firedac.pas',
  Loja.Model.Conexao.FactoryDataSet in 'Model\Conexao\Loja.Model.Conexao.FactoryDataSet.pas',
  Loja.Model.Conexao.Factory in 'Model\Conexao\Loja.Model.Conexao.Factory.pas',
  Loja.Model.Conexao.Table in 'Model\Conexao\Loja.Model.Conexao.Table.pas',
  Menus.Model.Entity.interfaces in 'Model\Conexao\Entity\Menus.Model.Entity.interfaces.pas',
  Menus.Model.Entity.Veiculos in 'Model\Conexao\Entity\Menus.Model.Entity.Veiculos.pas',
  Menus.Model.Entity.Pecas in 'Model\Conexao\Entity\Menus.Model.Entity.Pecas.pas',
  Menus.Model.Entity.Factory in 'Model\Conexao\Entity\Menus.Model.Entity.Factory.pas',
  Loja.Controller.Conexoes.interfaces in 'Controller\Loja.Controller.Conexoes.interfaces.pas',
  Loja.Controller.Conexoes.Factory in 'Controller\Loja.Controller.Conexoes.Factory.pas',
  Loja.Controller.Conexoes.DataSet in 'Controller\Loja.Controller.Conexoes.DataSet.pas',
  Loja.Controller.Entity.Veiculos in 'Controller\Entity\Loja.Controller.Entity.Veiculos.pas',
  Loja.Controller.Entity.Pecas in 'Controller\Entity\Loja.Controller.Entity.Pecas.pas',
  Loja.Controller.Entity.interfaces in 'Controller\Entity\Loja.Controller.Entity.interfaces.pas',
  Loja.Controller.Entity.Factory in 'Controller\Entity\Loja.Controller.Entity.Factory.pas',
  View.Cadastro.Veiculos in 'View\View.Cadastro.Veiculos.pas' {ViewCadastroVeiculos},
  View.Cadastro.Pecas in 'View\View.Cadastro.Pecas.pas' {ViewCadastroPecas},
  Menus.Model.Entity.PecasCompativeis in 'Model\Conexao\Entity\Menus.Model.Entity.PecasCompativeis.pas',
  Loja.Controller.Entity.PecasCompativeis in 'Controller\Entity\Loja.Controller.Entity.PecasCompativeis.pas',
  LojaUtils in 'Utils\LojaUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TViewCadastroVeiculos, ViewCadastroVeiculos);
  Application.CreateForm(TViewCadastroPecas, ViewCadastroPecas);
  Application.Run;
end.
