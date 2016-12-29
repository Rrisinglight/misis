object QDohodi: TQDohodi
  Left = 305
  Top = 275
  BorderStyle = bsDialog
  Caption = #1044#1086#1093#1086#1076#1099
  ClientHeight = 257
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 176
    Width = 60
    Height = 13
    Caption = #1042#1080#1076' '#1076#1086#1093#1086#1076#1072':'
  end
  object Label2: TLabel
    Left = 224
    Top = 176
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label3: TLabel
    Left = 208
    Top = 200
    Width = 6
    Height = 13
    Caption = #1089
  end
  object Label4: TLabel
    Left = 208
    Top = 232
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object ButtonDo: TButton
    Left = 400
    Top = 224
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 0
    OnClick = ButtonDoClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 545
    Height = 120
    DataSource = QDohod_TableDataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Vid: TDBLookupComboBox
    Left = 24
    Top = 200
    Width = 145
    Height = 21
    KeyField = 'Num'
    ListField = 'Name'
    ListSource = QDohod_TableDataSource1
    TabOrder = 2
  end
  object Data1: TDateTimePicker
    Left = 224
    Top = 192
    Width = 89
    Height = 21
    Date = 39435.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 39435.000000000000000000
    TabOrder = 3
  end
  object Data2: TDateTimePicker
    Left = 224
    Top = 224
    Width = 97
    Height = 21
    Date = 39435.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 39435.000000000000000000
    TabOrder = 4
  end
  object Button1: TButton
    Left = 480
    Top = 224
    Width = 75
    Height = 25
    Caption = #1054#1090#1095#1077#1090
    TabOrder = 5
    OnClick = Button1Click
  end
  object QDohod_Table: TTable
    Active = True
    TableName = 'Dohodi.DB'
    Left = 8
    Top = 128
  end
  object QDohod_TableDataSource1: TDataSource
    DataSet = QDohod_Table
    Left = 40
    Top = 128
  end
  object QDohod_TableQuery: TQuery
    DataSource = QDohod_TableDataSource1
    SQL.Strings = (
      'SELECT Data, KontrAgents, Name, Summa'
      'FROM Dohodi'
      
        'WHERE Dohodi.Data>=:first_date and Dohodi.Data<=:last_date and D' +
        'ohodi.Name = :name')
    Left = 72
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'first_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'last_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
  end
  object QDohod_TableDataSource2: TDataSource
    DataSet = QDohod_Table
    Left = 104
    Top = 128
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 'Dohodi.rav'
    Left = 200
    Top = 128
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 168
    Top = 128
  end
  object RvQueryConnection1: TRvQueryConnection
    RuntimeVisibility = rtDeveloper
    Query = QDohod_TableQuery
    Left = 136
    Top = 128
  end
end
