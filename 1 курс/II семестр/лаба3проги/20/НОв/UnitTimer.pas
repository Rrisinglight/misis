unit UnitTimer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormTimer = class(TForm)
    LabelMin: TLabel;
    LabelSec: TLabel;
    LabelTimer: TLabel;
    ButtonPusk: TButton;
    Timer: TTimer;
    EditMin: TEdit;
    EditSec: TEdit;
    procedure TimerTimer(Sender: TObject);
    procedure ButtonPuskClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTimer: TFormTimer;

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
   FormTimer.LabelTimer.Caption := buf;
end;


procedure TFormTimer.TimerTimer(Sender: TObject);
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
          Timer.Enabled := False; // ����
          ShowMessage('�������� �������� �����!');
          ButtonPusk.Caption := '����';
          LabelTimer.Visible := False; // ������ ��������� �������
          // ������� �������� ���� ����� ���������
          LabelMin.Visible := True;
          EditMin.Visible := True;
          LabelSec.Visible := True;
          EditSec.Visible := True;
          exit;
       end;

   If (sec = 0) and (min > 0) then
       begin
          sec := 60;
          min := min -1;
       end;
end;

procedure TFormTimer.ButtonPuskClick(Sender: TObject);
begin
   If FormTimer.Timer.Enabled then
      // ������ ��������, ���� ����������
      begin
         Timer.Enabled := False; // ����
         ButtonPusk.Caption := '����';
         LabelTimer.Visible := False; // ������ ��������� �������
         // ������� �������� ���� ����� ���������
         LabelMin.Visible := True;
         EditMin.Visible := True;
         LabelSec.Visible := True;
         EditSec.Visible := True;
      end

   else
      // ������ ����� ���� ���������
      begin
         min := StrToInt(EditMin.Text);
         sec := StrToInt(EditSec.Text);
         If (sec = 0) and (min = 0) then
         begin
            ShowMessage('���� ������ ��������!');
            exit;
         end;
         Timer.Enabled := True; // ��������� ������
         // ������ ���� ����� ���������
         LabelMin.Visible := False;
         EditMin.Visible := False;
         LabelSec.Visible := False;
         EditSec.Visible := False;
         LabelTimer.Visible := True;
         ButtonPusk.Caption := '����';
         ShowTime;
      end;
end;



end.
