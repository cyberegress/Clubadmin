object Form6: TForm6
  Left = 345
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 486
  ClientWidth = 628
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
  object Button1: TButton
    Left = 465
    Top = 456
    Width = 70
    Height = 25
    Cursor = crHandPoint
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 547
    Top = 456
    Width = 70
    Height = 25
    Cursor = crHandPoint
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    OnClick = Button2Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 628
    Height = 449
    Cursor = crHandPoint
    ActivePage = TabSheet4
    Align = alTop
    HotTrack = True
    Images = ImageList1
    MultiLine = True
    TabIndex = 7
    TabOrder = 2
    object TabSheet6: TTabSheet
      Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088#1099
      ImageIndex = 1
      object DBGrid3: TExDBGrid
        Left = 4
        Top = 3
        Width = 609
        Height = 358
        BorderStyle = bsNone
        DataSource = ds3
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        GridAutoWidth = False
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clNavy
        ImageHighlightColor = clWindow
        HighlightFontColor = clWhite
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Title.Caption = #8470
            Width = 25
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'addr'
            Title.Alignment = taCenter
            Title.Caption = 'IP-'#1072#1076#1088#1077#1089
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'mac'
            Title.Alignment = taCenter
            Title.Caption = 'MAC'
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cl_discount'
            Title.Alignment = taCenter
            Title.Caption = #1050#1083#1080#1077#1085#1090'-'#1089#1082#1080#1076#1082#1072
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'time_discount'
            Title.Alignment = taCenter
            Title.Caption = #1042#1088#1077#1084'. '#1089#1082#1080#1076#1082#1072
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h0'
            Title.Caption = '0-1'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h1'
            Title.Caption = '1-2'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h2'
            Title.Caption = '2-3'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h3'
            Title.Caption = '3-4'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h4'
            Title.Caption = '4-5'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h5'
            Title.Caption = '5-6'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h6'
            Title.Caption = '6-7'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h7'
            Title.Caption = '7-8'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h8'
            Title.Caption = '8-9'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h9'
            Title.Caption = '9-10'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h10'
            Title.Caption = '10-11'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h11'
            Title.Caption = '11-12'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h12'
            Title.Caption = '12-13'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h13'
            Title.Caption = '13-14'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h14'
            Title.Caption = '14-15'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h15'
            Title.Caption = '15-16'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h16'
            Title.Caption = '16-17'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h17'
            Title.Caption = '17-18'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h18'
            Title.Caption = '18-19'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h19'
            Title.Caption = '19-20'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h20'
            Title.Caption = '20-21'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h21'
            Title.Caption = '21-22'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h22'
            Title.Caption = '22-23'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'h23'
            Title.Caption = '23-24'
            Width = 30
            Visible = True
          end>
      end
      object SevePriceBtn: TBitBtn
        Left = 474
        Top = 369
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        Default = True
        TabOrder = 1
        OnClick = SevePriceBtnClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00007A3D3D00994D4D0099464600B3B3B300B3B3B300B3B3B300B3B3B300B3B3
          B300B3B3B3009933330099333300994D4D00994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00AF9C9C00C2757500DAB4B400FBFBFB00F0F0
          F000E4E4E4009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00CFB6B600B7515100BF8C8C00D9D9D900FBFB
          FB00F0F0F0009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00E1C7C700A8424200A9767600B3B3B300D9D9
          D900FBFBFB009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00DCC8C800CA979700CAB1B100A9A9A900B3B3
          B300D6CFCF00993333009C363600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600CC666600CC666600CC666600CC666600CC666600CC66
          6600CC666600CC666600CC666600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600BF8C8C00BF8C8C00BF8C8C00BF8C8C00BF8C8C00BF8C
          8C00BF8C8C00BF8C8C00CC666600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00C1C1C100C3C3C300C3C3C300C5C5C500C5C5
          C500C7C7C700FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00BFBFBF00C0C0C000C2C2C200C3C3C300C4C4
          C400C5C5C500FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500994D4D00BF8C8C00C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4
          C400C4C4C400C4C4C400BF8C8C00994D4D0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1062#1077#1085#1099
      ImageIndex = 12
      object RxLabel1: TRxLabel
        Left = 3
        Top = 15
        Width = 162
        Height = 13
        Caption = #1053#1072#1094#1077#1085#1082#1072' '#1085#1072' '#1080#1085#1090#1077#1088#1085#1077#1090' ('#1082#1086#1087'/'#1095#1072#1089'):'
      end
      object RxLabel2: TRxLabel
        Left = 3
        Top = 61
        Width = 222
        Height = 13
        Caption = #1053#1072#1094#1077#1085#1082#1072' '#1085#1072' '#1080#1085#1090#1077#1088#1085#1077#1090' '#1087#1086' '#1090#1088#1072#1092#1080#1082#1091' ('#1082#1086#1087'/'#1095#1072#1089'):'
      end
      object RxLabel4: TRxLabel
        Left = 3
        Top = 38
        Width = 124
        Height = 13
        Caption = #1062#1077#1085#1072' '#1079#1072' '#1084#1077#1075#1072#1073#1072#1081#1090' ('#1082#1086#1087'):'
      end
      object RxLabel46: TRxLabel
        Left = 3
        Top = 138
        Width = 146
        Height = 13
        Caption = #1042#1088#1077#1084#1077#1085#1085'&'#1099#1077' '#1089#1082#1080#1076#1082#1080' '#1085#1072' '#1080#1075#1088#1099':'
      end
      object RxLabel3: TRxLabel
        Left = 3
        Top = 107
        Width = 203
        Height = 13
        Caption = #1053#1072#1094#1077#1085#1082#1072' '#1085#1072' '#1091#1089#1083#1091#1075#1091' "'#1057#1086#1094#1089#1077#1090#1100'" ('#1082#1086#1087'/'#1095#1072#1089'):'
      end
      object RxLabel5: TRxLabel
        Left = 317
        Top = 84
        Width = 259
        Height = 13
        Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1087#1072#1091#1079#1072' '#1089#1077#1072#1085#1089#1072' ('#1074#1088#1077#1084#1103' '#1089#1082#1080#1076#1099#1074#1072#1085#1080#1103'):'
      end
      object RxLabel6: TRxLabel
        Left = 317
        Top = 107
        Width = 125
        Height = 13
        Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072' '#1089#1086#1094#1089#1077#1090#1080':'
      end
      object RxLabel7: TRxLabel
        Left = 3
        Top = 84
        Width = 129
        Height = 13
        Caption = #1051#1080#1084#1080#1090' '#1090#1088#1072#1092#1080#1082#1072' ('#1084#1073'/'#1095#1072#1089'):'
      end
      object extra_inet: TRxSpinEdit
        Left = 231
        Top = 10
        Width = 65
        Height = 21
        ButtonKind = bkStandard
        Increment = 5
        MaxValue = 1000
        MinValue = -1000
        TabOrder = 0
      end
      object extra_traffic: TRxSpinEdit
        Left = 231
        Top = 56
        Width = 65
        Height = 21
        ButtonKind = bkStandard
        Increment = 5
        MaxValue = 1000
        MinValue = -1000
        TabOrder = 1
      end
      object extra_limited: TRxSpinEdit
        Left = 231
        Top = 102
        Width = 65
        Height = 21
        ButtonKind = bkStandard
        Increment = 5
        TabOrder = 2
      end
      object extra_mb: TRxSpinEdit
        Left = 231
        Top = 33
        Width = 65
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 1000
        TabOrder = 3
      end
      object DBGrid7: TExDBGrid
        Left = 4
        Top = 161
        Width = 609
        Height = 195
        BorderStyle = bsNone
        DataSource = skidki_s
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clNavy
        ImageHighlightColor = clWindow
        HighlightFontColor = clWhite
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Expanded = False
            FieldName = 'start'
            PickList.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18'
              '19'
              '20'
              '21'
              '22'
              '23')
            Title.Caption = #1053#1072#1095#1080#1085#1072#1103' '#1086#1090':'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'stop'
            PickList.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18'
              '19'
              '20'
              '21'
              '22'
              '23')
            Title.Caption = #1054#1082#1072#1085#1095#1080#1074#1072#1103':'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dow'
            PickList.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '')
            Title.Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080':'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dow_e'
            PickList.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7')
            Title.Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080' '#1076#1086':'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'skidka'
            Title.Caption = #1057#1082#1080#1076#1082#1072' (%):'
            Visible = True
          end>
      end
      object viewcassa: TCheckBox
        Left = 317
        Top = 15
        Width = 249
        Height = 17
        Cursor = crHandPoint
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1082#1072#1089#1089#1099' '#1084#1077#1085#1077#1076#1078#1077#1088#1072#1084#1080
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object allow5min: TCheckBox
        Left = 317
        Top = 38
        Width = 265
        Height = 17
        Cursor = crHandPoint
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' "'#1073#1086#1085#1091#1089#1085#1099#1077' 5 '#1084#1080#1085#1091#1090'"'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object allowautoreuse: TCheckBox
        Left = 317
        Top = 61
        Width = 185
        Height = 17
        Cursor = crHandPoint
        Caption = #1040#1074#1090#1086#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1077#1072#1085#1089#1086#1074
        TabOrder = 7
      end
      object maxpause: TRxSpinEdit
        Left = 577
        Top = 78
        Width = 38
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 60
        MinValue = 5
        Value = 5
        TabOrder = 8
      end
      object lim: TEdit
        Left = 448
        Top = 103
        Width = 167
        Height = 21
        MaxLength = 28
        TabOrder = 9
        Text = 'http://vkontakte.ru'
      end
      object SEDBNavigator1: TSEDBNavigator
        Left = 4
        Top = 365
        Width = 81
        Height = 25
        Cursor = crHandPoint
        DataSource = skidki_s
        VisibleButtons = [nbInsert, nbDelete, nbPost]
        Flat = True
        Hints.Strings = (
          #1042' '#1085#1072#1095#1072#1083#1086
          #1053#1072#1079#1072#1076
          #1044#1072#1083#1077#1077
          #1042' '#1082#1086#1085#1077#1094
          #1044#1086#1073#1072#1074#1080#1090#1100
          #1059#1076#1072#1083#1080#1090#1100
          'Edit record'
          #1057#1086#1093#1088#1072#1085#1080#1090#1100
          ' '
          #1054#1073#1085#1086#1074#1080#1090#1100)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
      end
      object limit_mb: TRxSpinEdit
        Left = 231
        Top = 79
        Width = 65
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 1000
        TabOrder = 11
      end
    end
    object TabSheet12: TTabSheet
      Caption = #1044#1086#1087'. '#1091#1089#1083#1091#1075#1080
      ImageIndex = 10
      object ExDBGrid2: TExDBGrid
        Left = 4
        Top = 3
        Width = 609
        Height = 329
        BorderStyle = bsNone
        DataSource = services_src
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clNavy
        ImageHighlightColor = clWindow
        HighlightFontColor = clWhite
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Expanded = False
            FieldName = 'title'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
            Width = 478
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cost'
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' ('#1082#1086#1087'.)'
            Width = 90
            Visible = True
          end>
      end
      object SEDBNavigator2: TSEDBNavigator
        Left = 533
        Top = 344
        Width = 81
        Height = 25
        Cursor = crHandPoint
        DataSource = services_src
        VisibleButtons = [nbInsert, nbDelete, nbPost]
        Flat = True
        Hints.Strings = (
          #1042' '#1085#1072#1095#1072#1083#1086
          #1053#1072#1079#1072#1076
          #1044#1072#1083#1077#1077
          #1042' '#1082#1086#1085#1077#1094
          #1044#1086#1073#1072#1074#1080#1090#1100
          #1059#1076#1072#1083#1080#1090#1100
          'Edit record'
          #1057#1086#1093#1088#1072#1085#1080#1090#1100
          ' '
          #1054#1073#1085#1086#1074#1080#1090#1100)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object TabSheet7: TTabSheet
      Caption = #1055#1072#1082#1077#1090#1099
      ImageIndex = 9
      object RxLabel24: TRxLabel
        Left = 415
        Top = 48
        Width = 63
        Height = 13
        Caption = #1058#1080#1087' '#1089#1077#1072#1085#1089#1072':'
      end
      object RxLabel26: TRxLabel
        Left = 415
        Top = 132
        Width = 96
        Height = 26
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1085#1072#1095#1072#1083#1086#13#10#1089#1077#1072#1085#1089#1072
      end
      object RxLabel27: TRxLabel
        Left = 526
        Top = 168
        Width = 17
        Height = 13
        Caption = #1087#1086':'
      end
      object RxLabel28: TRxLabel
        Left = 595
        Top = 144
        Width = 10
        Height = 13
        Caption = #1095'.'
      end
      object RxLabel29: TRxLabel
        Left = 595
        Top = 168
        Width = 10
        Height = 13
        Caption = #1095'.'
      end
      object RxLabel30: TRxLabel
        Left = 415
        Top = 88
        Width = 109
        Height = 13
        Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100':'
      end
      object RxLabel31: TRxLabel
        Left = 595
        Top = 112
        Width = 10
        Height = 13
        Caption = #1095'.'
      end
      object RxLabel32: TRxLabel
        Left = 526
        Top = 144
        Width = 11
        Height = 13
        Caption = #1089':'
      end
      object RxLabel33: TRxLabel
        Left = 415
        Top = 8
        Width = 55
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      end
      object RxLabel34: TRxLabel
        Left = 415
        Top = 200
        Width = 60
        Height = 13
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
      end
      object RxLabel35: TRxLabel
        Left = 518
        Top = 200
        Width = 22
        Height = 13
        Caption = #1075#1088#1085'.'
      end
      object RxLabel36: TRxLabel
        Left = 583
        Top = 200
        Width = 23
        Height = 13
        Caption = #1082#1086#1087'.'
      end
      object DBGrid4: TExDBGrid
        Left = 4
        Top = 3
        Width = 382
        Height = 382
        Cursor = crHandPoint
        BorderStyle = bsNone
        DataSource = ds4
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clInfoBk
        ImageHighlightColor = clWindow
        HighlightFontColor = clNavy
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Expanded = False
            FieldName = 'title'
            ReadOnly = True
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 177
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'hours'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
            Width = 113
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'allowed_time_min'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1057':'
            Width = 30
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'allowed_time_max'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1055#1086':'
            Width = 30
            Visible = True
          end>
      end
      object s_min: TDBComboBox
        Left = 544
        Top = 136
        Width = 49
        Height = 21
        Style = csDropDownList
        DataField = 'allowed_time_min'
        DataSource = ds4
        ItemHeight = 13
        Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23')
        TabOrder = 1
      end
      object s_max: TDBComboBox
        Left = 544
        Top = 160
        Width = 49
        Height = 21
        Style = csDropDownList
        DataField = 'allowed_time_max'
        DataSource = ds4
        ItemHeight = 13
        Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23')
        TabOrder = 2
      end
      object s_hour: TDBComboBox
        Left = 416
        Top = 104
        Width = 177
        Height = 21
        Style = csDropDownList
        DataField = 'hours'
        DataSource = ds4
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24')
        TabOrder = 3
      end
      object s_type: TRxDBComboBox
        Left = 416
        Top = 64
        Width = 177
        Height = 21
        Style = csDropDownList
        DataField = 'type'
        DataSource = ds4
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          #1054#1092#1080#1089
          #1048#1085#1090#1077#1088#1085#1077#1090)
        TabOrder = 4
        Values.Strings = (
          '0'
          '1')
      end
      object AddPacket: TBitBtn
        Left = 444
        Top = 334
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 5
        OnClick = AddPacketClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00A3777400A3777400A3777400A3777400A3777400A3777400A3777400A377
          7400A3777400A3777400A377740090605D00FF00FF00FF00FF00FF00FF00FF00
          FF00A67B7500FFCEC200FFCEC200FFCEC200FFCEC200FFCEC200FFCEC200FFCE
          C200FFCEC200FFCEC200FFCEC20093635F00FF00FF00FF00FF00FF00FF00FF00
          FF00AB7F7700F3E5D700FFE8D300FFE6CE00FFE3C600FFE1C200FFDDBB00FFD9
          B400FFD7B000FFD4A900FFD2A30096666200FF00FF00FF00FF00FF00FF00FF00
          FF00B0837900F4E7DB00FFEDDB00FFE8D300FFE6CE00FFE3C600FFE1C200FFDD
          BB00FFD9B400FFD7B000FFD4A9009A696400FF00FF00FF00FF00FF00FF00FF00
          FF00B6897C00F5ECE200FFEEDE00FFEDDB00FFE8D300FFE6CE00FFE3C600FFE1
          C200FFDDBB00FFD9B400FFD7B0009E6C6600FF00FF00FF00FF00FF00FF00FF00
          FF00BC8E7E00F7EFE600FFF3E600FFEEDE00FFEDDB00FFE8D300FFE6CE00FFE3
          C600FFE1C200FFDDBB00FFD9B400A26F6800FF00FF00FF00FF00FF00FF00FF00
          FF00C3958100F8F3EF00FFF5EA00FFF3E600FFEEDE00FFEDDB00FFE8D300FFE6
          CE00FFE3C600FFE1C200FFDDBB00A5736A00FF00FF00FF00FF00FF00FF00FF00
          FF00CA9B8400F9F5F100FFF9F300FFF5EA00FFF3E600FFEEDE00FFEDDB00FFE8
          D300FFE6CE00FFE3C600FFE1C200A8766C00FF00FF00FF00FF00FF00FF00FF00
          FF00D2A18700FAF9F900FFFAF600FFF9F300FFF5EA00FFF3E600FFEEDE00FFED
          DB00FFE8D300FFE6CE00FFE3C600AC796E00FF00FF00FF00FF00FF00FF00FF00
          FF00D9A88A00FBFBFB00FFFFFE00FFFAF600FFF9F300FFF5EA00FFF3E600FFEE
          DE00FFEDDB00FFE8D300FFE6CE00AE7B7100FF00FF00FF00FF00FF00FF00FF00
          FF00DFAE8C00FCFCFC00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5EA00FFF3
          E600FFEEDE00FFD7CE00FFB0B000B07D7200FF00FF00FF00FF00FF00FF00FF00
          FF00E5B38F00FDFDFD00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5
          EA00F4DECE00B27F7300B27F7300B27F7300FF00FF00FF00FF00FF00FF00FF00
          FF00EAB89100FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9
          F300F5E1D200B27F7300EDA75400CB987F00FF00FF00FF00FF00FF00FF00FF00
          FF00EFBC9200FFFFFF00FCFCFC00FAFAFA00F7F7F700F5F5F500F2F1F100F0ED
          EA00E9DAD000B27F7300D4A18300D09D8100FF00FF00FF00FF00FF00FF00FF00
          FF00F2BF9400DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA9
          8700DCA98700B27F7300D8A58500FF00FF00FF00FF00FF00FF00}
      end
      object p_del: TBitBtn
        Left = 444
        Top = 362
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 6
        OnClick = p_delClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482006B6D6B6B6D6B84820084820084820084
          82008482008482008482008482008482008482008482008482008482007B5DEF
          2900DE3928A56365638482008482008482008482008482008482008482006351
          B52904DE8482008482008482007B5DEF2900DE3108DE524D6B63656384820084
          82008482008482008482004228C62900DE5A45B5848200848200848200848200
          7B5DEF2900DE391CD65A5D5A8482008482008482008482003918CE2904DE5A45
          B58482008482008482008482008482008482007B61EF2900DE5238C663656384
          82008482003918CE2904DE5A45B5848200848200848200848200848200848200
          8482008482007B61EF2900DE5234C652515A3110C62904D65A45B58482008482
          008482008482008482008482008482008482008482008482007B5DEF2900DE29
          04D62904D66B618C848200848200848200848200848200848200848200848200
          8482008482008482008482002908DE2900DE4228C66B618C8482008482008482
          008482008482008482008482008482008482008482008482003918CE2904DE5A
          45B5310CE75A3CD66B618C848200848200848200848200848200848200848200
          8482008482003918CE2900DE5A45B5848200848200421CE74A28DE6B618C8482
          008482008482008482008482008482008482003914CE2900DE5A45B584820084
          82008482008482005A41E7310CDE6B618C848200848200848200848200848200
          3914CE2900DE5A45B58482008482008482008482008482008482005A41E72900
          DE848200848200848200848200421CE72900DE4228C684820084820084820084
          82008482008482008482008482008482008482008482008482008482003110E7
          4A2CE78482008482008482008482008482008482008482008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
      object s_title: TDBEdit
        Left = 416
        Top = 24
        Width = 177
        Height = 21
        DataField = 'title'
        DataSource = ds4
        MaxLength = 39
        TabOrder = 7
      end
      object s_hi: TRxSpinEdit
        Left = 478
        Top = 192
        Width = 41
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 100
        TabOrder = 8
        OnBottomClick = s_hiChange
        OnTopClick = s_hiChange
        OnChange = s_hiChange
        OnKeyPress = s_hiKeyPress
      end
      object s_low: TRxSpinEdit
        Left = 544
        Top = 192
        Width = 41
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 100
        TabOrder = 9
        OnBottomClick = s_lowChange
        OnTopClick = s_lowChange
        OnChange = s_lowChange
        OnKeyPress = s_hiKeyPress
      end
      object DBCheckBox1: TDBCheckBox
        Left = 415
        Top = 227
        Width = 150
        Height = 17
        Cursor = crHandPoint
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1089#1082#1080#1076#1082#1080
        DataField = 'ds'
        DataSource = ds4
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object TabSheet10: TTabSheet
      Caption = #1055#1088#1086#1092#1080#1083#1080
      ImageIndex = 3
      object RxLabel40: TRxLabel
        Left = 9
        Top = 316
        Width = 93
        Height = 13
        Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1077#1085' '#1076#1086':'
      end
      object AddClient: TBitBtn
        Left = 477
        Top = 21
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 0
        OnClick = AddClientClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00A3777400A3777400A3777400A3777400A3777400A3777400A3777400A377
          7400A3777400A3777400A377740090605D00FF00FF00FF00FF00FF00FF00FF00
          FF00A67B7500FFCEC200FFCEC200FFCEC200FFCEC200FFCEC200FFCEC200FFCE
          C200FFCEC200FFCEC200FFCEC20093635F00FF00FF00FF00FF00FF00FF00FF00
          FF00AB7F7700F3E5D700FFE8D300FFE6CE00FFE3C600FFE1C200FFDDBB00FFD9
          B400FFD7B000FFD4A900FFD2A30096666200FF00FF00FF00FF00FF00FF00FF00
          FF00B0837900F4E7DB00FFEDDB00FFE8D300FFE6CE00FFE3C600FFE1C200FFDD
          BB00FFD9B400FFD7B000FFD4A9009A696400FF00FF00FF00FF00FF00FF00FF00
          FF00B6897C00F5ECE200FFEEDE00FFEDDB00FFE8D300FFE6CE00FFE3C600FFE1
          C200FFDDBB00FFD9B400FFD7B0009E6C6600FF00FF00FF00FF00FF00FF00FF00
          FF00BC8E7E00F7EFE600FFF3E600FFEEDE00FFEDDB00FFE8D300FFE6CE00FFE3
          C600FFE1C200FFDDBB00FFD9B400A26F6800FF00FF00FF00FF00FF00FF00FF00
          FF00C3958100F8F3EF00FFF5EA00FFF3E600FFEEDE00FFEDDB00FFE8D300FFE6
          CE00FFE3C600FFE1C200FFDDBB00A5736A00FF00FF00FF00FF00FF00FF00FF00
          FF00CA9B8400F9F5F100FFF9F300FFF5EA00FFF3E600FFEEDE00FFEDDB00FFE8
          D300FFE6CE00FFE3C600FFE1C200A8766C00FF00FF00FF00FF00FF00FF00FF00
          FF00D2A18700FAF9F900FFFAF600FFF9F300FFF5EA00FFF3E600FFEEDE00FFED
          DB00FFE8D300FFE6CE00FFE3C600AC796E00FF00FF00FF00FF00FF00FF00FF00
          FF00D9A88A00FBFBFB00FFFFFE00FFFAF600FFF9F300FFF5EA00FFF3E600FFEE
          DE00FFEDDB00FFE8D300FFE6CE00AE7B7100FF00FF00FF00FF00FF00FF00FF00
          FF00DFAE8C00FCFCFC00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5EA00FFF3
          E600FFEEDE00FFD7CE00FFB0B000B07D7200FF00FF00FF00FF00FF00FF00FF00
          FF00E5B38F00FDFDFD00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5
          EA00F4DECE00B27F7300B27F7300B27F7300FF00FF00FF00FF00FF00FF00FF00
          FF00EAB89100FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9
          F300F5E1D200B27F7300EDA75400CB987F00FF00FF00FF00FF00FF00FF00FF00
          FF00EFBC9200FFFFFF00FCFCFC00FAFAFA00F7F7F700F5F5F500F2F1F100F0ED
          EA00E9DAD000B27F7300D4A18300D09D8100FF00FF00FF00FF00FF00FF00FF00
          FF00F2BF9400DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA9
          8700DCA98700B27F7300D8A58500FF00FF00FF00FF00FF00FF00}
      end
      object DelCient: TBitBtn
        Left = 477
        Top = 77
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 1
        OnClick = DelCientClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482006B6D6B6B6D6B84820084820084820084
          82008482008482008482008482008482008482008482008482008482007B5DEF
          2900DE3928A56365638482008482008482008482008482008482008482006351
          B52904DE8482008482008482007B5DEF2900DE3108DE524D6B63656384820084
          82008482008482008482004228C62900DE5A45B5848200848200848200848200
          7B5DEF2900DE391CD65A5D5A8482008482008482008482003918CE2904DE5A45
          B58482008482008482008482008482008482007B61EF2900DE5238C663656384
          82008482003918CE2904DE5A45B5848200848200848200848200848200848200
          8482008482007B61EF2900DE5234C652515A3110C62904D65A45B58482008482
          008482008482008482008482008482008482008482008482007B5DEF2900DE29
          04D62904D66B618C848200848200848200848200848200848200848200848200
          8482008482008482008482002908DE2900DE4228C66B618C8482008482008482
          008482008482008482008482008482008482008482008482003918CE2904DE5A
          45B5310CE75A3CD66B618C848200848200848200848200848200848200848200
          8482008482003918CE2900DE5A45B5848200848200421CE74A28DE6B618C8482
          008482008482008482008482008482008482003914CE2900DE5A45B584820084
          82008482008482005A41E7310CDE6B618C848200848200848200848200848200
          3914CE2900DE5A45B58482008482008482008482008482008482005A41E72900
          DE848200848200848200848200421CE72900DE4228C684820084820084820084
          82008482008482008482008482008482008482008482008482008482003110E7
          4A2CE78482008482008482008482008482008482008482008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
      object MoneyPayedByClient: TBitBtn
        Left = 477
        Top = 133
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1044#1077#1085#1077#1075' '#1091#1087#1083#1072#1095#1077#1085#1086
        TabOrder = 2
        OnClick = MoneyPayedByClientClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000000000000000
          000000000000000000000000A0C0D02078B02078B03068903048503050600000
          00000000000000000000000000000000000000000000000000000000B0D8F0C0
          F0F040D0FF30C0FF30A8F0304850207090304850305870000000000000A0C0D0
          2078B02078B0306890304050305870A0C8D0A0C0C090A0A080808070D0F040D0
          FF40B8F040587000000000000090B0C0C0F0F040D0FF30C0FF30B0F010385000
          0000000000A0C8D01078B01070A0205870203840507890000000000000000000
          90B0C0A0C0C090A0A08088908098A000000000000090B0C0D0FFFF60D8FF40D0
          FF40B8F030586000000000000000000000000000000000000000000000000000
          0000000000A0C0D01068A01070A0205870203840507890000000000000000000
          00000000000000000000000000000000000000000080C0D0D0FFFF60D8FF40D0
          FF40B8F0204860000000D0785090482090482090482080402080402080402080
          3820803820C0B8C00068A01070A02058702030408098A0802020D07850C08870
          C08050B09070D0A890E0C8B0C08060B06830C0505080B8E0C0F0F040D0FF30C0
          FF30A8F0205070802020D08050B09080D0C0B0E0D0C0D0B0A0E0C8C0B08870B0
          7040C07050D0B8A080B0E0A0C0D08098B07080A0D0B890802020D08860E0D0C0
          E0B8A0C08860C08050D0B8A0E0B090B07850B07050E0A880C09890905830A060
          40B0A090C09880802820E09070FFFFFFD09880D08860C08860E0D8D0C09880C0
          8050B07050C09070C0B8B0A05830905830A06030C0C0C0802820E09870E0D0D0
          F0C8B0D09870D08860F0D8D0C09880C08860B08050C09070D0C0B0A06030A060
          30B08870C09080803020E0A080B0A090E0C8C0F0E0E0F0C8B0E0B0A0F0C8B0D0
          A890C09880E0B8A0C09080C0A090D0B8B0B09880A06030803020E0A080A08880
          B09080B0A090D0C0B0FFF0E0FFF0F0F0F0F0F0F0F0F0E0E0F0D8C0C0A890A078
          60905830A05820803820E0A080E0A080E0A080E0A080E09880E09870D09070D0
          8870C08060C07860B07850B07050B06840A06040A05840905030}
      end
      object TimeUsedByClient: TBitBtn
        Left = 477
        Top = 105
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1054#1090#1088#1072#1073#1086#1090#1072#1085#1086
        TabOrder = 3
        OnClick = TimeUsedByClientClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200737173
          7371737371737371737371737371737375735A51525A51525A51525A51527B7D
          7B848200848200848200B5756BB5756BB5756BB5756BB5756BB5756BB5756B6B
          696B8482849C8E8C8C86849C86845A5152636563848200848200B57D73CE9E9C
          E7AEADE7AEADE7AEADC6AA8C8C8E8CA59E8CDECFAD8CA2E7DED7D6ADA694B59A
          9C635952636563848200B57D73FFFFFFFFEBD6FFE7CEEFCBA5ADAEADCEB69CFF
          EFC6FFE7BDDECBC6FFE7BDFFF7EFDED7D6C6A6A54A4D4A848200BD8673FFFFFF
          F7E3CEF7E3CECEB69CADAEADFFF7C6FFF7C6FFEFBDFFE7B5FFDFADFFDFADFFF7
          EFADA694847173848284BD8673FFFFFFFFD7ADFFD3A5ADA29CDECFADE7F3DEFF
          FFD6FFFFCEADA68CDEBE94FFDBA5FFE7CEBDBEBDAD9A9C848284C68E7BFFFFFF
          FFF3E7FFF3E7ADA29CC6C3C663B2FFFFFFF7FFFFDE8C8A8C393839635952FFE7
          BD5A71C6A59694848284C68E7BFFFFFFFFD7ADFFD7ADADA29CDECBC6FFFFFFFF
          FFFFFFFFEFFFFFDE84826B846D5AFFEFC6BDB69C848284848284CE967BFFFFFF
          FFF3E7FFF3E7D6CBBDADA29CEFDBCEFFFFFFFFFFFFFFFFFFFFFFD6847D6BC6AA
          8C8C8A8C7B7D7B848200CE9A84FFFFFFFFE3C6FFE3C6FFE3C6ADA29CD6CBBDEF
          DBCEFFFBF763B2FFE7F3EFF7E3B5A59E94848284848200848200D6A284FFFFFF
          FFF3E7FFF3E7FFF3E7FFF3E7ADA29CADA29CDED7D6D6CBBDADA29CADAEAD8482
          84848200848200848200DEA684FFFFFFFFE7CEFFE7CEFFE3C6FFE3C6FFE3C6D6
          CBBDADA29CADA29CADA29C737173848200848200848200848200DEAA84FFFFFF
          FFFFFFFFFFFFFFFFFFFFFBF7FFFBF7FFF7EFFFEFDEF7CFA5F7BA848C8A8C8482
          00848200848200848200E7AE8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7FF
          FBF7FFEBD6DE8A29DE8A29848200848200848200848200848200DEAA84EFEFEF
          EFEFEFEFEBEFEFEBEFE7E7E7E7E7E7E7E3E7E7E3E7DE8A298482008482008482
          00848200848200848200C69E94C69E94C69E94C69E94C69E94C69E94C69E94C6
          9E94C69E94848200848200848200848200848200848200848200}
      end
      object ClearClientHistory: TBitBtn
        Left = 477
        Top = 161
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1080#1089#1090#1086#1088#1080#1102
        TabOrder = 4
        OnClick = ClearClientHistoryClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482008482008482006B696B6B696B6B696B6B
          696B848200848200848200848200848200848200848200848200848200848200
          8482006B696BB5B29CADAA9CADAA9C8C8E846B696B7371738482008482008482
          008482008482008482008482008482006B696BFFF3CEFFEBC6FFE7BDFFEBC6FF
          F3CEFFFBDED6C7A5737573737173848200848200848200848200848200848200
          F7C78CFFE7BDFFDFB5FFDBAD42B242FFFBDEFFFBE7FFFFEFFFFFDE9C9A8C6B69
          6B848200848200848200848200EFCFA5FFE3B5FFF7D6FFE3B5FFD3A542B24200
          9A00009A0021A621CEEFC6FFFFDE6B696B848200848200848200848200F7C78C
          F7BE84FFCF9CFFE7BDFFF3CE42B242009A0052BA52EFFBE742B242FFE7C66B6D
          6B848200848200848200848200FFCB94FFCB94FFCB94FFCB94FFDFB542B24242
          B24221A621DEF3D68CD38CBDDB9C84867B6B6963848200848200FFDBADFFD3A5
          FFD3A5FFD3A5FFD3A5FFEBC684CF84FFFBDE73C76B42B24242B242DEE7BDA5A6
          946B6D6B848200848200FFDBADFFDFB5FFDFB5FFDFB5FFDFB5FFE7BD52BA5284
          CF8484CF84009A0042B242FFE7C6ADAA9C6B696B848200848200FFDBADFFEFCE
          FFEFCEFFEFCEFFEFCEFFEFCEDEEBCE21A621009A00009A0042B242FFF7D6D6CF
          B56B696B848200848200FFDBADFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEEF
          F7DEBDE7B5CEEFC642B242FFFFE7DEDBC66B696B848200848200FFDBADFFFFDE
          FFFFDEFFFFDEFFFFDEFFFBDEFFEFC6FFE3B5FFE7B5FFF3CEFFFFDEFFFFDEFFFF
          DE6B696B848200848200848200FFDBADFFDBADFFDBADEFCFA5EFB673EFB66BF7
          B673F7BA7BF7BE7BFFCB8CFFEBBDFFFFDE6B696B848200848200848200848200
          848200848200848200848200848200F7BE7BF7BE84FFC384FFC38CFFC78CFFDF
          B56B696B84820084820084820084820084820084820084820084820084820084
          8200848200F7BE7BFFCB94FFCB94F7D3AD848200848200848200}
      end
      object RxDBGrid1: TExDBGrid
        Left = 4
        Top = 3
        Width = 446
        Height = 297
        BorderStyle = bsNone
        DataSource = clients_ds
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        DisplayDateTime = False
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clNavy
        ImageHighlightColor = clWindow
        HighlightFontColor = clWhite
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Title.Caption = #8470
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'name'
            Title.Alignment = taCenter
            Title.Caption = #1048#1084#1103
            Width = 148
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'end'
            Title.Alignment = taCenter
            Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Title.Caption = 'ID'
            Width = 75
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ds'
            Title.Alignment = taCenter
            Title.Caption = #1057#1082#1080#1076#1082#1072' (%)'
            Width = 75
            Visible = True
          end>
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 3
        Top = 337
        Width = 537
        Height = 35
        Caption = #1058#1080#1087
        Columns = 3
        DataField = 'admin'
        DataSource = clients_ds
        Items.Strings = (
          #1054#1073#1099#1095#1085#1099#1081' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
          #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088' ('#1089' '#1080#1085#1090#1077#1088#1085#1077#1090#1086#1084')')
        TabOrder = 6
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object SetCard: TButton
        Left = 467
        Top = 248
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
        TabOrder = 7
        OnClick = SetCardClick
      end
      object DBDateEdit1: TDBDateEdit
        Left = 108
        Top = 309
        Width = 177
        Height = 21
        DataField = 'end'
        DataSource = clients_ds
        DefaultToday = True
        DialogTitle = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
        DirectInput = False
        NumGlyphs = 2
        TabOrder = 8
      end
      object SaveClient: TBitBtn
        Left = 477
        Top = 49
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 9
        OnClick = SaveClientClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00007A3D3D00994D4D0099464600B3B3B300B3B3B300B3B3B300B3B3B300B3B3
          B300B3B3B3009933330099333300994D4D00994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00AF9C9C00C2757500DAB4B400FBFBFB00F0F0
          F000E4E4E4009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00CFB6B600B7515100BF8C8C00D9D9D900FBFB
          FB00F0F0F0009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00E1C7C700A8424200A9767600B3B3B300D9D9
          D900FBFBFB009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00DCC8C800CA979700CAB1B100A9A9A900B3B3
          B300D6CFCF00993333009C363600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600CC666600CC666600CC666600CC666600CC666600CC66
          6600CC666600CC666600CC666600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600BF8C8C00BF8C8C00BF8C8C00BF8C8C00BF8C8C00BF8C
          8C00BF8C8C00BF8C8C00CC666600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00C1C1C100C3C3C300C3C3C300C5C5C500C5C5
          C500C7C7C700FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00BFBFBF00C0C0C000C2C2C200C3C3C300C4C4
          C400C5C5C500FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500994D4D00BF8C8C00C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4
          C400C4C4C400C4C4C400BF8C8C00994D4D0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object ClearAllHistory: TBitBtn
        Left = 467
        Top = 276
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1102' '#1080#1089#1090#1086#1088#1080#1102
        TabOrder = 10
        OnClick = ClearAllHistoryClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482008482008482006B696B6B696B6B696B6B
          696B848200848200848200848200848200848200848200848200848200848200
          8482006B696BB5B29CADAA9CADAA9C8C8E846B696B7371738482008482008482
          008482008482008482008482008482006B696BFFF3CEFFEBC6FFE7BDFFEBC6FF
          F3CEFFFBDED6C7A5737573737173848200848200848200848200848200848200
          F7C78CFFE7BDFFDFB5FFDBAD42B242FFFBDEFFFBE7FFFFEFFFFFDE9C9A8C6B69
          6B848200848200848200848200EFCFA5FFE3B5FFF7D6FFE3B5FFD3A542B24200
          9A00009A0021A621CEEFC6FFFFDE6B696B848200848200848200848200F7C78C
          F7BE84FFCF9CFFE7BDFFF3CE42B242009A0052BA52EFFBE742B242FFE7C66B6D
          6B848200848200848200848200FFCB94FFCB94FFCB94FFCB94FFDFB542B24242
          B24221A621DEF3D68CD38CBDDB9C84867B6B6963848200848200FFDBADFFD3A5
          FFD3A5FFD3A5FFD3A5FFEBC684CF84FFFBDE73C76B42B24242B242DEE7BDA5A6
          946B6D6B848200848200FFDBADFFDFB5FFDFB5FFDFB5FFDFB5FFE7BD52BA5284
          CF8484CF84009A0042B242FFE7C6ADAA9C6B696B848200848200FFDBADFFEFCE
          FFEFCEFFEFCEFFEFCEFFEFCEDEEBCE21A621009A00009A0042B242FFF7D6D6CF
          B56B696B848200848200FFDBADFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEEF
          F7DEBDE7B5CEEFC642B242FFFFE7DEDBC66B696B848200848200FFDBADFFFFDE
          FFFFDEFFFFDEFFFFDEFFFBDEFFEFC6FFE3B5FFE7B5FFF3CEFFFFDEFFFFDEFFFF
          DE6B696B848200848200848200FFDBADFFDBADFFDBADEFCFA5EFB673EFB66BF7
          B673F7BA7BF7BE7BFFCB8CFFEBBDFFFFDE6B696B848200848200848200848200
          848200848200848200848200848200F7BE7BF7BE84FFC384FFC38CFFC78CFFDF
          B56B696B84820084820084820084820084820084820084820084820084820084
          8200848200F7BE7BFFCB94FFCB94F7D3AD848200848200848200}
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1077#1088#1074#1077#1088
      ImageIndex = 5
      object RxLabel15: TRxLabel
        Left = 16
        Top = 24
        Width = 82
        Height = 13
        Caption = #1055#1088#1086#1082#1089#1080'-'#1089#1077#1088#1074#1077#1088':'
      end
      object RxLabel16: TRxLabel
        Left = 16
        Top = 56
        Width = 69
        Height = 13
        Caption = #1055#1088#1086#1082#1089#1080'-'#1087#1086#1088#1090':'
      end
      object RxLabel17: TRxLabel
        Left = 16
        Top = 88
        Width = 82
        Height = 13
        Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1087#1086#1088#1090':'
      end
      object RxLabel18: TRxLabel
        Left = 104
        Top = 88
        Width = 26
        Height = 13
        Caption = '3128'
      end
      object RxLabel20: TRxLabel
        Left = 144
        Top = 32
        Width = 5
        Height = 13
        Caption = '.'
      end
      object RxLabel21: TRxLabel
        Left = 192
        Top = 32
        Width = 5
        Height = 13
        Caption = '.'
      end
      object RxLabel22: TRxLabel
        Left = 240
        Top = 32
        Width = 5
        Height = 13
        Caption = '.'
      end
      object port: TRxSpinEdit
        Left = 104
        Top = 56
        Width = 65
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 32000
        MinValue = 80
        Value = 80
        TabOrder = 0
      end
      object ip1: TRxSpinEdit
        Left = 104
        Top = 24
        Width = 41
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 255
        Value = 127
        TabOrder = 1
      end
      object ip2: TRxSpinEdit
        Left = 152
        Top = 24
        Width = 41
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 255
        TabOrder = 2
      end
      object ip3: TRxSpinEdit
        Left = 200
        Top = 24
        Width = 41
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 255
        TabOrder = 3
      end
      object ip4: TRxSpinEdit
        Left = 248
        Top = 24
        Width = 41
        Height = 21
        ButtonKind = bkStandard
        MaxValue = 255
        Value = 1
        TabOrder = 4
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088#1099
      ImageIndex = 7
      object DBGrid1: TExDBGrid
        Left = 4
        Top = 3
        Width = 609
        Height = 330
        Cursor = crHandPoint
        BorderStyle = bsNone
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        GridAutoWidth = False
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clInfoBk
        ImageHighlightColor = clWindow
        HighlightFontColor = clNavy
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Expanded = False
            FieldName = 'User'
            Title.Caption = #1051#1086#1075#1080#1085
            Width = 572
            Visible = True
          end>
      end
      object AddManager: TBitBtn
        Left = 3
        Top = 344
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
        TabOrder = 1
        OnClick = AddManagerClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00A3777400A3777400A3777400A3777400A3777400A3777400A3777400A377
          7400A3777400A3777400A377740090605D00FF00FF00FF00FF00FF00FF00FF00
          FF00A67B7500FFCEC200FFCEC200FFCEC200FFCEC200FFCEC200FFCEC200FFCE
          C200FFCEC200FFCEC200FFCEC20093635F00FF00FF00FF00FF00FF00FF00FF00
          FF00AB7F7700F3E5D700FFE8D300FFE6CE00FFE3C600FFE1C200FFDDBB00FFD9
          B400FFD7B000FFD4A900FFD2A30096666200FF00FF00FF00FF00FF00FF00FF00
          FF00B0837900F4E7DB00FFEDDB00FFE8D300FFE6CE00FFE3C600FFE1C200FFDD
          BB00FFD9B400FFD7B000FFD4A9009A696400FF00FF00FF00FF00FF00FF00FF00
          FF00B6897C00F5ECE200FFEEDE00FFEDDB00FFE8D300FFE6CE00FFE3C600FFE1
          C200FFDDBB00FFD9B400FFD7B0009E6C6600FF00FF00FF00FF00FF00FF00FF00
          FF00BC8E7E00F7EFE600FFF3E600FFEEDE00FFEDDB00FFE8D300FFE6CE00FFE3
          C600FFE1C200FFDDBB00FFD9B400A26F6800FF00FF00FF00FF00FF00FF00FF00
          FF00C3958100F8F3EF00FFF5EA00FFF3E600FFEEDE00FFEDDB00FFE8D300FFE6
          CE00FFE3C600FFE1C200FFDDBB00A5736A00FF00FF00FF00FF00FF00FF00FF00
          FF00CA9B8400F9F5F100FFF9F300FFF5EA00FFF3E600FFEEDE00FFEDDB00FFE8
          D300FFE6CE00FFE3C600FFE1C200A8766C00FF00FF00FF00FF00FF00FF00FF00
          FF00D2A18700FAF9F900FFFAF600FFF9F300FFF5EA00FFF3E600FFEEDE00FFED
          DB00FFE8D300FFE6CE00FFE3C600AC796E00FF00FF00FF00FF00FF00FF00FF00
          FF00D9A88A00FBFBFB00FFFFFE00FFFAF600FFF9F300FFF5EA00FFF3E600FFEE
          DE00FFEDDB00FFE8D300FFE6CE00AE7B7100FF00FF00FF00FF00FF00FF00FF00
          FF00DFAE8C00FCFCFC00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5EA00FFF3
          E600FFEEDE00FFD7CE00FFB0B000B07D7200FF00FF00FF00FF00FF00FF00FF00
          FF00E5B38F00FDFDFD00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5
          EA00F4DECE00B27F7300B27F7300B27F7300FF00FF00FF00FF00FF00FF00FF00
          FF00EAB89100FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9
          F300F5E1D200B27F7300EDA75400CB987F00FF00FF00FF00FF00FF00FF00FF00
          FF00EFBC9200FFFFFF00FCFCFC00FAFAFA00F7F7F700F5F5F500F2F1F100F0ED
          EA00E9DAD000B27F7300D4A18300D09D8100FF00FF00FF00FF00FF00FF00FF00
          FF00F2BF9400DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA9
          8700DCA98700B27F7300D8A58500FF00FF00FF00FF00FF00FF00}
      end
      object DelManager: TBitBtn
        Left = 493
        Top = 344
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 2
        OnClick = DelManagerClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482006B6D6B6B6D6B84820084820084820084
          82008482008482008482008482008482008482008482008482008482007B5DEF
          2900DE3928A56365638482008482008482008482008482008482008482006351
          B52904DE8482008482008482007B5DEF2900DE3108DE524D6B63656384820084
          82008482008482008482004228C62900DE5A45B5848200848200848200848200
          7B5DEF2900DE391CD65A5D5A8482008482008482008482003918CE2904DE5A45
          B58482008482008482008482008482008482007B61EF2900DE5238C663656384
          82008482003918CE2904DE5A45B5848200848200848200848200848200848200
          8482008482007B61EF2900DE5234C652515A3110C62904D65A45B58482008482
          008482008482008482008482008482008482008482008482007B5DEF2900DE29
          04D62904D66B618C848200848200848200848200848200848200848200848200
          8482008482008482008482002908DE2900DE4228C66B618C8482008482008482
          008482008482008482008482008482008482008482008482003918CE2904DE5A
          45B5310CE75A3CD66B618C848200848200848200848200848200848200848200
          8482008482003918CE2900DE5A45B5848200848200421CE74A28DE6B618C8482
          008482008482008482008482008482008482003914CE2900DE5A45B584820084
          82008482008482005A41E7310CDE6B618C848200848200848200848200848200
          3914CE2900DE5A45B58482008482008482008482008482008482005A41E72900
          DE848200848200848200848200421CE72900DE4228C684820084820084820084
          82008482008482008482008482008482008482008482008482008482003110E7
          4A2CE78482008482008482008482008482008482008482008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
      object SetPassword: TBitBtn
        Left = 148
        Top = 344
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1047#1072#1076#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
        TabOrder = 3
        OnClick = SetPasswordClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000848200848200
          0000000000000000000000008482008482008482008482008482008482008482
          00848200848200848200848200008284009A9C009A9C009A9C009A9C00000084
          820084820000000084820084820000000084820084820084820000828400CFCE
          00CFCE00828400CFCE00CFCE009A9C080808080808009A9C000000000000009A
          9C00000084820084820000828400FFFF008284FFFBFF00000000CFCE00CFCE00
          9A9C009A9C00CFCE009A9C009A9C00CFCE00CFCE00000084820000828400FFFF
          00828400000000000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00000084820084820000828400FFFF000000009A9C00FFFF00FFFF00828400
          8284008284008284008284008284008284848200848200848200848200008284
          000000B5B2B500FFFF0082840000000000000000008482008482008482008482
          00848200848200848200848200848200008284000000000000C6C3C6C6C3C6C6
          C3C6C6C3C6000000848200848200848200848200848200848200848200848200
          848200848684C6C3C6C6C3C6FF0000FFFBFFFFFBFFC6C3C60000008482008482
          00848200848200848200848200848200848200848684FFFBFF0000FFC6C3C600
          0000000000FFFBFFC6C3C6000000848200848200848200848200848200848200
          848200848684FFFBFFC6C3C6000000FF0000FF0000000000FFFBFFC6C3C60000
          00848200848200848200848200848200848200848684FFFBFFC6C3C63100CE00
          00FF00CFCE00FFFF000000B5B2B5000000848200848200848200848200848200
          848200848200848684FFFBFF000000319A00319A00000000C6C3C60000008482
          00848200848200848200848200848200848200848200848200737573FFFBFF84
          8684000000B5B2B5000000848200848200848200848200848200848200848200
          848200848200848200848200848684FFFBFFC6C3C60000008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8684000000848200848200848200848200848200848200848200}
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1057#1077#1072#1085#1089' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
      ImageIndex = 11
      object RxLabel19: TRxLabel
        Left = 11
        Top = 16
        Width = 138
        Height = 13
        Caption = #1057#1077#1072#1085#1089' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072' '#1085#1072':'
      end
      object adm_ls: TComboBox
        Left = 13
        Top = 35
        Width = 135
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object ExecAdmin: TBitBtn
        Left = 13
        Top = 65
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        Default = True
        TabOrder = 0
        OnClick = ExecAdminClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          0065004A4D4A8482008482008482008482008482008482008482008482008482
          008482008482008482008482008482000065000065004A4D4A4A4D4A84820084
          8200848200848200848200848200848200848200848200848200848200848200
          006500089218006D00105D084A4D4A8482008482008482008482008482008482
          0084820084820084820084820084820000650010A22110AA290086080061004A
          4D4A4A4D4A848200848200848200848200848200848200848200848200848200
          00650018A63118B63110B229089610006900185D104A4D4A8482008482008482
          0084820084820084820084820084820000650018AA3921BA4218B63110B22908
          A6180079000861004A4D4A848200848200848200848200848200848200848200
          00650021B24229C35221BA4218B63110B22908AA18008A080069004A4D4A4A4D
          4A84820084820084820084820084820000650021B24A31CB6329C35221BA4218
          B63110B22908AA18089A100071001061084A4D4A848200848200848200848200
          00650021B24A31CF6331CB6329C35221BA4218B63110B22908A618007D000065
          004A4D4A84820084820084820084820000650029BA5231CF6B31CF6331CB6329
          C35221BA4210A229006D00105D08848200848200848200848200848200848200
          00650031BE5A39D76B31CF6B31CF6331CB631096290061008482008482008482
          0084820084820084820084820084820000650031C35A42DF7339D76B29BA5208
          7910085D08848200848200848200848200848200848200848200848200848200
          00650039CB634AE37B21AA42006D002959188482008482008482008482008482
          0084820084820084820084820084820000650039C75A10862108610084820084
          8200848200848200848200848200848200848200848200848200848200848200
          006500006500215D188482008482008482008482008482008482008482008482
          00848200848200848200848200848200006500215D1884820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
    end
    object TabSheet8: TTabSheet
      Caption = #1050#1072#1089#1089#1072
      ImageIndex = 2
      object DBText1: TDBText
        Left = 196
        Top = 314
        Width = 65
        Height = 25
        DataField = 'grn'
        DataSource = cassa_src
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RxLabel37: TRxLabel
        Left = 8
        Top = 314
        Width = 176
        Height = 25
        Caption = #1057#1077#1081#1095#1072#1089' '#1074' '#1082#1072#1089#1089#1077':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RxLabel38: TRxLabel
        Left = 261
        Top = 314
        Width = 46
        Height = 25
        Caption = #1075#1088#1085'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 309
        Top = 314
        Width = 41
        Height = 25
        DataField = 'kop'
        DataSource = cassa_src
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RxLabel39: TRxLabel
        Left = 340
        Top = 314
        Width = 48
        Height = 25
        Caption = #1082#1086#1087'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object CassaGetBtn: TBitBtn
        Left = 3
        Top = 344
        Width = 89
        Height = 25
        Cursor = crHandPoint
        Caption = #1048#1079#1074#1083#1077#1095#1100
        TabOrder = 0
        OnClick = CassaGetBtnClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000012000000110000000100
          040000000000CC00000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFCFFFFFCFFFFF00
          0000FFFFFCCFFFFCCFFFFF000000FFFFCCCFFFCCCFFFFF000000FFFCCCCFFCCC
          CFFFFF000000FFFFCCCFFFCCCFFFFF000000FFFFFCCFFFFCCFFFFF000000FFFF
          FFCFFFFFCFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000}
      end
      object DBGrid5: TExDBGrid
        Left = 4
        Top = 18
        Width = 609
        Height = 290
        Cursor = crHandPoint
        BorderStyle = bsNone
        DataSource = cassa_j_src
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        CellHints = True
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clInfoBk
        ImageHighlightColor = clWindow
        HighlightFontColor = clNavy
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        MultiLineRows = True
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'event_date'
            ReadOnly = False
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Width = 118
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'grn'
            Title.Alignment = taCenter
            Title.Caption = #1057#1091#1084#1084#1072' ('#1075#1088#1085'.)'
            Width = 76
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'kop'
            Title.Alignment = taCenter
            Title.Caption = #1057#1091#1084#1084#1072' ('#1082#1086#1087'.)'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'comment'
            Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1077
            Width = 307
            Visible = True
          end>
      end
      object StaticText1: TStaticText
        Left = 0
        Top = 0
        Width = 620
        Height = 17
        Align = alTop
        Caption = ' '#1046#1091#1088#1085#1072#1083' '#1082#1072#1089#1089#1099':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object CassaReturnBtn: TBitBtn
        Left = 99
        Top = 344
        Width = 89
        Height = 25
        Cursor = crHandPoint
        Caption = #1042#1086#1079#1074#1088#1072#1090#1080#1090#1100
        TabOrder = 3
        OnClick = CassaReturnBtnClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000012000000110000000100
          040000000000CC000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFCFFFFFCFFFFFFF00
          0000FFFFCCFFFFCCFFFFFF000000FFFFCCCFFFCCCFFFFF000000FFFFCCCCFFCC
          CCFFFF000000FFFFCCCFFFCCCFFFFF000000FFFFCCFFFFCCFFFFFF000000FFFF
          CFFFFFCFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000}
      end
      object ClearCassaBtn: TBitBtn
        Left = 493
        Top = 372
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1054#1073#1085#1091#1083#1080#1090#1100' '#1082#1072#1089#1089#1091
        TabOrder = 4
        OnClick = ClearCassaBtnClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482006B6D6B6B6D6B84820084820084820084
          82008482008482008482008482008482008482008482008482008482007B5DEF
          2900DE3928A56365638482008482008482008482008482008482008482006351
          B52904DE8482008482008482007B5DEF2900DE3108DE524D6B63656384820084
          82008482008482008482004228C62900DE5A45B5848200848200848200848200
          7B5DEF2900DE391CD65A5D5A8482008482008482008482003918CE2904DE5A45
          B58482008482008482008482008482008482007B61EF2900DE5238C663656384
          82008482003918CE2904DE5A45B5848200848200848200848200848200848200
          8482008482007B61EF2900DE5234C652515A3110C62904D65A45B58482008482
          008482008482008482008482008482008482008482008482007B5DEF2900DE29
          04D62904D66B618C848200848200848200848200848200848200848200848200
          8482008482008482008482002908DE2900DE4228C66B618C8482008482008482
          008482008482008482008482008482008482008482008482003918CE2904DE5A
          45B5310CE75A3CD66B618C848200848200848200848200848200848200848200
          8482008482003918CE2900DE5A45B5848200848200421CE74A28DE6B618C8482
          008482008482008482008482008482008482003914CE2900DE5A45B584820084
          82008482008482005A41E7310CDE6B618C848200848200848200848200848200
          3914CE2900DE5A45B58482008482008482008482008482008482005A41E72900
          DE848200848200848200848200421CE72900DE4228C684820084820084820084
          82008482008482008482008482008482008482008482008482008482003110E7
          4A2CE78482008482008482008482008482008482008482008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
      object ShowAllCassa: TBitBtn
        Left = 493
        Top = 316
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1105
        TabOrder = 5
        OnClick = ShowAllCassaClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003050
          70203040203850000000000000B0A09060483060483060483060483060483060
          48306048306048306048305048403050604078C0304860305060000000B0A090
          FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
          D04098E050B0F0506870000000B0A090FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090
          989070686060686050586040709040A0E060C8FF7090A0708890000000B0A090
          FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
          B07098B0708890000000000000B0A090FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FF
          F0E0FFE8E0F0D8C0F0D0B0807870605860708890000000000000000000C0A890
          FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A05058
          50000000000000000000000000C0A8A0FFFFFFFFFFFFFFFFFFA0A090F0E8E0FF
          FFFFFFF8F0FFF0F0FFE8E0E0C0B0606060000000000000000000000000C0B0A0
          FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A0906060
          60000000000000000000000000D0B0A0FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0
          C0C0F0E8E0F0E8E0B0B0A0707060807060000000000000000000000000D0B8A0
          FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050400000
          00000000000000000000000000D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB0A090604830604830604830000000000000000000000000000000D0C0B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830D0B0A00000
          00000000000000000000000000E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC0A8A0604830D0B0A0000000000000000000000000000000000000E0C0B0
          E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0D0B0A00000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      object ClearAllLogs: TBitBtn
        Left = 3
        Top = 372
        Width = 185
        Height = 25
        Cursor = crHandPoint
        Caption = #1054#1073#1085#1091#1083#1080#1090#1100' '#1078#1091#1088#1085#1072#1083#1099' '#1080' '#1082#1072#1089#1089#1091
        TabOrder = 6
        OnClick = ClearAllLogsClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF2BB81F3C48AF2BC81EF
          B072EEAF6EEFB275FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFBEBBDFEF3C9FBDEACF3C990FBB67EFFB47DFCCA99FFD9ADFED9A7F0B5
          77FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFEFAD3FEF7CCFBDCA9EBCA91A9
          B86E84AB542B912057A743EAF3C7FCE9BDEEAD6FFF00FFFF00FFFF00FFFF00FF
          EDA565F3C28AFCF0C4FCE5B5FBD09F2C9622007B00058206067F043DA335FEF2
          D0F0B173FF00FFFF00FFFF00FFFF00FFEEAB6DEDA767EFB070F6C990FFD8AC2E
          9823006E006ABF6BFFF0EA48A138A3AF5EFCAF74FF00FFFF00FFFF00FFFF00FF
          F2B479F2B77EF0B277F0AC6FFBB57E7AB46041A6416FBC69FFFFFFF4FEFBBCBB
          79F3AA6BFF00FFFF00FFFF00FFFF00FFF7C292FAC598F8C293F8C090F3BF8AC2
          D5A5FFFFFFD9EED556B1534BAF4BB8BC79F8B075FF00FFFF00FFFF00FFF6C792
          FCD4ADFCD4ACFCD0A9FCD0A9FFD4B55DA94680C780E0F2DE27982400700082B0
          5BFFBD90EEAC6DFF00FFFF00FFF6C792FFEAC4FEE3BCFEE2BAFEE0B8FFE0BAD9
          D9AC0A8209188A16037F0300790077B45DFFCEAAEEAC6DFF00FFFF00FFFADDAB
          FFFBD5FFF4CCFFF3CAFFF0C9FFEFC5FFF2D1B5D5982A96242B99249ACB87B5D1
          95FFE0BAF2B77AFF00FFFF00FFFCEFC4FFFFD8FFFBD3FFFCD4FFFBD3FFFBD4FF
          FCD4FFFFE1FFFFEBFFFFE7FFFFE0FFF8D7FFF4CBF3C086FF00FFFF00FFFEF4CB
          FFFFDDFFFFD9FFFFD9FFFFDAFFFED7FEF6CCF8DAA3F4C07DF4C17FF7D8A3FEF2
          C5FFFFDDF3C991FF00FFFF00FFF4CC96F8DEAFF8DDACF7D8A6F6CF99F3BF80EF
          AC66EB9D4FEB9C4CEB9F55F0AC6EFAC087FCD3A0FAC089FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDA354EFAB68F7BC83FABF
          88FABC83FABC83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFAC088FAC088FAC088FF00FFFF00FF}
      end
      object BitBtn2: TBitBtn
        Left = 493
        Top = 344
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        TabOrder = 7
        OnClick = BitBtn2Click
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482006B6D6B6B6D6B84820084820084820084
          82008482008482008482008482008482008482008482008482008482007B5DEF
          2900DE3928A56365638482008482008482008482008482008482008482006351
          B52904DE8482008482008482007B5DEF2900DE3108DE524D6B63656384820084
          82008482008482008482004228C62900DE5A45B5848200848200848200848200
          7B5DEF2900DE391CD65A5D5A8482008482008482008482003918CE2904DE5A45
          B58482008482008482008482008482008482007B61EF2900DE5238C663656384
          82008482003918CE2904DE5A45B5848200848200848200848200848200848200
          8482008482007B61EF2900DE5234C652515A3110C62904D65A45B58482008482
          008482008482008482008482008482008482008482008482007B5DEF2900DE29
          04D62904D66B618C848200848200848200848200848200848200848200848200
          8482008482008482008482002908DE2900DE4228C66B618C8482008482008482
          008482008482008482008482008482008482008482008482003918CE2904DE5A
          45B5310CE75A3CD66B618C848200848200848200848200848200848200848200
          8482008482003918CE2900DE5A45B5848200848200421CE74A28DE6B618C8482
          008482008482008482008482008482008482003914CE2900DE5A45B584820084
          82008482008482005A41E7310CDE6B618C848200848200848200848200848200
          3914CE2900DE5A45B58482008482008482008482008482008482005A41E72900
          DE848200848200848200848200421CE72900DE4228C684820084820084820084
          82008482008482008482008482008482008482008482008482008482003110E7
          4A2CE78482008482008482008482008482008482008482008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1046#1091#1088#1085#1072#1083
      ImageIndex = 8
      object log_grid: TExDBGrid
        Left = 4
        Top = 3
        Width = 609
        Height = 305
        Cursor = crHandPoint
        BorderStyle = bsNone
        DataSource = ds2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        CellHints = True
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clInfoBk
        ImageHighlightColor = clWindow
        HighlightFontColor = clNavy
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        SearchMode = True
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'manager'
            Title.Alignment = taCenter
            Title.Caption = #1052#1077#1085#1077#1076#1078#1077#1088
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'comp'
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1084#1087'.'
            Width = 35
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'money_payed'
            Title.Alignment = taCenter
            Title.Caption = #1057#1091#1084#1084#1072' ('#1082#1086#1087'.)'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'traffic_user'
            Title.Alignment = taCenter
            Title.Caption = #1058#1088#1072#1092#1080#1082' ('#1084#1073')'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'event_date'
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'comment'
            Title.Caption = #1057#1086#1073#1099#1090#1080#1077
            Width = 246
            Visible = True
          end>
      end
      object getonmanager: TBitBtn
        Left = 4
        Top = 344
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1085#1072' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
        TabOrder = 1
        OnClick = getonmanagerClick
      end
      object summtraffic: TBitBtn
        Left = 322
        Top = 316
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1057#1091#1084#1084#1072#1088#1085#1099#1081' '#1090#1088#1072#1092#1080#1082
        TabOrder = 2
        OnClick = summtrafficClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          080000000000000100000000000000000000000100000001000000000000FFFF
          FF0000000000DFD5D200DCCDC700FAF5F300C8A59500D6BDB200DBC9C100E1DA
          D700AD592E00BB603300B75F3200C2673800C6693A00CB6D3C00EC834D00EC83
          4F00EC855100ED875400ED885700ED8A5A00ED8A5B00ED8D5E00EC8D5F00ED90
          6200EC8F6300E9956B00E4977000EDA07800EB9E7900F0A57E00EFA57F00F3AA
          8600F6B89800CBAC9C00CFB2A300D2B6A800D4BBAE00D7C0B400D7C0B500D7C1
          B600DCC6BB00D9C3B800DDC9BF00F3E9E400F8F2EF00FAF6F400FDFBFA00DA7A
          4700E2814E00965937008F563500D3B9AB00DBC7BC00DAC6BB00DECABF00DCC9
          BE00D8C5BB00DFCDC300EDE0D900F5EEEA009057350089553500865334007F4F
          3200D9C6BA00DFCEC400EADFD800DDD3CD007A4E3100714A2F00BAA39300C5AE
          9E00C1AB9C00CAB4A500D2BCAD00FCF9F700774D2F0063493500B49E8E00BFA9
          9800BCA69600BDA89800B9A49500C5B0A000D8C2B200D7C1B100D6C0B000D5BF
          AF00CEB9A900F3ECE700F9F5F2009C7C6200FCFAF800FEFDFC00E1DFDC00FDFC
          FA00F0F0F000FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000080808080808
          080808080808080808080808080811333E3F414E47080808080808080808131D
          310F0B0A46080808080808544F5D151F32010E0C405D4F4F080808535F601721
          0101010D3444074F0808084A015F192221201E1C333C294F0808085501441B1A
          1816141210443A4F0808084B0101015F5E2F2E3D3D2D084F0808085A0139362A
          2B3524232306044F0808084C0101010161304D05055C454F0808085862626262
          383728262625034F08080856514850620101015F5F5E094F08080808575B5262
          433B2C424227604F08080808085749620101010101015F4F0808080808085659
          4C5A4B55554A5354080808080808080808080808080808080808}
      end
      object getfromallbtn: TBitBtn
        Left = 4
        Top = 316
        Width = 87
        Height = 25
        Cursor = crHandPoint
        Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1074#1089#1077#1075#1086
        TabOrder = 3
        OnClick = getfromallbtnClick
      end
      object ClearLogBtn: TBitBtn
        Left = 493
        Top = 372
        Width = 121
        Height = 23
        Cursor = crHandPoint
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 4
        OnClick = ClearLogBtnClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482008482008482006B696B6B696B6B696B6B
          696B848200848200848200848200848200848200848200848200848200848200
          8482006B696BB5B29CADAA9CADAA9C8C8E846B696B7371738482008482008482
          008482008482008482008482008482006B696BFFF3CEFFEBC6FFE7BDFFEBC6FF
          F3CEFFFBDED6C7A5737573737173848200848200848200848200848200848200
          F7C78CFFE7BDFFDFB5FFDBAD42B242FFFBDEFFFBE7FFFFEFFFFFDE9C9A8C6B69
          6B848200848200848200848200EFCFA5FFE3B5FFF7D6FFE3B5FFD3A542B24200
          9A00009A0021A621CEEFC6FFFFDE6B696B848200848200848200848200F7C78C
          F7BE84FFCF9CFFE7BDFFF3CE42B242009A0052BA52EFFBE742B242FFE7C66B6D
          6B848200848200848200848200FFCB94FFCB94FFCB94FFCB94FFDFB542B24242
          B24221A621DEF3D68CD38CBDDB9C84867B6B6963848200848200FFDBADFFD3A5
          FFD3A5FFD3A5FFD3A5FFEBC684CF84FFFBDE73C76B42B24242B242DEE7BDA5A6
          946B6D6B848200848200FFDBADFFDFB5FFDFB5FFDFB5FFDFB5FFE7BD52BA5284
          CF8484CF84009A0042B242FFE7C6ADAA9C6B696B848200848200FFDBADFFEFCE
          FFEFCEFFEFCEFFEFCEFFEFCEDEEBCE21A621009A00009A0042B242FFF7D6D6CF
          B56B696B848200848200FFDBADFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEEF
          F7DEBDE7B5CEEFC642B242FFFFE7DEDBC66B696B848200848200FFDBADFFFFDE
          FFFFDEFFFFDEFFFFDEFFFBDEFFEFC6FFE3B5FFE7B5FFF3CEFFFFDEFFFFDEFFFF
          DE6B696B848200848200848200FFDBADFFDBADFFDBADEFCFA5EFB673EFB66BF7
          B673F7BA7BF7BE7BFFCB8CFFEBBDFFFFDE6B696B848200848200848200848200
          848200848200848200848200848200F7BE7BF7BE84FFC384FFC38CFFC78CFFDF
          B56B696B84820084820084820084820084820084820084820084820084820084
          8200848200F7BE7BFFCB94FFCB94F7D3AD848200848200848200}
      end
      object DelFromLogBtn: TBitBtn
        Left = 493
        Top = 344
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        TabOrder = 5
        OnClick = DelFromLogBtnClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482006B6D6B6B6D6B84820084820084820084
          82008482008482008482008482008482008482008482008482008482007B5DEF
          2900DE3928A56365638482008482008482008482008482008482008482006351
          B52904DE8482008482008482007B5DEF2900DE3108DE524D6B63656384820084
          82008482008482008482004228C62900DE5A45B5848200848200848200848200
          7B5DEF2900DE391CD65A5D5A8482008482008482008482003918CE2904DE5A45
          B58482008482008482008482008482008482007B61EF2900DE5238C663656384
          82008482003918CE2904DE5A45B5848200848200848200848200848200848200
          8482008482007B61EF2900DE5234C652515A3110C62904D65A45B58482008482
          008482008482008482008482008482008482008482008482007B5DEF2900DE29
          04D62904D66B618C848200848200848200848200848200848200848200848200
          8482008482008482008482002908DE2900DE4228C66B618C8482008482008482
          008482008482008482008482008482008482008482008482003918CE2904DE5A
          45B5310CE75A3CD66B618C848200848200848200848200848200848200848200
          8482008482003918CE2900DE5A45B5848200848200421CE74A28DE6B618C8482
          008482008482008482008482008482008482003914CE2900DE5A45B584820084
          82008482008482005A41E7310CDE6B618C848200848200848200848200848200
          3914CE2900DE5A45B58482008482008482008482008482008482005A41E72900
          DE848200848200848200848200421CE72900DE4228C684820084820084820084
          82008482008482008482008482008482008482008482008482008482003110E7
          4A2CE78482008482008482008482008482008482008482008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
      object getfrominet: TBitBtn
        Left = 151
        Top = 316
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1079#1072' '#1080#1085#1090#1077#1088#1085#1077#1090
        TabOrder = 6
        OnClick = getfrominetClick
      end
      object getfromgames: TBitBtn
        Left = 151
        Top = 344
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1079#1072' '#1086#1092#1080#1089
        TabOrder = 7
        OnClick = getfromgamesClick
      end
      object savetofile: TBitBtn
        Left = 322
        Top = 344
        Width = 140
        Height = 25
        Cursor = crHandPoint
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
        TabOrder = 8
        OnClick = savetofileClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00007A3D3D00994D4D0099464600B3B3B300B3B3B300B3B3B300B3B3B300B3B3
          B300B3B3B3009933330099333300994D4D00994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00AF9C9C00C2757500DAB4B400FBFBFB00F0F0
          F000E4E4E4009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00CFB6B600B7515100BF8C8C00D9D9D900FBFB
          FB00F0F0F0009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00E1C7C700A8424200A9767600B3B3B300D9D9
          D900FBFBFB009933330099333300CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600994D4D00DCC8C800CA979700CAB1B100A9A9A900B3B3
          B300D6CFCF00993333009C363600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600CC666600CC666600CC666600CC666600CC666600CC66
          6600CC666600CC666600CC666600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600CC666600BF8C8C00BF8C8C00BF8C8C00BF8C8C00BF8C8C00BF8C
          8C00BF8C8C00BF8C8C00CC666600CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00C1C1C100C3C3C300C3C3C300C5C5C500C5C5
          C500C7C7C700FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00BFBFBF00C0C0C000C2C2C200C3C3C300C4C4
          C400C5C5C500FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500CC666600BF8C8C00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
          FA00FAFAFA00FAFAFA00BF8C8C00CC666600994D4D00FF00FF00FF00FF00B986
          7500994D4D00BF8C8C00C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4
          C400C4C4C400C4C4C400BF8C8C00994D4D0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object ShowAllLog: TBitBtn
        Left = 493
        Top = 316
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1105
        TabOrder = 9
        OnClick = ShowAllLogClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003050
          70203040203850000000000000B0A09060483060483060483060483060483060
          48306048306048306048305048403050604078C0304860305060000000B0A090
          FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
          D04098E050B0F0506870000000B0A090FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090
          989070686060686050586040709040A0E060C8FF7090A0708890000000B0A090
          FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
          B07098B0708890000000000000B0A090FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FF
          F0E0FFE8E0F0D8C0F0D0B0807870605860708890000000000000000000C0A890
          FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A05058
          50000000000000000000000000C0A8A0FFFFFFFFFFFFFFFFFFA0A090F0E8E0FF
          FFFFFFF8F0FFF0F0FFE8E0E0C0B0606060000000000000000000000000C0B0A0
          FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A0906060
          60000000000000000000000000D0B0A0FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0
          C0C0F0E8E0F0E8E0B0B0A0707060807060000000000000000000000000D0B8A0
          FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050400000
          00000000000000000000000000D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB0A090604830604830604830000000000000000000000000000000D0C0B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830D0B0A00000
          00000000000000000000000000E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC0A8A0604830D0B0A0000000000000000000000000000000000000E0C0B0
          E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0D0B0A00000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      object BitBtn1: TBitBtn
        Left = 90
        Top = 316
        Width = 54
        Height = 25
        Cursor = crHandPoint
        Caption = '/'#1085#1072' '#1082#1086#1084#1087'.'
        TabOrder = 10
        OnClick = BitBtn1Click
      end
    end
    object TabSheet11: TTabSheet
      Caption = #1057#1077#1089#1089#1080#1080
      ImageIndex = 6
      object ExDBGrid1: TExDBGrid
        Left = 4
        Top = 3
        Width = 609
        Height = 330
        Cursor = crHandPoint
        BorderStyle = bsNone
        DataSource = sessions_ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clInfoBk
        ImageHighlightColor = clWindow
        HighlightFontColor = clNavy
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Title.Caption = 'SID'
            Width = 86
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'comp'
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088' '#8470
            Width = 84
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 't'
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Width = 204
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cost'
            Title.Alignment = taCenter
            Title.Caption = #1044#1077#1085#1100#1075#1080
            Width = 124
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'closed'
            Title.Alignment = taCenter
            Title.Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1072
            Width = 72
            Visible = True
          end>
      end
      object AllSessions: TDsRadio
        Left = 8
        Top = 344
        Width = 49
        Height = 20
        Cursor = crHandPoint
        Caption = #1042#1089#1077
        Checked = True
        Color_High = clBtnHighlight
        Color_Low = clBtnShadow
        TabOrder = 1
        TabStop = True
        OnClick = AllSessionsClick
      end
      object FinalizedSessions: TDsRadio
        Left = 72
        Top = 344
        Width = 97
        Height = 20
        Cursor = crHandPoint
        Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077
        Color_High = clBtnHighlight
        Color_Low = clBtnShadow
        TabOrder = 2
        OnClick = FinalizedSessionsClick
      end
      object UnFinalizedSessions: TDsRadio
        Left = 176
        Top = 344
        Width = 105
        Height = 20
        Cursor = crHandPoint
        Caption = #1053#1077#1079#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077
        Color_High = clBtnHighlight
        Color_Low = clBtnShadow
        TabOrder = 3
        OnClick = UnFinalizedSessionsClick
      end
      object Delsession: TBitBtn
        Left = 366
        Top = 344
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        TabOrder = 4
        OnClick = DelsessionClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482006B6D6B6B6D6B84820084820084820084
          82008482008482008482008482008482008482008482008482008482007B5DEF
          2900DE3928A56365638482008482008482008482008482008482008482006351
          B52904DE8482008482008482007B5DEF2900DE3108DE524D6B63656384820084
          82008482008482008482004228C62900DE5A45B5848200848200848200848200
          7B5DEF2900DE391CD65A5D5A8482008482008482008482003918CE2904DE5A45
          B58482008482008482008482008482008482007B61EF2900DE5238C663656384
          82008482003918CE2904DE5A45B5848200848200848200848200848200848200
          8482008482007B61EF2900DE5234C652515A3110C62904D65A45B58482008482
          008482008482008482008482008482008482008482008482007B5DEF2900DE29
          04D62904D66B618C848200848200848200848200848200848200848200848200
          8482008482008482008482002908DE2900DE4228C66B618C8482008482008482
          008482008482008482008482008482008482008482008482003918CE2904DE5A
          45B5310CE75A3CD66B618C848200848200848200848200848200848200848200
          8482008482003918CE2900DE5A45B5848200848200421CE74A28DE6B618C8482
          008482008482008482008482008482008482003914CE2900DE5A45B584820084
          82008482008482005A41E7310CDE6B618C848200848200848200848200848200
          3914CE2900DE5A45B58482008482008482008482008482008482005A41E72900
          DE848200848200848200848200421CE72900DE4228C684820084820084820084
          82008482008482008482008482008482008482008482008482008482003110E7
          4A2CE78482008482008482008482008482008482008482008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
      object ClearSessions: TBitBtn
        Left = 493
        Top = 344
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
        TabOrder = 5
        OnClick = ClearSessionsClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482008482008482006B696B6B696B6B696B6B
          696B848200848200848200848200848200848200848200848200848200848200
          8482006B696BB5B29CADAA9CADAA9C8C8E846B696B7371738482008482008482
          008482008482008482008482008482006B696BFFF3CEFFEBC6FFE7BDFFEBC6FF
          F3CEFFFBDED6C7A5737573737173848200848200848200848200848200848200
          F7C78CFFE7BDFFDFB5FFDBAD42B242FFFBDEFFFBE7FFFFEFFFFFDE9C9A8C6B69
          6B848200848200848200848200EFCFA5FFE3B5FFF7D6FFE3B5FFD3A542B24200
          9A00009A0021A621CEEFC6FFFFDE6B696B848200848200848200848200F7C78C
          F7BE84FFCF9CFFE7BDFFF3CE42B242009A0052BA52EFFBE742B242FFE7C66B6D
          6B848200848200848200848200FFCB94FFCB94FFCB94FFCB94FFDFB542B24242
          B24221A621DEF3D68CD38CBDDB9C84867B6B6963848200848200FFDBADFFD3A5
          FFD3A5FFD3A5FFD3A5FFEBC684CF84FFFBDE73C76B42B24242B242DEE7BDA5A6
          946B6D6B848200848200FFDBADFFDFB5FFDFB5FFDFB5FFDFB5FFE7BD52BA5284
          CF8484CF84009A0042B242FFE7C6ADAA9C6B696B848200848200FFDBADFFEFCE
          FFEFCEFFEFCEFFEFCEFFEFCEDEEBCE21A621009A00009A0042B242FFF7D6D6CF
          B56B696B848200848200FFDBADFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEEF
          F7DEBDE7B5CEEFC642B242FFFFE7DEDBC66B696B848200848200FFDBADFFFFDE
          FFFFDEFFFFDEFFFFDEFFFBDEFFEFC6FFE3B5FFE7B5FFF3CEFFFFDEFFFFDEFFFF
          DE6B696B848200848200848200FFDBADFFDBADFFDBADEFCFA5EFB673EFB66BF7
          B673F7BA7BF7BE7BFFCB8CFFEBBDFFFFDE6B696B848200848200848200848200
          848200848200848200848200848200F7BE7BF7BE84FFC384FFC38CFFC78CFFDF
          B56B696B84820084820084820084820084820084820084820084820084820084
          8200848200F7BE7BFFCB94FFCB94F7D3AD848200848200848200}
      end
    end
    object TabSheet9: TTabSheet
      Caption = #1046#1091#1088#1085#1072#1083' '#1072#1091#1090#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080
      ImageIndex = 4
      object DBGrid6: TExDBGrid
        Left = 4
        Top = 3
        Width = 609
        Height = 330
        Cursor = crHandPoint
        BorderStyle = bsNone
        DataSource = loginlog_src
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        EditColor = clWindow
        DefaultRowHeight = 17
        RowColor1 = 12255087
        RowColor2 = clWindow
        HighlightColor = clInfoBk
        ImageHighlightColor = clWindow
        HighlightFontColor = clNavy
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        GridAutoWidthDisplay = Proportional
        MaskedColumnDrag = True
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'event_date'
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'login'
            Title.Caption = #1051#1086#1075#1080#1085
            Width = 463
            Visible = True
          end>
      end
      object ClearAuthLog: TBitBtn
        Left = 493
        Top = 344
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
        TabOrder = 1
        OnClick = ClearAuthLogClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482008482008482006B696B6B696B6B696B6B
          696B848200848200848200848200848200848200848200848200848200848200
          8482006B696BB5B29CADAA9CADAA9C8C8E846B696B7371738482008482008482
          008482008482008482008482008482006B696BFFF3CEFFEBC6FFE7BDFFEBC6FF
          F3CEFFFBDED6C7A5737573737173848200848200848200848200848200848200
          F7C78CFFE7BDFFDFB5FFDBAD42B242FFFBDEFFFBE7FFFFEFFFFFDE9C9A8C6B69
          6B848200848200848200848200EFCFA5FFE3B5FFF7D6FFE3B5FFD3A542B24200
          9A00009A0021A621CEEFC6FFFFDE6B696B848200848200848200848200F7C78C
          F7BE84FFCF9CFFE7BDFFF3CE42B242009A0052BA52EFFBE742B242FFE7C66B6D
          6B848200848200848200848200FFCB94FFCB94FFCB94FFCB94FFDFB542B24242
          B24221A621DEF3D68CD38CBDDB9C84867B6B6963848200848200FFDBADFFD3A5
          FFD3A5FFD3A5FFD3A5FFEBC684CF84FFFBDE73C76B42B24242B242DEE7BDA5A6
          946B6D6B848200848200FFDBADFFDFB5FFDFB5FFDFB5FFDFB5FFE7BD52BA5284
          CF8484CF84009A0042B242FFE7C6ADAA9C6B696B848200848200FFDBADFFEFCE
          FFEFCEFFEFCEFFEFCEFFEFCEDEEBCE21A621009A00009A0042B242FFF7D6D6CF
          B56B696B848200848200FFDBADFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEFFFFDEEF
          F7DEBDE7B5CEEFC642B242FFFFE7DEDBC66B696B848200848200FFDBADFFFFDE
          FFFFDEFFFFDEFFFFDEFFFBDEFFEFC6FFE3B5FFE7B5FFF3CEFFFFDEFFFFDEFFFF
          DE6B696B848200848200848200FFDBADFFDBADFFDBADEFCFA5EFB673EFB66BF7
          B673F7BA7BF7BE7BFFCB8CFFEBBDFFFFDE6B696B848200848200848200848200
          848200848200848200848200848200F7BE7BF7BE84FFC384FFC38CFFC78CFFDF
          B56B696B84820084820084820084820084820084820084820084820084820084
          8200848200F7BE7BFFCB94FFCB94F7D3AD848200848200848200}
      end
      object DelAuthRecord: TBitBtn
        Left = 366
        Top = 344
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        TabOrder = 2
        OnClick = DelAuthRecordClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000848200848200
          8482008482008482008482008482008482008482008482008482008482008482
          008482008482008482008482008482006B6D6B6B6D6B84820084820084820084
          82008482008482008482008482008482008482008482008482008482007B5DEF
          2900DE3928A56365638482008482008482008482008482008482008482006351
          B52904DE8482008482008482007B5DEF2900DE3108DE524D6B63656384820084
          82008482008482008482004228C62900DE5A45B5848200848200848200848200
          7B5DEF2900DE391CD65A5D5A8482008482008482008482003918CE2904DE5A45
          B58482008482008482008482008482008482007B61EF2900DE5238C663656384
          82008482003918CE2904DE5A45B5848200848200848200848200848200848200
          8482008482007B61EF2900DE5234C652515A3110C62904D65A45B58482008482
          008482008482008482008482008482008482008482008482007B5DEF2900DE29
          04D62904D66B618C848200848200848200848200848200848200848200848200
          8482008482008482008482002908DE2900DE4228C66B618C8482008482008482
          008482008482008482008482008482008482008482008482003918CE2904DE5A
          45B5310CE75A3CD66B618C848200848200848200848200848200848200848200
          8482008482003918CE2900DE5A45B5848200848200421CE74A28DE6B618C8482
          008482008482008482008482008482008482003914CE2900DE5A45B584820084
          82008482008482005A41E7310CDE6B618C848200848200848200848200848200
          3914CE2900DE5A45B58482008482008482008482008482008482005A41E72900
          DE848200848200848200848200421CE72900DE4228C684820084820084820084
          82008482008482008482008482008482008482008482008482008482003110E7
          4A2CE78482008482008482008482008482008482008482008482008482008482
          0084820084820084820084820084820084820084820084820084820084820084
          8200848200848200848200848200848200848200848200848200}
      end
    end
  end
  object db1: TZMySqlDatabase
    Database = 'mysql'
    Port = '3306'
    Encoding = etCp1251
    LoginPrompt = False
    Connected = False
    Left = 20
    Top = 208
  end
  object ta1: TZMySqlTransact
    Options = []
    AutoCommit = True
    Database = db1
    TransactSafe = False
    Left = 60
    Top = 208
  end
  object ds: TDataSource
    DataSet = users
    Left = 308
    Top = 312
  end
  object db2: TZMySqlDatabase
    Database = 'ipguard'
    Port = '3306'
    Encoding = etCp1251
    LoginPrompt = False
    Connected = False
    Left = 20
    Top = 256
  end
  object ta2: TZMySqlTransact
    Options = []
    AutoCommit = True
    Database = db2
    TransactSafe = False
    Left = 60
    Top = 256
  end
  object logs: TZMySqlQuery
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    Sql.Strings = (
      
        'select manager,comp,traffic_user,money_payed,DATE_FORMAT(event_d' +
        'ate,'#39'%Y-%m-%e %H:%i'#39') as event_date,comment from logs where TO_D' +
        'AYS(event_date)>=TO_DAYS(now())-7 order by id desc')
    RequestLive = True
    Left = 508
    Top = 256
  end
  object ds2: TDataSource
    DataSet = logs
    Left = 388
    Top = 312
  end
  object addr: TZMySqlTable
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doEnableAutoInc, doUseRowId, doRefreshAfterPost, doRefreshBeforeEdit]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    TableName = 'addr'
    Left = 436
    Top = 256
  end
  object ds3: TDataSource
    DataSet = addr
    Left = 276
    Top = 312
  end
  object users: TZMySqlQuery
    Database = db1
    Transaction = ta1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doQueryAllRecords, doAutoFillDefs, doEnableAutoInc, doUseRowId, doRefreshAfterPost, doRefreshBeforeEdit]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = usersAfterScroll
    AfterDelete = usersAfterScroll
    AfterScroll = usersAfterScroll
    ExtraOptions = [moStoreResult]
    Macros = <>
    MacroCheck = False
    ParamCheck = False
    Sql.Strings = (
      
        'select * from user where length(user)>0 and md5(host)<>md5('#39'%'#39') ' +
        'order by user')
    RequestLive = True
    Left = 132
    Top = 208
  end
  object q1: TZMySqlQuery
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    MacroCheck = False
    ParamCheck = False
    RequestLive = True
    Left = 92
    Top = 256
  end
  object packets: TZMySqlTable
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId, doRefreshAfterPost]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = packetsAfterOpen
    AfterInsert = packetsAfterOpen
    BeforePost = packetsBeforePost
    AfterPost = packetsAfterOpen
    AfterCancel = packetsAfterOpen
    AfterDelete = packetsAfterOpen
    BeforeScroll = packetsBeforePost
    AfterScroll = packetsAfterOpen
    ExtraOptions = [moStoreResult]
    TableName = 'packets'
    Left = 132
    Top = 256
  end
  object ds4: TDataSource
    DataSet = packets
    Left = 196
    Top = 312
  end
  object cassa: TZMySqlQuery
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    Sql.Strings = (
      
        'select TRUNCATE(sum(summ)/100,0) grn, MOD(sum(summ),100) kop, su' +
        'm(summ) ksumm from cassa')
    RequestLive = False
    Left = 260
    Top = 256
  end
  object cassa_src: TDataSource
    DataSet = cassa
    Left = 116
    Top = 312
  end
  object cassa_j_src: TDataSource
    DataSet = cassa_j
    Left = 84
    Top = 312
  end
  object cassa_j: TZMySqlQuery
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    Sql.Strings = (
      
        'select id, DATE_FORMAT(event_date,'#39'%Y-%m-%e %H:%i'#39') as event_dat' +
        'e, SIGN(summ)*TRUNCATE(ABS(summ/100) ,0) grn, MOD(summ,100) kop,' +
        ' comment from cassa where TO_DAYS(event_date)>=TO_DAYS(now())-7 ' +
        'order by id desc')
    RequestLive = True
    Left = 300
    Top = 256
  end
  object cassa_exe: TZMySqlQuery
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    RequestLive = False
    Left = 220
    Top = 256
  end
  object loginlog: TZMySqlQuery
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    Sql.Strings = (
      
        'select DATE_FORMAT(event_date,'#39'%Y-%m-%e %H:%i'#39') as event_date,lo' +
        'gin,id from loginlog order by id desc')
    RequestLive = False
    Left = 404
    Top = 258
  end
  object loginlog_src: TDataSource
    DataSet = loginlog
    Left = 236
    Top = 314
  end
  object clients_list: TZMySqlQuery
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    MacroCheck = False
    ParamCheck = False
    Sql.Strings = (
      'select * from clients order by id')
    RequestLive = True
    Left = 468
    Top = 258
  end
  object clients_ds: TDataSource
    DataSet = clients_list
    Left = 28
    Top = 314
  end
  object ImageList1: TImageList
    Left = 144
    Top = 418
    Bitmap = {
      494C01010D000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      000000000000000000000000000000000000F4FAFDFFB7E0F6FF87CAEEFF67AA
      D0FF4683AAFF517A98FF65829BFFA5BBCCFFF2F6F8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005FB4E3FF5EBBECFF7ECFF1FF5BBE
      F1FF2D96D4FF0F6293FF15618EFF2C6E9BFF417EAAFF72B6E4FF578EBAFF2B5D
      89FF4C6B8AFF607D97FFA5BBCCFFF2F6F8FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000055B0E2FF74D3FEFFC2F1FCFFCDFA
      FFFFBDF6FFFFB7F4FFFF91CFE3FF44A5D6FF3676A6FF47A1DBFF2F83C4FF165C
      9EFF084172FF125685FF2C6E9BFF417EAAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053ADE0FF93E4FBFF8BDBF6FF74C9
      EFFF65AFD4FF4683AAFF578AA6FF4D7D9BFF356F9BFF6AB6E0FF6AACD0FF5B97
      BEFF65A3C7FF76B6D3FF44A5D6FF3676A6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000075B9DFFF54AFE1FF5EBBECFF7ECF
      F1FF5BBEF1FF2D96D4FF0F6293FF15618EFF2C6E9BFF387AA9FF377CB1FF2251
      7FFF305C82FF437291FF6AAFCCFF397EAEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4FAFDFF58B4E6FF5EBDEEFF61AD
      D5FF5890B5FF5384A6FF49799BFF538DB1FF3C9DD0FF3676A6FF2F83C4FF165C
      9EFF084172FF135E8BFF2C6E9BFF3779A8FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005FB4E3FF5EBBECFF7ECFF1FF5BBE
      F1FF2D96D4FF0F6293FF15618EFF2C6E9BFF387BABFF397EAEFF6AACD0FF5B97
      BEFF69A7CAFF91CFE3FF44A5D6FF3676A6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000055B0E2FF74D3FEFFC2F1FCFFCDFA
      FFFFBDF6FFFFB7F4FFFF91CFE3FF44A5D6FF3676A6FF439CD3FF377CB1FF2F62
      8EFF3E6D90FF5A8AA3FF6AAFCCFF397EAEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053AEE1FF98E8FCFFA7F3FFFFA7F3
      FFFFA7F3FFFFA7F3FFFFA7F3FFFFA2EEFFFF397EAEFF47A1DBFF2F83C4FF165C
      9EFF0C5788FF15618EFF2C6E9BFF397EADFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000075B9DFFF55B0DDFF6FCCEEFF7CDE
      FBFF7CE1FFFF81E6FFFF8EDCF5FF6CBBE5FF4FABDEFF6DBCE5FF6AACD0FF5B97
      BEFFB3EFFBFF91CFE3FF44A5D6FF3676A6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCEDF7FFA2CFE9FFA2CF
      E9FFA2CFE9FFA2CFE9FF9CCDE9FF379ADFFF4DB5F1FF449FDAFF3C83B6FF4B87
      ADFF578AA6FF5A8AA3FF6AAFCCFF397EAEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000045A4E0FF4EAFEAFF74C5ECFF5BBEF1FF2D96
      D4FF0F6293FF15618EFF2C6E9BFF397EADFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000055B0E2FF74D3FEFFC2F1FCFFCDFAFFFFBDF6
      FFFFB7F4FFFF91CFE3FF44A5D6FF3676A6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000053AEE1FF98E8FCFFA7F3FFFFA7F3FFFFA7F3
      FFFFA7F3FFFFA7F3FFFFA2EEFFFF397EAEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000075B9DFFF55B0DDFF6FCCEEFF7CDEFBFF7CE1
      FFFF81E6FFFF8EDCF5FF6CBBE5FF75B9DFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCEDF7FFA2CFE9FFA2CFE9FFA2CF
      E9FFA2CFE9FFA2CFE9FFDCEDF7FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A47C5C00AD876700AD88
      6700AD886700AD886700AD876700AE876800AD886800AD876700AE876700AE87
      6700AE876700AE886700A57C5B00000000000000000000000000000000000000
      00000000000093664500895E3A007B522B00774F2600744C2300744C2300784F
      27007C522B00895E3A0093674500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFAF9FFE9E7E6FFD8D6D5FFD8D8D7FFDADADAFFE5E5
      E5FFFDFDFDFF00000000000000000000000000000000C9A98A00D4B79700B28B
      6500D0B18E00E3CBAD00DABD9F00DABC9E00D9BC9E00DABC9F00DABD9E00DABC
      9E00DABC9E00E0C6A800C9AA8A000000000095694500E4CBAE00E4CBAE00E4CB
      AE0094674500C19E7000D2AF8200D9B78900DAB88A00EAEAEA00EAEAEA00DAB8
      8A00D9B78900D4B18300C5A17400815C340000000000C6A59400634A3100634A
      3100634A3100634A3100634A3100634A3100634A3100634A3100634A3100634A
      3100634A3100634A3100634A3100000000000000000000000000000000000000
      0000F6F4F2FFC8C3BAFFDFA568FFD9D8D7FFE5E5E5FFEEEEEEFFF8F8F8FFFDFD
      FDFFD7D7D7FFF4F4F4FF000000000000000000000000CBAC8D00E7CEAE00E4C0
      9300B7916C00E5CCB100BF967300BD936F00BD926F00BD926F00BD936F00BD92
      6F00BD926F00D7B99B00CAAC8D000000000097694600E5CDB100E6C396009C6F
      45008C683D00DDBB8E00DDBB8E00DDBB8E00DDBB8E00F3F3F300F3F3F300DDBB
      8E00DDBB8E00DDBB8E00DDBB8E008563390000000000C6A59400FFFFF700E7DE
      D600E7D6D600D6CEC600D6C6B500D6BDB500C6B5A500C6ADA500C6A59400B59C
      9400B5948400A58C8400634A310000000000000000000000000000000000F0F0
      F0FFD6D6D6FFD6CFC4FFE2A464FFCCCBCBFFDEDEDEFFE9E9E9FFF3F3F3FFFAFA
      FAFFFEFEFEFFD3D3D3FF000000000000000000000000CCAE9000E8D2B700EBD4
      B900D8BD9F00E5CEB500E5CFB500E5D0B500E5CEB500E5CEB500E5CFB400E5CF
      B500E5CEB500E5CEB500CBAD9000000000009A6B4700E6D1B600E6D0B500E6D0
      B600E6CFB60096704100D9B98B00E1C19400E1C194000000000000000000E1C1
      9400E1C19400D9B88B0096704100FEFEFE0000000000C6A59400FFFFF700B5D6
      E70031738400A5ADB500FFE7C600FFD6C600F7CEB500F7C6A500E7B59400E7AD
      9400D6A58400B5948400634A310000000000000000000000000000000000C9C9
      C9FFE2E2E2FFD6D3CFFFE2A363FFC5C4C3FFD6D6D6FFE4E4E4FFEEEEEEFFF7F7
      F7FFFDFDFDFFF2F2F2FF000000000000000000000000CDB09400D7BB9C00B083
      5500C19F7D00E7D2BA00CAA78700C8A38400C8A38300C8A48400C8A48400C7A3
      8300C8A48400DCC3A800CDB09400000000009A6C4800E7D2B900A0734800B992
      6B00E7D2B9009B784D00946E3D00E3C39600E3C39600BBBBBB00BBBBBB00E3C3
      9600E3C39600946E3D00815728000000000000000000C6A59400FFFFF70000B5
      FF00C6FFFF00316B8400FFEFD600B5A5A500B5A59400B59C9400B59C8400B594
      8400E7AD9400B59C9400634A310000000000000000000000000000000000C0C0
      C0FFE9E9E9FFDBDCDCFFE0A263FFC2BEBAFFCCCCCCFFDEDEDEFFE9E9E9FFF2F2
      F2FFF8F8F8FF00000000000000000000000000000000CFB39700ECD7BE00EDCF
      A900BA977400E7D5BF00D4B89C00D3B69A00D3B59A00D3B59A00D3B59A00D3B5
      9A00D3B69A00E0CBB200CFB39700000000009F6E4900E8D7C000FDE8CF00A87D
      5300E8D6C000E8D7C100E8D7C000B1A3900075858E00597C99005B7D9B007483
      8D00AEA08A00E8D6C0009F6F48000000000000000000C6AD9400FFFFF700B5E7
      F70000B5FF00B5D6E700FFF7E700FFE7D600FFDEC600FFD6B500F7C6A500F7C6
      A500E7B59400C6A59400634A310000000000000000000000000000000000E9E9
      EAFFEEEEEEFFE2E3E3FFDFAE7DFFCCBEB1FFC4C4C4FFD6D6D6FFE3E3E3FFEEEE
      EEFFF9F9F9FF00000000000000000000000000000000D1B69C00E1CDB600CEB4
      9800DEC9B100E9D9C500E4D1BC00E4D1BB00E4D0BB00E4D0BB00E4D0BA00E3D0
      BA00E4D1BA00E7D6C000D1B69B0000000000A06F4A00E9D9C400E9D9C300E9D9
      C400E9D9C400E9D9C400E9D9C400B5BABB007A9FC10078ABDA0076A9D8006E98
      BD00B4BABA00E9D8C300A0704A000000000000000000C6ADA500FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFEFE700FFE7D600FFDEC600FFD6B500F7C6
      A500F7C6A500C6ADA500634A310000000000000000000000000000000000FEFE
      FEFFF1F1F2FFE8E8E8FFECDBC6FFF6EEE7FFD1D1D1FFCCCCCCFFDEDEDEFFEDED
      EDFFFDFDFDFF00000000000000000000000000000000D2B89F00E1CAAF00C59B
      6900BD9C7A00EBDCC900BC937200B98E6C00B98E6C00B98E6C00B98E6C00B98E
      6C00B98E6C00DAC2AA00D2B99F0000000000A3724B00EBDCCA00E6C396009D70
      4600EBDECA00AF7F5A00A7744D0081ADD400ACCFF00088BBEA0088BBEA0072A4
      D3005F90BC00E7DBC800A4724B000000000000000000C6ADA500FFFFF70094A5
      FF003139A500949CD600FFFFF700FFF7E700FFEFD600FFE7C600FFD6C600FFCE
      B500F7C6A500C6B5A500634A3100000000000000000000000000000000000000
      0000FCFCFDFFACBBCFFF6C88B0FF849BBDFFCDD1D7FFCCCCCCFFE7E8E9FFFEFE
      FEFF0000000000000000000000000000000000000000D4BBA300EFE1CF00F3DF
      C500CDB49800ECE0D000ECE0CF00ECE0CF00ECE0CF00ECE0CF00ECDFCF00ECE0
      CF00ECDFCF00ECE0CF00D5BCA40000000000A5744B00EBDFCF00FDE8CF00A87D
      5300ECE0CF00ECDFCE00DCD1C10086B2D900BCD9F30089BCEA0088BBEA0087BA
      E9005E8AB500D7CCBF00A6734C000000000000000000C6ADA500FFFFF7004263
      FF0094B5FF003139B500FFFFF700C6ADA500B5A59400B5A59400B59C9400B59C
      9400F7CEB500D6BDB500634A3100000000000000000000000000000000000000
      0000B8C5D8FF607FAAFF607EA9FF6582ACFF6581AAFFE0E3E8FF000000000000
      00000000000000000000000000000000000000000000D6BEA600DCC9B400B593
      7100D6C0A700EDE2D400E3D2BF00E2D2BD00E2D1BE00E2D1BE00E2D1BE00E1D0
      BD00E2D1BE00E9DDCC00D6BEA60000000000A9754D00EEE4D500A0734800BB97
      7200EEE3D500DFCBB800C6B7A70019192A0096A9C1008BBBE90087BAE9006D94
      BE000E0E2000CFC7BC00A9754D000000000000000000C6B5A500FFFFF70094A5
      FF004263FF0094A5FF00FFFFF700FFFFF700FFFFF700FFF7E700FFE7D600FFDE
      C600FFD6B500D6BDB500634A3100000000000000000000000000000000000000
      00007A94BBFF6585B2FF6483B0FF6684AEFF6F8AB0FFFDFDFDFF000000000000
      00000000000000000000000000000000000000000000D8C1AB00EEDEC900E4C0
      9300BA9A7A00EFE6D900C3A08300C09B7D00C09B7D00C09B7D00C09B7D00C09B
      7D00C09B7D00DFCDBA00D8C1AB0000000000AA774E00EFE6D800E6C396009D70
      4700EFE6D800B0805B00966949002B2B3B000F0F21004E6684007FAED9000E0E
      20000E0E2000D2CAC000AA774E000000000000000000C6B5A500FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFE700FFEFE700FFE7
      D600FFDEC600D6BDB500634A310000000000000000000000000000000000F1F4
      F8FF6B8CBCFF6D8DBEFF6A8AB9FF6484B1FF718CB3FF89909AFF000000000000
      00000000000000000000000000000000000000000000D9C4AE00F1EADC00F2E6
      D400DFD1BF00EFE9DE00EFE9DE00EFEADE00EFE9DE00F0E9DE00EFEADE00EFE9
      DE00EFEADE00EFE9DE00D9C3AE0000000000AF794F00F0EBDF00F0EBDF00F0EA
      DF00F0EADF00F0EADF00E9E5DB002224360036364500101022000E0E20000E0E
      200010102200E6E0D500AF784F000000000000000000C6B5A500FFFFF700FF9C
      A500C6313100FF947300FFFFF700FFFFF700FFFFF700FFFFF700FFF7E700FFEF
      D600FFE7C600D6C6B500634A310000000000000000000000000000000000EFF2
      F7FF7F9DCAFF799ACAFF6F90C1FF6888B6FF576E8CFF454B54FFF3F4F4FF0000
      00000000000000000000000000000000000000000000DBC6B100DDCDB700B083
      5500C6AB8F00F1ECE200CFB49D00CDB19800CDB19800CDB19900CDB19900CDB0
      9700CDB19900E5D8C900DBC6B10000000000AF7A5000F1ECE100A0734800BB99
      7500F1ECE200E1D2C200DECEBD002120310016182B00161627000E0E20001213
      2500191A2A00EFEADF00AF7950000000000000000000D6B5A500FFFFF700FF84
      8400FFC6C600B5292100FFFFF700C6ADA500C6ADA500B5A59400B5A59400B59C
      9400FFEFD600D6CEC600634A310000000000000000000000000000000000FBFB
      FCFF86A2CDFF81A0CEFF7695C4FF6989B8FF434A54FF404040FFE5E6E7FF0000
      00000000000000000000000000000000000000000000DCC8B400F2E8D800EDCF
      A900BDA08100F1EEE600DBC8B700D9C6B400D9C6B300D9C6B300DAC6B400D9C6
      B400D9C6B400E9E1D400DBC8B30000000000B27C5100F2EFE700FDE8CF00A87E
      5400F1EFE700F3EFE700F2EFE700F1EEE500ECE9E200DBD8D200DBD8D200E9E7
      E000F1EEE600F1EFE600B27C51000000000000000000D6BDA500FFFFF700FFAD
      B500FF848400FF9C9400FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFF7E700D6D6C600634A3100000000000000000000000000000000000000
      00008294AFFF667B9AFF6B7F9EFF647184FF434343FF444444FFF7F8F8FF0000
      00000000000000000000000000000000000000000000DDC9B600F3F0E800F2F0
      E900F2F0E900F2F1E900F2F0E900F2F1E900F2F0E800F3F0E900F3F1E900F2F1
      E900F2F0E900F2F0E800DDCAB60000000000B37D5200F3F0E800F3F1E900F2F0
      E900F2F1E900F3F0E900F2F1E900F2F0E800F3F0E800F3F1E900F3F1E900F2F0
      E900F2F0E900F2F1E800B47C51000000000000000000D6BDA500FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFE700FFEFE700634A310000000000000000000000000000000000FDFD
      FDFFA3A4A6FF737373FF676767FF585858FF4A4A4AFF949494FF000000000000
      00000000000000000000000000000000000000000000C2967300C9A38400C9A3
      8400C9A38400C9A38400C9A48400C9A38400C9A38400C9A38400C9A38400C9A3
      8400C9A38400C9A38400C296730000000000B57D5200B57D5200B57D5200B57D
      5200B57D5200B57E5200B57E5200B57D5200B57D5200B57D5200B57D5200B57D
      5200B57D5200B57D5200B57D52000000000000000000D6BDA500D6BDA500D6BD
      A500D6B5A500D6B5A500C6B5A500C6B5A500C6ADA500C6ADA500C6AD9400C6AD
      9400C6A59400C6A59400C6A59400000000000000000000000000000000000000
      000000000000DDDFE1FFBEBEBFFFABABABFFC0C0C1FFF6F6F6FF000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000008C8C8C005252520094949400000000000000
      000000000000000000000000000000000000000000008C8C8C007B736B008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003100006363000000
      000000000000000000000000000000000000FFFFFF0084B5DE00086BAD001073
      B5001873B5001873B5001873B5001073B500107BB500087BBD00087BBD00007B
      BD00007BBD00006BAD007BADCE00FFFFFF000000000000000000000000000000
      00009C8C8C005A5A5A00B5949400CE9C9C0094737300636363009C8C8C005A5A
      5A008484840000000000000000000000000000000000739CB5007394DE009C6B
      73008C8C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031CECE00009CCE00000031000063
      630000000000000000000000000000000000FFFFFF001084CE00D6EFF700FFFF
      FF00FFFFFF0084BDE7004AA5DE00399CDE00219CD60018A5DE0010A5DE0008A5
      DE00009CDE00008CD600006BAD00FFFFFF00000000000000000000000000CEA5
      A500CE9C9C008C6B6B00B58C8C00CE9C9C00B58C8C0094737300CE9C9C00BD8C
      8C006B6B6B000000000000000000000000000000000094DEFF0039B5FF007384
      D6009C6B73008C8C8C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      0000FF9C00008400000084000000000000009CFFFF000000310031CECE000000
      310000636300000000000000000000000000FFFFFF00188CD600FFFFFF006BB5
      E70094CEEF00FFFFFF00FFFFFF00DEF7FF004AB5E70021ADE70018B5E70010B5
      E70008ADE700009CDE000073BD00FFFFFF0000000000000000007B7B7B00BD94
      9400CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00B58C
      8C004A4A4A006B6B6B007B7B7B00000000000000000000000000A5E7FF0039BD
      FF006B8CDE00946B73008C8C8C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF9C0000FF00
      0000FF000000FF000000FF000000FF000000003131009CFFFF0000003100009C
      CE0000003100000000000063630000000000FFFFFF00218CD600FFFFFF00A5D6
      EF004AA5DE008CC6EF00BDDEF700FFFFFF00C6E7F70029B5E70021B5E70018B5
      E70008B5E70008A5DE00007BBD00FFFFFF0000000000CE9C9C00B58C8C00B58C
      8C00CE9C9C00CE9C9C00CE9C9C00D6ADAD00CE9C9C00CE9C9C00CE9C9C00C694
      9400B58C8C00C6949400635A5A0000000000000000008C8C8C008C8C8C006394
      B50029B5FF006384CE00635A5A00948C8C0084736B008C7B7300736363008C8C
      8C008C8C8C008C8C8C008C8C8C000000000000000000FF9C0000FF0000000000
      000000000000000000000000000000000000000084000000000000FFFF000031
      310031CECE0000FFFF000000000000636300FFFFFF002994DE0073BDE700FFFF
      FF00B5DEF7004AA5DE0042A5DE00FFFFFF00CEEFFF0063C6EF0052C6EF0018B5
      E70010ADE70008A5DE00087BBD00FFFFFF0000000000CE9C9C00CE9C9C00CE9C
      9C00CE9C9C00B5A5A50000000000000000000000000000000000CE9C9C00CE9C
      9C00CE9C9C00CE9C9C00A59494000000000000000000B56B4200B56B4200B56B
      42008CBDD6009CB5C600BD948400FFEFBD00FFFFEF00FFFFFF00FFFFFF00A584
      7B0063312100D69473007342290000000000000000000000000000000000C6C6
      C600319CCE000000000000008400000084000000FF000000000000639C0000FF
      FF0000FFFF0000639C0000FFFF0000000000FFFFFF00319CDE004AA5DE0084BD
      EF00FFFFFF00B5D6F7004AA5DE008CCEEF00FFFFFF00FFFFFF00FFFFFF00CEEF
      FF0042BDE70018A5DE00107BBD00FFFFFF0000000000B5949400CE9C9C00CE9C
      9C00947B7B00000000000000000000000000000000000000000000000000CE9C
      9C00CE9C9C008C737300636363008484840000000000F7D69C00E7FFFF00E7FF
      FF00E7F7FF00CEBDBD00EFCEA500F7F7C600F7F7CE00EFF7DE00F7FFFF00FFFF
      FF0084737300D6F7FF00947B6B00000000000000000000000000C6C6C600319C
      CE00848484000000000000000000000000000000000000000000006363009CFF
      FF00006363000000000000FFFF0000000000FFFFFF00399CDE0052A5E70052AD
      E70084C6EF00FFFFFF00ADD6F70042A5DE005AB5E70042ADE70052BDE700FFFF
      FF00E7F7FF0039ADDE00187BBD00FFFFFF00CEADAD00BD949400CE9C9C00C694
      940073737300000000000000000000000000000000000000000000000000CE9C
      9C00CE9C9C00B58C8C00A58484005252520000000000E7BD8C00CEEFFF00C6D6
      DE00BDD6DE00D6BDA500E7D6AD00DECEA500DEE7C600DEE7DE00E7E7E700FFFF
      EF00BDAD9400A5ADB5008C73630000000000000000000000000000000000C6C6
      C600319CCE00C6C6C60063CEFF0000000000000000000000000000639C009CFF
      FF009CFFFF0000FFFF000000000000639C00FFFFFF0042A5DE005AADE7005AAD
      E70052ADE70094CEEF00FFFFFF005AADE700319CDE00299CDE00219CDE0029A5
      DE00FFFFFF008CCEEF00187BBD00FFFFFF00CE9C9C00CE9C9C00CE9C9C00AD84
      840063636300000000000000000000000000000000000000000000000000CEAD
      AD00CE9C9C00CE9C9C00CE9C9C009C9C9C0000000000E7BD8400CEEFFF00C6DE
      DE00C6CED600DEC6AD00DECEA500D6C6A500DEDEBD00DEE7CE00DEE7CE00EFF7
      D600D6BD9C00A5ADB500947363000000000000000000000000000000000063CE
      FF00C6C6C60063CEFF0094ADAD0000000000319CCE0094ADAD00000000000063
      9C00006363000000000000639C0000000000FFFFFF004AA5DE0063ADE70063AD
      E7005AADE7007BBDE700FFFFFF004AA5DE00319CDE0042A5E70063B5E7002194
      DE00A5D6EF00BDDEF700217BB500FFFFFF00CEADAD00CEADAD00CE9C9C00C694
      94004A4A4A009C9C9C000000000000000000000000000000000000000000CE9C
      9C00CE9C9C00AD848400A58C8C000000000000000000E7BD8400D6EFFF00CEDE
      DE00CED6E700D6BDAD00E7E7BD00DECEAD00DED6AD00E7DEBD00E7E7BD00FFFF
      CE00BD9C8400C6D6DE009473630000000000000000000000000063CEFF00C6C6
      C60063CEFF00EFEFEF0063CEFF0094ADAD000031310063CEFF00000000000000
      000000000000000000000000000000000000FFFFFF0052A5E7006BB5E7006BB5
      E7005AADE70084BDEF00FFFFFF005AADE700399CDE009CCEEF00FFFFFF00399C
      DE00B5DEF700B5DEF700217BB500FFFFFF0000000000C6A5A500CE9C9C00CE9C
      9C008C6B6B00525252009C9C9C00000000000000000000000000B59C9C00CE9C
      9C00CE9C9C009C7B7B00635A5A000000000000000000E7BD8400D6F7FF00CEDE
      DE00CEE7E700C6C6BD00DECEC600EFF7F700EFE7BD00EFD6A500F7EFB500EFCE
      9C00A58C8C00F7FFFF0094735A00000000000000000000000000C6C6C60063CE
      FF00C6C6C60063CEFF000000000000000000319CCE0094ADAD00319CCE008484
      840000000000000000000000000000000000FFFFFF005AADE7007BBDE70073B5
      E70063ADE70063ADE700E7F7FF00C6DEF700429CDE00399CDE0052A5DE0063B5
      E700FFFFFF0073B5E700217BB500FFFFFF0000000000CE9C9C00CE9C9C00CE9C
      9C00CE9C9C008C737300524A4A0052525200636363009C7B7B00CE9C9C00CE9C
      9C00CE9C9C00CE9C9C00A59494000000000000000000EFBD8C00D6EFFF00C6D6
      DE00CEDEDE00C6D6DE00C6B5BD00D6C6BD00E7D6AD00EFDEAD00E7C6A500B59C
      9400C6D6E700FFFFFF0094735200000000000000000000000000000000000000
      000063CEFF00C6C6C60063CEFF000000000094ADAD0000000000000000000000
      000000000000000000000000000000000000FFFFFF006BB5E7008CC6EF0084BD
      EF006BB5E70063B5E70094C6EF00FFFFFF00DEEFFF0094CEEF00ADD6F700FFFF
      FF00B5D6F7003194D600187BB500FFFFFF0000000000D6ADAD00CEADAD00CEA5
      A500CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00BD8C
      8C00A5848400CE9C9C00000000000000000000000000EFC68C00D6F7FF00CEDE
      E700CEDEE700CEE7EF00CEE7EF00C6C6CE00B5ADAD00BDB5BD00C6C6D600D6EF
      F700DEF7FF00FFFFFF0094735A00000000000000000000000000000000000000
      00000000000063CEFF00C6C6C60000000000319CCE0063CEFF00000000000000
      000000000000000000000000000000000000FFFFFF0073BDE7009CCEEF008CC6
      EF007BBDE70073B5E7006BB5E70084C6EF00C6E7F700EFF7FF00D6EFF70094CE
      EF0042A5DE002994D6001873B500FFFFFF00000000000000000000000000D6A5
      A500CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00BD94
      94008484840000000000000000000000000000000000EFC69400DEFFFF00D6EF
      F700D6EFF700D6EFF700D6EFF700D6F7FF00DEF7FF00DEF7FF00DEF7FF00DEF7
      FF00DEF7F700FFFFFF0094735A00000000000000000000000000000000000000
      00000000000000000000000000000000000094ADAD00319CCE00000000000000
      000000000000000000000000000000000000FFFFFF00B5D6F70073BDE70063B5
      E7005AADE70052A5E7004AA5DE004AA5DE004AA5DE0042A5DE00399CDE00399C
      DE003194DE00218CCE008CBDDE00FFFFFF00000000000000000000000000D6AD
      AD00CE9C9C00CEADAD00D6ADAD00CE9C9C00B58C8C00BDA5A500CE9C9C00CE9C
      9C000000000000000000000000000000000000000000BD6B1800BD732100BD73
      2100BD732100BD732100BD732100BD732100BD732100BD732100C67B3100C67B
      2900BD7B3100A5846B0084521800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000D6ADAD00CE9C9C00CE9C9C0000000000000000000000
      00000000000000000000000000000000000000000000DE7B1000E7841800E784
      1000E7841000E77B0800E7841000E7841000E77B0800E77B0000E7841000EF84
      1000E7841800CE844A00AD8C6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE944200CE8C3100D69C
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000734A5A00734A5A00734A5A00734A5A00734A5A00734A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5C6D600217BB500217BB500316B9400314A52003152
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEA55200BD843900000000000000
      0000D69C5200B57B39006B5231006B5231006B5231006B5231006B5231000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C737300C6ADAD00CEB5B500C6ADAD00BD9C9C009C6B6B00734A
      5A00734A5A000000000000000000000000000000000000000000000000000000
      00000000000000000000B5DEF700C6F7F70042D6FF0031C6FF0031ADF700314A
      520021739400314A5200315A7300000000000000000073737300737373007373
      73006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B0000000000000000000000
      000000000000000000000000000000000000EFAD4200AD7B4200000000000000
      00006B523100C67B3100DE943900EFAD4200F7B55200DEB56300EFAD42006B52
      31006B5231000000000000000000000000000000000000000000000000000000
      0000CEA59C00E7E7E700E7DEDE00DED6D600D6BDBD00BDA5A500A56B6B00BD8C
      8C00734A5A0000000000000000000000000000000000A5C6D600217BB500217B
      B500316B940031425200315A7300A5CED600A5C6C60094A5A5008484840073D6
      F70042D6FF0042BDF700425A7300000000006B6B6B00B5634A008C5231008C52
      31008C5231008C5231006B524A006B635A00737373006B6B6B006B6B6B006B6B
      6B006B6B6B0073737300737373006B6B6B00EFB54A00AD7B4200000000006B52
      3100E79C3100F79C3900EF943100EF9C3100F7A53900F7BD5200FFD67300EFCE
      8C00B57B39006B52310000000000000000000000000000000000000000000000
      0000D69C9C00F7F7F700EFEFEF00DEDEDE00D6C6C600BD8C8C00945A5200B584
      8400734A5A000000000000000000000000000000000094B5C600C6F7F70042D6
      FF0031C6FF0031B5F700103952000000000000000000A5CED600107BB5001073
      A500215A730021394200527B940000000000E7634200DE523100FF635200FF73
      5A00F76B4A00D6734200F76B4A00D64A2100315A3900315A3900299C29004A94
      3100299C290021632100315A39006B6B6B00E7AD6300DE9C29006B523100F7A5
      3100EF9C3100E7942900E79429007352310073523100B5732900F7B54200FFD6
      6B00F7D69400B57B390000000000000000000000000000000000000000000000
      000000000000D6A59400F7F7F700E7E7E700D6B5B500A5636300B54A4A00B584
      8400734A5A00000000000000000000000000000000000000000094B5C600A5C6
      C60094A5A500848C9400849CA500000000000000000094B5C600D6FFFF0063DE
      FF0042D6FF0042BDF700315A630000000000D68C5200FF635200FF7B6300FF8C
      6B00D68C5200FFCE9C00F76B5200FF6B5200947B31004AB54A006BAD630063CE
      630052C6520039B53900219421006B6B6B0000000000F7B53900F7AD3100EFA5
      2900E7942900DE8C290084522900000000000000000000000000B5732900F7AD
      3900FFD66B00DEB57B00B57B3900000000000000000000000000000000000000
      000000000000CE8C8C00DEB5B500D6A5A500CE8C8C008C524A0084424200734A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5C6D600106BA5001073
      A500215A730021394200527B94000000000000000000E7634200FF846B00EF84
      5A00FFCE9C00FFCE9C00EF735200FF6B5A0084AD630084B58400FFEFDE004AB5
      4A0073D673004AC64A004A9431006B6B6B0000000000E7B56300F7B53100EFA5
      2900E7942100A56318006B5231006B5231006B5231006B5231006B5231006B52
      31006B5231006B5231006B523100000000000000000000000000000000000000
      000000000000DEA57300FFB52900EFC67B00DEADAD00C66B6B00B54A4A00734A
      5A00734A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084C6D600D6FFFF0063DE
      FF0042D6FF0042BDF700214A6300000000000000000000000000B5634A004A21
      4A00293152007B4A6B00B5634A00947B31007BD67B008CE78C00FFF7EF00BDDE
      AD005AC65A0042A5420000000000000000000000000000000000F7BD3900EFAD
      2900E79C2100D67B2900D67B2900D67B2900D67B2900D67B2900D67B2900D67B
      2900D67B2900D67B2900B57B3900000000000000000000000000000000000000
      0000C6A58400EFAD5200FFAD3900FFB53900FFB53900F7C66B00D6A59400AD6B
      6B00734A5A00734A5A000000000000000000D67B5200944A2100944A2100944A
      21008442210084422100844221008439210084392100C6BDC600006BA5001073
      A500215A730021314200849CA500842121000000000010101000000008000829
      6B001039A5001029940008186B00525252006BAD630042739C00107BBD00217B
      B500317B52004A4A4A000000000000000000000000000000000000000000F7C6
      4200EFAD2900E79C2100DE942100E7942900E7942900E7942900E7942900EF94
      3100F79C3900EFA54200B57B3900000000000000000000000000000000000000
      0000CE949400EFAD5200FFBD4A00FFC65200FFC65200FFC65200FFBD4A00FFB5
      4A00DE945A00734A5A000000000000000000D67B5200C68C7300C6845200B594
      7300D6AD9400E7CEB500C6846300B56B3100C652520084BDE700C6F7F70042D6
      FF0031C6FF0031ADF7002152730084212100393939001818180010295A00184A
      B5001852BD001852B50010299400525252006B9CAD002994F700319CFF00319C
      FF002994F700295A6B00848484000000000000000000EFCE940000000000F7C6
      4200F7C64200BD8429006B4A21000000000000000000B5732900CE8C3100EF94
      2900EF9C3100EF9C3100B57B3900000000000000000000000000000000000000
      0000CEADAD00FFC65200FFCE6300FFCE6B00FFCE6B00FFCE6B00FFCE6300FFC6
      4A00DE945A00734A5A000000000000000000D6845200B5948400D6C6B500E7D6
      C600D6B5A500E7CEC600B58C7300B5734200C6735200D6BDA50084B5E700A5C6
      D600849CB5007384A500D6BD9400842121001010100029292900082994002173
      DE002173D6002173D600185AC6005A6363003994C60042A5FF0042A5FF0042A5
      FF0039A5FF002184C6006B6B6B00000000000000000000000000EFCE94000000
      0000F7C64200E7AD39006B5229005A42290073523100B5732900E79C2900E794
      2900F7A53900B57B39000000000000000000000000000000000000000000C6AD
      9C00DEBDBD00FFD66B00FFD67300FFDE8400FFDE8400FFDE8400FFD67B00FFCE
      6B00CE7B6B00734A5A000000000000000000D68C6300E7D6C600E7BDA500C68C
      6300C6845200D6BDA500E7B59400B57B5200B5735200E7AD8400C69C9400945A
      3100A5634200B5A59400C69C8400842921002929290031313100295A6B003194
      FF00319CFF003194F700216BD6005A636300429CD6004AB5FF004AB5FF004AB5
      FF004AADFF002994E70063636300000000000000000000000000D6BD8C00E7CE
      8C0000000000F7DE8C00E7B53900B5842100CE8C2100E7A52900E79C2100EFA5
      2900EFA53900B57B39000000000000000000000000000000000000000000CEA5
      9C00F7CE9C00FFD67B00FFDE8C00FFE79C00FFE79C00FFE79C00FFE78C00FFD6
      7B00AD636300734A5A000000000000000000E7947300FFFFFF00D69C8400D68C
      6300C68C6300E7DED600C69C8400C6845200B5735200C6947300C6BDB500A55A
      3100945A3100A5633100C6C6C600842921006B6B6B004A4A4A00393939004242
      42001039A5002163C600105A8C007B7B7B0052ADD6004AB5F7004AB5F70052BD
      FF0052B5FF0042ADEF006B6B6B0000000000000000000000000000000000D6BD
      8C00D6BD8C00E7D66300E7D66300F7D64200F7B53100EFAD2900EFAD2900EFA5
      3100B57B390000000000D6BD8C0000000000000000000000000000000000C6AD
      9C00F7D69C00FFDE8C00FFEF9C00FFF7AD00FFF7B500FFF7AD00FFEFA500FFDE
      8C008C524A00734A5A000000000000000000E79C7300E7D6D600F7CEB500D69C
      7300D68C6300F7DED600C69C8400C68C6300B5845200C6947300D6C6B500A563
      3100A5633100B58C7300C6948400843121000000000039393900636363008C8C
      8C00A5A5A5004A4A4A00424242000000000063ADD600217BB50052ADD60063AD
      D600429CD6001073A5006B9CAD00000000000000000000000000000000000000
      000000000000D6BD8C00D6BD8C00D6BD8C00DEB55200FFCE4A00B57B3900B57B
      39000000000000000000D6BD8C0000000000000000000000000000000000CEA5
      9C00B59C8C00DECE9C00E7C69C00FFF7BD00FFFFCE00FFFFC600FFF7AD00FFE7
      940084424200734A5A000000000000000000E7A58400B5A59400E7CEC600F7E7
      E700F7CEB500E7B5A500F7CEB500D6AD9400C69C8400E7BDA500C6948400C6A5
      9400D6BDB500B59C8400A56331008431210000000000000000006B6B6B00635A
      5A00635A5A0063636300000000000000000000000000398CB50084C6E700A5D6
      EF00429CD6006B9CAD0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BD8C00E7CE8C000000
      00000000000000000000D6BD8C0000000000000000000000000000000000D69C
      9C00D69C9C00CEA59C00D6A59400C6B5B500C6AD9C00CEB59400DECE9C00CEB5
      940084424200734A5A000000000000000000E7A58400A58C8400B5948400B5A5
      9400D6C6B500FFF7E700FFF7F700F7F7F700F7F7F700F7E7E700F7DEC600C6AD
      9400A57B6300945A3100A55A2100843921000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000398CB500398C
      B500398CB5000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7CE
      8C00E7CE8C00D6BD8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000D69C9C00D69C9C00D69C9C00D69C9C00C69C
      9C00C69C9C00000000000000000000000000E7A58400E7A58400E7A58400E7A5
      8400E79C8400E79C7300D6947300D68C7300C6846300C67B6300B57B5200B573
      5200B56B4200A5634200A55A4200945231000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00007F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000000000000FE00000000000000FE00000000000000FE00000000000000
      FE00000000000000FF010000000000008001F801FFFFFC07800100008001F003
      800100008001E003800100608001E003800100018001E007800100018001E007
      800100018001E007800100018001F00F800100018001F03F800100018001F03F
      800100018001E03F800100018001E01F800100018001E01F800100018001F01F
      800100018001E03F800100018001F83F8001FE3F8FFFFF1F0000F00787FFFE0F
      0000E00783FFC0070000C001C1FF00010000800180010000000083C180010040
      000087E0800180C0000007E08001C000000007E080018001000003E18001001F
      000081C18001000F000080018001001F000080038001001F0000E0078001000F
      0000E00F8001800F8001FC7F8001E01F8FFFFC0FFC0FFFFF301FF807FC01807F
      3007F007800100002003F007818100000003F807C181000081C1F80FFF818000
      8001F807FF81C003C001F00300008003E001F00300000001A181F00300000001
      D003E00300000001C803E00300000001E005E00300008101F80DE0030000C383
      FF9DE0030000FFC7FFE3FE070000FFFF00000000000000000000000000000000
      000000000000}
  end
  object skidki: TZMySqlTable
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    TableName = 'skidki'
    Left = 176
    Top = 256
  end
  object skidki_s: TDataSource
    DataSet = skidki
    Left = 372
    Top = 452
  end
  object dlg: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'log'
    Filter = 'Text files (*.txt)|*.txt'
    Left = 408
    Top = 456
  end
  object sessions: TZMySqlQuery
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    Sql.Strings = (
      
        'select id,comp,cost,closed, DATE_FORMAT(t,'#39'%Y-%m-%e %H:%i'#39') as t' +
        ' from session order by id desc')
    RequestLive = True
    Left = 372
    Top = 256
  end
  object sessions_ds: TDataSource
    DataSet = sessions
    Left = 158
    Top = 314
  end
  object services_table: TZMySqlTable
    Database = db2
    Transaction = ta2
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doEnableAutoInc, doUseRowId, doRefreshAfterPost, doRefreshBeforeEdit]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    TableName = 'services'
    Left = 332
    Top = 256
  end
  object services_src: TDataSource
    DataSet = services_table
    Left = 348
    Top = 311
  end
  object q_my: TZMySqlQuery
    Database = db1
    Transaction = ta1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    MacroCheck = False
    ParamCheck = False
    RequestLive = True
    Left = 92
    Top = 208
  end
end
