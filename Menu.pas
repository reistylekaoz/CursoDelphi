unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TFrmMenu = class(TForm)
    MainMenu: TMainMenu;
    Cadastros: TMenuItem;
    CadProdutos: TMenuItem;
    CadFornecedores: TMenuItem;
    Movimentaes1: TMenuItem;
    Relatrios1: TMenuItem;
    Estoque1: TMenuItem;
    Sair1: TMenuItem;
    CadUsuarios: TMenuItem;
    CadFuncionarios: TMenuItem;
    CadCargos: TMenuItem;
    CadGrupoUsuarios: TMenuItem;
    DefAcesso: TMenuItem;
    Label1: TLabel;
    LblUsuario: TLabel;
    procedure CadUsuariosClick(Sender: TObject);
    procedure CadFuncionariosClick(Sender: TObject);
    procedure CadCargosClick(Sender: TObject);
    procedure CadGrupoUsuariosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses Usuarios, Funcionarios, Cargos, GrupoUsuarios, dmodule;

procedure TFrmMenu.CadCargosClick(Sender: TObject);
begin
    FrmCargos := TFrmCargos.Create(self);
    FrmCargos.ShowModal;
end;

procedure TFrmMenu.CadFuncionariosClick(Sender: TObject);
begin
    FrmFuncionarios := TFrmFuncionarios.Create(self);
    FrmFuncionarios.ShowModal;
end;

procedure TFrmMenu.CadGrupoUsuariosClick(Sender: TObject);
begin
    frmGrupoUsuarios := TfrmGrupoUsuarios.Create(self);
    frmGrupoUsuarios.ShowModal;
end;

procedure TFrmMenu.CadUsuariosClick(Sender: TObject);
begin
    FrmUsuarios := TFrmUsuarios.Create(self);
    FrmUsuarios.ShowModal;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
LblUsuario.Caption := USUARIO;
end;

end.
