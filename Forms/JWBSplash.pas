unit JWBSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Buttons, UrlLabel;

type
  TfSplash = class(TForm)
    Panel1: TPanel;
    lblVersion: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    lblURL: TUrlLabel;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Shape1: TShape;
    lblCopyright: TLabel;
    lblTargetOS: TLabel;
    procedure FormCreate(Sender: TObject);
  end;

var
  fSplash: TfSplash;

implementation
uses JWBUnit;

{$R *.DFM}

procedure TfSplash.FormCreate(Sender: TObject);
begin
  lblVersion.Caption:=WakanVer;
  lblCopyright.Caption:=WakanCopyright;
end;

end.
