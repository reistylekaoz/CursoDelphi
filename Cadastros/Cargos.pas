unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TFrmCargos = class(TForm)
    PageControl1: TPageControl;
    TbConsulta: TTabSheet;
    Label1: TLabel;
    edtPesquisa: TEdit;
    StringGrid1: TStringGrid;
    tbCadastro: TTabSheet;
    Label2: TLabel;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnDeletar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edtNome: TEdit;
    Label3: TLabel;
    edtId: TEdit;
    procedure BtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCargos: TFrmCargos;

implementation

{$R *.dfm}

procedure TFrmCargos.BtnNovoClick(Sender: TObject);
begin
    edtnome.Text := '';
    edtNome.SetFocus;



end;

end.
