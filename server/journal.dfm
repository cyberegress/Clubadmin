object logfrm: Tlogfrm
  Left = 286
  Top = 293
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1046#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081
  ClientHeight = 450
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object DsGroup1: TDsGroup
    Left = 0
    Top = 0
    Width = 749
    Height = 450
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object DBGrid1: TExDBGrid
      Left = 7
      Top = 15
      Width = 735
      Height = 396
      Cursor = crHandPoint
      BorderStyle = bsNone
      DataSource = DataSource1
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
      CellHints = True
      RowColor1 = 12255087
      RowColor2 = clWindow
      AllowAutoAppend = False
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
          FieldName = 'dt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Width = 109
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'comp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1084#1087'.'
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'money_payed'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072' ('#1082#1086#1087'.)'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'traffic_user'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #1058#1088#1072#1092#1080#1082' ('#1084#1073')'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'comment'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 426
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 672
      Top = 419
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
  end
  object q: TZMySqlQuery
    Database = mainfrm.db
    Transaction = mainfrm.ta
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [moStoreResult]
    Macros = <>
    Sql.Strings = (
      
        'select logs.*, DATE_FORMAT(event_date,'#39'%Y-%m-%e %H:%i'#39') as dt fr' +
        'om logs order by id desc limit 300')
    RequestLive = False
    Active = True
    Left = 520
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = q
    Left = 520
    Top = 48
  end
end
