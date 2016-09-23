object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 477
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 590
    Top = 8
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 5
    Top = 8
    Width = 105
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1086#1087#1088#1086#1089
    TabOrder = 1
    OnClick = Button3Click
  end
  object ListView1: TListView
    Left = 5
    Top = 39
    Width = 706
    Height = 421
    Columns = <
      item
        Caption = #1042#1086#1087#1088#1086#1089
        Width = 200
      end
      item
        Caption = #1054#1090#1074#1077#1090' '#8470'1'
        Width = 70
      end
      item
        Caption = #1054#1090#1074#1077#1090' '#8470'2'
        Width = 70
      end
      item
        Caption = #1054#1090#1074#1077#1090' '#8470'3'
        Width = 70
      end
      item
        Caption = #1054#1090#1074#1077#1090' '#8470'4'
        Width = 70
      end
      item
        Caption = #1054#1090#1074#1077#1090' '#8470'5'
        Width = 70
      end
      item
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1075#1086' '#1086#1090#1074#1077#1090#1072
        Width = 150
      end>
    GridLines = True
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
  end
end
