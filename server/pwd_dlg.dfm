object Form7: TForm7
  Left = 301
  Top = 640
  ActiveControl = BitBtn1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1047#1072#1076#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
  ClientHeight = 105
  ClientWidth = 238
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
  object GroupBox1: TDsGroup
    Left = 0
    Top = 0
    Width = 238
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 12
      Top = 25
      Width = 43
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100':'
    end
    object RxLabel2: TRxLabel
      Left = 12
      Top = 49
      Width = 98
      Height = 13
      Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1077' '#1087#1072#1088#1086#1083#1100':'
    end
    object pwd: TEdit
      Left = 114
      Top = 18
      Width = 110
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
      OnChange = pwdChange
    end
    object confirm: TEdit
      Left = 114
      Top = 42
      Width = 110
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnChange = pwdChange
    end
    object BitBtn1: TButton
      Left = 42
      Top = 74
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      Default = True
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TButton
      Left = 124
      Top = 74
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
end
