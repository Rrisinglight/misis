unit Stat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
   StringGrid1.Cells[0,0] := '�������';
   StringGrid1.Cells[1,0] := '������ �';
   StringGrid1.Cells[2,0] := '����� ��������';
   StringGrid1.Cells[3,0] := '����� ������������';
   StringGrid1.Cells[4,0] := '����� �� ������';
   StringGrid1.Cells[5,0] := '������ ����� � ����';
   StringGrid1.Cells[6,0] := '���� �';
   StringGrid1.TopRow :=0;
end;

end.
