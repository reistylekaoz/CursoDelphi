unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    PanelLogin: TPanel;
    ImgLoginFundo: TImage;
    PanelImglogin: TPanel;
    ImgLogin: TImage;
    EdtSenha: TEdit;
    EdtLogin: TEdit;
    BtnLogin: TSpeedButton;
    LblAvisoLogin: TLabel;
    procedure centralizarpainel;
    procedure login;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure BtnLoginClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses Menu;

procedure TFrmLogin.BtnLoginClick(Sender: TObject);
begin
    if Trim(EdtLogin.Text) = '' then
        begin
          LblAvisoLogin.Caption := 'Digite o usuário!';
          EdtLogin.SetFocus;
          exit;
        end;

    if Trim(EdtSenha.Text) = '' then
    begin
        LblAvisoLogin.Caption := 'Digite a Senha!';
          EdtSenha.SetFocus;
          exit;
    end;

        login;
end;

procedure TFrmLogin.centralizarpainel;
begin
   PanelImglogin.top := (self.Height div 2) - 180;
    PanelImglogin.left := (Self.Width div 2) - 182;
end;

procedure TFrmLogin.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    centralizarpainel;
end;

procedure TFrmLogin.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  LblAvisoLogin.Caption := '';
end;

procedure TFrmLogin.login;
begin
    FrmMenu := TFrmMenu.Create(self);
    FrmMenu.ShowModal;
    LblAvisoLogin.Caption := 'Login Efetuado';
end;

end.
