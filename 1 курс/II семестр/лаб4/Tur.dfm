object Form1: TForm1
  Left = 307
  Top = 450
  Width = 828
  Height = 226
  Caption = #1058#1091#1088#1073#1102#1088#1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 81
    Height = 25
    Caption = #1047#1072#1087#1088#1086#1089'_'#1074#1099#1073#1086#1088
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 48
    Width = 81
    Height = 25
    Caption = #1047#1072#1087#1088#1086#1089'_'#1089#1086#1088#1090
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 88
    Width = 81
    Height = 25
    Caption = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 128
    Width = 81
    Height = 25
    Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
    TabOrder = 3
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 104
    Top = 8
    Width = 657
    Height = 145
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 272
    Top = 168
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = Table
    Left = 776
  end
  object Query1: TQuery
    DatabaseName = 'UFO'
    Left = 776
    Top = 88
  end
  object Table: TTable
    Active = True
    DatabaseName = 'UFO'
    TableName = 'UFO.DB'
    Left = 776
    Top = 40
  end
end
