unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.ComCtrls, Vcl.Buttons, Data.DB, Vcl.DBGrids, FireDAC.Stan.Param;

type
  TFrmFuncionarios = class(TForm)
    PageControl1: TPageControl;
    TbConsulta: TTabSheet;
    Label1: TLabel;
    edtPesquisa: TEdit;
    tbCadastro: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNome: TEdit;
    edtEnd: TEdit;
    edtCpf: TMaskEdit;
    edtFone: TMaskEdit;
    cmbCargo: TComboBox;
    BtnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnDeletar: TSpeedButton;
    btnCancelar: TSpeedButton;
    grid: TDBGrid;
    DS: TDataSource;
    Label7: TLabel;
    Label8: TLabel;
    edtID: TEdit;
    cmbIDcargo: TComboBox;
    PROCEDUre salvar;
    procedure alterar;
    procedure pesquisar;
    procedure delete(id: String);
    procedure listarcargos;
    procedure FormShow(Sender: TObject);
    procedure cmbCargoChange(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionarios: TFrmFuncionarios;
  CRUD: String;

implementation

{$R *.dfm}

uses dmodule;

{ TFrmFuncionarios }

procedure TFrmFuncionarios.alterar;
begin
  DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add('update funcionarios set ');
  dmod.QRcon.SQL.Add('NOME = :nome,');
  dmod.QRcon.SQL.Add('CPF = :CPF,');
  DMod.QRcon.SQL.Add('TELEFONE = :TELEFONE,') ;
  DMod.QRcon.SQL.Add('ENDERECO = :ENDERECO,');
  DMod.QRcon.SQL.Add('CARGO = :CARGO');
  DMod.QRcon.SQL.Add('WHERE ID = :ID');


  DMod.QRcon.ParamByName('NOME').Value := edtNome.Text;
  DMod.QRcon.ParamByName('ID').Value := edtID.Text;
  DMod.QRcon.ParamByName('CPF').Value := edtCpf.Text;
  DMod.QRcon.ParamByName('TELEFONE').Value := edtFone.Text;
  DMod.QRcon.ParamByName('ENDERECO').Value := edtEnd.Text;
  DMod.QRcon.ParamByName('CARGO').Value := cmbIDcargo.Text;
  DMod.QRcon.ExecSQL;
  MessageDlg('Cargos Alterado com Sucesso!', mtInformation, mbOKCancel, 0);
  CRUD := 'R';

end;

procedure TFrmFuncionarios.BtnNovoClick(Sender: TObject);
begin
 if crud <> 'R' then
  BEGIN
    MessageDlg('Existe um cadastro em aberto', mtWarning, mbOKCancel, 0);
    Exit;
  END
  else
  begin

    edtId.Text := '';
    edtNome.Text := '';
    edtNome.Enabled := true;
    PageControl1.ActivePageIndex := 1;
    edtNome.SetFocus;
    crud := 'C';
  end;
end;

procedure TFrmFuncionarios.BtnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text) = '' then
  begin
    MessageDlg('Campo Cargo v�zio!!', mtWarning, mbOKCancel, 0);
    edtNome.SetFocus;
    Exit;
  end;
  salvar;
  edtNome.Enabled := false;
  edtEnd.Enabled := false;
  edtCpf.Enabled := False;
  edtFone.Enabled := false;
  cmbCargo.Enabled := false;
end;

procedure TFrmFuncionarios.cmbCargoChange(Sender: TObject);
begin
  cmbIDcargo.ItemIndex := cmbCargo.ItemIndex;
end;

procedure TFrmFuncionarios.delete(id: String);
begin
  if Trim(id) = '' then
  begin
    MessageDlg('Nenhum Funcion�rio Selecionado', mtInformation, mbOKCancel, 0);
    Exit;
  end;

  DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add('delete from funcionarios where id = :id');
  DMod.QRcon.ParamByName('ID').Value := id;
  DMod.QRcon.ExecSQL;
  MessageDlg('Registro deletado com sucesso', mtInformation, mbOKCancel, 0);
  CRUD := 'R';
end;

procedure TFrmFuncionarios.FormShow(Sender: TObject);
begin
  listarcargos;
  CRUD := 'R';
end;

procedure TFrmFuncionarios.listarcargos;
begin
  //fun��o para inserir os cargos no combobox, criei um cmbbox auxiliar que fica invisivel, s� para registrar o ID

  DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add('select id, nome from cargos order by id');
  DMod.QRcon.Open();

  while not DMod.QRcon.Eof do
  begin
    cmbCargo.Items.Add(DMod.QRcon.FieldByName('NOME').Value);
    cmbIDcargo.Items.Add(DMod.QRcon.FieldByName('id').Value);
    DMod.QRcon.Next;
  end;
end;

procedure TFrmFuncionarios.pesquisar;
begin
  DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add
    ('select * from funcionarios where nome containing :pesquisa order by id');
  DMod.QRcon.ParamByName('pesquisa').Value := edtPesquisa.Text;
  DMod.QRcon.Open;
  grid.Columns[0].FieldName := 'ID';
  grid.Columns[1].FieldName := 'NOME';
end;

procedure TFrmFuncionarios.salvar;
begin
  if CRUD = 'C' then

  begin
    // Inser��o do registro na tabela
    DMod.QRcon.SQL.Clear;
    DMod.QRcon.SQL.Add
      ('INSERT INTO FUNCIONARIOS (NOME, CPF, TELEFONE, ENDERECO, CARGO) VALUES ( :NOME, :CPF, :TELEFONE, :ENDERECO, :CARGO);');
    DMod.QRcon.ParamByName('NOME').Value := edtNome.Text;
    DMod.QRcon.ParamByName('CPF').Value := edtCpf.Text;
    DMod.QRcon.ParamByName('TELEFONE').Value := edtFone.Text;
    DMod.QRcon.ParamByName('ENDERECO').Value := edtEnd.Text;
    DMod.QRcon.ParamByName('CARGO').AsInteger := StrToInt(cmbIDcargo.Text);
    DMod.QRcon.ExecSQL;

    // Consulta o ID gerado na tabela e repassa para o edt de ID
    DMod.QRcon.SQL.Clear;
    DMod.QRcon.SQL.Add
      ('select id from funcionarios where id = (select max(id) from funcionarios)');
    DMod.QRcon.Open;
    edtID.Text := DMod.QRcon.FieldByName('ID').Value;

    DMod.QRcon.SQL.Clear;
    CRUD := 'R';
    MessageDlg('Salvo com sucesso', mtInformation, mbOKCancel, 0);
  end
  else if CRUD = 'U' then

  begin
    alterar;
  end;
end;

procedure TFrmFuncionarios.btnAlterarClick(Sender: TObject);
begin
     if crud <> 'R' then
  BEGIN
    MessageDlg('Existe um cadastro em aberto', mtWarning, mbOKCancel, 0);
    Exit;
  END
  else
  begin

    edtId.Text := Grid.Columns.Items[0].Field.Text;
    edtNome.Text := Grid.Columns.Items[1].Field.Text;
    edtNome.Enabled := true;
    PageControl1.ActivePageIndex := 1;
    edtNome.SetFocus;
    crud := 'U';
  end;
end;

end.
