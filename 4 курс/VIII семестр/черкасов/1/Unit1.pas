unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// ������ ��������� � ��������
function p(x,y:Double):TPoint;
var point:TPoint;
  w,h: integer;
begin
  w:=550;
  h:=300;
  point.X := Round(35 + x * w/6.7);
  point.Y := Round(h + 25 - (y-600) * h/1000);
  Result := point;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
  // ������ ������������ �����
  PaintBox1.Canvas.Pen.Width := 2;
  PaintBox1.Canvas.Polyline([p(0,0), p(6.7,0)]); // ��� �
  PaintBox1.Canvas.Polyline([p(0,0), p(0,1600)]); // ��� Y

 // ����������
 PaintBox1.Canvas.Pen.Width := 1;
 PaintBox1.Canvas.Pen.Color := clGray;
 PaintBox1.Canvas.Pen.Style:=psDot;

 // ��������������
 for i := 1 to 16 do
 begin
    PaintBox1.Canvas.Polyline([p(0,i*100), p(6.7,i*100)]);
    PaintBox1.Canvas.TextOut(5, p(0,i*100).Y-5, IntToStr(i*100));
 end;

 // ������������
 for i := 1 to 6 do
 begin
    PaintBox1.Canvas.Polyline([p(i,0), p(i,1600)]);
    PaintBox1.Canvas.TextOut(p(i,0).X,PaintBox1.Height-15, IntToStr(i));
 end;
 
 PaintBox1.Canvas.Pen.Color := clBlack;
 PaintBox1.Canvas.Pen.Width := 2;

 // �����
 PaintBox1.Canvas.Polyline([p(2.1,1147), p(6.7,1147)]);
 PaintBox1.Canvas.Polyline([p(0.1,1499), p(0.5,1499)]);
 PaintBox1.Canvas.Polyline([p(0.1,1499), p(0,1539)]);
 PaintBox1.Canvas.Polyline([p(0.1,1499), p(0,1392)]);
 PaintBox1.Canvas.Polyline([p(0,1392), p(0.2,1499)]);
 PaintBox1.Canvas.Polyline([p(6.7,1250), p(6.7,0)]);
 PaintBox1.Canvas.Polyline([p(0.05,727), p(6.7,727)]);
 PaintBox1.Canvas.Polyline([p(0.05,727), p(0,600)]);
 PaintBox1.Canvas.Polyline([p(0.05,727), p(0,911)]);

 // ������. ������ �� ���������, �������� � 2-� ������������� ������
 PaintBox1.Canvas.PolyBezier([p(0.2,1499), p(1.1,1304), p(1.5,1245), p(2.1,1147)]);
 PaintBox1.Canvas.PolyBezier([p(0.5,1499), p(1.0,1482), p(3.5,1261), p(4.3,1147)]);
 PaintBox1.Canvas.PolyBezier([p(4.3,1147), p(5.0,1201), p(6.0,1243), p(6.7,1250)]);
 PaintBox1.Canvas.PolyBezier([p(0.8,727), p(1.2,891), p(1.6,1018), p(2.1,1147)]);
 PaintBox1.Canvas.PolyBezier([p(0,910), p(0.2,853), p(0.5,773), p(0.8,727)]);
 PaintBox1.Canvas.PolyBezier([p(0,1539), p(0.2,1535), p(0.3,1524), p(0.5,1499)]);

 // ���������� �������
 Label1.Visible := true;
 Label2.Visible := true;
 Label3.Visible := true;
 Label4.Visible := true;
 Label5.Visible := true;
end;


end.
