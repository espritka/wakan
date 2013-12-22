unit JWBKanjiSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, CheckLst, JWBStrings, JWBRadical, WakanPaintbox;

type
  TfKanjiSearch = class(TForm)
    Bevel: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnInClipboard: TSpeedButton;
    btnOnlyCommon: TSpeedButton;
    cbNot: TCheckBox;
    cbOtherType: TComboBox;
    edtDefinition: TEdit;
    edtJouyou: TEdit;
    edtOther: TEdit;
    edtPinYin: TEdit;
    edtSkip: TEdit;
    edtStrokeCount: TEdit;
    edtYomi: TEdit;
    lbCategories: TCheckListBox;
    pbRadicals: TWakanPaintbox;
    rgOrAnd: TRadioGroup;
    rgSortBy: TRadioGroup;
    sbClearFilters: TSpeedButton;
    sbDefinition: TSpeedButton;
    sbJouyou: TSpeedButton;
    sbJouyouExpand: TSpeedButton;
    sbJouyouMinus: TSpeedButton;
    sbJouyouPlus: TSpeedButton;
    sbJouyouShrink: TSpeedButton;
    sbListRadicals: TSpeedButton;
    sbOther: TSpeedButton;
    sbPinYin: TSpeedButton;
    sbRadicals: TSpeedButton;
    sbSKIP: TSpeedButton;
    sbStrokeCount: TSpeedButton;
    sbStrokeCountExpand: TSpeedButton;
    sbStrokeCountMinus: TSpeedButton;
    sbStrokeCountPlus: TSpeedButton;
    sbStrokeCountShrink: TSpeedButton;
    sbYomi: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton25: TSpeedButton;
    procedure sbPinYinClick(Sender: TObject);
    procedure sbClearFiltersClick(Sender: TObject);
    procedure edtPinYinChange(Sender: TObject);
    procedure edtYomiChange(Sender: TObject);
    procedure edtDefinitionChange(Sender: TObject);
    procedure edtSkipChange(Sender: TObject);
    procedure edtOtherChange(Sender: TObject);
    procedure edtStrokeCountChange(Sender: TObject);
    procedure edtJouyouChange(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure sbListRadicalsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbStrokeCountPlusClick(Sender: TObject);
    procedure sbStrokeCountMinusClick(Sender: TObject);
    procedure sbStrokeCountExpandClick(Sender: TObject);
    procedure sbStrokeCountShrinkClick(Sender: TObject);
    procedure sbJouyouPlusClick(Sender: TObject);
    procedure sbJouyouMinusClick(Sender: TObject);
    procedure sbJouyouExpandClick(Sender: TObject);
    procedure sbJouyouShrinkClick(Sender: TObject);
    procedure rgSortByClick(Sender: TObject);
    procedure cbOtherTypeChange(Sender: TObject);
    procedure pbRadicalsPaint(Sender: TObject; Canvas: TCanvas);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lbCategoriesClick(Sender: TObject);
    procedure lbCategoriesClickCheck(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure lbCategoriesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure rgOrAndClick(Sender: TObject);
    procedure lbCategoriesDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  protected
   { Currently selected radical indexes/characters. Kept in sync by Set* functions,
    you only have to set one. }
    FCurRadIndexes: string;
    FCurRadChars: string;
    procedure SetCurRadIndexes(const Value: string);
    procedure SetCurRadChars(const Value: string);
    procedure RadicalSelectionChanged(Sender: TObject);
    function OffsetRange(tx:string;min,max:integer):string;
  public
    curRadSearchType: TRadSearchType;
    procedure ReloadOtherTypes;
    property CurRadIndexes: string read FCurRadIndexes write SetCurRadIndexes;
    property CurRadChars: string read FCurRadChars write SetCurRadChars;

  end;

var
  fKanjiSearch: TfKanjiSearch;

implementation

uses JWBKanji, JWBSettings, JWBUnit, JWBMenu, JWBNewCategory,
  JWBKanjiDetails, JWBUserData, JWBCategories, JWBCharData;

{$R *.DFM}

procedure TfKanjiSearch.FormCreate(Sender: TObject);
begin
  curRadSearchType:=stRaine;
  FCurRadIndexes:='';
  FCurRadChars:='';
end;

procedure TfKanjiSearch.FormShow(Sender: TObject);
begin
  ReloadOtherTypes;
end;

procedure TfKanjiSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fKanji.btnSearchSort.Down:=false;
  fMenu.aKanjiSearch.Checked:=false;
end;

//Reloads a list of "other" search types
procedure TfKanjiSearch.ReloadOtherTypes;
var i:integer;
  bk:integer;
begin
  bk:=fKanjiSearch.cbOtherType.ItemIndex;
  if bk=-1 then bk:=kanji_othersearch;
  fKanjiSearch.cbOtherType.Items.Clear;
  fKanjiSearch.cbOtherType.Items.Add('Unicode');
  for i:=0 to Length(CharPropTypes)-1 do
    if CharPropTypes[i].id>20 then
      fKanjiSearch.cbOtherType.Items.Add(_l('^e'+CharPropTypes[i].englishName));
  fKanjiSearch.cbOtherType.ItemIndex:=0;
  if bk<fKanjiSearch.cbOtherType.Items.Count-1 then fKanjiSearch.cbOtherType.ItemIndex:=bk;
end;

procedure TfKanjiSearch.sbPinYinClick(Sender: TObject);
begin
  fKanji.DoIt;
end;

procedure TfKanjiSearch.sbClearFiltersClick(Sender: TObject);
begin
  sbPinYin.Down:=false;
  sbYomi.Down:=false;
  sbDefinition.Down:=false;
  sbOther.Down:=false;
  SpeedButton1.Down:=false;
  btnOnlyCommon.Down:=false;
  btnInClipboard.Down:=false;
  sbStrokeCount.Down:=false;
  sbRadicals.Down:=false;
  sbSKIP.Down:=false;
//  SpeedButton16.Down:=false;
  sbJouyou.Down:=false;
  fKanji.DoIt;
end;

procedure TfKanjiSearch.edtPinYinChange(Sender: TObject);
begin
  sbPinYin.Down:=edtPinYin.Text<>'';;
  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.edtYomiChange(Sender: TObject);
begin
  sbYomi.Down:=edtYomi.Text<>'';
  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.edtDefinitionChange(Sender: TObject);
begin
  sbDefinition.Down:=edtDefinition.Text<>'';
  fKanji.DoItTimer;
end;

{ Called when a radical filter changes }
procedure TfKanjiSearch.SetCurRadIndexes(const Value: string);
var i, radno: integer;
  parts: TStringArray;
begin
  FCurRadIndexes := Value;
  sbRadicals.Down := FCurRadIndexes<>'';

 //Update CurRadChars appropriately
  parts := SplitStr(FCurRadIndexes,';');
  FCurRadChars := '';
  for i := 0 to Length(parts)-1 do begin
    radno := StrToInt(parts[i]);
    case CurRadSearchType of
      stClassic: FCurRadChars := FCurRadChars+RadicalUnicode(radno);
      stRaine: FCurRadChars := FCurRadChars+RaineRadicals.Items[radno].Radical;
    end;
  end;

  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.SetCurRadChars(const Value: string);
var i: integer;
  ch: char;
begin
  FCurRadChars := Value;
  sbRadicals.Down := FCurRadIndexes<>'';

 //Update CurRadIndexes appropriately
  FCurRadIndexes := '';
  for i := 1 to Length(FCurRadChars) do begin
    ch := FCurRadChars[i];
    case CurRadSearchType of
      stClassic: FCurRadIndexes := FCurRadIndexes+IntToStr(RadicalIndex(ch))+';';
      stRaine: FCurRadIndexes := FCurRadIndexes+IntToStr(RaineRadicals.FindRadical(ch))+';';
    end;
  end;

 //Delete final ';'
  if Length(FCurRadIndexes)>0 then
    SetLength(FCurRadIndexes, Length(FCurRadIndexes)-1);

  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.edtSkipChange(Sender: TObject);
begin
  sbSKIP.Down:=edtSkip.Text<>'';
  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.edtOtherChange(Sender: TObject);
begin
  sbOther.Down:=edtOther.Text<>'';
  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.edtStrokeCountChange(Sender: TObject);
begin
  sbStrokeCount.Down:=edtStrokeCount.Text<>'';
  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.edtJouyouChange(Sender: TObject);
begin
  sbJouyou.Down:=edtJouyou.Text<>'';
  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.SpeedButton19Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to lbCategories.Items.Count-1 do lbCategories.Checked[i]:=false;
  fKanji.DoIt;
end;

procedure TfKanjiSearch.RadicalSelectionChanged(Sender: TObject);
begin
  curRadSearchType := fRadical.SearchType;
  curRadIndexes := fRadical.SelectedIndexes;
 //SetCurRadIndexes() will trigger filter update
  pbRadicals.Invalidate;
end;

procedure TfKanjiSearch.sbListRadicalsClick(Sender: TObject);
var
  _radsearchtype: TRadSearchType;
  _radindexes: string;
begin
 //save current search, it'll be broken by RadicalSelectionChanged
  _radSearchType := curRadSearchType;
  _radindexes := FCurRadIndexes;
 //bring up selection window
  fRadical.SetSelectedRadicals(curRadSearchType, FCurRadChars);
  fRadical.OnSelectionChanged := Self.RadicalSelectionChanged;
  if IsPositiveResult(fRadical.ShowModal) then begin
    _radsearchtype := fRadical.SearchType;
    _radindexes := fRadical.SelectedIndexes;
  end;
  fRadical.OnSelectionChanged := nil;
 //apply new search, or re-apply old search
  curRadSearchType := _radsearchtype;
  curRadIndexes := _radindexes;
 //SetCurRadicals will trigger filter update
  pbRadicals.Invalidate;
end;

//Takes tx in the form of "number" or "number_min-number_max", and adds min
//to number_min and max to number max.
//Returns new value for this filter.
function TfKanjiSearch.OffsetRange(tx:string;min,max:integer):string;
var curtx,txleft,otx:string;
    nn1,nn2:integer;
begin
  txleft:=tx;
  otx:='';
  while txleft<>'' do
  begin
    curtx:='';
    while (length(txleft)>0) and (txleft[1]<>';') and (txleft[1]<>',') do
    begin
      curtx:=curtx+txleft[1];
      delete(txleft,1,1);
    end;
    if (length(txleft)>0) and ((txleft[1]=';') or (txleft[1]=',')) then delete(txleft,1,1);
    nn1:=0;
    nn2:=0;
    if pos('-',curtx)=0 then begin try nn1:=strtoint(curtx); nn2:=strtoint(curtx); except end; end
    else
      begin
        try
          nn1:=strtoint(copy(curtx,1,pos('-',curtx)-1));
          delete(curtx,1,pos('-',curtx));
          nn2:=strtoint(curtx);
        except end;
      end;
    nn1:=nn1+min; nn2:=nn2+max;
    if nn1<0 then nn1:=0; if nn2<0 then nn2:=0;
    if nn1>nn2 then nn1:=nn2;
    if nn1=nn2 then if otx='' then otx:=inttostr(nn1) else otx:=otx+';'+inttostr(nn1);
    if nn1<>nn2 then if otx='' then otx:=inttostr(nn1)+'-'+inttostr(nn2) else otx:=otx+';'+inttostr(nn1)+'-'+inttostr(nn2);
  end;
  result:=otx;
end;

procedure TfKanjiSearch.sbStrokeCountPlusClick(Sender: TObject);
begin
  edtStrokeCount.text:=OffsetRange(edtStrokeCount.text,1,1);
end;

procedure TfKanjiSearch.sbStrokeCountMinusClick(Sender: TObject);
begin
  edtStrokeCount.text:=OffsetRange(edtStrokeCount.text,-1,-1);
end;

procedure TfKanjiSearch.sbStrokeCountExpandClick(Sender: TObject);
begin
  edtStrokeCount.text:=OffsetRange(edtStrokeCount.text,-1,1);
end;

procedure TfKanjiSearch.sbStrokeCountShrinkClick(Sender: TObject);
begin
  edtStrokeCount.text:=OffsetRange(edtStrokeCount.text,1,-1);
end;

procedure TfKanjiSearch.sbJouyouPlusClick(Sender: TObject);
begin
  edtJouyou.text:=OffsetRange(edtJouyou.text,1,1);
end;

procedure TfKanjiSearch.sbJouyouMinusClick(Sender: TObject);
begin
  edtJouyou.text:=OffsetRange(edtJouyou.text,-1,-1);
end;

procedure TfKanjiSearch.sbJouyouExpandClick(Sender: TObject);
begin
  edtJouyou.text:=OffsetRange(edtJouyou.text,-1,1);
end;

procedure TfKanjiSearch.sbJouyouShrinkClick(Sender: TObject);
begin
  edtJouyou.text:=OffsetRange(edtJouyou.text,1,-1);
end;

procedure TfKanjiSearch.rgSortByClick(Sender: TObject);
begin
  fKanji.DoIt;
end;

procedure TfKanjiSearch.cbOtherTypeChange(Sender: TObject);
begin
  fKanji.DoItTimer;
end;

procedure TfKanjiSearch.pbRadicalsPaint(Sender: TObject; Canvas: TCanvas);
begin
  Canvas.Brush.Color:=clBtnFace;
  Canvas.Font.Style:=[];
  DrawUnicode(Canvas,1,1,16,FCurRadChars,FontRadical);
end;

procedure TfKanjiSearch.SpeedButton1Click(Sender: TObject);
begin
  NewKanjiCategoryUI();
end;

procedure TfKanjiSearch.lbCategoriesClick(Sender: TObject);
var IsKnownLearned: boolean;
begin
  IsKnownLearned := GetSelCatIdx(lbCategories)=KnownLearned;
  SpeedButton25.Enabled:=not IsKnownLearned;
  SpeedButton20.Enabled:=not IsKnownLearned;
end;

procedure TfKanjiSearch.lbCategoriesClickCheck(Sender: TObject);
begin
  fKanji.DoIt;
end;

procedure TfKanjiSearch.SpeedButton25Click(Sender: TObject);
begin
  if lbCategories.ItemIndex=-1 then exit;
  DeleteCategoryUI(GetSelCatIdx(lbCategories));
end;

procedure TfKanjiSearch.SpeedButton20Click(Sender: TObject);
begin
  if lbCategories.ItemIndex=-1 then exit;
  EditCategoryUI(GetSelCatIdx(lbCategories));
end;

procedure TfKanjiSearch.lbCategoriesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var IsKnownLearned: boolean;
begin
  IsKnownLearned := GetCatIdx(lbCategories,index)=KnownLearned;
  if IsKnownLearned then
    lbCategories.Canvas.Font.Style:=[fsBold]
  else
    lbCategories.Canvas.Font.Style:=[];
  lbCategories.Canvas.TextOut(Rect.Left,Rect.Top,lbCategories.Items[index]);
end;

procedure TfKanjiSearch.rgOrAndClick(Sender: TObject);
begin
  fKanji.DoIt;
end;

procedure TfKanjiSearch.lbCategoriesDblClick(Sender: TObject);
var i:integer;
begin
  if lbCategories.ItemIndex<>-1 then
  begin
    for i:=0 to lbCategories.Items.Count-1 do
      lbCategories.Checked[i]:=i=lbCategories.ItemIndex;
    fKanji.DoIt;
  end;
end;

end.
