object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1081' '#1046#1077#1083#1077#1079#1086'-'#1059#1075#1083#1077#1088#1086#1076
  ClientHeight = 464
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    845
    464)
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 8
    Top = 8
    Width = 829
    Height = 398
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    OnMouseMove = PaintBox1MouseMove
    OnPaint = PaintBox1Paint
    ExplicitWidth = 435
    ExplicitHeight = 265
  end
  object Label1: TLabel
    Left = 8
    Top = 412
    Width = 117
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 279
  end
  object Label2: TLabel
    Left = 8
    Top = 437
    Width = 211
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1094#1080#1103' '#1091#1075#1083#1077#1088#1086#1076#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 304
  end
  object CheckBox1: TCheckBox
    Left = 724
    Top = 439
    Width = 113
    Height = 17
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1089#1077#1090#1082#1091
    Checked = True
    ParentBiDiMode = False
    State = cbChecked
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object XPManifest1: TXPManifest
    Left = 800
    Top = 368
  end
end
