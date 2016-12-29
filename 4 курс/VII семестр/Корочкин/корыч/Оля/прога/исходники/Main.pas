unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, logic, StdCtrls, myclasses, input;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    InfoTimer: TTimer;
    ListBox1: TListBox;
    Label1: TLabel;
    TickTimer: TTimer;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure InfoTimerTimer(Sender: TObject);
    procedure TickTimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  test:TConvMan;
  test2:TTimeControls;
  log:TLog;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TickTimer.Enabled := not(TickTimer.Enabled);
  if TickTimer.Enabled then Button2.Caption:='����'
  else Button2.Caption:='�����';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  test.Reset;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  log:=TLog.Create(ListBox1);

  test := TConvMan.Create(Panel1, log);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //test2 := TTimeControls.Create('������1',Form2.GroupBox1);
  test.CreateControls(Form2.Panel1);
end;

procedure TForm1.InfoTimerTimer(Sender: TObject);
begin
  test.UpdateInfo;
  Label1.Caption := log.MakeTimeString(log.time);

  begin
   Label2.Caption := '������� ������� 1-�� ����: '+ IntToStr(((test.ConvList[0] as TConv).Stans.Last as TStan).DoneNum);
   Label3.Caption := '������� ������� 2-�� ����: '+ IntToStr(((test.ConvList[1] as TConv).Stans.Last as TStan).DoneNum);
   Label4.Caption := '������� ������� 3-�� ����: '+ IntToStr(((test.ConvList[2] as TConv).Stans.Last as TStan).DoneNum);
  end;

  TickTimer.Interval:=Round(1000/Form2.TrackBar1.Position);
end;

procedure TForm1.TickTimerTimer(Sender: TObject);
begin
  log.Tick(60);
  test.Tick(1);
end;

end.
