unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Timer1: TTimer;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Timer1Timer(Sender: TObject);
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
var
  // ��������
  min: integer; // �����
  sec: integer; // ������

// � ��������� ���� ���������
// ���������, ������� ������� ��������
procedure ShowTime;
var
   buf: string[20];
begin
   // ������ � ������� ������� ����� �������
   If min < 10 then
      buf := '0' + IntToStr(min)+ ':'
   else
      buf := IntToStr(min) + ':';
   If sec < 10 then
      buf := buf + '0' + IntToStr(sec)
   else
      buf := buf + IntToStr(sec);
   Form1.Label3.Caption := buf;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
   If (sec = 0) and (min > 0) then
       begin
          sec := 60;
          min := min -1;
       end;
   sec := sec - 1;
   ShowTime; // ��������, ������� ������� ��������
   If (min = 0) and (sec = 0) then
       // �������� �������� �����
       begin
          Timer1.Enabled := False; // ����
          ShowMessage('�������� �������� �����!');
          Button1.Caption := '����';
          Label3.Visible := False; // ������ ��������� �������
          // ������� �������� ���� ����� ���������
          Label1.Visible := True;
          Edit1.Visible := True;
          Label2.Visible := True;
          Edit2.Visible := True;
          exit;
       end;

   If (sec = 0) and (min > 0) then
       begin
          sec := 60;
          min := min -1;
       end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   If Form1.Timer1.Enabled then
      // ������ ��������, ���� ����������
      begin
         Timer1.Enabled := False; // ����
         Button1.Caption := '����';
         Label3.Visible := False; // ������ ��������� �������
         // ������� �������� ���� ����� ���������
         Label1.Visible := True;
         Edit1.Visible := True;
         Label2.Visible := True;
         Edit2.Visible := True;
      end

   else
      // ������ ����� ���� ���������
      begin
         min := StrToInt(Edit1.Text);
         sec := StrToInt(Edit2.Text);
         If (sec = 0) and (min = 0) then
         begin
            ShowMessage('���� ������ ��������!');
            exit;
         end;
         Timer1.Enabled := True; // ��������� ������
         // ������ ���� ����� ���������
         Label1.Visible := False;
         Edit1.Visible := False;
         Label2.Visible := False;
         Edit2.Visible := False;
         Label3.Visible := True;
         Button1.Caption := '����';
         ShowTime;
      end;
end;



end.
