unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, unit1, unit3, unit5, unit4,unit6,unit12,unit7,unit8,unit9 , unit10, unit11,
  Menus, jpeg;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    N9: TMenuItem;
    N10: TMenuItem;
    Label3: TLabel;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


procedure TForm2.Button2Click(Sender: TObject);
begin
  Button2.Hide;
  edit1.Hide;
    edit2.Hide;
    label1.hide;
        label2.hide;
            label3.show;
end;

procedure TForm2.N10Click(Sender: TObject);
begin
form6.Show;
end;

procedure TForm2.N11Click(Sender: TObject);
begin
  form5.Show;
end;

procedure TForm2.N12Click(Sender: TObject);
begin
form7.show;
end;

procedure TForm2.N13Click(Sender: TObject);
begin
form8.show;
end;

procedure TForm2.N14Click(Sender: TObject);
begin
form9.show;
end;

procedure TForm2.N16Click(Sender: TObject);
begin
form12.Show;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
form11.Show;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
form10.Show;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.N6Click(Sender: TObject);
begin
  Form1.CalcNom(nil);
  Form1.Show();
end;

procedure TForm2.N7Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm2.N8Click(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm2.N9Click(Sender: TObject);
begin
form5.Show;
end;

end.
