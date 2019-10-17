unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, ComCtrls;

type
  TFrmMenu = class(TForm)
    MainMenu: TMainMenu;
    Cadastros: TMenuItem;
    CadProdutos: TMenuItem;
    CadFornecedores: TMenuItem;
    Movimentacoes: TMenuItem;
    Relatorios: TMenuItem;
    Estoque: TMenuItem;
    Sair1: TMenuItem;
    CadUsuarios: TMenuItem;
    CadFuncionarios: TMenuItem;
    CadCargos: TMenuItem;
    CadGrupoUsuarios: TMenuItem;
    ConfDefAcesso: TMenuItem;
    Label1: TLabel;
    LblUsuario: TLabel;
    Config: TMenuItem;
    EstOutrasEntradas: TMenuItem;
    procedure liberartodasfunc;
    procedure bloqueartodasfunc;
    procedure carregarfuncoes;
    procedure CadUsuariosClick(Sender: TObject);
    procedure CadFuncionariosClick(Sender: TObject);
    procedure CadCargosClick(Sender: TObject);
    procedure CadGrupoUsuariosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConfDefAcessoClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure CadFornecedoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses Usuarios, Funcionarios, Cargos, GrupoUsuarios, dmodule, DefinicoesdeAcesso,
  Fornecedores;

procedure TFrmMenu.bloqueartodasfunc;
var
i: integer;
j: integer;

begin
        for i :=  0 to Menu.Items.Count - 1 do
  begin
    Menu.Items[i].Enabled := true;


    for j := 0 to Menu.Items[i].Count - 1 do
    begin
      Menu.Items[i].Items[j].Enabled := false;

    end;
  end;
end;

procedure TFrmMenu.CadCargosClick(Sender: TObject);
begin
  FrmCargos := TFrmCargos.Create(self);
  FrmCargos.ShowModal;
end;

procedure TFrmMenu.CadFornecedoresClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.ShowModal;
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

procedure TFrmMenu.carregarfuncoes;
begin
  DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add
    ('select g.id, g.grupo_usuarios_id, gu.nome as nomegrupo, g.funcoes_id, f.nome as nomefuncao, g.alterar, g.excluir, g.inserir, g.entrar from funcoes_grupo_usuarios g');
  DMod.QRcon.SQL.Add
    ('left join grupo_usuarios gu on(g.grupo_usuarios_id = gu.id)');
  DMod.QRcon.SQL.Add('left join funcoes f on(g.funcoes_id = f.id)');
  DMod.QRcon.SQL.Add('where g.grupo_usuarios_id = :id');
  DMod.QRcon.ParamByName('ID').Value := grupoid;
  DMod.QRcon.open;

  while not DMod.QRcon.Eof do
  begin
    if DMod.QRcon.FieldByName('entrar').Value = 'S' then
    begin

      TMenuItem(FindComponent(DMod.QRcon.FieldByName('nomefuncao').Value))
        .Enabled := true;
    end;

    DMod.QRcon.Next;
  end;
end;

procedure TFrmMenu.ConfDefAcessoClick(Sender: TObject);
begin
  frmDefinicoes := TfrmDefinicoes.Create(self);
  frmDefinicoes.ShowModal;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
var
  i: integer;
  j: integer;
begin
  LblUsuario.Caption := IntToStr(USUARIOID) + '-' + USUARIO;

  bloqueartodasfunc;

  if superusuario = 'N' then
  begin

    carregarfuncoes;

  end
  else
  begin
    liberartodasfunc;
  end;
end;

procedure TFrmMenu.liberartodasfunc;
var
i: integer;
j: integer;
begin
for i :=  0 to Menu.Items.Count - 1 do
  begin
    Menu.Items[i].Enabled := true;


    for j := 0 to Menu.Items[i].Count - 1 do
    begin
      Menu.Items[i].Items[j].Enabled := true;

    end;
  end;

end;

procedure TFrmMenu.Sair1Click(Sender: TObject);
begin
   self.Close;

end;

end.
