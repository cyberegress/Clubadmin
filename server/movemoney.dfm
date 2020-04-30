inherited movemoneyfrm: Tmovemoneyfrm
  Top = 431
  Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1076#1077#1085#1100#1075#1080
  ClientHeight = 131
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TDsGroup
    Height = 131
    inherited RxLabel1: TRxLabel
      Top = 16
    end
    inherited compl: TRxLabel
      Top = 16
    end
    inherited RxLabel2: TRxLabel
      Top = 45
      Width = 86
      Caption = #1055#1077#1088#1077#1095#1080#1089#1083#1080#1090#1100' '#1085#1072':'
    end
    object RxLabel3: TRxLabel [3]
      Left = 11
      Top = 69
      Width = 39
      Height = 13
      Caption = #1057#1091#1084#1084#1072':'
    end
    inherited to: TComboBox
      Left = 110
      Top = 40
      Width = 57
    end
    inherited Button1: TButton
      Top = 96
    end
    inherited Button2: TButton
      Top = 96
    end
    object money: TRxSpinEdit
      Left = 110
      Top = 64
      Width = 57
      Height = 21
      ButtonKind = bkStandard
      Increment = 5
      Value = 5
      TabOrder = 3
    end
  end
end
