unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Logic, ExtCtrls, Myclasses, Input,  XPMan;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    InfoTimer: TTimer;
    Label1: TLabel;
    TickTimer: TTimer;
    Button1: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Button2: TButton;
    Button4: TButton;
    XPManifest1: TXPManifest;
    Label7: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure InfoTimerTimer(Sender: TObject);
    procedure TickTimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Log: TLog;
  SceneMan: TSceneMan;
  max,avg:integer;

implementation

uses ComCtrls;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TickTimer.Enabled := not(TickTimer.Enabled);
  if TickTimer.Enabled then Button2.Caption:='�����'
  else Button2.Caption:='�����';

     
end;



procedure TForm1.Button4Click(Sender: TObject);
begin
  SceneMan.Reset;
  if TickTimer.Enabled then Button2.Click;
  (SceneMan.SellerMan.Sellers[0] as TSeller).InfoControls.WaitInfo.Edit.Text := '0 ���';
  (SceneMan.SellerMan.Sellers[1] as TSeller).InfoControls.WaitInfo.Edit.Text := '0 ���';
  (SceneMan.SellerMan.Sellers[2] as TSeller).InfoControls.WaitInfo.Edit.Text := '0 ���';
  
  max:=0;
  avg:=0;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Log:= TLog.Create(ListBox1);
  SceneMan := TSceneMan.Create(Log);
  SceneMan.CreateSellerMan(GroupBox1);
  max:=0;
  avg:=0;
end;

procedure TForm1.FormShow(Sender: TObject);
var i:Integer;
    buf:TSeller;
begin
  for i:= 0 to SceneMan.SellerMan.Sellers.Count - 1 do
  begin
    buf := SceneMan.SellerMan.Sellers[i] as TSeller;
    buf.CreateSettings(Form2.GroupBox1);
    if i=0 then buf.Settings.ChangeCoord(10,30)
    else buf.Settings.RightTo((SceneMan.SellerMan.Sellers[i-1] as TSeller).Settings,10);
  end;

  //SceneMan.Stat := Form3.StringGrid1;
  SceneMan.Itens := TIntSettings.Create(Form2.GroupBox2,10,20,30);
  (SceneMan.SellerMan.Sellers[0] as TSeller).Settings.SetTime(45, 150);
  (SceneMan.SellerMan.Sellers[1] as TSeller).Settings.SetTime(100, 200);
  (SceneMan.SellerMan.Sellers[2] as TSeller).Settings.SetTime(300, 450);
end;

procedure TForm1.InfoTimerTimer(Sender: TObject);
var i:integer;
    buf:TSeller;
    buf2:TClient;
    s:integer;
begin
  SceneMan.UpdateInfo;
  Label1.Caption := Log.MakeTimeString(Log.Time);
  SceneMan.Table.Places := StrToInt(Form2.Edit1.Text);

  for i:=  0 to SceneMan.SellerMan.Sellers.Count - 1 do
    begin
      buf := SceneMan.SellerMan.Sellers[i] as TSeller;
      if buf.ClientList.Count>max then max:= buf.ClientList.Count;
    end;

  for i:=  0 to SceneMan.Table.EndClientsList.Count - 1 do
    begin
      buf2 := SceneMan.Table.EndClientsList[i] as TClient;
      s:=s+buf2.PurchaseTime;//+buf2.WaitTime;
    end;

  if SceneMan.Table.EndClientsList.Count>0 then avg:=round(s/SceneMan.Table.EndClientsList.Count);
   

  begin
    Label2.Caption := '��������� ��������: '+IntToStr(SceneMan.Table.EndClientsList.Count);
    Label3.Caption := '�� ��������� ��������: '+IntToStr(SceneMan.Noserved);
   // Label4.Caption := '������� ����� ������������: '+IntToStr(avg)+' ���.';
    Label6.Caption := 'Max ����� �������: '+IntToStr(max);

  end;


end;

procedure TForm1.TickTimerTimer(Sender: TObject);
var i:integer;
begin


  for i:= 1 to Form2.TrackBar1.Position do
  begin
  if (Log.Time >= 23*3600) then
  begin
  Button2.Click;
  Break;
  end;
  SceneMan.Tick(1);
  end;
end;

end.
