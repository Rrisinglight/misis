object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 552
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 32
    Width = 89
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 63
    Width = 273
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button2: TButton
    Left = 24
    Top = 200
    Width = 145
    Height = 25
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 368
    Width = 625
    Height = 169
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Button3: TButton
    Left = 168
    Top = 264
    Width = 169
    Height = 25
    Caption = #1056#1072#1089#1096#1080#1092#1088#1088#1086#1074#1072#1090#1100' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 336
    Width = 633
    Height = 17
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 672
    Top = 520
  end
  object SaveDialog1: TSaveDialog
    Left = 640
    Top = 528
  end
end
