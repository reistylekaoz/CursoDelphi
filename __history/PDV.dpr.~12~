program PDV;

uses
  Vcl.Forms,
  Login in 'Login.pas' {FrmLogin},
  Menu in 'Menu.pas' {FrmMenu},
  Usuarios in 'Cadastros\Usuarios.pas' {FrmUsuarios},
  Funcionarios in 'Cadastros\Funcionarios.pas' {FrmFuncionarios},
  Cargos in 'Cadastros\Cargos.pas' {FrmCargos},
  dmodule in 'dmodule.pas' {DMod: TDataModule},
  GrupoUsuarios in 'Cadastros\GrupoUsuarios.pas' {frmGrupoUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDMod, DMod);
  Application.CreateForm(TfrmGrupoUsuarios, frmGrupoUsuarios);
  Application.Run;
end.
