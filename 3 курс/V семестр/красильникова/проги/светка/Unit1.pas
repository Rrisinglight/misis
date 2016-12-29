unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Menus, unit2;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  simvols:array[0..31] of char;
  rasshifr:array[0..8] of string;
  heart:array[0..9] of integer = (0,5,8,9,14,19,27,29,30,31);
  lich:array[0..21] of integer = (1,2,3,4,6,7,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,28);
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var  count:integer;
     f:TextFile;
     temp:string;
begin
 simvols[0]:='�';
 simvols[1]:='�';
 simvols[2]:='�';
 simvols[3]:='�';
 simvols[4]:='�';
 simvols[5]:='�';
 simvols[6]:='�';
 simvols[7]:='�';
 simvols[8]:='�';
 simvols[9]:='�';
 simvols[10]:='�';
 simvols[11]:='�';
 simvols[12]:='�';
 simvols[13]:='�';
 simvols[14]:='�';
 simvols[15]:='�';
 simvols[16]:='�';
 simvols[17]:='�';
 simvols[18]:='�';
 simvols[19]:='�';
 simvols[20]:='�';
 simvols[21]:='�';
 simvols[22]:='�';
 simvols[23]:='�';
 simvols[24]:='�';
 simvols[25]:='�';
 simvols[26]:='�';
 simvols[27]:='�';
 simvols[28]:='�';
 simvols[29]:='�';
 simvols[30]:='�';
 simvols[31]:='�';

 for count := 0 to Length(rasshifr)-1 do
   rasshifr[count] := '';

 DateTimePicker1.date := date;

 // ��������� �������� ����� �� �����
 count := 0;
  AssignFile(f,'Nums.txt');
  Reset(f);
  while(not eof(f))do
    begin
      Readln(f,temp);
      if(AnsiPos('@',temp)>0)then
        begin
          inc(count);
        end
         else
           rasshifr[count] := rasshifr[count]+ ' ' +temp ;
    end;
  CloseFile(f);

end;

// ��������������� �������:

function CharToNum(ch:char):integer;
var
 count:integer;
begin
 count := 0;
 while((ch <> simvols[count])and(count < length(simvols)))do
   inc(count);
 inc(count);
 result := count mod 8;
 if(result = 0)then
   result := 8;
end;

function StringToNum(value: string): integer;
var
 count:integer;
 name:integer;
begin
 name := 0;
 for count := 1 to Length(value) do
  if(IsCharAlpha(value[count]))then
    name := name + CharToNum(value[count]);
 result := name;
end;

function toSimple(val: integer): integer;
var
 temp:string;
 count:integer;
 return:integer;
begin
 return := 0;
 temp := IntToStr(val);
 for count := 1 to Length(temp) do
    return := return + StrToInt(temp[count]);
 if(Length(IntToStr(return))>1)then
     return := toSimple(return);
 Result := return;
end;

function GetBirthday(date: TDate): integer;
var
 temp:string;
 count: integer;
 value: integer;
begin
 value := 0;
 temp := FormatDateTime('ddmmyyyy',date);
 for count := 1 to Length(temp) do
     value := value + StrToInt(temp[count]);
 result := toSimple(value);
end;


function GetLichnost(val: string): integer;
var
  i,j:integer;
  return:integer;
begin
  return := 0;

  for i := 1 to Length(val) do
    for j := 0 to Length(lich)-1 do
      if(val[i] = simvols[lich[j]])then
        return := return + CharToNum(val[i]);

  Result := toSimple(return);
end;

procedure TForm1.Button1Click(Sender: TObject);
var name:integer;
 temp:string;
begin
 name := 0;
 temp := '';
 Memo1.Lines.Clear();
 temp := Edit1.Text + Edit2.Text + Edit3.Text;

 // ������� ��������� ������
 if(Edit1.Text <> '')then
   Memo1.Lines.add(Edit1.Text);

 if(Edit2.Text <> '')then
   Memo1.Lines.add(Edit2.Text);

 if(Edit3.Text <> '')then
   Memo1.Lines.add(Edit3.Text);

 if(DateToStr(DateTimePicker1.Date) <> DateToStr(Date))then
  Memo1.Lines.add(FormatDateTime('yyyy-mm-dd',DateTimePicker1.DateTime));
 //////////////////////////////////////////////////////////////////////////


 if(temp <> '')then
  begin
   name := StringToNum(AnsiLowerCase(temp));
   name := toSimple(name);
   Memo1.Lines.Add('����� ������ ����� '+IntToStr(name));
   Memo1.Lines.Add('');
   Memo1.Lines.Add(rasshifr[name-1]);
   Memo1.Lines.Add('');
  end;

 if(DateToStr(DateTimePicker1.Date) <> DateToStr(Date))then
  begin
    name := GetBirthday(DateTimePicker1.date);
    Memo1.Lines.Add('����� ������ ��� �������� '+IntToStr(name));
    Memo1.Lines.Add('');
    Memo1.Lines.Add(rasshifr[name-1]);
    Memo1.Lines.Add('');
  end;

 if(Length(temp) > 0)then
  begin
    name := GetLichnost(temp);
    Memo1.Lines.Add('����� ����� �������� '+IntToStr(name));
    Memo1.Lines.Add('');
    Memo1.Lines.Add(rasshifr[name-1]);
    Memo1.Lines.Add('');
  end;
 Memo1.SelStart := 0;
 SendMessage(Memo1.Handle,EM_SCROLLCARET,0,0);
end;

// ����������
procedure TForm1.Button2Click(Sender: TObject);
var s:TSaveDialog;
begin
  if(Memo1.Lines.Count > 0)then
   begin
   s := TSaveDialog.Create(Application);
   if s.Execute then
     Memo1.Lines.SaveToFile(s.FileName);
     end;

 
end;

procedure TForm1.N3Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Button2.Click;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  DateTimePicker1.date := date;
  Memo1.Lines.Clear;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 Form2.Show;
end;

end.
