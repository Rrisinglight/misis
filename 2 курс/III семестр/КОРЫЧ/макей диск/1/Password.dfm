object PasswordForm: TPasswordForm
  Left = 79
  Top = 58
  Width = 275
  Height = 193
  Caption = #1055#1072#1088#1086#1083#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 8
    Width = 81
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  end
  object Label2: TLabel
    Left = 64
    Top = 48
    Width = 116
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100
  end
  object Info: TLabel
    Left = 48
    Top = 104
    Width = 3
    Height = 13
  end
  object Edit_Pass: TEdit
    Left = 64
    Top = 24
    Width = 97
    Height = 21
    TabOrder = 0
  end
  object EditNewPas: TEdit
    Left = 64
    Top = 64
    Width = 97
    Height = 21
    TabOrder = 1
  end
  object ButtonChange: TButton
    Left = 128
    Top = 104
    Width = 97
    Height = 25
    Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 2
    OnClick = ButtonChangeClick
  end
  object ButtonNewPas: TButton
    Left = 168
    Top = 72
    Width = 73
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 3
    OnClick = ButtonNewPasClick
  end
  object ButtonOK: TButton
    Left = 176
    Top = 8
    Width = 49
    Height = 41
    Caption = 'OK'
    TabOrder = 4
    OnClick = ButtonOKClick
  end
end
