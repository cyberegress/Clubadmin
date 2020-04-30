object Form8: TForm8
  Left = 577
  Top = 361
  ActiveControl = BitBtn1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
  ClientHeight = 216
  ClientWidth = 185
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
  object GroupBox1: TDsGroup
    Left = 0
    Top = 0
    Width = 185
    Height = 216
    Align = alClient
    Color_High = clBtnHighlight
    Color_Low = clBtnShadow
    TabOrder = 0
    object BitBtn1: TButton
      Left = 16
      Top = 184
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object DBGrid1: TExDBGrid
      Left = 6
      Top = 15
      Width = 171
      Height = 161
      Cursor = crHandPoint
      BorderStyle = bsNone
      DataSource = Form6.ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
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
          FieldName = 'User'
          Title.Caption = #1051#1086#1075#1080#1085
          Width = 118
          Visible = True
        end>
    end
    object BitBtn2: TButton
      Left = 99
      Top = 184
      Width = 70
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
    end
  end
end
