object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 503
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  DesignSize = (
    1012
    503)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 208
    Width = 97
    Height = 13
    Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1074#1088#1077#1084#1077#1085#1080':'
  end
  object Button1: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1090#1077#1089#1090
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 399
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100
    Enabled = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object StaticText1: TStaticText
    AlignWithMargins = True
    Left = 41
    Top = 227
    Width = 42
    Height = 17
    Alignment = taCenter
    Anchors = [akTop]
    BorderStyle = sbsSingle
    Caption = '0:00:00'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 837
    Top = 441
    Width = 75
    Height = 25
    Caption = #1053#1072#1079#1072#1076
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 929
    Top = 441
    Width = 75
    Height = 25
    Caption = #1042#1087#1077#1088#1077#1076
    TabOrder = 4
    OnClick = Button4Click
  end
  object PageControl1: TPageControl
    Left = 111
    Top = 56
    Width = 893
    Height = 379
    TabOrder = 5
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 47
    Top = 110
  end
end
