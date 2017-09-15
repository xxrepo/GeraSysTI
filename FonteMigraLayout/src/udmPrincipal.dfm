object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 398
  Top = 162
  Height = 517
  Width = 457
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 52
    Top = 94
  end
  object spHabilitaTriggers: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PE_OPCAO'
        ParamType = ptInput
      end>
    StoredProcName = 'HABILITA_TRIGGERS'
    Left = 56
    Top = 160
  end
  object connectionGERA: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    KeepConnection = False
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      
        'Database=D:\Aplicativos\Delphi2010\Remuneratus\Dados\REMUN_PM_SA' +
        'LINOP.FDB'
      'RoleName=RoleName'
      'User_Name=GERASYS.TI'
      'Password=gsti2010'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    VendorLib = 'fbclient.DLL'
    Left = 240
    Top = 152
  end
  object qryMaxServidor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(ID) FROM SERVIDOR')
    SQLConnection = connectionGERA
    Left = 379
    Top = 7
  end
  object connectionLayOut: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    KeepConnection = False
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      
        'Database=D:\Aplicativos\Delphi2010\Remuneratus\Compilado\4552011' +
        '4.FDB'
      'RoleName='
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    VendorLib = 'fbclient.DLL'
    Left = 240
    Top = 208
  end
end
