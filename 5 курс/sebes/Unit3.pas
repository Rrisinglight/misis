unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,SQLite3, SQLiteTable3, Globals;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  DB : TSQLiteDatabase;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var name, podr, date, count: string;
query: AnsiString;
begin
  //��������
  name := Edit1.Text;
  podr := Edit2.Text;
  date := Edit3.Text;
  count := Edit4.Text;
  query := 'INSERT INTO products(name, podrazd, date, count) VALUES("'+name+'","'+podr+'","'+date+'","'+count+'")';
  query := AnsiToUtf8(query);
 // ShowMessage(query);
  DB.ExecSQL(query);
  Form3.Close;
  NeedLoadProducts := true;

end;

procedure TForm3.Button2Click(Sender: TObject);
var name, podr, date, count: string;
query: AnsiString;
begin
  //���������
   name := Edit1.Text;
  podr := Edit2.Text;
  date := Edit3.Text;
  count := Edit4.Text;
  query := 'UPDATE products SET name="'+name+'", podrazd="'+podr+'", date="'+date+'", count="'+count+'" WHERE id='+CurrentProductId;
  query := AnsiToUtf8(query);
   DB.ExecSQL(query);
  Form3.Close;
  NeedLoadProducts := true;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  //�������
  DB.ExecSQL('DELETE FROM products WHERE id='+CurrentProductId);
    NeedLoadProducts := true;
  Form3.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
   DB := TSQLiteDatabase.Create('base.sqlite');
end;

end.
