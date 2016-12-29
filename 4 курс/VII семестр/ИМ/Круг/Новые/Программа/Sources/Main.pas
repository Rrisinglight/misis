unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMan, StdCtrls, Logic, myclasses, InputForm, Stat;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    LogListBox: TListBox;
    Button1: TButton;
    InfoTimer: TTimer;
    TickTimer: TTimer;
    Panel2: TPanel;
    TimeLabel: TLabel;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure InfoTimerTimer(Sender: TObject);
    procedure TickTimerTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure UpdateStat;

var
  Form1: TForm1;
  Log: TLog;
  SceneMan:TSceneMan;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TickTimer.Enabled := not(TickTimer.Enabled);
  if TickTimer.Enabled then Button2.Caption := '����'
  else Button2.Caption := '�����';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SceneMan.Reset;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Log := TLog.Create(LogListBox);
  SceneMan := TSceneMan.Create(Log);
  SceneMan.CreateCarMan(Panel1);
  SceneMan.CreateClientMan(Panel2);
end;

procedure TForm1.FormShow(Sender: TObject);
var i: integer;
    buf:TClient;
    buf2:TCar;
begin
   for i := 0 to SceneMan.ClientMan.Clients.Count - 1 do
   begin
      buf := SceneMan.ClientMan.Clients[i] as TClient;
      buf.CreateSettings(Form2.GroupBox1);
      if i=0 then buf.Settings.ChangeCoord(10,30)
      else buf.Settings.RightTo((SceneMan.ClientMan.Clients[i-1] as TClient).Settings,25);
   end;
   for i := 0 to SceneMan.CarMan.Cars.Count - 1 do
   begin
      buf2 := SceneMan.CarMan.Cars[i] as TCar;
      buf2.CreateSettings(Form2.GroupBox2);
      if i=0 then buf2.Settings.ChangeCoord(10,10)
      else buf2.Settings.NextTo((SceneMan.CarMan.Cars[i-1] as TCar).Settings);
   end;
end;

procedure TForm1.InfoTimerTimer(Sender: TObject);
begin
  SceneMan.UpdateInfo;
  TimeLabel.Caption := Log.MakeTimeString(Log.Time);
  TickTimer.Interval := Round(1000/Form2.TrackBar1.Position);
  UpdateStat;
end;

procedure TForm1.TickTimerTimer(Sender: TObject);
begin
  if SceneMan.Log.Time<72000 then
  SceneMan.Tick(1) // ��� ������� 1 ���
  else
  begin
    Button2.Click;
    SceneMan.Log.Add('����������� ��������. ������� ���� ����������');
    Form3.Show;
  end;
end;

procedure UpdateStat();
var buf, Min,Max: TClient;
    i:integer;
    N,M,K,S:integer;
begin
  N:=0;
  M:=0;
  K:=0;
  S:=0;
  for i := 0 to SceneMan.ClientMan.Clients.Count - 1 do
   begin
      buf := SceneMan.ClientMan.Clients[i] as TClient;
      if i=0 then
      begin
        Min:=buf;
        Max:=buf;
      end
      else
      begin
        if buf.TotalWaitTime>Max.TotalWaitTime then Max:=buf;
        if buf.TotalWaitTime<Min.TotalWaitTime then Min:=buf;
      end;

      if buf.NeedMass>0 then N:=N+1;
      M:=M+buf.NeedMass;
      K:=K+buf.GoingMass;
      S:=S+buf.TotalWaitTime;
   end;

   Form3.Edit1.Text := IntToStr(Round(S/SceneMan.ClientMan.Clients.Count));
   Form3.Edit2.Text := Max.Name;
   Form3.Edit3.Text := Min.Name;
   Form3.Edit4.Text := IntToStr(N);
   Form3.Edit5.Text := IntToStr(M);
   Form3.Edit6.Text := IntToStr(K);
end;

end.
