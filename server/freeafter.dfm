object freecompfrm: Tfreecompfrm
  Left = 308
  Top = 469
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1054#1089#1074#1086#1073#1086#1076#1080#1090#1089#1103' '#1095#1077#1088#1077#1079'...'
  ClientHeight = 92
  ClientWidth = 177
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
    Width = 177
    Height = 92
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 119
      Top = 32
      Width = 25
      Height = 13
      Caption = #1084#1080#1085'.'
    end
    object Button1: TButton
      Left = 12
      Top = 59
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 95
      Top = 59
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object list: TRxSpinEdit
      Left = 12
      Top = 23
      Width = 105
      Height = 21
      ButtonKind = bkStandard
      MaxValue = 600
      MinValue = 1
      Value = 5
      TabOrder = 2
    end
  end
end
