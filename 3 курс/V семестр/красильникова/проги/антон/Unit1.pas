unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Translit(s: string): string;
var
 i: integer;
 t: string;
begin
 for i:=1 to Length(s) do
  begin
   case s[i] of
        '�': t:=t+'a';
        '�': t:=t+'b';
        '�': t:=t+'v';
        '�': t:=t+'g';
        '�': t:=t+'d';
        '�': t:=t+'e';
        '�': t:=t+'ye';
        '�': t:=t+'zh';
        '�': t:=t+'z';
        '�': t:=t+'i';
        '�': t:=t+'y';
        '�': t:=t+'k';
        '�': t:=t+'l';
        '�': t:=t+'m';
        '�': t:=t+'n';
        '�': t:=t+'o';
        '�': t:=t+'p';
        '�': t:=t+'r';
        '�': t:=t+'s';
        '�': t:=t+'t';
        '�': t:=t+'u';
        '�': t:=t+'f';
        '�': t:=t+'ch';
        '�': t:=t+'z';
        '�': t:=t+'ch';
        '�': t:=t+'sh';
        '�': t:=t+'ch';
        '�': t:=t+'''';
        '�': t:=t+'y';
        '�': t:=t+'''';
        '�': t:=t+'e';
        '�': t:=t+'yu';
        '�': t:=t+'ya';
        '�': t:=t+'A';
        '�': t:=t+'B';
        '�': t:=t+'V';
        '�': t:=t+'G';
        '�': t:=t+'D';
        '�': t:=t+'E';
        '�': t:=t+'Ye';
        '�': t:=t+'Zh';
        '�': t:=t+'Z';
        '�': t:=t+'I';
        '�': t:=t+'Y';
        '�': t:=t+'K';
        '�': t:=t+'L';
        '�': t:=t+'M';
        '�': t:=t+'N';
        '�': t:=t+'O';
        '�': t:=t+'P';
        '�': t:=t+'R';
        '�': t:=t+'S';
        '�': t:=t+'T';
        '�': t:=t+'U';
        '�': t:=t+'F';
        '�': t:=t+'Ch';
        '�': t:=t+'Z';
        '�': t:=t+'Ch';
        '�': t:=t+'Sh';
        '�': t:=t+'Ch';
        '�': t:=t+'''';
        '�': t:=t+'Y';
        '�': t:=t+'''';
        '�': t:=t+'E';
        '�': t:=t+'Yu';
        '�': t:=t+'Ya';
      else t:=t+s[i];
   end;
  end;
 Result:=t;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
    Memo2.Lines.Clear;
    for i:=0 to (Memo1.Lines.Count-1) do
        Memo2.Lines.Add(Translit(Memo1.Lines.Strings[i]));
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 SaveDialog1.Create(Application);
 if SaveDialog1.Execute then Memo2.Lines.SaveToFile(SaveDialog1.FileName);
 SaveDialog1.Free;
end;

end.
