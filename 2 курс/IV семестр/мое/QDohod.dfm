object QDohodi: TQDohodi
  Left = 305
  Top = 275
  Width = 746
  Height = 537
  Caption = 'QDohodi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonDo: TButton
    Left = 208
    Top = 256
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 0
    OnClick = ButtonDoClick
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 40
    Width = 320
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
    Top = 192
    Width = 145
    Height = 21
    KeyField = 'Num'
    ListField = 'Name'
    ListSource = QDohod_TableDataSource1
    TabOrder = 2
  end
  object Data1: TDateTimePicker
    Left = 176
    Top = 192
    Width = 186
    Height = 21
    Date = 39435.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 39435.000000000000000000
    TabOrder = 3
  end
  object Data2: TDateTimePicker
    Left = 176
    Top = 224
    Width = 186
    Height = 21
    Date = 39435.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 39435.000000000000000000
    TabOrder = 4
  end
  object Button1: TButton
    Left = 288
    Top = 256
    Width = 75
    Height = 25
    Caption = #1054#1090#1095#1077#1090
    TabOrder = 5
    OnClick = Button1Click
  end
  object QDohod_Table: TTable
    Active = True
    TableName = 'Dohodi.DB'
    Left = 40
    Top = 448
  end
  object QDohod_TableDataSource1: TDataSource
    DataSet = QDohod_Table
    Left = 72
    Top = 448
  end
  object QDohod_TableQuery: TQuery
    DataSource = QDohod_TableDataSource1
    SQL.Strings = (
      'SELECT Data, KontrAgents, Name, Summa'
      'FROM Dohodi'
      
        'WHERE Dohodi.Data>=:first_date and Dohodi.Data<=:last_date and D' +
        'ohodi.Name = :name'
      '')
    Left = 104
    Top = 448
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
    Left = 136
    Top = 448
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\Program Files\Borland\Delphi7\Rave5\Dohodi.rav'
    Left = 368
    Top = 448
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
    Left = 328
    Top = 448
  end
  object RvQueryConnection1: TRvQueryConnection
    RuntimeVisibility = rtDeveloper
    Query = QDohod_TableQuery
    Left = 288
    Top = 448
  end
end
