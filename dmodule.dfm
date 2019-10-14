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
    Left = 72
    Top = 56
  end
  object TBcon: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDCon
    Left = 136
    Top = 56
  end
  object QRcon: TFDQuery
    Connection = FDCon
    SQL.Strings = (
      '')
    Left = 200
    Top = 56
  end
end
