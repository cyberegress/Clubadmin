object movefrm: Tmovefrm
  Left = 364
  Top = 599
  ActiveControl = Button1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1089#1072#1076#1080#1090#1100
  ClientHeight = 97
  ClientWidth = 180
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TDsGroup
    Left = 0
    Top = 0
    Width = 180
    Height = 97
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 11
      Top = 15
      Width = 110
      Height = 13
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1082#1086#1084#1087#1100#1102#1090#1077#1088':'
    end
    object compl: TRxLabel
      Left = 124
      Top = 15
      Width = 10
      Height = 13
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel2: TRxLabel
      Left = 11
      Top = 42
      Width = 81
      Height = 13
      Caption = #1055#1077#1088#1077#1089#1072#1076#1080#1090#1100' '#1085#1072':'
    end
    object to: TComboBox
      Left = 107
      Top = 35
      Width = 60
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object Button1: TButton
      Left = 13
      Top = 66
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 96
      Top = 66
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
    end
  end
end
