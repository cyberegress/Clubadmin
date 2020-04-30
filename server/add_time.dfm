object addmoneyfrm: Taddmoneyfrm
  Left = 254
  Top = 209
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1088#1077#1084#1103
  ClientHeight = 147
  ClientWidth = 169
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TDsGroup
    Left = 0
    Top = 0
    Width = 169
    Height = 147
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    PopupMenu = PopupMenu1
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 8
      Top = 14
      Width = 67
      Height = 13
      Caption = #1042#1088#1077#1084#1103' ('#1084#1080#1085'):'
    end
    object summl: TRxLabel
      Left = 8
      Top = 64
      Width = 62
      Height = 20
      Caption = #1057#1091#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object summ: TRxLabel
      Left = 9
      Top = 88
      Width = 213
      Height = 20
      Caption = '_____________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object time: TRxSpinEdit
      Left = 8
      Top = 34
      Width = 85
      Height = 21
      ButtonKind = bkStandard
      Increment = 5
      MaxValue = 5000
      MinValue = 5
      Value = 5
      TabOrder = 0
      OnChange = timeClick
    end
    object Button1: TButton
      Left = 9
      Top = 112
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 89
      Top = 112
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
    end
  end
  object PopupMenu1: TPopupMenu
    MenuAnimation = [maLeftToRight]
    Left = 136
    Top = 96
    object N151: TMenuItem
      Tag = 15
      Caption = '15 '#1084#1080#1085#1091#1090
      OnClick = N151Click
    end
    object N301: TMenuItem
      Tag = 30
      Caption = '30 '#1084#1080#1085#1091#1090
      OnClick = N151Click
    end
    object N451: TMenuItem
      Tag = 45
      Caption = '45 '#1084#1080#1085#1091#1090
      OnClick = N151Click
    end
    object N11: TMenuItem
      Tag = 60
      Caption = '1 '#1095#1072#1089
      OnClick = N151Click
    end
    object N152: TMenuItem
      Tag = 90
      Caption = '1,5 '#1095#1072#1089#1072
      OnClick = N151Click
    end
    object N21: TMenuItem
      Tag = 120
      Caption = '2 '#1095#1072#1089#1072
      OnClick = N151Click
    end
    object N31: TMenuItem
      Tag = 180
      Caption = '3 '#1095#1072#1089#1072
      OnClick = N151Click
    end
    object N41: TMenuItem
      Tag = 240
      Caption = '4 '#1095#1072#1089#1072
      OnClick = N151Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Tag = 100
      Caption = #1053#1072' 1 '#1075#1088#1085'.'
      OnClick = N12Click
    end
    object N22: TMenuItem
      Tag = 200
      Caption = #1053#1072' 2 '#1075#1088#1085'.'
      OnClick = N12Click
    end
    object N51: TMenuItem
      Tag = 500
      Caption = #1053#1072' 5 '#1075#1088#1085'.'
      OnClick = N12Click
    end
    object N101: TMenuItem
      Tag = 1000
      Caption = #1053#1072' 10 '#1075#1088#1085'.'
      OnClick = N12Click
    end
  end
end
