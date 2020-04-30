object Form13: TForm13
  Left = 286
  Top = 189
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1050#1072#1089#1089#1072
  ClientHeight = 86
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TDsGroup
    Left = 0
    Top = 0
    Width = 225
    Height = 86
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 16
      Top = 24
      Width = 39
      Height = 14
      Caption = #1057#1091#1084#1084#1072':'
    end
    object RxLabel2: TRxLabel
      Left = 112
      Top = 24
      Width = 22
      Height = 13
      Caption = #1075#1088#1085'.'
    end
    object RxLabel3: TRxLabel
      Left = 193
      Top = 24
      Width = 23
      Height = 13
      Caption = #1082#1086#1087'.'
    end
    object grn: TRxSpinEdit
      Left = 56
      Top = 16
      Width = 57
      Height = 21
      ButtonKind = bkStandard
      TabOrder = 0
    end
    object kop: TRxSpinEdit
      Left = 136
      Top = 16
      Width = 57
      Height = 21
      ButtonKind = bkStandard
      Increment = 5
      MaxValue = 99
      TabOrder = 1
    end
    object Action: TBitBtn
      Left = 18
      Top = 54
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      ModalResult = 1
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 119
      Top = 54
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 3
    end
  end
end
