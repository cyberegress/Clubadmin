object Form11: TForm11
  Left = 657
  Top = 267
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1082' '#1074#1088#1077#1084#1077#1085#1080
  ClientHeight = 199
  ClientWidth = 289
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
    Width = 289
    Height = 199
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object etime: TDateEdit
      Left = 232
      Top = 0
      Width = 33
      Height = 21
      NumGlyphs = 2
      CalendarStyle = csDialog
      TabOrder = 0
      Visible = False
    end
    object GroupBox2: TDsGroup
      Left = 8
      Top = 16
      Width = 273
      Height = 73
      Caption = #1057#1095#1080#1090#1072#1103' '#1086#1090':'
      Color_High = clBtnHighlight
      Color_Low = clBtnShadow
      TabOrder = 1
      object RxLabel1: TRxLabel
        Left = 234
        Top = 24
        Width = 31
        Height = 13
        Caption = #1095#1072#1089#1086#1074
      end
      object BitBtn1: TBitBtn
        Left = 96
        Top = 41
        Width = 80
        Height = 25
        Cursor = crHandPoint
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1076#1072#1090#1091
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object h1: TRxSpinEdit
        Left = 193
        Top = 16
        Width = 40
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 23
        DragCursor = crHelp
        TabOrder = 1
      end
      object d1: TRxSpinEdit
        Left = 11
        Top = 16
        Width = 50
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 30
        MinValue = 1
        Value = 1
        TabOrder = 2
      end
      object m1: TRxSpinEdit
        Left = 69
        Top = 16
        Width = 50
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 12
        MinValue = 1
        Value = 1
        TabOrder = 3
      end
      object y1: TRxSpinEdit
        Left = 127
        Top = 16
        Width = 50
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 3000
        MinValue = 2002
        Value = 2002
        TabOrder = 4
      end
    end
    object GroupBox3: TDsGroup
      Left = 8
      Top = 88
      Width = 273
      Height = 73
      Caption = #1047#1072#1082#1072#1085#1095#1080#1074#1072#1103':'
      Color_High = clBtnHighlight
      Color_Low = clBtnShadow
      TabOrder = 2
      object RxLabel2: TRxLabel
        Left = 233
        Top = 24
        Width = 31
        Height = 13
        Caption = #1095#1072#1089#1086#1074
      end
      object d2: TRxSpinEdit
        Left = 11
        Top = 16
        Width = 50
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 30
        MinValue = 1
        Value = 1
        TabOrder = 0
      end
      object m2: TRxSpinEdit
        Left = 69
        Top = 16
        Width = 50
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 12
        MinValue = 1
        Value = 1
        TabOrder = 1
      end
      object y2: TRxSpinEdit
        Left = 127
        Top = 16
        Width = 50
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 3000
        MinValue = 2002
        Value = 2002
        TabOrder = 2
      end
      object h2: TRxSpinEdit
        Left = 193
        Top = 16
        Width = 40
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 23
        DragCursor = crHelp
        TabOrder = 3
      end
      object BitBtn2: TBitBtn
        Left = 96
        Top = 41
        Width = 80
        Height = 25
        Cursor = crHandPoint
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1076#1072#1090#1091
        TabOrder = 4
        OnClick = BitBtn2Click
      end
    end
    object BitBtn3: TBitBtn
      Left = 128
      Top = 167
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 3
    end
    object BitBtn4: TBitBtn
      Left = 210
      Top = 167
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 4
    end
  end
end
