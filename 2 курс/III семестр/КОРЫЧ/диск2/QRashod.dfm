object QRashodi: TQRashodi
  Left = 517
  Top = 322
  BorderStyle = bsDialog
  Caption = #1056#1072#1089#1093#1086#1076#1099
  ClientHeight = 255
  ClientWidth = 566
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
    Left = 32
    Top = 176
    Width = 66
    Height = 13
    Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072':'
  end
  object Label2: TLabel
    Left = 240
    Top = 176
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label3: TLabel
    Left = 224
    Top = 200
    Width = 6
    Height = 13
    Caption = #1089
  end
  object Label4: TLabel
    Left = 224
    Top = 232
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 0
    Width = 545
    Height = 120
    DataSource = QRashodi_DataSource2
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ButtonDo: TButton
    Left = 408
    Top = 224
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonDoClick
  end
  object Vid: TDBLookupComboBox
    Left = 32
    Top = 192
    Width = 145
    Height = 21
    KeyField = 'Vid'
    ListField = 'Vid'
    ListSource = QRashodi_DataSource1
    TabOrder = 2
  end
  object Data1: TDateTimePicker
    Left = 240
    Top = 192
    Width = 130
    Height = 21
    Date = 39435.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 39435.000000000000000000
    TabOrder = 3
  end
  object Data2: TDateTimePicker
    Left = 240
    Top = 224
    Width = 130
    Height = 21
    Date = 39435.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 39435.000000000000000000
    TabOrder = 4
  end
  object Button1: TButton
    Left = 488
    Top = 224
    Width = 75
    Height = 25
    Caption = #1054#1090#1095#1077#1090
    TabOrder = 5
    OnClick = Button1Click
  end
  object QRashodi_DataSource1: TDataSource
    DataSet = QRashodi_Table
    Left = 40
    Top = 128
  end
  object QRashodi_DataSource2: TDataSource
    DataSet = QRashodi_Table
    Left = 104
    Top = 128
  end
  object QRashodi_Table: TTable
    Active = True
    TableName = 'Rashodi.DB'
    Left = 8
    Top = 128
  end
  object QRashodi_Query: TQuery
    DataSource = QRashodi_DataSource1
    SQL.Strings = (
      'SELECT Data, Vid, KontrAgents, Summa'
      'FROM Rashodi'
      
        'WHERE Rashodi.Data>=:first_date and Rashodi.Data<=:last_date and' +
        ' Rashodi.Vid = :name'
      '')
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
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 'Rashodi.rav'
    Left = 136
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
  object RvQueryConnection2: TRvQueryConnection
    RuntimeVisibility = rtDeveloper
    Query = QRashodi_Query
    Left = 200
    Top = 128
  end
end
