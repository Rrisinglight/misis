object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1050#1086#1085#1074#1077#1081#1077#1088#1085#1099#1077' '#1083#1080#1085#1080#1080
  ClientHeight = 612
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 746
    Top = 542
    Width = 149
    Height = 73
    Caption = '10:00'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 552
    Width = 147
    Height = 13
    Caption = #1057#1076#1077#1083#1072#1085#1086' '#1080#1079#1076#1077#1083#1080#1081' 1-'#1075#1086' '#1090#1080#1087#1072': '
  end
  object Label3: TLabel
    Left = 8
    Top = 571
    Width = 147
    Height = 13
    Caption = #1057#1076#1077#1083#1072#1085#1086' '#1080#1079#1076#1077#1083#1080#1081' 2-'#1075#1086' '#1090#1080#1087#1072': '
  end
  object Label4: TLabel
    Left = 8
    Top = 590
    Width = 147
    Height = 13
    Caption = #1057#1076#1077#1083#1072#1085#1086' '#1080#1079#1076#1077#1083#1080#1081' 3-'#1075#1086' '#1090#1080#1087#1072': '
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 889
    Height = 521
    BevelOuter = bvNone
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 536
    Top = 655
    Width = 57
    Height = 42
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object Button1: TButton
    Left = 553
    Top = 579
    Width = 88
    Height = 25
    Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 654
    Top = 579
    Width = 75
    Height = 25
    Caption = #1057#1090#1072#1088#1090
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 654
    Top = 548
    Width = 75
    Height = 25
    Caption = #1057#1085#1072#1095#1072#1083#1072
    TabOrder = 4
    OnClick = Button3Click
  end
  object InfoTimer: TTimer
    Interval = 200
    OnTimer = InfoTimerTimer
    Left = 744
    Top = 496
  end
  object TickTimer: TTimer
    Enabled = False
    OnTimer = TickTimerTimer
    Left = 776
    Top = 496
  end
end
