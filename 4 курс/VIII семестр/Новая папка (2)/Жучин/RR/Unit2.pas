unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  TForm2 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label4: TLabel;
    Edit9: TEdit;
    Button3: TButton;
    Label5: TLabel;
    Edit10: TEdit;
    Label6: TLabel;
    ListBox3: TListBox;
    Label7: TLabel;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    Button5: TButton;
    Label8: TLabel;
    Memo3: TMemo;
    OpenDialog2: TOpenDialog;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

  closeKey, openKey: array[1..4] of integer;
  n,m,nminus: integer;

  outFile, inFile:File of Byte;

implementation

{$R *.dfm}

function IntToBin( Int: Integer; maxlen: integer ): String;
var
  i, j, k: Integer;
begin
  Result := '';
  i := 0;
  j := 1;
  while i = 0 do
    if( ( Int Mod (j*2) ) = Int )
      then i := j
      else j := j * 2;
  while i > 0 do
  begin
    if( ( Int div i ) > 0 ) then
    begin
      Int := Int - i;
      Result := Result + '1';
    end
    else Result := Result + '0';
    i := Trunc( i * 0.5 );
  end;
  k:=maxlen-Length(Result);
  for i := 1 to k do Result := '0'+Result;
end;

// ������� ���� ��� ����������
procedure TForm2.Button1Click(Sender: TObject);
begin
  if openDialog1.Execute then
  begin
    Label2.Caption := OpenDialog1.FileName;
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

function toR(code:integer):integer;
var i,k:integer;
begin
  k:=0;
  for i := 0 to Form2.ListBox2.Count - 1 do
    begin
      if (code = StrToInt(Form2.ListBox2.Items[i])) then
      begin
        k:=i+1;
        Break;
      end;
    end;
  Result:=k;
end;


procedure Convert();
var k, code, rcode:integer;
    text:string;
    ch:char;
begin
  Form2.ListBox1.Clear;
  Form2.Memo2.Clear;
  text := Form2.Memo1.Text;
  for k := 1 to Length(text) do
  begin
    ch := text[k];
    code := ord(ch);
    rcode := toR(code);
    Form2.ListBox1.AddItem(ch +' #'+IntToStr(code) + ' = ' + IntToStr(rcode), nil);
    Form2.Memo2.Text := Form2.Memo2.Text + IntToBin(rcode,8);
  end;
end;

procedure CalculateNm();
var k,res: integer;
begin
  k:=0;
  res:=0;

  while res<>1 do
  begin
    k:=k+1;
    res := (n*k) mod m;
  end;

  nminus := k;
end;

procedure CalculateKeys();
var i:integer;
begin
  with Form2 do
  begin
    closeKey[1]:=StrToInt(Edit1.Text);
    closeKey[2]:=StrToInt(Edit2.Text);
    closeKey[3]:=StrToInt(Edit3.Text);
    closeKey[4]:=StrToInt(Edit4.Text);

    n:=StrToInt(Edit9.Text);
    m:=StrToInt(Edit10.Text);

    for i := 1 to 4 do
    begin
      openKey[i] := (closeKey[i]*n) mod m;
    end;

    Edit5.Text := IntToStr(openKey[1]);
    Edit6.Text := IntToStr(openKey[2]);
    Edit7.Text := IntToStr(openKey[3]);
    Edit8.Text := IntToStr(openKey[4]);
  end;
  CalculateNm();
end;

procedure EnCrypt();
var i,j,num,k,sum:integer;
    text:string;
begin
  num:=(Length(Form2.Memo2.Text)) div 4;
  text := Form2.Memo2.Text;
  Form2.ListBox3.Clear;
  for i := 0 to num-1 do
  begin
    sum:=0;
    for j := 1 to 4 do
    begin
      k:=i*4+j;
      if text[k]='1' then sum:= sum + openKey[j];
    end;
    Form2.ListBox3.AddItem(IntToStr(sum),nil);
  end;
end;

function DeCrypt4(k:integer):string;
var i:integer;
    text:string;
begin
  for i := 4 downto 1 do
    begin
      if k>=closeKey[i] then
      begin
        k:=k-closeKey[i];
        text:='1'+text;
      end
      else text:='0'+text;
    end;
  Result:=text;
end;

function nexp(ex:integer):integer;
var i,res:integer;
begin
  res:=1;
  for i := 1 to ex do
    begin
      res:=res*2;
    end;
  Result:=res;
end;

function DeCrypt(s:string):string;
var i,j,k,num, code:integer;
    text:string;
begin
  k := Length(s) div 8;
  for i := 0 to k-1 do
    begin
      code := 0;
      for j := 8 downto 1 do
        begin
           num:=i*8+(9-j);
           if (s[num]='1') then code := code + nexp(j-1);
        end;
        text := text + chr(StrToInt(Form2.ListBox2.Items[code-1]));
    end;
  Result:=text;
end;

// �����������
procedure TForm2.Button2Click(Sender: TObject);
begin
  Convert();
  EnCrypt();
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  CalculateKeys();
end;

// ���������
procedure TForm2.Button4Click(Sender: TObject);
var i,k: integer;
begin
  if saveDialog1.Execute then
  begin
    assignfile(outFile, SaveDialog1.FileName);
    rewrite(outFile);

    for i := 0 to ListBox3.Count - 1 do
      begin
         k:=StrToInt(ListBox3.Items[i]);
         write(outFile, byte(k));
      end;
    CloseFile(outFile);
    ShowMessage('���������!');
  end;
end;

// �����������
procedure TForm2.Button5Click(Sender: TObject);
var b,k,k2:byte;
    buf:string;
begin
  Memo3.Clear;
  buf := '';
  if openDialog2.Execute then
  begin
    assignfile(inFile, openDialog2.FileName);
    reset(inFile);
    while not eof(inFile) do
    begin
      read(inFile,b);
      k:=integer(b);
      k2:= (k*nminus) mod m;
      buf := buf + DeCrypt4(k2);
    end;
    CloseFile(inFile);

    Memo3.Text := DeCrypt(buf);
  end;
  
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Label2.Caption := OpenDialog1.FileName;
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  CalculateKeys();
end;

end.
