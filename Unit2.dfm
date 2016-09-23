object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 88
  ClientWidth = 124
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 37
    Height = 13
    Alignment = taCenter
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Edit1: TEdit
    Left = 16
    Top = 31
    Width = 97
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 32
    Top = 58
    Width = 65
    Height = 25
    Caption = #1042#1093#1086#1076
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
end
