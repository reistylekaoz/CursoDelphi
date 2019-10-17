program PDV;

uses
  Vcl.Forms,
  Login in 'Login.pas' {FrmLogin},
  Menu in 'Menu.pas' {FrmMenu},
  Usuarios in 'Cadastros\Usuarios.pas' {FrmUsuarios},
  Funcionarios in 'Cadastros\Funcionarios.pas' {FrmFuncionarios},
  Cargos in 'Cadastros\Cargos.pas' {FrmCargos},
  dmodule in 'dmodule.pas' {DMod: TDataModule},
  GrupoUsuarios in 'Cadastros\GrupoUsuarios.pas' {frmGrupoUsuarios},
  DefinicoesdeAcesso in 'Configurações\DefinicoesdeAcesso.pas' {frmDefinicoes},
  Fornecedores in 'Cadastros\Fornecedores.pas' {frmFornecedores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDMod, DMod);
  Application.CreateForm(TfrmGrupoUsuarios, frmGrupoUsuarios);
  Application.CreateForm(TfrmDefinicoes, frmDefinicoes);
  Application.CreateForm(TfrmFornecedores, frmFornecedores);
  Application.Run;
end.
