unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    Button3: TButton;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  tkey    = array[1 .. 2, 1 .. 2] of byte;
  tcolumn = array[1 .. 2] of byte;

const
  k_2: Tkey = ((1, 2), (5, 3));
var
  Form2: TForm2;
  fi, fo: File;
  k_2_inv: Tkey;

implementation

{$R *.dfm}

{
  ���������� ������������ ��������� �������
  (������������ ��� ���������� �����, ��������� ������� �� ������
   ��� ���������� ������������ �������)
}
procedure extended_euclid(a, b: Longint;
          var x, y, d: Longint);
var q, r, x1, x2, y1, y2: Longint;
begin

  if b = 0 then begin

    d := a; x := 1; y := 0;
    exit

  end;

  x2 := 1; x1 := 0; y2 := 0; y1 := 1; 
  while b > 0 do begin

    q := a div b; r := a - q * b; 
    x := x2 - q * x1; y := y2 - q * y1; 
    a := b; b := r; 
    x2 := x1; x1 := x; y2 := y1; y1 := y; 

  end; 

  d := a; x := x2; y := y2; 

end; 

(* ���������� �����, ��������� A �� ������ N *) 
function inverse(a, n: Longint): Longint;
var d, x, y: Longint;
begin 

  extended_euclid(a, n, x, y, d); 
  if d = 1 then inverse := x 
  else
  begin
    inverse := 0;
    ShowMessage('�������� ������� �� �������');
  end;

end;

function positive(X: integer): integer;
  begin
    repeat 
      inc(X, 256);
    until X >= 0;
    positive := X;
  end;

procedure CalculateInvKey();
var det, i, j, count: integer;
begin
  det := k_2[1,1]*k_2[2,2]-k_2[1,2]*k_2[2, 1];
  if det < 0 then det := positive(det);

  det := inverse(det, 256);
  for i := 1 to 2 do
    for j := 1 to 2 do begin

      if i = j then
        k_2_inv[i, j] := det * k_2[3 - i, 3 - j]
      else
        k_2_inv[i, j] := - det * k_2[i, j];

      if k_2_inv[i, j] < 0 then
        k_2_inv[i, j] := positive(k_2_inv[i, j])
      else k_2_inv[i, j] := k_2_inv[i, j] mod 256;
    end;
end;

// open file
procedure TForm2.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit1.Text := OpenDialog1.FileName;
    AssignFile(fi, OpenDialog1.FileName);
    Reset(fi, 1);
    Memo1.Lines.Add('������ ���� '+OpenDialog1.FileName);
    ProgressBar1.Max := FileSize(fi);
    ProgressBar1.Position := 0;
  end;
end;

procedure Hill2_Enc(var buf:tcolumn);
var newbuf: tcolumn;
begin
  //Form2.Memo1.Lines.Add('�������� ����: '+IntToStr(buf[1])+','+IntToStr(buf[2]));
  newbuf[1] := (buf[1]*k_2[1][1] + buf[2]*k_2[1][2]) mod 256;
  newbuf[2] := (buf[1]*k_2[2][1] + buf[2]*k_2[2][2]) mod 256;
  buf := newbuf;
  //Form2.Memo1.Lines.Add('���� ����������: '+IntToStr(buf[1])+','+IntToStr(buf[2]));
end;

procedure Hill2_Dec(var buf:tcolumn);
var newbuf: tcolumn;
begin
  //Form2.Memo1.Lines.Add('�������� ����: '+IntToStr(buf[1])+','+IntToStr(buf[2]));
  newbuf[1] := (buf[1]*k_2_inv[1][1] + buf[2]*k_2_inv[1][2]) mod 256;
  newbuf[2] := (buf[1]*k_2_inv[2][1] + buf[2]*k_2_inv[2][2]) mod 256;
  buf := newbuf;
  //Form2.Memo1.Lines.Add('���� �����������: '+IntToStr(buf[1])+','+IntToStr(buf[2]));
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  buf: tcolumn;
  count: integer;
  add: byte;
begin
  if SaveDialog1.Execute then
  begin
     AssignFile(fo, SaveDialog1.FileName);
     ReWrite(fo, 1);
     ProgressBar1.Position := 0;
     add := (FileSize(fi) mod 2);
     BlockWrite(fo, add, 1);
     while not eof(fi) do
     begin
       BlockRead(fi, buf, 2,count);
       if (count=1) then buf[2] := 0;
       Hill2_Enc(buf);
       BlockWrite(fo, buf[1], 1);
       BlockWrite(fo, buf[2], 1);
       ProgressBar1.Position := ProgressBar1.Position + 2;
     end;
     Memo1.Lines.Add('�������� ���� '+SaveDialog1.FileName);
     ShowMessage('���������!');
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  buf: tcolumn;
  count: integer;
  add: byte;
begin
  if SaveDialog1.Execute then
  begin
     AssignFile(fo, SaveDialog1.FileName);
     ReWrite(fo, 1);
     ProgressBar1.Position := 0;
     BlockRead(fi, add, 1);
     while not eof(fi) do
     begin
       BlockRead(fi, buf, 2,count);
       if (count=1) then buf[2] := 0;
       Hill2_Dec(buf);
       BlockWrite(fo, buf[1], 1);
       if not(eof(fi) and (add=1)) then BlockWrite(fo, buf[2], 1)
       else
       begin
         add:=2;
       end;
            
       ProgressBar1.Position := ProgressBar1.Position + 2;
     end;
     Memo1.Lines.Add('�������� ���� '+SaveDialog1.FileName);
     ShowMessage('���������!');
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  CalculateInvKey();

end;

end.
