object In_Dohodi: TIn_Dohodi
  Left = 312
  Top = 628
  Width = 462
  Height = 243
  Caption = #1044#1086#1093#1086#1076#1099' - '#1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label_Dohod_Data: TLabel
    Left = 32
    Top = 16
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label_Dohod_KontrAgent: TLabel
    Left = 32
    Top = 40
    Width = 66
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
  end
  object Label_Dohod_Name: TLabel
    Left = 32
    Top = 64
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label_Dohod_Ed: TLabel
    Left = 32
    Top = 88
    Width = 104
    Height = 13
    Caption = #1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
  end
  object Label_Dohod_Cena: TLabel
    Left = 32
    Top = 112
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object Label_Dohod_Kolichestvo: TLabel
    Left = 32
    Top = 136
    Width = 59
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object Dohod_KontrAgent: TDBEdit
    Left = 136
    Top = 40
    Width = 121
    Height = 21
    DataField = 'KontrAgents'
    DataSource = Tabl_Dohodi.Dohodi_DataSource
    TabOrder = 0
  end
  object Dohod_Name: TDBEdit
    Left = 136
    Top = 64
    Width = 121
    Height = 21
    DataField = 'Name'
    DataSource = Tabl_Dohodi.Dohodi_DataSource
    TabOrder = 1
  end
  object Dohod_Ed: TDBEdit
    Left = 136
    Top = 88
    Width = 121
    Height = 21
    DataField = 'Ed'
    DataSource = Tabl_Dohodi.Dohodi_DataSource
    TabOrder = 2
  end
  object Dohod_Cena: TDBEdit
    Left = 136
    Top = 112
    Width = 121
    Height = 21
    DataField = 'Cena'
    DataSource = Tabl_Dohodi.Dohodi_DataSource
    TabOrder = 3
  end
  object Dohod_Kolichestvo: TDBEdit
    Left = 136
    Top = 136
    Width = 121
    Height = 21
    DataField = 'Kolichestvo'
    DataSource = Tabl_Dohodi.Dohodi_DataSource
    TabOrder = 4
  end
  object Button_Add_Dohod: TButton
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 5
    OnClick = Button_Add_DohodClick
  end
  object Dohod_Num: TDBEdit
    Left = 280
    Top = 24
    Width = 121
    Height = 21
    DataField = 'Num'
    DataSource = Tabl_Dohodi.Dohodi_DataSource
    TabOrder = 6
  end
  object Dohod_Data: TDateTimePicker
    Left = 136
    Top = 16
    Width = 122
    Height = 21
    Date = 39432.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 39432.000000000000000000
    TabOrder = 7
  end
end
