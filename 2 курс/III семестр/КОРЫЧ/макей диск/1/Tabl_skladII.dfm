object Kod_sklad: TKod_sklad
  Left = 212
  Top = 139
  Width = 278
  Height = 218
  Caption = #1057#1082#1083#1072#1076#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Kod_Label: TLabel
    Left = 104
    Top = 24
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Mesto_hran_Label: TLabel
    Left = 40
    Top = 48
    Width = 82
    Height = 13
    Caption = #1052#1077#1089#1090#1086' '#1093#1088#1072#1085#1077#1085#1080#1103
  end
  object Otv_lico_Label: TLabel
    Left = 16
    Top = 72
    Width = 104
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1077' '#1083#1080#1094#1086
  end
  object Tip_Label: TLabel
    Left = 104
    Top = 96
    Width = 19
    Height = 13
    Caption = #1058#1080#1087
  end
  object fgdh: TDBEdit
    Left = 136
    Top = 16
    Width = 81
    Height = 21
    DataField = 'Kod'
    DataSource = Sklad_DataSource
    TabOrder = 0
  end
  object Mesto_hran_sklad: TDBEdit
    Left = 136
    Top = 40
    Width = 89
    Height = 21
    DataField = 'Mesto_hran'
    DataSource = Sklad_DataSource
    TabOrder = 1
  end
  object Otv_lico_Sklad: TDBEdit
    Left = 136
    Top = 64
    Width = 105
    Height = 21
    DataField = 'Otv_lico'
    DataSource = Sklad_DataSource
    TabOrder = 2
  end
  object Tip_sklad: TDBEdit
    Left = 136
    Top = 88
    Width = 105
    Height = 21
    DataField = 'Tip'
    DataSource = Sklad_DataSource
    TabOrder = 3
  end
  object Sklad_DBNavigator: TDBNavigator
    Left = 48
    Top = 136
    Width = 200
    Height = 25
    DataSource = Sklad_DataSource
    TabOrder = 4
  end
  object Sklad_DataSource: TDataSource
    DataSet = Sklad_Table
    Left = 24
    Top = 88
  end
  object Sklad_Table: TTable
    Active = True
    TableName = 'Skladi.DB'
    Left = 16
    Top = 8
  end
end
