unit JWBKanjiCard;

interface
uses SysUtils, Classes, Graphics, Windows;

var
  kcchind,
  kcchcomp:TStringList;

procedure DrawKanjiCard(canvas:TCanvas;u:string;x,y:integer;ch:double;
  stcount,outlin,alt,rad,inlin,comp,read,mean,strokeorder,fullcomp,sortfreq:boolean;
  sizhor,sizvert,nofullcomp:integer;calfont:string);
procedure ClearKanjiCardCache;

implementation
uses JWBStrings, JWBUnit, JWBDicSearch, JWBMenu, JWBSettings;

procedure DrawKanjiCard(canvas:TCanvas;u:string;x,y:integer;ch:double;
  stcount,outlin,alt,rad,inlin,comp,read,mean,strokeorder,fullcomp,sortfreq:boolean;
  sizhor,sizvert,nofullcomp:integer;calfont:string);
var ony,kuny,defy:string;
    radf:integer;
    sl:TStringList;
    s:string; //can contain fstring too
    ws:FString;
    p:integer;
    i,j:integer;
    rect:TRect;
    nch,ncv:integer;
    fontjpch:string;
    FontJpChGrid:string;
    FontJpEnGrid:string;
    adddot:integer;
    dic:TJaletDic;
    mark,freq:string;
    rt: integer; //TCharRead.Int(TCharReadType)
begin
  if curlang='j'then fontjpch:=FontJapanese else fontjpch:=FontChinese;
  if curlang='j'then fontjpchgrid:=FontJapaneseGrid else fontjpchgrid:=FontChineseGrid;
  if curlang='j'then fontjpengrid:=FontJapaneseGrid else fontjpengrid:=FontPinYin;
  ncv:=sizvert;
  if read then inc(ncv,3);
  if mean then inc(ncv,2);
  if fullcomp then inc(ncv,1+nofullcomp);
  nch:=sizvert;
  if alt or rad then inc(nch,(sizvert div 2)+1);
  if comp then nch:=nch+1+sizhor;
  sl:=TStringList.Create;
  TChar.Locate('Unicode',u,false);
  DrawUnicode(canvas,trunc(x+ch/2),trunc(y+ch/2),trunc((sizvert-1)*ch),u,calfont);
  if stcount then
    if curlang<>'j'then DrawUnicode(canvas,trunc(x+ch/2),trunc(y+ch/2),trunc(ch),fstr(TChar.Str(TCharStrokeCount)),FontEnglish);
  if stcount then
    if curlang='j'then DrawUnicode(canvas,trunc(x+ch/2),trunc(y+ch/2),trunc(ch),fstr(TChar.Str(TCharJpStrokeCount)),FontEnglish);
  if strokeorder then
    DrawStrokeOrder(canvas,trunc(x+ch/2),trunc(y+ch/2),trunc((sizvert-1)*ch),trunc((sizvert-1)*ch),u,trunc(ch/3*2),clBlack);

  {outer lines}
  if outlin then
  begin
    canvas.MoveTo(x,y);
    canvas.LineTo(trunc(x+nch*ch),y);
    canvas.LineTo(trunc(x+nch*ch),trunc(y+ncv*ch));
    canvas.LineTo(x,trunc(y+ncv*ch));
    canvas.LineTo(x,y);
  end;

  {alternate}
  radf:=fSettings.ComboBox1.ItemIndex+12;
  TRadicals.Locate('Number',inttostr(fMenu.GetCharValueRad(TChar.Int(TCharIndex),radf)),true);
  if alt then
    DrawUnicode(canvas,trunc(x+ch/2+(sizvert)*ch*17/16),trunc(y+ch/2),trunc(sizvert/8*3*ch),TRadicals.Str(TRadicalsUnicode),FontRadical);

  {radical}
  if rad then
    DrawUnicode(canvas,trunc(x+ch/2+(sizvert)*ch*17/16),trunc(y+ch/2+(sizvert/2)*ch),trunc((sizvert/8*3)*ch),u,FontJpchGrid);
  if inlin then
  begin
    canvas.MoveTo(trunc(x+ch*sizvert),trunc(y+ch/2));
    canvas.LineTo(trunc(x+ch*sizvert),trunc(y+ch*sizvert-ch/2));
  end;

  {compounds}
  sl.Clear;
  if comp then
  begin
    TUserIdx.SetOrder('Kanji_Ind');
    TUserIdx.Locate('Kanji',u,false);
    while (not TUserIdx.EOF) and (TUserIdx.Str(TUserIdxKanji)=u) do
    begin
      TUser.Locate('Index',TUserIdx.Str(TUserIdxWord),true);
      if flength(TUser.Str(TUserKanji))<10 then
//      if FirstUnknownKanjiIndex(TUser.Str(TUserKanji))<0 then
        if TUserIdx.Bool(TUserIdxBegin) then
          sl.Add('+'+inttostr(flength(TUser.Str(TUserKanji)))+TUser.Str(TUserKanji)) else
          sl.Add('-'+inttostr(flength(TUser.Str(TUserKanji)))+TUser.Str(TUserKanji));
      TUserIdx.Next;
    end;
    sl.Sort;
    p:=0;
    for j:=0 to sizvert-2 do
    begin
      s:='';
      while (p<sl.Count) and (flenfc(length(sl[p])-2)+flength(s)+1<=sizhor) do
      begin
        s:=s+copy(sl[p],3,length(sl[p])-2)+UH_IDG_COMMA;
        inc(p);
      end;
      if (p>=sl.Count) and (flength(s)>0) then fdelete(s,flength(s),1);
      if alt or rad then
        DrawUnicode(canvas,trunc(x+((sizvert)*3*ch)/2+ch+ch/2),trunc(y+ch/2+j*ch),trunc(ch),s,FontJpChGrid) else
        DrawUnicode(canvas,trunc(x+(sizvert)*ch+ch+ch/2),trunc(y+ch/2+j*ch),trunc(ch),s,FontJpChGrid);
    end;
    if (alt or rad) and (inlin) then
    begin
      canvas.MoveTo(trunc(x+ch*(((sizvert*3)/2)+1)),trunc(y+ch/2));
      canvas.LineTo(trunc(x+ch*(((sizvert*3)/2)+1)),trunc(y+ch*sizvert-ch/2));
    end;
  end;

  {full compounds}
  sl.Clear;
  if fullcomp then
  begin
    if kcchind.IndexOf(u)=-1 then
    begin
      for i:=0 to dicts.Count-1 do if ((dicts.Objects[i] as TJaletDic).loaded) and (pos(','+(dicts.Objects[i] as TJaletDic).name,NotGroupDicts[4])=0)
        and ((dicts.Objects[i] as TJaletDic).TDictFrequency<>-1) then
      begin
        dic:=dicts.Objects[i] as TJaletDic;
        dic.Demand;
        dic.FindIndexString(false,u);
        j:=dic.ReadIndex;
        while (j>0) do
        begin
          dic.TDict.Locate('Index',inttostr(j),true);
          if dic.TDictMarkers<>-1 then mark:=dic.TDict.Str(dic.TDictMarkers) else mark:='';
          freq:='0000000';
          if (dic.TDictFrequency<>-1) and (sortfreq) then freq:=inttostr(9999999-dic.TDict.Int(dic.TDictFrequency));
          while length(freq)<7 do freq:='0'+freq;
          if pos(UH_LBEG+'spop'+UH_LEND,EnrichDictEntry(dic.TDict.Str(dic.TDictEnglish),mark))=0 then freq[1]:='a';
          if freq<>'9999999'then
          sl.Add(freq+#9+ChinTo(dic.TDict.Str(dic.TDictKanji))+' ['+dic.TDict.Str(dic.TDictPhonetic)+'] {'+EnrichDictEntry(dic.TDict.Str(dic.TDictEnglish),mark)+'}{');
          j:=dic.ReadIndex;
        end;
      end;
      sl.Sort;
      for j:=0 to nofullcomp-1 do if sl.Count>j then kcchcomp.Add(sl[j]) else kcchcomp.Add('');
      kcchind.Add(u);
    end;
    p:=0;
    i:=kcchind.IndexOf(u);
    for j:=0 to nofullcomp-1 do
    begin
      s:=kcchcomp[i*nofullcomp+j];
      rect.left:=x+round(ch/2);
      rect.right:=x+round(nch*ch-ch/2);
      rect.top:=y+round(sizvert*ch+j*ch+ch/2);
      rect.bottom:=y+round(sizvert*ch+j*ch+ch+ch/2);
      if read then
      begin
        rect.top:=rect.top+trunc(ch*3);
        rect.bottom:=rect.bottom+trunc(ch*3);
      end;
      if mean then
      begin
        rect.top:=rect.top+trunc(ch*2);
        rect.bottom:=rect.bottom+trunc(ch*2);
      end;
      if s<>'' then DrawPackedWordInfo(canvas,rect,copy(s,9,length(s)-8),trunc(ch),false);
    end;
    if inlin then
    begin
      rect.top:=y+round(sizvert*ch);
      if read then
        rect.top:=rect.top+trunc(ch*3);
      if mean then
        rect.top:=rect.top+trunc(ch*2);
      canvas.MoveTo(trunc(x+ch/2),rect.top);
      canvas.LineTo(trunc(x+nch*ch-ch/2),rect.top);
    end;
  end;

  {readings}
  if read then
  begin
    if inlin then
    begin
      canvas.MoveTo(trunc(x+ch/2),trunc(y+ch*sizvert));
      canvas.LineTo(trunc(x+nch*ch-ch/2),trunc(y+ch*sizvert));
    end;
    ony:='';
    kuny:='';
    TCharRead.SetOrder('');
    TCharRead.Locate('Kanji',TChar.Str(TCharIndex),true);
    while (not TCharRead.EOF) and (TCharRead.Int(TCharReadKanji)=TChar.Int(TCharIndex)) do
    begin
     //Unfortunately for us, TCharReadReading is stored as Hex text in Ansi chars,
     //and mixed with control characters, so there's nothing we can do to convert
     //it to unicode automatically on reading.
     //We'll have to do it when copying s->ws.
      s := TCharRead.Str(TCharReadReading);
      rt := TCharRead.Int(TCharReadType);
      if curlang='j'then
       //Make some adjustments to the string (replace control chars with FChar equivalents)
        if (rt>3) and (rt<7) then
        begin
          ws:='';
          adddot:=0;
          if s[1]='+'then
          begin
            ws:={$IFNDEF UNICODE}'FF0B'{$ELSE}#$FF0B{$ENDIF};
            delete(s,1,1);
            adddot:=1;
          end;
          if s[1]='-'then
          begin
            ws:=ws+{$IFNDEF UNICODE}'FF0D'{$ELSE}#$FF0D{$ENDIF};
            delete(s,1,1);
            adddot:=1;
          end;
          if TCharRead.Int(TCharReadReadDot)>0 then
          begin
            ws:=ws+hextofstr(copy(s,1,TCharRead.Int(TCharReadReadDot)-1-adddot));
            ws:=ws+{$IFNDEF UNICODE}'FF0E'{$ELSE}#$FF0E{$ENDIF};
            delete(s,1,TCharRead.Int(TCharReadReadDot)-1-adddot);
          end;
          if s[length(s)]='-' then
            ws:=ws+hextofstr(copy(s,1,length(s)-1))+{$IFNDEF UNICODE}'FF0D'{$ELSE}#$FF0D{$ENDIF}
          else
            ws:=ws+hextofstr(s);
        end;
      if curlang='c' then ws:=hextofstr(s);
      case rt of
        2:if curlang='c'then if ony='' then ony:=ConvertPinYin(ws) else ony:=ony+fstr(', ')+ConvertPinYin(ws);
        8:if curlang='c'then if kuny='' then kuny:=fstr(lowercase(ws)) else kuny:=kuny+fstr(', ')+fstr(lowercase(ws));
        4:if curlang='j'then if flength(ony)+flength(ws)+2<=nch then if ony='' then ony:=ws else ony:=ony+UH_IDG_COMMA+ws;
        5:if curlang='j'then if flength(kuny)+flength(ws)+2<=nch then if kuny='' then kuny:=ws else kuny:=kuny+UH_IDG_COMMA+ws;
      end;
      TCharRead.Next;
    end;
//        ony:=fstr(KanaToRomaji(ony,3));
//        kuny:=fstr(KanaToRomaji(ony,3));
    DrawUnicode(canvas,trunc(x+ch/2),trunc(y+sizvert*ch+ch/2),trunc(ch),ony,FontJpEnGrid);
    DrawUnicode(canvas,trunc(x+ch/2),trunc(y+sizvert*ch+ch/2+ch),trunc(ch),kuny,FontJpEnGrid);
  end;

  if mean then
  begin
    if inlin then if not read then
    begin
      canvas.MoveTo(trunc(x+ch/2),trunc(y+ch*sizvert));
      canvas.LineTo(trunc(x+nch*ch-ch/2),trunc(y+ch*sizvert));
    end else
    begin
      canvas.MoveTo(trunc(x+ch/2),trunc(y+ch*(3+sizvert)));
      canvas.LineTo(trunc(x+nch*ch-ch/2),trunc(y+ch*(3+sizvert)));
    end;
    rect.left:=trunc(x+ch/2);
    rect.right:=trunc(x+nch*ch-ch/2);
    rect.top:=trunc(y+ch*(sizvert)+ch/2);
    rect.bottom:=trunc(y+ch*(1+sizvert)+ch/2);
    if read then
    begin
      rect.top:=rect.top+trunc(ch*3);
      rect.bottom:=rect.bottom+trunc(ch*3);
    end;
    defy:='';
    TCharRead.SetOrder('');
    TCharRead.Locate('Kanji',TChar.Str(TCharIndex),true);
    while (not TCharRead.EOF) and (TCharRead.Int(TCharReadKanji)=TChar.Int(TCharIndex)) do
    begin
      s:=TCharRead.Str(TCharReadReading);
      if ((curlang='j') and (TCharRead.Int(TCharReadType)=3)) or ((curlang='c') and (TCharRead.Int(TCharReadType)=7)) then
      begin
        if defy='' then defy:=defy+s else defy:=defy+', '+s;
      end;
      TCharRead.Next;
    end;
    canvas.Font.Name:=FontEnglish;
    canvas.Font.Height:=trunc(ch);
    canvas.TextRect(rect,rect.left,rect.top,defy);
  end;
  sl.Free;
end;

procedure ClearKanjiCardCache;
begin
  kcchind.Clear;
  kcchcomp.Clear;
end;

initialization
  kcchind:=TStringList.Create;
  kcchcomp:=TStringList.Create;

finalization
  kcchind.Free;
  kcchcomp.Free;

end.
