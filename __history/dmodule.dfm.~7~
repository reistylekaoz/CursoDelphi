object DMod: TDMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 678
  Width = 861
  object FDCon: TFDConnection
    Params.Strings = (
      'Database=D:\Projeto\WS\CursoDelphi\CursoDelphi\BANCO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    Left = 72
    Top = 56
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 224
    Top = 56
  end
  object tbCargos: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDCon
    UpdateOptions.UpdateTableName = 'CARGOS'
    TableName = 'CARGOS'
    Left = 224
    Top = 144
    object tbCargosID: TIntegerField
      DisplayLabel = 'C'#243'digo do Cargo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbCargosNOME: TStringField
      DisplayLabel = 'Nome do Cargo'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
  end
  object QRcargos: TFDQuery
    Connection = FDCon
    SQL.Strings = (
      'select * from cargos')
    Left = 224
    Top = 240
    object QRcargosID: TIntegerField
      DisplayLabel = 'C'#243'digo do Cargo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRcargosNOME: TStringField
      DisplayLabel = 'Nome do Cargo'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
  end
end
