object fKanjiSearch: TfKanjiSearch
  Left = 359
  Top = 186
  BorderStyle = bsNone
  Caption = '#00174^eSearch characters'
  ClientHeight = 206
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 426
    Top = 0
    Width = 144
    Height = 206
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      144
      206)
    object btnOnlyCommon: TSpeedButton
      Left = 4
      Top = 129
      Width = 131
      Height = 22
      Hint = '#00186^eDisplay only common characters'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 20
      Caption = '#00187^eCommon'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbPinYinClick
      ExplicitTop = 131
    end
    object btnInClipboard: TSpeedButton
      Left = 4
      Top = 152
      Width = 131
      Height = 22
      Hint = '#00188^eDisplay only characters in clipboard'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 21
      Caption = '#00189^eIn clipboard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbPinYinClick
      ExplicitTop = 154
    end
    object sbClearFilters: TSpeedButton
      Left = 4
      Top = 175
      Width = 131
      Height = 22
      Hint = '#00182^eDisplay all characters (Ctrl-N)'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      Caption = '#00183^eAll filters off'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbClearFiltersClick
      ExplicitTop = 177
    end
    object rgSortBy: TRadioGroup
      Left = 6
      Top = 7
      Width = 129
      Height = 117
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '#00197^eSort by'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        '#00146^eRadical'
        '#00147^eStroke count'
        '#00148^eFrequency'
        '#00198^eLearner index'
        'Gakken Kanji'
        'Remembering Kanji'
        '#00149^eRandom')
      ParentFont = False
      TabOrder = 0
      OnClick = rgSortByClick
    end
  end
  object Panel2: TPanel
    Left = 274
    Top = 0
    Width = 152
    Height = 206
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      152
      206)
    object SpeedButton1: TSpeedButton
      Left = 58
      Top = 148
      Width = 23
      Height = 22
      Hint = '#00881^eAdd category'
      Anchors = [akLeft, akBottom]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
      ExplicitTop = 150
    end
    object SpeedButton19: TSpeedButton
      Left = 81
      Top = 148
      Width = 23
      Height = 22
      Hint = '#00880^eUncheck all categories'
      Anchors = [akLeft, akBottom]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton19Click
      ExplicitTop = 150
    end
    object SpeedButton20: TSpeedButton
      Left = 104
      Top = 148
      Width = 23
      Height = 22
      Hint = '#00030^eEdit category'
      Anchors = [akLeft, akBottom]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton20Click
      ExplicitTop = 150
    end
    object SpeedButton25: TSpeedButton
      Left = 127
      Top = 148
      Width = 23
      Height = 22
      Hint = '#00031^eDelete category'
      Anchors = [akLeft, akBottom]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton25Click
      ExplicitTop = 150
    end
    object rgOrAnd: TRadioGroup
      Left = 2
      Top = 152
      Width = 53
      Height = 44
      Anchors = [akLeft, akBottom]
      ItemIndex = 0
      Items.Strings = (
        'OR'
        'AND')
      TabOrder = 0
      OnClick = rgOrAndClick
    end
    object cbNot: TCheckBox
      Left = 60
      Top = 178
      Width = 81
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'NOT'
      TabOrder = 1
      OnClick = rgOrAndClick
    end
    object lbCategories: TCheckListBox
      Left = 2
      Top = 6
      Width = 148
      Height = 142
      OnClickCheck = lbCategoriesClickCheck
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 2
      OnClick = lbCategoriesClick
      OnDblClick = lbCategoriesDblClick
      OnDrawItem = lbCategoriesDrawItem
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 274
    Height = 206
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 2
    DesignSize = (
      274
      206)
    object sbJouyouExpand: TSpeedButton
      Left = 226
      Top = 145
      Width = 22
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '-/+'
      OnClick = sbJouyouExpandClick
      ExplicitLeft = 384
    end
    object sbJouyouMinus: TSpeedButton
      Left = 209
      Top = 145
      Width = 17
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '-'
      OnClick = sbJouyouMinusClick
      ExplicitLeft = 367
    end
    object sbJouyouPlus: TSpeedButton
      Left = 192
      Top = 145
      Width = 17
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '+'
      OnClick = sbJouyouPlusClick
      ExplicitLeft = 350
    end
    object sbJouyouShrink: TSpeedButton
      Left = 248
      Top = 145
      Width = 22
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '+/-'
      OnClick = sbJouyouShrinkClick
      ExplicitLeft = 406
    end
    object sbStrokeCountExpand: TSpeedButton
      Left = 226
      Top = 74
      Width = 22
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '-/+'
      OnClick = sbStrokeCountExpandClick
      ExplicitLeft = 384
    end
    object sbStrokeCountMinus: TSpeedButton
      Left = 209
      Top = 74
      Width = 17
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '-'
      OnClick = sbStrokeCountMinusClick
      ExplicitLeft = 367
    end
    object sbStrokeCountPlus: TSpeedButton
      Left = 192
      Top = 74
      Width = 17
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '+'
      OnClick = sbStrokeCountPlusClick
      ExplicitLeft = 350
    end
    object sbStrokeCountShrink: TSpeedButton
      Left = 248
      Top = 74
      Width = 22
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '+/-'
      OnClick = sbStrokeCountShrinkClick
      ExplicitLeft = 406
    end
    object cbOtherType: TComboBox
      Left = 3
      Top = 170
      Width = 110
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbOtherTypeChange
    end
    object edtDefinition: TEdit
      Left = 3
      Top = 51
      Width = 267
      Height = 21
      Hint = '#00179^eFilter by definition (meaning) (Ctrl-M)'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = '#00180^eDefinition'
      OnChange = edtDefinitionChange
    end
    object edtJouyou: TEdit
      Left = 4
      Top = 147
      Width = 182
      Height = 21
      Hint = '#00194^eFilter by Jouyou grade (Japanese school grade)'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TextHint = '#00963^eJouyou'
      OnChange = edtJouyouChange
    end
    object edtPinYin: TButtonedEdit
      Left = 3
      Top = 3
      Width = 267
      Height = 21
      Hint = '#00175^eFilter by PinYin (chinese reading) (Ctrl-I)'
      Anchors = [akLeft, akTop, akRight]
      DoubleBuffered = True
      Images = ImageList1
      LeftButton.ImageIndex = 0
      ParentDoubleBuffered = False
      ParentShowHint = False
      RightButton.ImageIndex = 0
      ShowHint = True
      TabOrder = 3
      TextHint = '#00964^e&PinYin'
      OnChange = edtPinYinChange
      OnLeftButtonClick = edtPinYinLeftButtonClick
      OnRightButtonClick = edtPinYinLeftButtonClick
    end
    object edtSkip: TEdit
      Left = 4
      Top = 123
      Width = 266
      Height = 21
      Hint = '#00181^eFilter by SKIP code (see KANJIDIC for explanation)'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      TextHint = '#00962^eSKIP'
      OnChange = edtSkipChange
    end
    object edtStrokeCount: TEdit
      Left = 3
      Top = 75
      Width = 184
      Height = 21
      Hint = 
        '#00190^eFilter by stroke count (you can search by range, ex. 1-6' +
        ')'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TextHint = '#00191^eStroke #'
      OnChange = edtStrokeCountChange
    end
    object edtYomi: TEdit
      Left = 3
      Top = 27
      Width = 267
      Height = 21
      Hint = '#00176^eFilter by japanese reading (Ctrl-Y)'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TextHint = '#00965^eYomi'
      OnChange = edtYomiChange
    end
    object pbRadicals: TWakanPaintbox
      Left = 3
      Top = 98
      Width = 267
      Height = 22
      Cursor = crHandPoint
      Hint = '#00177^eFilter by radical (Ctrl-R)'
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      DoubleBuffered = True
      ShowHint = True
      ParentShowHint = False
      OnPaint = pbRadicalsPaint
      OnClick = sbListRadicalsClick
    end
    object edtOther: TEdit
      Left = 113
      Top = 170
      Width = 157
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      TextHint = '#00193^eOther'
      OnChange = edtJouyouChange
    end
  end
  object ImageList1: TImageList
    Left = 296
    Top = 32
    Bitmap = {
      494C010101000800240010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000DEDEDEFFDCDCDCFFDCDCDCFFDCDC
      DCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDC
      DCFFDCDCDCFFDCDCDCFFDCDCDCFFC1C1C1FB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEAEAFFEBE8E8FFEBE8E8FFEBE8
      E8FFEBE8E8FFEBE8E8FFEBE8E8FFEBE8E8FFEBE8E8FFEBE8E8FFEBE8E8FFEBE8
      E8FFEBE8E8FFEBE8E8FFEBE8E8FFDBDBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECE8E8FFEBE7E7FFEBE7E7FFEBE7
      E7FFEBE7E7FFEBE7E7FFEBE7E7FFEBE7E7FFEBE7E7FFEBE7E7FFEBE7E7FFEBE7
      E7FFEBE7E7FFEBE7E7FFEAE6E6FFDBDBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EBE6E6FFE8E5E5FFE8E5E5FFE8E5
      E5FFF4F0F0FFEBE7E7FFE8E5E5FFE8E5E5FFE8E5E5FFE8E4E4FFF6F2F2FFE9E5
      E5FFE8E5E5FFE8E5E5FFE8E4E4FFDBDBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9E5E5FFE8E3E3FFE8E3E3FFFDFA
      FAFF474747FF4E4F50FFECE7E7FFE8E3E3FFE7E1E1FFEEF0F0FF505050FFC6C2
      C2FFE8E3E3FFE8E3E3FFE7E2E2FFDBDBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E8E3E3FFE7E1E1FFE6DFDFFF7D7D
      7DFF5D5D5FFF5D5D5FFF545555FFE9E4E4FFEDECEDFF5B5B5CFF5D5D5FFF5757
      59FFE7E2E2FFE7E1E1FFE6E0E0FFDBDBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E0E0FFE6E0E0FFE6E0E0FFE7E1
      E1FF686A69FF646466FF646466FF5F5F61FF636364FF646466FF626364FFCAC5
      C5FFE6E0E0FFE6E0E0FFE5DFDFFFDBDBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E1E1FFE6DFDFFFE6DFDFFFE6DF
      DFFFE7DFDFFF717071FF6D6D6DFF6D6D6DFF6D6D6DFF6B6B6BFFCBC3C3FFE6DF
      DFFFE6DFDFFFE6DFDFFFE5DEDEFFDBDCDCFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDE6E6FFEBE4E4FFEBE4E4FFEBE4
      E4FFEBE4E4FFF4F2F4FF737373FF757575FF757575FF706F71FFF0E7E7FFEBE4
      E4FFEBE4E4FFEBE4E4FFEBE4E4FFDBDBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5EFEFFFF4EDEDFFF4EDEDFFF3EC
      ECFFF5F4F3FF79797AFF7B7B7DFF7A7A7CFF7B7B7DFF7B7B7DFF747575FFF6F0
      F0FFF4EDEDFFF4EDEDFFF3ECECFFDADBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F2F2FFF4F0F0FFF4F0F0FFF4F3
      F3FF808081FF828284FF818182FFDAD4D5FF878687FF828284FF828284FF7C7D
      7DFFF7F0F0FFF4F0F0FFF4EFEFFFDADADAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F5F5FFF7F3F3FFF6F3F3FFE7E5
      E5FF878788FF878788FFDAD7D7FFF7F3F3FFF9F4F4FF8C8C8CFF88888AFF8081
      82FFF6F0F0FFF7F3F3FFF6F2F2FFDADADAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCF8F8FFF9F6F6FFF9F6F6FFF8F5
      F5FFE5E3E3FFDBD9D9FFF9F6F6FFF9F6F6FFF9F6F6FFFBF7F7FF9A999AFFF8F5
      F5FFF9F6F6FFF9F6F6FFF8F5F5FFDADADAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFAFAFFFBF9F9FFFBF9F9FFFBF9
      F9FFFBF9F9FFFBF9F9FFFBF9F9FFFBF9F9FFFBF9F9FFFBF9F9FFFBF9F9FFFBF9
      F9FFFBF9F9FFFBF9F9FFFAF8F8FFD9DADAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFEFFFDFCFCFFFDFCFCFFFDFC
      FCFFFDFCFCFFFDFCFCFFFDFCFCFFFDFCFCFFFDFCFCFFFDFCFCFFFDFCFCFFFDFC
      FCFFFDFCFCFFFDFCFCFFFDFCFCFFD9D9D9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
