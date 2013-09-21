unit JWBVocabAdd;
{
Has two modes: "enter anything" and "copy dictionary word (possibly alter meaning)".
Needs to be supplied with latest clipboard data through ClipText := value.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, WakanPaintbox, JWBStrings;

type
  TfVocabAdd = class(TForm)
    lblPhonetic: TLabel;
    lblWritten: TLabel;
    lblCategory: TLabel;
    lblMeaning: TLabel;
    edtPhonetic: TEdit;
    cbCategories: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    pbWritten: TWakanPaintbox;
    pbPhoneticConv: TWakanPaintbox;
    pbPhonetic: TWakanPaintbox;
    edtMeaning: TMemo;
    procedure edtPhoneticChange(Sender: TObject);
    procedure pbPhoneticConvPaint(Sender: TObject; Canvas: TCanvas);
    procedure pbWrittenPaint(Sender: TObject; Canvas: TCanvas);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pbPhoneticPaint(Sender: TObject; Canvas: TCanvas);
    procedure edtMeaningKeyPress(Sender: TObject; var Key: Char);
  protected
    FMeaningOnly: boolean;
    FFixedKanji: FString;
    FFixedPhonetic: FString;
    FClipText: FString;
    procedure SetMeaningOnly(const Value: boolean);
    procedure SetClipText(const Value: FString);
  public
    function ModalAddWord(): TModalResult;
    function ModalAddFixed(const AKanji, APhonetic: FString; const AMeaning: FString): TModalResult;
    property MeaningOnly: boolean read FMeaningOnly write SetMeaningOnly;
    property ClipText: FString read FClipText write SetClipText; //call when clipboard text changes
  end;

var
  fVocabAdd: TfVocabAdd;

implementation

uses JWBVocab, JWBUnit, JWBKanaConv, JWBMenu;

{$R *.DFM}

procedure TfVocabAdd.SetMeaningOnly(const Value: boolean);
begin
  FMeaningOnly := Value;
  pbPhonetic.Visible := Value;
  edtPhonetic.Visible := not Value;
  pbPhoneticConv.Visible := not Value;
  if FMeaningOnly then begin
    lblWritten.Caption := _l('#00061^eWritten:');
    lblMeaning.Caption := _l('#00058^eMeaning (editable):');
  end else begin
    lblWritten.Caption := _l('#00690^eWritten (from clipboard):');
    lblMeaning.Caption := _l('#00691^eMeaning:');
  end;
end;

procedure TfVocabAdd.SetClipText(const Value: FString);
begin
  FClipText := Value;
  if not MeaningOnly then
    pbWritten.Invalidate;
end;

procedure TfVocabAdd.pbPhoneticPaint(Sender: TObject; Canvas: TCanvas);
begin
  Canvas.Brush.Color:=clWindow;
  DrawUnicode(Canvas,2,2,22,FFixedPhonetic,FontJapanese)
end;

procedure TfVocabAdd.edtPhoneticChange(Sender: TObject);
begin
  pbPhoneticConv.Invalidate;
end;

procedure TfVocabAdd.pbPhoneticConvPaint(Sender: TObject; Canvas: TCanvas);
begin
  Canvas.Brush.Color:=clBtnFace;
  DrawUnicode(Canvas,2,2,16,RomajiToKana(edtPhonetic.Text,romasys,curlang,[]),FontSmall);
end;

procedure TfVocabAdd.pbWrittenPaint(Sender: TObject; Canvas: TCanvas);
begin
  Canvas.Brush.Color:=clWindow;
  if MeaningOnly then
    DrawUnicode(Canvas,2,2,22,FFixedKanji,FontJapanese)
  else
    DrawUnicode(Canvas,2,2,22,FClipText,FontJapanese);
end;

procedure TfVocabAdd.edtMeaningKeyPress(Sender: TObject; var Key: Char);
var str: string;
begin
 //TMemo doesn't support Ctrl-A by itself
  if Key=^A then begin
    (Sender as TMemo).SelectAll;
    Key := #00;
  end;

 { Pressing Ctrl-C without a text being selected copies everything for this article.
  I'd like this to work anywhere on a form, but it doesnt :(
  We need to override Ctrl-C only when it's meaningless otherwise, and first of
  all, the focus mostly stays in this TMemo where Ctrl-C HAS meaning.
  And TForm has no way to "receive keypress but only if no one handled it". }
  if (Key=^C) and ((Sender as TMemo).SelLength<=0) then begin
    if MeaningOnly then
      str := FFixedKanji + ' [' + FFixedPhonetic + '] ' + edtMeaning.Text
    else
      str := FClipText + ' [' + RomajiToKana(edtPhonetic.Text,romasys,curlang,[rfDeleteInvalidChars]) + ']'
        + edtMeaning.Text;
    clip := str;
    fMenu.SetClipboard;
    Key := #00;
  end;
end;

procedure TfVocabAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fVocab.SpeedButton1.Down:=false;
  fMenu.aUserAdd.Checked:=false;
end;

function TfVocabAdd.ModalAddWord(): TModalResult;
begin
  Self.MeaningOnly := false;
  Self.FFixedKanji := '';
  Self.FFixedPhonetic := '';
  Self.edtPhonetic.Text := '';
  Self.edtMeaning.Text := '';
  Result := Self.ShowModal;
  if IsPositiveResult(Result) then
    fVocab.AddWord(
      FClipText,
      RomajiToKana(edtPhonetic.Text,romasys,curlang,[rfDeleteInvalidChars]),
      edtMeaning.Text,
      cbCategories.Text,
      '?', false, 1
    );
end;

function TfVocabAdd.ModalAddFixed(const AKanji, APhonetic: FString;
  const AMeaning: FString): TModalResult;
begin
  Self.MeaningOnly := true;
  Self.FFixedKanji := AKanji;
  Self.FFixedPhonetic := APhonetic;
  Self.edtPhonetic.Text := '';
  Self.edtMeaning.Text := fstrtouni(AMeaning);
  Result := Self.ShowModal;
  if IsPositiveResult(Result) then
    fVocab.AddWord(
      AKanji, APhonetic,
      edtMeaning.Text,
      cbCategories.Text,
      '?', false, 1
    );
end;

end.
