unit JWBRadical;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, RXCtrls, Buttons, StdCtrls;

type
  TfRadical = class(TForm)
    DrawGrid1: TDrawGrid;
    RxLabel17: TRxLabel;
    Shape6: TShape;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DrawGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DrawGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DrawGrid1DblClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DrawGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowIt;
    procedure DoSearch;
    function GetKanji(x,y:integer):string;
    { Public declarations }
  end;

var
  fRadical: TfRadical;
  rl,rlc,rld,rli:TStringList;
  selradical:string;
  selindex:string;

implementation

uses JWBMenu, JWBUnit, JWBKanji, JWBSettings, JWBKanjiSearch, 
  JWBKanjiSort, PKGWrite;

var sel:array[1..300] of boolean;

{$R *.DFM}

procedure TfRadical.ShowIt;
var i,j:integer;
    knw:boolean;
    jap:integer;
    s:string;
begin
  if (curlang='c') or (rainesearch=nil) then
  begin
    RadioGroup1.ItemIndex:=1;
    RadioGroup1.Enabled:=false;
  end else if RadioGroup1.Enabled=false then
  begin
    RadioGroup1.ItemIndex:=0;
    RadioGroup1.Enabled:=true;
  end;
  Label1.Visible:=RadioGroup1.ItemIndex=1;
  Label2.Visible:=RadioGroup1.ItemIndex=0;
  CheckBox1.Enabled:=RadioGroup1.ItemIndex=1;
  rl.Clear;
  rli.Clear;
  rlc.Clear;
  rld.Clear;
  TRadicals.First;
  j:=0;
  if RadioGroup1.ItemIndex=1 then
  begin
    while not TRadicals.EOF do
    begin
      if (TRadicals.Int(TRadicalsStrokeCount)>j) and (TRadicals.Int(TRadicalsVariant)=1) then
      begin
        j:=TRadicals.Int(TRadicalsStrokeCount);
        rl.Add(inttostr(j));
        rlc.Add('0');
        rli.Add('0');
      end;
      if (CheckBox1.Checked) or (TRadicals.Int(TRadicalsVariant)=1) then
      begin
        rl.Add(TRadicals.Str(TRadicalsUnicode));
        if (TRadicals.Int(TRadicalsVariant)=1) then
        begin
          knw:=IsKnown(KnownLearned,TRadicals.Str(TRadicalsUnicode));
          jap:=TRadicals.Int(TRadicalsJapaneseCount);
        end;
        if (CheckBox2.Checked) and (knw) then rlc.Add('0999') else
        begin
          if CheckBox3.Checked then
            case jap of
              0:rlc.Add('0000');
              1:rlc.Add('0005');
              2:rlc.Add('0020');
            end else rlc.Add('0020');
        end;
        rli.Add(TRadicals.Str(TRadicalsNumber));
      end;
      TRadicals.Next;
    end;
  end else
  begin
    for i:=0 to raineradicals.Count-1 do
    begin
      s:=raineradicals[i];
      if strtoint(copy(s,6,2))<>j then
      begin
        j:=strtoint(copy(s,6,2));
        rl.Add(inttostr(j));
        rlc.Add('0');
        rli.Add('0');
      end;
      rl.Add(copy(s,1,4));
      if (CheckBox2.Checked) and (IsKnown(KnownLearned,copy(s,1,4))) then rlc.Add('0999') else
        if CheckBox3.Checked then
        begin
          if strtoint(copy(s,9,4))>100 then rlc.Add('0020')
          else if strtoint(copy(s,9,4))>20 then rlc.Add('0005') else
          rlc.Add('0000');
        end else rlc.Add('0020');
      rli.Add(inttostr(i+1));
    end;
  end;
//  TChar.SetFilter('');
  for i:=40 downto 20 do
  begin
    DrawGrid1.DefaultColWidth:=i;
    DrawGrid1.DefaultRowHeight:=DrawGrid1.DefaultColWidth+14;
    DrawGrid1.ColCount:=DrawGrid1.ClientWidth div (DrawGrid1.DefaultColWidth+1);
    DrawGrid1.RowCount:=((rl.Count-1) div DrawGrid1.ColCount)+1;
    if DrawGrid1.RowCount*DrawGrid1.DefaultRowHeight<DrawGrid1.ClientHeight then break;
  end;
  DrawGrid1.DefaultRowHeight:=(DrawGrid1.ClientHeight div DrawGrid1.RowCount)-1;
  DrawGrid1.Row:=0;
  DrawGrid1.Col:=1;
  if rl.Count>1 then selradical:=rl[1] else selradical:='';
  if rl.Count>1 then selindex:=rli[1] else selindex:='';
  DrawGrid1.Invalidate;
end;

procedure TfRadical.FormShow(Sender: TObject);
begin
//  Width:=Screen.Width;
//  Height:=Screen.Height;
//  Left:=0;
//  Top:=0;
  ShowIt;
end;

procedure TfRadical.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var p,c:integer;
    w:widechar;
    s:string;
    i:integer;
    selc:boolean;
begin
  p:=ARow*DrawGrid1.ColCount+ACol;
  if p>=rli.Count then exit;
  i:=0;
  if rli[p]<>'' then i:=strtoint(rli[p]);
  if i>0 then selc:=sel[i] else selc:=false;
  if (p>=rl.Count) then
  begin
    DrawGrid1.Canvas.Pen.Color:=clWindow;
    DrawGrid1.Canvas.Brush.Color:=clWindow;
    DrawGrid1.Canvas.FillRect(Rect);
    exit;
  end;
  if length(rl[p])<4 then
  begin
    DrawGrid1.Canvas.Brush.Color:=clHighlight;
    DrawGrid1.Canvas.Font.Color:=clHighlightText;
    DrawGrid1.Canvas.Font.Name:=FontEnglish;
    DrawGrid1.Canvas.Font.Style:=[fsBold];
    DrawGrid1.Canvas.Font.Height:=DrawGrid1.DefaultColWidth-6;
    DrawGrid1.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,rl[p]);
  end else
  begin
    s:=rlc[p];
    delete(s,1,1);
    c:=strtoint(s);
    w:=HexToUnicode(rl[p])[1];
    if selc then DrawGrid1.Canvas.Brush.Color:=clHighlight else
    DrawGrid1.Canvas.Brush.Color:=clWindow;
    if selc then DrawGrid1.Canvas.Font.Color:=clHighlightText else
    DrawGrid1.Canvas.Font.Color:=clWindowText;
    DrawGrid1.Canvas.Font.Style:=[];
//    if SpeedButton1.Down then
    if not selc then
    begin
      if c<10 then DrawGrid1.Canvas.Font.Color:=Col('Kanji_RadRare') else
        DrawGrid1.Canvas.Font.Color:=Col('Kanji_RadCommon');
      if c=999 then DrawGrid1.Canvas.Font.Color:=Col('Kanji_RadLearned');
      if (not CheckBox2.Checked) and (not CheckBox3.Checked) then DrawGrid1.Canvas.Font.Color:=clWindowText else
        DrawGrid1.Canvas.Brush.Color:=Col('Kanji_Back');
    end;
    DrawGrid1.Canvas.FillRect(Rect);
    DrawGrid1.Canvas.Font.Name:=FontRadical;
    DrawGrid1.Canvas.Font.Height:=DrawGrid1.DefaultColWidth-5;
    TextOutW(DrawGrid1.Canvas.Handle,Rect.Left+2,Rect.Top+2,@w,1);
    DrawGrid1.Canvas.Font.Name:=FontEnglish;
    DrawGrid1.Canvas.Font.Height:=10;
    DrawGrid1.Canvas.TextOut(Rect.Left+(Rect.Right-Rect.Left-DrawGrid1.Canvas.TextExtent(rli[p]).cx) div 2,Rect.Bottom-10,rli[p]);
  end;
end;

procedure TfRadical.DrawGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var p:integer;
    radf:integer;
begin
  Screen.Cursor:=crHourGlass;
  p:=ARow*DrawGrid1.ColCount+ACol;
  if (p>=rl.Count) then
  begin
    CanSelect:=false;
    exit;
  end;
  if length(rl[p])<4 then
  begin
    CanSelect:=true;
    exit;
  end;
  selradical:=rl[p];
  selindex:=rli[p];
  Screen.Cursor:=crDefault;
end;

procedure TfRadical.SpeedButton1Click(Sender: TObject);
var CanSelect:boolean;
begin
  DrawGrid1SelectCell(Sender,DrawGrid1.Col,DrawGrid1.Row,CanSelect);
  DrawGrid1.Invalidate;
end;

procedure TfRadical.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfRadical.DoSearch;
var s:string;
    i:integer;
begin
  s:='';
  curradsearch:='';
  raineradsearch:=RadioGroup1.ItemIndex=0;
  for i:=1 to 300 do if sel[i] then
  begin
    if RadioGroup1.ItemIndex=1 then
    begin
      TRadicals.Locate('Number',inttostr(i),true);
      curradsearch:=curradsearch+TRadicals.Str(TRadicalsUnicode);
    end else curradsearch:=curradsearch+copy(raineradicals[i-1],1,4);
    if s='' then s:=inttostr(i) else s:=s+';'+inttostr(i);
  end;
  fKanjiSearch.Edit2.Text:=s;
  fKanjiSearch.PaintBox1.Invalidate;
//  fKanjiSearch.SpeedButton6.Down:=true;
//  fKanji.DoIt;
end;

procedure TfRadical.BitBtn1Click(Sender: TObject);
begin
  DoSearch;
  Close;
end;

procedure TfRadical.FormResize(Sender: TObject);
var cwx,cwy:integer;
begin
{  cwx:=(Width-211-20) div 21;
  cwy:=round(50/36*cwx);
  DrawGrid1.Width:=cwx*21+20;
  DrawGrid1.Height:=cwy*11+10;
  DrawGrid1.DefaultColWidth:=cwx;
  DrawGrid1.DefaultRowHeight:=cwy;
  Shape6.Width:=cwx*21+22;
  Shape6.Height:=cwy*11+12;}
  ShowIt;
end;

procedure TfRadical.DrawGrid1KeyPress(Sender: TObject; var Key: Char);
var i:string;
begin
  if key='l'then
  begin
    if selradical<>'' then
    begin
      TChar.Locate('Unicode',selradical,false);
      i:=TChar.Str(TCharUnicode);
      SetKnown(KnownLearned,i,not IsKnown(KnownLearned,i));
    end;
  end;
end;

procedure TfRadical.DrawGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
begin
  if not Visible then exit;
  if selindex<>'' then
  begin
    if not ((ssShift in Shift) or (ssCtrl in Shift)) then for i:=1 to 300 do sel[i]:=false;
    i:=strtoint(selindex);
    if i>0 then sel[i]:=not sel[i];
    DrawGrid1.Invalidate;
    DoSearch;
  end;
end;

procedure TfRadical.DrawGrid1DblClick(Sender: TObject);
begin
  BitBtn1Click(sender);
end;

procedure TfRadical.CheckBox2Click(Sender: TObject);
begin
  ShowIt;
end;

procedure TfRadical.FormCreate(Sender: TObject);
var i:integer;
begin
  rl:=TStringList.Create;
  rli:=TStringList.Create;
  rlc:=TStringList.Create;
  rld:=TStringList.Create;
end;

procedure TfRadical.FormDestroy(Sender: TObject);
begin
  rl.Free;
  rlc.Free;
  rld.Free;
  rli.Free;
end;

procedure TfRadical.DrawGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  fMenu.IntTipGridOver(DrawGrid1,x,y,false);
end;

function TfRadical.GetKanji(x,y:integer):string;
var p:integer;
begin
  p:=y*DrawGrid1.ColCount+x;
  result:='';
  if p>=rli.Count then exit;
  if p<0 then exit;
  result:=rl[p];
end;

procedure TfRadical.RadioGroup1Click(Sender: TObject);
var i:integer;
begin
  for i:=1 to 300 do sel[i]:=false;
  ShowIt;
end;

procedure TfRadical.Button1Click(Sender: TObject);
begin
  PKGWriteForm.PKGWriteCmd('PKGFileName wakan.rad');
  PKGWriteForm.PKGWriteCmd('MemoryLimit 100000000');
  PKGWriteForm.PKGWriteCmd('Name Japanese Radicals');
  PKGWriteForm.PKGWriteCmd('TitleName Japanese advanced radical search');
  PKGWriteForm.PKGWriteCmd('CompanyName LABYRINTH');
  PKGWriteForm.PKGWriteCmd('CopyrightName (C) Michael Raine, Jim Breen');
  PKGWriteForm.PKGWriteCmd('FormatName Pure Package File');
  PKGWriteForm.PKGWriteCmd('CommentName File is used by WaKan - Japanese & Chinese Learning Tool');
  PKGWriteForm.PKGWriteCmd('VersionName 1.0');
  PKGWriteForm.PKGWriteCmd('HeaderCode 791564');
  PKGWriteForm.PKGWriteCmd('FileSysCode 978132');
  PKGWriteForm.PKGWriteCmd('WriteHeader');
  PKGWriteForm.PKGWriteCmd('TemporaryLoad');
  PKGWriteForm.PKGWriteCmd('CryptMode 0');
  PKGWriteForm.PKGWriteCmd('CRCMode 0');
  PKGWriteForm.PKGWriteCmd('PackMode 0');
  PKGWriteForm.PKGWriteCmd('CryptCode 978123');
  PKGWriteForm.PKGWriteCmd('Include raine');
  PKGWriteForm.PKGWriteCmd('Finish');
end;

end.