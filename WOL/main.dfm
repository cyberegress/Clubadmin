object Form1: TForm1
  Left = 471
  Top = 326
  Width = 202
  Height = 118
  Caption = 'Wake-on-LAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 13
    Height = 13
    Caption = 'IP:'
  end
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 24
    Height = 13
    Caption = 'Mac:'
  end
  object ip: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '192.168.1.2'
  end
  object mac: TEdit
    Left = 64
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '00-11-D8-A2-4B-7C'
  end
  object IdUDPClient1: TIdUDPClient
    Active = True
    BroadcastEnabled = True
    Host = '192.168.0.1'
    Port = 80
    Left = 8
    Top = 16
  end
end
