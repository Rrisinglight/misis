unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Edit3: TEdit;
    ListBox1: TListBox;
    Table1: TTable;
    Button4: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var t,s:integer;
k: double;
begin
  t := StrToInt(Edit1.Text);
  s := StrToInt(Edit2.Text);

  k := t/s;
  Edit3.Text := FloatToStr(k);
end;

procedure TForm4.Button4Click(Sender: TObject);
var count,j, year : integer;
i,r,n,t,d,s,o,k: double;
str: string;
begin
  Table1.First;
  ListBox1.Clear;
  count := Table1.RecordCount;

  for j := 1 to count do
    begin
      year := Table1.FieldByName('god').Value;
      t := Table1.FieldByName('t').Value;

      s := Table1.FieldByName('c').Value;
      k := t/s;

      str := '���: '+IntToStr(year)+'   ����������� ���������������: '+FloatToStr(k);

      ListBox1.AddItem(str, nil);
      Table1.Next;
    end;
end;

end.
