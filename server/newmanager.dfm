object newmanagerfrm: Tnewmanagerfrm
  Left = 687
  Top = 250
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1099#1081' '#1084#1077#1085#1077#1076#1078#1077#1088
  ClientHeight = 97
  ClientWidth = 266
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
    Width = 266
    Height = 97
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 13
      Caption = #1051#1086#1075#1080#1085':'
    end
    object Button1: TButton
      Left = 99
      Top = 64
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 181
      Top = 64
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 16
      Top = 32
      Width = 235
      Height = 21
      TabOrder = 2
    end
  end
end
