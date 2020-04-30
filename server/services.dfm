object servicesfrm: Tservicesfrm
  Left = 410
  Top = 178
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
  ClientHeight = 294
  ClientWidth = 418
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
    Width = 418
    Height = 294
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    DesignSize = (
      418
      294)
    object RxLabel1: TRxLabel
      Left = 7
      Top = 245
      Width = 64
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
    end
    object RxLabel2: TRxLabel
      Left = 83
      Top = 270
      Width = 50
      Height = 13
      Caption = #1050' '#1086#1087#1083#1072#1090#1077':'
    end
    object hrn: TRxLabel
      Left = 135
      Top = 270
      Width = 24
      Height = 13
      Caption = '000'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object RxLabel3: TRxLabel
      Left = 159
      Top = 270
      Width = 22
      Height = 13
      Caption = #1075#1088#1085'.'
    end
    object kop: TRxLabel
      Left = 183
      Top = 270
      Width = 17
      Height = 13
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel4: TRxLabel
      Left = 199
      Top = 270
      Width = 23
      Height = 13
      Caption = #1082#1086#1087'.'
    end
    object ExDBGrid1: TExDBGrid
      Left = 9
      Top = 16
      Width = 400
      Height = 222
      Cursor = crHandPoint
      BorderStyle = bsNone
      DataSource = services_src
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = Button1Click
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
          Title.Caption = 'ID'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'title'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
          Width = 253
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cost_string'
          Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
          Width = 95
          Visible = True
        end>
    end
    object count: TRxSpinEdit
      Left = 8
      Top = 262
      Width = 64
      Height = 21
      Alignment = taRightJustify
      ButtonKind = bkStandard
      MaxValue = 1000
      MinValue = 1
      Color = clInfoBk
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = countChange
    end
    object Button1: TButton
      Left = 257
      Top = 257
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 339
      Top = 257
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 3
    end
  end
  object services_table: TZMySqlQuery
    Database = mainfrm.db
    Transaction = mainfrm.ta
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = services_tableAfterScroll
    ExtraOptions = [moStoreResult]
    Macros = <>
    MacroCheck = False
    ParamCheck = False
    Sql.Strings = (
      
        'select services.*, CONCAT(truncate(cost/100,0)," '#1075#1088#1085'. ",cost%100' +
        '," '#1082#1086#1087'.") as cost_string from services order by title')
    RequestLive = True
    Left = 376
    Top = 60
  end
  object services_src: TDataSource
    DataSet = services_table
    Left = 376
    Top = 92
  end
end
