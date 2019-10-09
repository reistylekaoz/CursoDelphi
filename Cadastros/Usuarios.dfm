object FrmUsuarios: TFrmUsuarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Usuarios'
  ClientHeight = 274
  ClientWidth = 536
  Color = clMenuBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 536
    Height = 274
    ActivePage = tbCadastro
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 645
    ExplicitHeight = 441
    object TbConsulta: TTabSheet
      Caption = 'Consulta'
      ExplicitLeft = -84
      ExplicitTop = -48
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Label1: TLabel
        Left = 3
        Top = 21
        Width = 79
        Height = 19
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtPesquisa: TEdit
        Left = 3
        Top = 46
        Width = 521
        Height = 21
        TabOrder = 0
      end
      object StringGrid1: TStringGrid
        Left = 3
        Top = 73
        Width = 521
        Height = 160
        TabOrder = 1
      end
    end
    object tbCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitLeft = -164
      ExplicitTop = -40
      ExplicitWidth = 637
      ExplicitHeight = 413
      object Label2: TLabel
        Left = 33
        Top = 58
        Width = 39
        Height = 21
        Alignment = taRightJustify
        Caption = 'Nome:'
      end
      object Label3: TLabel
        Left = 9
        Top = 85
        Width = 63
        Height = 21
        Alignment = taRightJustify
        Caption = 'Endere'#231'o:'
      end
      object Label4: TLabel
        Left = -14
        Top = 112
        Width = 86
        Height = 21
        Alignment = taRightJustify
        Caption = 'CPF:'
      end
      object Label5: TLabel
        Left = -159
        Top = 139
        Width = 231
        Height = 21
        Alignment = taRightJustify
        Caption = 'Telefone:'
      end
      object Label6: TLabel
        Left = -38
        Top = 166
        Width = 110
        Height = 21
        Alignment = taRightJustify
        Caption = 'Cargo:'
      end
      object edtNome: TEdit
        Left = 78
        Top = 55
        Width = 417
        Height = 21
        TabOrder = 0
      end
      object edtEnd: TEdit
        Left = 78
        Top = 82
        Width = 417
        Height = 21
        TabOrder = 1
      end
      object edtCpf: TMaskEdit
        Left = 78
        Top = 109
        Width = 416
        Height = 21
        EditMask = '000.000.000-00;1;_'
        MaxLength = 14
        TabOrder = 2
        Text = '   .   .   -  '
      end
      object edtFone: TMaskEdit
        Left = 78
        Top = 136
        Width = 415
        Height = 21
        EditMask = '(00)9 0000 0000;1;_'
        MaxLength = 15
        TabOrder = 3
        Text = '(  )           '
      end
      object cmbCargo: TComboBox
        Left = 78
        Top = 163
        Width = 417
        Height = 21
        TabOrder = 4
        Text = 'cmbCargo'
      end
    end
  end
end
