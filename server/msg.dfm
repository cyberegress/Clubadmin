object msgfrm: Tmsgfrm
  Left = 521
  Top = 411
  ActiveControl = text
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
  ClientHeight = 96
  ClientWidth = 369
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
    Width = 369
    Height = 96
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 16
      Top = 16
      Width = 95
      Height = 14
      Caption = #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103':'
    end
    object text: TEdit
      Left = 16
      Top = 32
      Width = 337
      Height = 21
      MaxLength = 78
      TabOrder = 0
    end
    object Button1: TButton
      Left = 201
      Top = 64
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 283
      Top = 64
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
    end
  end
end
