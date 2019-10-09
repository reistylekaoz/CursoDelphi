unit Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Mask;

type
  TFrmUsuarios = class(TForm)
    PageControl1: TPageControl;
    TbConsulta: TTabSheet;
    tbCadastro: TTabSheet;
    edtPesquisa: TEdit;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    edtNome: TEdit;
    edtEnd: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCpf: TMaskEdit;
    edtFone: TMaskEdit;
    cmbCargo: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuarios: TFrmUsuarios;

implementation

{$R *.dfm}

end.
