object Form1: TForm1
  Left = 366
  Top = 235
  BorderStyle = bsSingle
  Caption = #1058#1088#1072#1085#1089#1083#1080#1090
  ClientHeight = 188
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 8
    Width = 85
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090':'
  end
  object Label2: TLabel
    Left = 328
    Top = 8
    Width = 125
    Height = 13
    Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1085#1099#1081' '#1090#1077#1082#1089#1090
  end
  object Label3: TLabel
    Left = 248
    Top = 24
    Width = 18
    Height = 13
    Caption = '==>'
  end
  object Label4: TLabel
    Left = 248
    Top = 56
    Width = 18
    Height = 13
    Caption = '==>'
  end
  object Label5: TLabel
    Left = 248
    Top = 40
    Width = 18
    Height = 13
    Caption = '==>'
  end
  object Label6: TLabel
    Left = 248
    Top = 104
    Width = 18
    Height = 13
    Caption = '==>'
  end
  object Label7: TLabel
    Left = 248
    Top = 88
    Width = 18
    Height = 13
    Caption = '==>'
  end
  object Label8: TLabel
    Left = 248
    Top = 72
    Width = 18
    Height = 13
    Caption = '==>'
  end
  object Label9: TLabel
    Left = 248
    Top = 120
    Width = 18
    Height = 13
    Caption = '==>'
  end
  object Label10: TLabel
    Left = 248
    Top = 136
    Width = 18
    Height = 13
    Caption = '==>'
  end
  object Memo1: TMemo
    Left = 8
    Top = 24
    Width = 233
    Height = 129
    Lines.Strings = (
      #1055#1088#1080#1084#1077#1088' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' '
      #1088#1091#1089#1089#1082#1086#1075#1086' '#1090#1077#1082#1089#1090#1072' '#1074' '
      #1072#1085#1075#1083#1080#1081#1089#1082#1080#1081' '#1079#1072#1084#1077#1085#1086#1081' '
      #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1093' '#1073#1091#1082#1074'.')
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 272
    Top = 24
    Width = 233
    Height = 129
    TabOrder = 1
  end
  object Button1: TButton
    Left = 216
    Top = 160
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080
    TabOrder = 2
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 160
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N2Click
      end
      object N6: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N6Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N4: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N5Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    Left = 328
    Top = 160
  end
end
