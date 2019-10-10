unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.ComCtrls, Vcl.Buttons, Data.DB, Vcl.DBGrids;

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
    SpeedButton1: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnDeletar: TSpeedButton;
    btnCancelar: TSpeedButton;
    grid: TDBGrid;
    DS: TDataSource;
    Label7: TLabel;
    Label8: TLabel;
    edtID: TEdit;
     PROCEDUre salvar;
    procedure alterar;
    procedure pesquisar;
    procedure delete(id: String);
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
  DMod.QRcon.SQL.Add('update cargos c set c.nome = :nome where c.id = :id');
  DMod.QRcon.ParamByName('NOME').Value := edtNome.Text;
  DMod.QRcon.ParamByName('ID').Value := edtId.Text;
  DMod.QRcon.ExecSQL;
  MessageDlg('Cargos Alterado com Sucesso!', mtInformation, mbOKCancel, 0);
  crud := 'R';

end;

procedure TFrmFuncionarios.delete(id: String);
begin
  if Trim(id) = '' then
  begin
    MessageDlg('Nenhum Cargo Selecionado', mtInformation, mbOKCancel, 0);
    Exit;
  end;

  DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add('delete from cargos where id = :id');
  DMod.QRcon.ParamByName('ID').Value := id;
  DMod.QRcon.ExecSQL;
  MessageDlg('Registro deletado com sucesso', mtInformation, mbOKCancel, 0);
  crud := 'R';
end;

procedure TFrmFuncionarios.pesquisar;
begin
   DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add
    ('select * from cargos where nome containing :pesquisa order by id');
  DMod.QRcon.ParamByName('pesquisa').Value := edtPesquisa.Text;
  DMod.QRcon.Open;
  Grid.Columns[0].FieldName := 'ID';
  Grid.Columns[1].FieldName := 'NOME';
end;

procedure TFrmFuncionarios.salvar;
begin
if crud = 'C' then

  begin
    // Inser��o do registro na tabela
    DMod.QRcon.SQL.Clear;
    DMod.QRcon.SQL.Add('INSERT INTO FUNCIONARIOS (NOME, CPF, TELEFONE, ENDERECO, CARGO) VALUES ( :NOME, :CPF, :TELEFONE, :ENDERECO, :CARGO);');
    DMod.QRcon.ParamByName('NOME').Value := edtNome.Text;
    DMod.QRcon.ParamByName('CPF').Value := edtCpf.Text;
    DMod.QRcon.ParamByName('TELEFONE').Value := edtFone.Text;
    DMod.QRcon.ParamByName('ENDERECO').Value := edtEnd.Text;
    DMod.QRcon.ParamByName('CARGO').Value := cmbCargo.ItemIndex +1;
    DMod.QRcon.ExecSQL;

    // Consulta o ID gerado na tabela e repassa para o edt de ID
    DMod.QRcon.SQL.Clear;
    DMod.QRcon.SQL.Add
      ('select id from cargos where id = (select max(id) from cargos)');
    DMod.QRcon.Open;
    edtId.Text := DMod.QRcon.FieldByName('ID').Value;

    DMod.QRcon.SQL.Clear;
    crud := 'R';
    MessageDlg('Salvo com sucesso', mtInformation, mbOKCancel, 0);
  end
  else if crud = 'U' then

  begin
    alterar;
  end;
end;

end.
