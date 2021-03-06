object fKanjiDetails: TfKanjiDetails
  Left = 686
  Top = 140
  BorderStyle = bsSizeToolWin
  Caption = '#00159^eCharacter details'
  ClientHeight = 639
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Padding.Left = 6
  Padding.Top = 6
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnKeyPress = FormKeyPress
  OnMouseWheel = FormMouseWheel
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSecond: TPanel
    Left = 6
    Top = 182
    Width = 315
    Height = 457
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlFooter: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 437
      Width = 315
      Height = 18
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alBottom
      BevelOuter = bvNone
      Padding.Right = 6
      TabOrder = 0
      object btnClose: TButton
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 231
        Height = 18
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = '#00170^eClose'
        Default = True
        TabOrder = 0
        OnClick = btnCloseClick
        OnKeyPress = btnCloseKeyPress
      end
      object btnDock: TButton
        Left = 234
        Top = 0
        Width = 75
        Height = 18
        Hint = '#00171^eDocks / undocks this window into main window'
        Align = alRight
        Caption = 'DOCK'
        TabOrder = 1
        OnClick = btnDockClick
      end
    end
    object Scrollbox: TScrollBox
      Left = 0
      Top = 0
      Width = 315
      Height = 435
      VertScrollBar.Tracking = True
      Align = alClient
      BorderStyle = bsNone
      Padding.Right = 6
      PopupMenu = PopupMenu
      TabOrder = 1
      OnClick = ScrollboxClick
      object pbKanjiInfo: TPaintBox
        Left = 0
        Top = 57
        Width = 309
        Height = 200
        Align = alTop
        Color = clBtnFace
        ParentColor = False
        OnClick = ScrollboxClick
        OnMouseDown = pbKanjiInfoMouseDown
        OnMouseMove = pbKanjiInfoMouseMove
        OnMouseUp = pbKanjiInfoMouseUp
        OnPaint = pbKanjiInfoPaint
        ExplicitLeft = 2
        ExplicitTop = 208
        ExplicitWidth = 295
      end
      object pnlCategories: TFlowPanel
        Left = 0
        Top = 15
        Width = 309
        Height = 17
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Padding.Bottom = 2
        ParentFont = False
        TabOrder = 0
        OnClick = ScrollboxClick
      end
      object pnlLinks: TFlowPanel
        Left = 0
        Top = 0
        Width = 309
        Height = 15
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        Padding.Bottom = 2
        TabOrder = 1
        OnClick = ScrollboxClick
      end
      object pnlOldCategories: TFlowPanel
        Left = 0
        Top = 32
        Width = 309
        Height = 25
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Padding.Bottom = 4
        ParentFont = False
        TabOrder = 2
        OnClick = ScrollboxClick
        object cbCategories: TComboBox
          Left = 0
          Top = 0
          Width = 127
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = cbCategoriesChange
        end
        object btnAddToCategory: TSpeedButton
          Left = 127
          Top = 0
          Width = 24
          Height = 21
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnAddToCategoryClick
        end
      end
    end
  end
  object pnlFirst: TPanel
    Left = 6
    Top = 6
    Width = 315
    Height = 176
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ShapeKanji: TShape
      Left = 0
      Top = 0
      Width = 153
      Height = 153
      Brush.Color = clWindow
    end
    object pbKanji: TPaintBox
      Left = 8
      Top = 8
      Width = 137
      Height = 137
      Color = clBtnFace
      ParentColor = False
      OnPaint = pbKanjiPaint
    end
    object lblMeaning: TLabel
      Left = 160
      Top = 88
      Width = 151
      Height = 60
      AutoSize = False
      Caption = '-'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object ShapeRadical: TShape
      Left = 160
      Top = 16
      Width = 65
      Height = 65
      Brush.Color = clWindow
    end
    object pbRadical: TPaintBox
      Left = 168
      Top = 24
      Width = 49
      Height = 49
      Color = clBtnFace
      ParentColor = False
      OnDblClick = pbRadicalDblClick
      OnMouseDown = pbRadicalMouseDown
      OnMouseMove = pbRadicalMouseMove
      OnMouseUp = pbRadicalMouseUp
      OnPaint = pbRadicalPaint
    end
    object ShapeSimplified: TShape
      Left = 240
      Top = 16
      Width = 65
      Height = 65
      Brush.Color = clWindow
    end
    object RxLabel10: TLabel
      Left = 160
      Top = 0
      Width = 105
      Height = 13
      Caption = '#00160^eRadical:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RxLabel35: TLabel
      Left = 240
      Top = 0
      Width = 35
      Height = 13
      Caption = 'Simpl:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblRadicalNo: TLabel
      Left = 219
      Top = 67
      Width = 3
      Height = 13
      Alignment = taRightJustify
      Caption = ' '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object btnStrokeOrder: TSpeedButton
      Left = -1
      Top = 153
      Width = 82
      Height = 19
      Hint = '#00168^Show/hide stroke order (only for Japanese Jouyou-kanji)'
      AllowAllUp = True
      GroupIndex = 99
      Caption = '#00162^Strokes:'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnStrokeOrderClick
    end
    object btnGoToWords: TSpeedButton
      Left = 80
      Top = 153
      Width = 73
      Height = 19
      Hint = '#01119^Show words with this kanji in the dictionary'
      Caption = '#01118^Words'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGoToWordsClick
    end
    object lblCharClass: TLabel
      Left = 4
      Top = 4
      Width = 57
      Height = 13
      Caption = 'Kanji type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object pbSimplified: TPaintBox
      Left = 248
      Top = 24
      Width = 49
      Height = 49
      OnMouseDown = pbSimplifiedMouseDown
      OnMouseMove = pbSimplifiedMouseMove
      OnMouseUp = pbSimplifiedMouseUp
      OnPaint = pbSimplifiedPaint
    end
    object btnGoToChars: TSpeedButton
      Left = 153
      Top = 153
      Width = 73
      Height = 19
      Hint = '#01239^Locate this character in the kanji grid'
      Caption = '#01238^Go to grid'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGoToCharsClick
    end
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = False
    IniSection = '\Software\Labyrinth\Wakan\DetailPos'
    Left = 40
    Top = 24
  end
  object pmCategoryMenu: TPopupMenu
    Left = 32
    Top = 256
    object pmGoToCategory: TMenuItem
      Caption = '#01113^Go to category'
      OnClick = pmGoToCategoryClick
    end
    object pmAddToAll: TMenuItem
      Caption = '#01114^Add to all'
      OnClick = pmAddToAllClick
    end
    object pmDelete: TMenuItem
      Caption = '#01115^Delete'
      OnClick = pmDeleteClick
    end
  end
  object pmAddCategoryMenu: TPopupMenu
    Left = 32
    Top = 312
  end
  object PopupMenu: TPopupMenu
    Left = 120
    Top = 256
    object Configure1: TMenuItem
      Caption = '#01116^Configure...'
      OnClick = Configure1Click
    end
  end
end
