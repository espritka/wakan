object fUser: TfUser
  Left = 57
  Top = 137
  Width = 712
  Height = 252
  BorderStyle = bsSizeToolWin
  Caption = '#00642^eDictionary lookup^cHled�n�Eve slovn��u'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 216
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 11
      Top = 4
      Width = 110
      Height = 22
      Hint = 
        '#00643^eSearch by japanese reading (F2)^cHledat podle japonsk�ho' +
        ' �ten� (F2)'
      AllowAllUp = True
      GroupIndex = 1
      Down = True
      Caption = '#00644^eJ -> E^cJ -> A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 123
      Top = 4
      Width = 107
      Height = 22
      Hint = 
        '#00645^eSearch by english meaning (F3)^cHledat podle anglick�ho ' +
        'v�znamu (F3)'
      AllowAllUp = True
      GroupIndex = 1
      Caption = '#00646^e&E -> J^cA -> J'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 232
      Top = 4
      Width = 73
      Height = 22
      Hint = 
        '#00647^eSearch by Kanji stored in clipboard (F4)^cHledat podle z' +
        'nak� ve schr�nce (F4)'
      AllowAllUp = True
      GroupIndex = 1
      Caption = '#00289^eBy clipboard^cPodle schr�nky'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Shape11: TShape
      Left = 10
      Top = 63
      Width = 687
      Height = 124
      Anchors = [akLeft, akTop, akRight, akBottom]
      Brush.Color = clWindow
    end
    object Label16: TLabel
      Left = 30
      Top = 90
      Width = 482
      Height = 19
      Caption = '#00155^eNo words were found.^c��dn� slova nebyla nalezena.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object SpeedButton5: TSpeedButton
      Left = 290
      Top = 195
      Width = 128
      Height = 17
      Hint = '#00648^eSelected word (Ctrl-Alt-F)^cVybran� slovo (Ctrl-Alt-F)'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 2
      Caption = '#00649^eSelected word^cVybran� slovo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 7
      Top = 195
      Width = 123
      Height = 17
      Hint = '#00650^eCharacters in word^cZnaky ve slov�'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 6
      Caption = '#00651^eChar. in word^cZnaky ve slov�'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 271
      Top = 195
      Width = 123
      Height = 17
      Hint = '#00652^eInformation (Ctrl-Alt-I)^cInformace (Ctrl-Alt-I)'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 3
      Caption = '#00653^eWord information^cInformace o slovu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = SpeedButton7Click
    end
    object SpeedButton8: TSpeedButton
      Left = 305
      Top = 195
      Width = 117
      Height = 17
      Hint = 
        '#00654^eEditor && translator  (Ctrl-Alt-E)^cEditace a p�eklad (C' +
        'trl-Alt-E)'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 5
      Caption = '#00655^eEditor / translator^cEditace / p�eklad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = SpeedButton8Click
    end
    object SpeedButton9: TSpeedButton
      Left = 135
      Top = 195
      Width = 130
      Height = 17
      Hint = '#00062^eAdd to vocabulary^cP�idat do slov��ek'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 4
      Caption = '#00315^eExamples^cP��klady'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton9Click
    end
    object SpeedButton10: TSpeedButton
      Left = 311
      Top = 4
      Width = 23
      Height = 22
      Hint = '#00656^eSearch exact word (F5)^cHledat p�esn� slovo (F5)'
      GroupIndex = 7
      Down = True
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton11: TSpeedButton
      Left = 335
      Top = 4
      Width = 23
      Height = 22
      Hint = '#00657^eSearch beginning (F6)^cHledat za��tek (F6)'
      GroupIndex = 7
      Caption = 'A+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton12: TSpeedButton
      Left = 359
      Top = 4
      Width = 23
      Height = 22
      Hint = '#00658^eSearch end (F7)^cHledat konec (F7)'
      GroupIndex = 7
      Caption = '+A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton23: TSpeedButton
      Left = 617
      Top = 187
      Width = 80
      Height = 22
      Hint = '#00659^eInsert word into clipboard^cVlo�it slovo do schr�nky'
      Anchors = [akRight, akBottom]
      Caption = '#00660^eClipboard^cSchr�nka'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton23Click
    end
    object Label1: TLabel
      Left = 8
      Top = 211
      Width = 32
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Label1'
      Visible = False
    end
    object SpeedButton4: TSpeedButton
      Left = 414
      Top = 4
      Width = 23
      Height = 22
      Hint = 
        '#00661^eSearch for inflected words / conjugated verbs^cHledat in' +
        'flektovan� slova'
      AllowAllUp = True
      GroupIndex = 8
      Caption = 'Inf'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton13: TSpeedButton
      Left = 438
      Top = 4
      Width = 33
      Height = 22
      Hint = 
        '#00662^eAuto-preview while typing (full search with arrow button' +
        ')^cAutomatick� n�hled p�i psan� (pln� seznam na tla��tku s �ipko' +
        'u)'
      AllowAllUp = True
      GroupIndex = 9
      Caption = 'Auto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton14: TSpeedButton
      Left = 478
      Top = 4
      Width = 25
      Height = 22
      Hint = 
        '#00663^eUse dictionaries in group 1 (Ctrl-1)^cPou��t slovn�ky ve' +
        ' skupin� 1 (Ctrl-1)'
      GroupIndex = 10
      Down = True
      Caption = 'D1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton15: TSpeedButton
      Left = 504
      Top = 4
      Width = 25
      Height = 22
      Hint = 
        '#00664^eUse dictionaries in group 2 (Ctrl-2)^cPou��t slovn�ky ve' +
        ' skupin� 2 (Ctrl-2)'
      GroupIndex = 10
      Caption = 'D2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton16: TSpeedButton
      Left = 530
      Top = 4
      Width = 25
      Height = 22
      Hint = 
        '#00665^eUse dictionaries in group 3 (Ctrl-3)^cPou��t slovn�ky ve' +
        ' skupin� 3 (Ctrl-3)'
      GroupIndex = 10
      Caption = 'D3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 522
      Top = 37
      Width = 174
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '#00666^eAll visible^cV�e zobrazeno'
      Enabled = False
    end
    object SpeedButton17: TSpeedButton
      Left = 521
      Top = 187
      Width = 94
      Height = 22
      Hint = '#00667^eInsert word into vocabulary^cVlo�it slovo do slov��ek'
      Anchors = [akRight, akBottom]
      Caption = '#00215^eVocabulary^cSlov��ka'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton17Click
    end
    object Label3: TLabel
      Left = 688
      Top = 17
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '0'
    end
    object SpeedButton18: TSpeedButton
      Left = 383
      Top = 4
      Width = 25
      Height = 22
      Hint = '#00930^eSearch middle^cHledat prost�edek'
      GroupIndex = 7
      Caption = '+A+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton19: TSpeedButton
      Left = 425
      Top = 187
      Width = 94
      Height = 22
      Hint = 
        '#00931^eGo to this word in vocabulary^cP�ej�t na toto slovo ve s' +
        'lov��k�ch'
      Anchors = [akRight, akBottom]
      Caption = '#00215^eVocabulary^cSlov��ka'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton19Click
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 616
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = Edit1Change
      OnClick = Edit1Click
    end
    object StringGrid1: TStringGrid
      Left = 11
      Top = 65
      Width = 685
      Height = 121
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      ColCount = 3
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect, goThumbTracking]
      TabOrder = 1
      OnDblClick = StringGrid1DblClick
      OnDrawCell = StringGrid1DrawCell
      OnMouseDown = StringGrid1MouseDown
      OnMouseMove = StringGrid1MouseMove
      OnMouseUp = StringGrid1MouseUp
      OnSelectCell = StringGrid1SelectCell
      ColWidths = (
        131
        128
        575)
    end
    object BitBtn1: TBitBtn
      Left = 626
      Top = 32
      Width = 70
      Height = 25
      Hint = 
        '#00668^eSearch results did not fit one page, click to display ev' +
        'erything^cV�sledky hled�n� se neve�ly na jednu stranu, stiskni p' +
        'ro zobrazen� v�eho'
      Anchors = [akTop, akRight]
      Caption = '#00669^eSearch^cHledat'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 216
    Width = 696
    Height = 0
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 696
    Top = 0
    Width = 0
    Height = 216
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.txt'
    Filter = 
      'Text file (all supported formats) (*.txt)|*.txt|WaKan text with ' +
      'translations (*.wtt)|*.wtt|Any file (all supported formats) (*.*' +
      ')|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 247
    Top = 84
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = 
      'Text file (*.txt)|*.txt|WaKan text with translations (*.wtt)|*.w' +
      'tt'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 279
    Top = 84
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'UTF-8 annotation file (*.txt)|*.txt'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 311
    Top = 82
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 352
    Top = 88
  end
end