object In_postup: TIn_postup
  Left = 445
  Top = 244
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076'-'#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077
  ClientHeight = 191
  ClientWidth = 228
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
  object Label_data: TLabel
    Left = 56
    Top = 24
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label_naimen: TLabel
    Left = 8
    Top = 48
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label_sklad: TLabel
    Left = 48
    Top = 72
    Width = 31
    Height = 13
    Caption = #1057#1082#1083#1072#1076
  end
  object Label_cena: TLabel
    Left = 56
    Top = 96
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object Label_kolvo: TLabel
    Left = 24
    Top = 120
    Width = 59
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object Postup_naimen: TDBEdit
    Left = 88
    Top = 40
    Width = 97
    Height = 21
    DataField = 'Naimenovanie'
    DataSource = Tabl_postup.Postup_DataSource
    TabOrder = 0
  end
  object Postup_kolvo: TDBEdit
    Left = 88
    Top = 112
    Width = 97
    Height = 21
    DataField = 'Kolvo'
    DataSource = Tabl_postup.Postup_DataSource
    TabOrder = 1
  end
  object Postup_cena: TDBEdit
    Left = 88
    Top = 88
    Width = 97
    Height = 21
    DataField = 'Cena'
    DataSource = Tabl_postup.Postup_DataSource
    TabOrder = 2
  end
  object Postup_data: TDateTimePicker
    Left = 88
    Top = 16
    Width = 97
    Height = 21
    Date = 39440.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 39440.000000000000000000
    TabOrder = 3
  end
  object Button_add_postup: TButton
    Left = 80
    Top = 152
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = Button_add_postupClick
  end
  object Postup_sklad: TDBComboBox
    Left = 88
    Top = 64
    Width = 97
    Height = 21
    DataField = 'Sklad'
    DataSource = Tabl_postup.Postup_DataSource
    ItemHeight = 13
    TabOrder = 5
  end
end
