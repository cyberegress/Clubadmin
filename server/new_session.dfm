object newsessionfrm: Tnewsessionfrm
  Left = 254
  Top = 409
  ActiveControl = Button1
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1053#1086#1074#1099#1081' '#1089#1077#1072#1085#1089
  ClientHeight = 216
  ClientWidth = 169
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = typeChange
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TDsGroup
    Left = 0
    Top = 0
    Width = 169
    Height = 216
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 8
      Top = 53
      Width = 67
      Height = 13
      Caption = #1042#1088#1077#1084#1103' ('#1084#1080#1085'):'
    end
    object RxLabel2: TRxLabel
      Left = 8
      Top = 10
      Width = 36
      Height = 13
      Caption = #1057#1077#1072#1085#1089':'
    end
    object summl: TRxLabel
      Left = 8
      Top = 136
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
      Top = 160
      Width = 153
      Height = 20
      Caption = '_______________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object type: TComboBox
      Left = 8
      Top = 26
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = typeChange
      Items.Strings = (
        #1048#1085#1090#1077#1088#1085#1077#1090
        #1054#1092#1080#1089
        #1055#1086' '#1090#1088#1072#1092#1080#1082#1091
        #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
        #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088' ('#1080#1085#1090#1077#1088#1085#1077#1090')'
        #1057#1086#1094#1089#1077#1090#1100)
    end
    object PostPay: TCheckBox
      Left = 8
      Top = 96
      Width = 129
      Height = 17
      Cursor = crHandPoint
      Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1085#1072#1088#1072#1073#1086#1090#1082#1077
      TabOrder = 1
      OnClick = typeChange
    end
    object skidka: TCheckBox
      Left = 8
      Top = 112
      Width = 73
      Height = 17
      Cursor = crHandPoint
      Caption = #1057#1082#1080#1076#1082#1072
      TabOrder = 2
      OnClick = skidkaClick
    end
    object Button1: TButton
      Left = 9
      Top = 184
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 89
      Top = 184
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 4
    end
    object time: TRxSpinEdit
      Left = 8
      Top = 70
      Width = 85
      Height = 21
      ButtonKind = bkStandard
      Increment = 5
      MaxValue = 600
      MinValue = 5
      Value = 5
      PopupMenu = PopupMenu1
      TabOrder = 5
      OnChange = typeChange
    end
  end
  object PopupMenu1: TPopupMenu
    MenuAnimation = [maLeftToRight]
    Left = 136
    Top = 112
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
      Tag = 1
      Caption = #1053#1072' 1 '#1075#1088#1085'.'
      OnClick = N12Click
    end
    object N22: TMenuItem
      Tag = 2
      Caption = #1053#1072' 2 '#1075#1088#1085'.'
      OnClick = N12Click
    end
    object N42: TMenuItem
      Tag = 4
      Caption = #1053#1072' 4 '#1075#1088#1085'.'
      OnClick = N12Click
    end
    object N51: TMenuItem
      Tag = 5
      Caption = #1053#1072' 5 '#1075#1088#1085'.'
      OnClick = N12Click
    end
    object N101: TMenuItem
      Tag = 10
      Caption = #1053#1072' 10 '#1075#1088#1085'.'
      OnClick = N12Click
    end
  end
end
