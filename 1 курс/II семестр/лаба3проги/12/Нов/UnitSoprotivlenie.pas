unit UnitSoprotivlenie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormSoprotivlenie = class(TForm)
    LabelText: TLabel;
    LabelR1: TLabel;
    LabelR2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioButtonPosled: TRadioButton;
    RadioButtonParall: TRadioButton;
    ButtonCalculate: TButton;
    LabelResult: TLabel;
    GroupBoxTip: TGroupBox;
    procedure ButtonCalculateClick(Sender: TObject);
    procedure RadioButtonPosledClick(Sender: TObject);
    procedure RadioButtonParallClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSoprotivlenie: TFormSoprotivlenie;

implementation

{$R *.dfm}

procedure TFormSoprotivlenie.ButtonCalculateClick(Sender: TObject);
var
   r1,r2: real; // �������� �������������
   r: real; // ������������� ����
begin
   // �������� �������� ������
   r1 := StrToFloat(Edit1.Text);
   r2 := StrToFloat(Edit2.Text);

   If (r1 = 0) and (r2 = 0) then
   begin
      ShowMessage('���� ������ �������� ���� �� ������ �������������');
      exit;
   end;

   If RadioButtonPosled.Checked
       then // ������ ������������ ���������������
           r := r1 + r2
       else // ������ ������������ �����������
           r := (r1*r2)/(r1+r2);
   LabelResult.Caption := '������������� ����: ';
   If r < 1000 then
      LabelResult.Caption := LabelResult.Caption + FloatToStrF(r,ffGeneral,3,2) + ' ��'
   else
     begin
        r := r/1000;
        LabelResult.Caption := LabelResult.Caption + FloatToStrF(r,ffGeneral,3,2) + ' ���';
     end
end;

procedure TFormSoprotivlenie.RadioButtonPosledClick(Sender: TObject);
begin
   LabelResult.Caption := '';
end;

procedure TFormSoprotivlenie.RadioButtonParallClick(Sender: TObject);
begin
   LabelResult.Caption := '';
end;

end.
