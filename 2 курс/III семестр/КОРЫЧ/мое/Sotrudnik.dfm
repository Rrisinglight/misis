object Sotrudniki: TSotrudniki
  Left = 385
  Top = 330
  BorderStyle = bsDialog
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 263
  ClientWidth = 316
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
    Left = 144
    Top = 24
    Width = 11
    Height = 13
    Caption = #8470
  end
  object Label2: TLabel
    Left = 64
    Top = 48
    Width = 92
    Height = 13
    Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object Label3: TLabel
    Left = 128
    Top = 72
    Width = 27
    Height = 13
    Caption = #1060#1048#1054
  end
  object Label4: TLabel
    Left = 128
    Top = 96
    Width = 24
    Height = 13
    Caption = #1048#1053#1053
  end
  object Label5: TLabel
    Left = 8
    Top = 120
    Width = 151
    Height = 13
    Caption = #8470' '#1057#1090#1088#1072#1093#1086#1074#1086#1075#1086' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
  end
  object Label6: TLabel
    Left = 96
    Top = 144
    Width = 58
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object Label7: TLabel
    Left = 40
    Top = 168
    Width = 113
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1087#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
  end
  object Label8: TLabel
    Left = 48
    Top = 192
    Width = 102
    Height = 13
    Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
  end
  object Sotrudniki_DBNavigator: TDBNavigator
    Left = 40
    Top = 216
    Width = 240
    Height = 25
    DataSource = Sotrudniki_DataSource
    TabOrder = 0
  end
  object Sotrudniki_Num: TDBEdit
    Left = 160
    Top = 16
    Width = 41
    Height = 21
    DataField = 'Num'
    DataSource = Sotrudniki_DataSource
    TabOrder = 1
  end
  object Sotrudniki_Nomer: TDBEdit
    Left = 160
    Top = 40
    Width = 57
    Height = 21
    DataField = 'Nomer'
    DataSource = Sotrudniki_DataSource
    TabOrder = 2
  end
  object Sotrudniki_FIO: TDBEdit
    Left = 160
    Top = 64
    Width = 121
    Height = 21
    DataField = 'FIO'
    DataSource = Sotrudniki_DataSource
    TabOrder = 3
  end
  object Sotrudniki_INN: TDBEdit
    Left = 160
    Top = 88
    Width = 97
    Height = 21
    DataField = 'INN'
    DataSource = Sotrudniki_DataSource
    TabOrder = 4
  end
  object Sotrudniki_NumStrah: TDBEdit
    Left = 160
    Top = 112
    Width = 97
    Height = 21
    DataField = 'NumStrah'
    DataSource = Sotrudniki_DataSource
    TabOrder = 5
  end
  object Sotrudniki_Dolgnost: TDBEdit
    Left = 160
    Top = 136
    Width = 97
    Height = 21
    DataField = 'Dolgnost'
    DataSource = Sotrudniki_DataSource
    TabOrder = 6
  end
  object Sotrudniki_RegAdres: TDBEdit
    Left = 160
    Top = 160
    Width = 145
    Height = 21
    DataField = 'RegAdres'
    DataSource = Sotrudniki_DataSource
    TabOrder = 7
  end
  object Sotrudniki_FakAdres: TDBEdit
    Left = 160
    Top = 184
    Width = 145
    Height = 21
    DataField = 'FakAdres'
    DataSource = Sotrudniki_DataSource
    TabOrder = 8
  end
  object Sotrudniki_DataSource: TDataSource
    DataSet = Sotrudniki_Table
    Left = 16
    Top = 56
  end
  object Sotrudniki_Table: TTable
    Active = True
    TableName = 'Sotrudniki.DB'
    Left = 16
    Top = 16
  end
end
