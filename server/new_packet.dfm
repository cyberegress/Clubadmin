object newpacketfrm: Tnewpacketfrm
  Left = 203
  Top = 107
  ActiveControl = btnOK
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1053#1086#1074#1099#1081' '#1087#1072#1082#1077#1090
  ClientHeight = 129
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TDsGroup
    Left = 0
    Top = 0
    Width = 270
    Height = 129
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 8
      Top = 16
      Width = 102
      Height = 13
      Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1072#1082#1077#1090#1099':'
    end
    object summl: TRxLabel
      Left = 8
      Top = 72
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
    object grnl: TRxLabel
      Left = 96
      Top = 72
      Width = 36
      Height = 20
      Caption = #1075#1088#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object kopl: TRxLabel
      Left = 162
      Top = 72
      Width = 37
      Height = 20
      Caption = #1082#1086#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object kop: TRxLabel
      Left = 136
      Top = 72
      Width = 23
      Height = 20
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grn: TRxLabel
      Left = 72
      Top = 72
      Width = 23
      Height = 20
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object list: TComboBox
      Left = 8
      Top = 32
      Width = 257
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = listChange
      OnClick = listChange
    end
    object skidka: TCheckBox
      Left = 8
      Top = 56
      Width = 129
      Height = 17
      Cursor = crHandPoint
      Caption = #1057#1082#1080#1076#1082#1072
      TabOrder = 1
      OnClick = skidkaClick
    end
    object btnOK: TButton
      Left = 8
      Top = 96
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = btnOKClick
    end
    object BitBtn2: TButton
      Left = 91
      Top = 96
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 3
    end
    object timer: TRxClock
      Left = 176
      Top = 96
      Width = 89
      Height = 25
      BorderStyle = bsSingle
    end
  end
  object packets: TZMySqlTable
    Database = mainfrm.db
    Transaction = mainfrm.ta
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId, doRefreshAfterPost]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    TableName = 'packets'
    Left = 216
    Top = 64
  end
end
