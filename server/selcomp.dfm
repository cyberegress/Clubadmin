object selCompFrm: TselCompFrm
  Left = 307
  Top = 593
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#8470' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
  ClientHeight = 93
  ClientWidth = 177
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DsGroup1: TDsGroup
    Left = 0
    Top = 0
    Width = 177
    Height = 93
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 11
      Top = 14
      Width = 39
      Height = 13
      Caption = #1053#1086#1084#1077#1088':'
    end
    object Button1: TButton
      Left = 12
      Top = 61
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 95
      Top = 61
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object n: TRxSpinEdit
      Left = 12
      Top = 31
      Width = 70
      Height = 21
      ButtonKind = bkStandard
      MaxValue = 150
      MinValue = 1
      Value = 1
      TabOrder = 2
    end
  end
end
