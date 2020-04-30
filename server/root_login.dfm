object Form9: TForm9
  Left = 302
  Top = 293
  ActiveControl = BitBtn1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1080#1089#1090#1077#1084#1099
  ClientHeight = 105
  ClientWidth = 183
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
    Width = 183
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 13
      Top = 24
      Width = 36
      Height = 13
      Caption = #1051#1086#1075#1080#1085':'
    end
    object RxLabel2: TRxLabel
      Left = 13
      Top = 48
      Width = 43
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100':'
    end
    object Edit1: TEdit
      Left = 58
      Top = 18
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'root'
    end
    object Edit2: TEdit
      Left = 58
      Top = 42
      Width = 110
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object BitBtn1: TButton
      Left = 15
      Top = 74
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 2
    end
    object BitBtn2: TButton
      Left = 98
      Top = 74
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 3
    end
  end
end
