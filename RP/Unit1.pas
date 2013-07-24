unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, jpeg, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    RP1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure RP1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  rr:array[0..100] of real;
  name1:array[0..100]of string[20];
  t:integer;
  tb:boolean;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  fillchar(rr,sizeof(rr),0);
  fillchar(name1,sizeof(name1),0);
  t:=0;
  stringgrid1.Cells[0,0]:='No.';
  stringgrid1.Cells[1,0]:='Name';
  stringgrid1.Cells[2,0]:='RP Value';
  tb:=false;
  stringgrid1.ColWidths[0]:=32;
  stringgrid1.ColWidths[1]:=80;
  stringgrid1.ColWidths[2]:=80;
end;

procedure TForm1.N3Click(Sender: TObject);
  var i,kk:integer;
begin
  fillchar(rr,sizeof(rr),0);
  fillchar(name1,sizeof(name1),0);
  edit1.Text:='';
  tb:=false;
  label3.Visible:=false;
  label4.visible:=false;
  kk:=stringgrid1.RowCount;
  for i:=1 to kk do begin
     //ValueListEditor1.DeleteRow(1);
     stringgrid1.Cells[0,i]:='';
     stringgrid1.Cells[1,i]:='';
     stringgrid1.Cells[2,i]:='';
  end;
  stringgrid1.RowCount:=2;
  t:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
  var r,kk:longint;
begin
  edit1.ReadOnly:=true;
  if edit1.text<>name1[t] then begin
    inc(t);
    r:=random(100001);
    rr[t]:=r/1000;
    label3.visible:=true;
    label4.Visible:=true;
    label4.caption:=floattostr(rr[t]);
    name1[t]:=edit1.text;
    //ValueListEditor1.InsertRow(name1[t],floattostr(rr[t]),true);
    if not tb then kk:=1 else kk:=stringgrid1.RowCount;
    stringgrid1.Cells[1,kk]:=name1[t];
    stringgrid1.Cells[2,kk]:=floattostr(rr[t]);
    stringgrid1.Cells[0,kk]:=inttostr(kk)+'.';
    if not tb then tb:=true else stringgrid1.RowCount:=stringgrid1.RowCount+1;
  end;
end;



procedure TForm1.Button2Click(Sender: TObject);
var i,j,k:integer;
      tmp_r:real;
      tmp_n:string;
begin
  for i:=1 to t-1 do begin
    k:=i;
    for j:=i+1 to t do
      if rr[j]<rr[k] then k:=j;
    if k<>i then begin
      tmp_r:=rr[i];  rr[i]:=rr[k];  rr[k]:=tmp_r;
      tmp_n:=name1[i];  name1[i]:=name1[k];  name1[k]:=tmp_n;
    end;
  end;
  // for i:=1 to t do ValueListEditor1.DeleteRow(1);
  // for i:=1 to t do ValueListEditor1.InsertRow(name1[i],floattostr(rr[i]),true);
  for i:=1 to t do begin
    stringgrid1.Cells[1,i]:=name1[i];
    stringgrid1.Cells[2,i]:=floattostr(rr[i]);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j,k:integer;
      tmp_r:real;
      tmp_n:string;
begin
  for i:=1 to t-1 do begin
    k:=i;
    for j:=i+1 to t do
      if rr[j]>rr[k] then k:=j;
    if k<>i then begin
      tmp_r:=rr[i];  rr[i]:=rr[k];  rr[k]:=tmp_r;
      tmp_n:=name1[i];  name1[i]:=name1[k];  name1[k]:=tmp_n;
    end;
  end;
//  for i:=1 to t do ValueListEditor1.DeleteRow(1);
//  for i:=1 to t do ValueListEditor1.InsertRow(name1[i],floattostr(rr[i]),true);
  for i:=1 to t do begin
    stringgrid1.Cells[1,i]:=name1[i];
    stringgrid1.Cells[2,i]:=floattostr(rr[i]);
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  messagebox(handle,'  ������...  ','����Ŀ¼',MB_OK);
end;

procedure TForm1.RP1Click(Sender: TObject);
begin
  form2:=Tform2.Create(self);
  try
    form2.ShowModal;
  finally
    form2.Free;
    end;
end;





procedure TForm1.Edit1Click(Sender: TObject);
begin
  edit1.ReadOnly:=false;
  edit1.Text:='';
  label3.Visible:=false;
  label4.Caption:='';
end;




end.
