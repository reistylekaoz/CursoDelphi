unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.DBGrids;

type
  TFrmCargos = class(TForm)
    PageControl1: TPageControl;
    TbConsulta: TTabSheet;
    Label1: TLabel;
    edtPesquisa: TEdit;
    tbCadastro: TTabSheet;
    Label2: TLabel;
    BtnSalvar: TSpeedButton;
    edtNome: TEdit;
    Label3: TLabel;
    edtId: TEdit;
    BtnNovo: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnDeletar: TSpeedButton;
    Grid: TDBGrid;
    DS: TDataSource;
    BtnCancelar: TSpeedButton;
    procedure BtnNovoClick(Sender: TObject);
    PROCEDUre salvar;
    procedure alterar;
    procedure pesquisar;
    procedure delete(id: String);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridDblClick(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCargos: TFrmCargos;

  // VARIAVEL PARA CONTROLAR ESTADO ATUAL DO CRUD
  crud: String;

implementation

{$R *.dfm}

uses dmodule;

procedure TFrmCargos.alterar;
begin

  DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add('update cargos c set c.nome = :nome where c.id = :id');
  DMod.QRcon.ParamByName('NOME').Value := edtNome.Text;
  DMod.QRcon.ParamByName('ID').Value := edtId.Text;
  DMod.QRcon.ExecSQL;
  MessageDlg('Cargos Alterado com Sucesso!', mtInformation, mbOKCancel, 0);
  crud := 'R';

end;

procedure TFrmCargos.BtnNovoClick(Sender: TObject);
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

procedure TFrmCargos.BtnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text) = '' then
  begin
    MessageDlg('Campo Cargo v�zio!!', mtWarning, mbOKCancel, 0);
    edtNome.SetFocus;
    Exit;
  end;
  salvar;
  edtNome.Enabled := false;
end;

procedure TFrmCargos.delete;
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

procedure TFrmCargos.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  pesquisar;
end;

procedure TFrmCargos.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  Grid.EditorMode := false;
  crud := 'R';
end;

procedure TFrmCargos.GridDblClick(Sender: TObject);
begin

  BtnAlterar.Click;
end;

procedure TFrmCargos.PageControl1Enter(Sender: TObject);
begin
  edtPesquisa.SetFocus;
  pesquisar;
end;

procedure TFrmCargos.pesquisar;
begin

  DMod.QRcon.SQL.Clear;
  DMod.QRcon.SQL.Add
    ('select * from cargos where nome containing :pesquisa order by id');
  DMod.QRcon.ParamByName('pesquisa').Value := edtPesquisa.Text;
  DMod.QRcon.Open;
  Grid.Columns[0].FieldName := 'ID';
  Grid.Columns[1].FieldName := 'NOME';

end;

procedure TFrmCargos.salvar;
begin

  if crud = 'C' then

  begin
    // Inser��o do registro na tabela
    DMod.QRcon.SQL.Clear;
    DMod.QRcon.SQL.Add('INSERT INTO CARGOS (NOME) VALUES (:NOME);');
    DMod.QRcon.ParamByName('NOME').Value := edtNome.Text;
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

procedure TFrmCargos.BtnAlterarClick(Sender: TObject);
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

procedure TFrmCargos.BtnCancelarClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  edtPesquisa.SetFocus;
  edtNome.Enabled := false;
  crud := 'R';
end;

procedure TFrmCargos.BtnDeletarClick(Sender: TObject);
begin
  crud := 'D';
  delete(Grid.Columns.Items[0].Field.Text);
  pesquisar;
end;

end.