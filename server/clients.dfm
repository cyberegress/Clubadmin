object Form15: TForm15
  Left = 615
  Top = 569
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1092#1080#1083#1080
  ClientHeight = 247
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TDsGroup
    Left = 0
    Top = 199
    Width = 371
    Height = 48
    Align = alBottom
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object RxSpeedButton2: TRxSpeedButton
      Left = 8
      Top = 16
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081
      Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081
      Flat = True
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
      Layout = blGlyphLeft
      OnClick = RxSpeedButton2Click
    end
    object RxSpeedButton1: TRxSpeedButton
      Left = 101
      Top = 16
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Hint = #1057#1083#1077#1076#1091#1102#1097#1080#1081
      Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000012000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFCFFFFFCFFFFFFF00
        0000FFFFCCFFFFCCFFFFFF000000FFFFCCCFFFCCCFFFFF000000FFFFCCCCFFCC
        CCFFFF000000FFFFCCCFFFCCCFFFFF000000FFFFCCFFFFCCFFFFFF000000FFFF
        CFFFFFCFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF000000}
      Layout = blGlyphRight
      OnClick = RxSpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 220
      Top = 16
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 294
      Top = 16
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TExDBGrid
    Left = 2
    Top = 1
    Width = 386
    Height = 200
    Cursor = crHandPoint
    BorderStyle = bsNone
    Color = clWhite
    DataSource = DataSource1
    FixedColor = clSilver
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
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
        FieldName = 'id'
        Title.Caption = #8470
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'name'
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1103
        Width = 252
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'end'
        Title.Caption = #1044#1086':'
        Width = 80
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = clients
    Left = 400
  end
  object clients: TZMySqlQuery
    Database = mainfrm.db
    Transaction = mainfrm.ta
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
      'select * from clients where skidka<1 order by id;')
    RequestLive = False
    Left = 120
    Top = 80
  end
end
