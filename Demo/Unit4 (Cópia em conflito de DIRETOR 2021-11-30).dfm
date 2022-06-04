object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    505
    231)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 382
    Top = 8
    Width = 115
    Height = 33
    Caption = 'Teste de Conex'#227'o'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 56
    Width = 505
    Height = 152
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 14
    Width = 161
    Height = 21
    Cursor = crHandPoint
    Style = csDropDownList
    Color = clInfoBk
    ItemIndex = 0
    TabOrder = 2
    Text = '1 - FIREDAC'
    StyleElements = [seBorder]
    Items.Strings = (
      '1 - FIREDAC'
      '2 - ZEOS'
      '3 - RESTDATAWARE')
  end
  object Panel1: TPanel
    Left = 0
    Top = 208
    Width = 505
    Height = 23
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 207
  end
  object DTQueryG1: TDTQueryG
    User = 'SYSDBA'
    PassWord = 'masterkey'
    Port = '3050'
    DataBase = 'C:\SUPERSYS10\DADOS\SUPERSYS.FDB'
    TipoConector = tpFireDAC
    CaminhoVendorLib = 'C:\SUPERSYS10\FBCLIENT.DLL'
    FireDACConection = FDConnection1
    ZeosConection = ZConnection1
    RDWConnection = RESTDWDataBase1
    Left = 72
    Top = 96
  end
  object DataSource1: TDataSource
    Left = 160
    Top = 96
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\SUPERSYS10\Dados\SUPERSYS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 248
    Top = 96
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'c:\supersys10\fbclient.dll'
    Left = 344
    Top = 96
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 3050
    Database = 'c:\supersys10\dados\supersys.fdb'
    User = 'SYSDBA'
    Password = 'masterkey'
    Protocol = 'firebird-2.1'
    LibraryLocation = 'c:\supersys10\fbclient.dll'
    Left = 248
    Top = 160
  end
  object RESTDWDataBase1: TRESTDWDataBase
    Active = False
    Compression = True
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    MyIP = '0.0.0.0'
    AuthenticationOptions.AuthorizationOption = rdwAONone
    Proxy = False
    ProxyOptions.Port = 8888
    PoolerService = '127.0.0.1'
    PoolerPort = 8082
    StateConnection.AutoCheck = False
    StateConnection.InTime = 1000
    RequestTimeOut = 10000
    ConnectTimeOut = 3000
    EncodeStrings = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    HandleRedirects = False
    RedirectMaximum = 0
    ParamCreate = True
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    ClientConnectionDefs.Active = False
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    Left = 136
    Top = 168
  end
end
