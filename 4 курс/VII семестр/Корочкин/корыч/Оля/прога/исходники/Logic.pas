unit Logic;

interface
uses classes, Sysutils, Contnrs, myclasses,Forms, StdCtrls, ComCtrls, ExtCtrls, Controls, Math, Graphics;

Type TTimeControls=class(Tobject)
  Name:string;
  Panel: TPanel;
  MinTime: TIntegerInput;
  MaxTime: TIntegerInput;
  Constructor Create(cName: string; cParent: TWinControl);
  procedure ChangeCoord(X,Y: integer);
  procedure NextTo(C: TTimeControls; delta: integer);
end;

Type TStanControls=class(Tobject)
  Name:string;
  GroupBox: TGroupBox;
  StateInfo: TInfoRecord;
  WorkTimeInfo: TInfoRecord;
  WaitTimeInfo: TInfoRecord;
  KPDInfo: TInfoRecord;
  QueueInfo:TInfoRecord;
  Constructor Create(cName: string; cParent: TWinControl);
  procedure ChangeCoord(X,Y: integer);
  procedure NextTo(CC: TStanControls; delta: integer);
end;

Type TDetal=class(Tobject)
  Name:string;
  DoingTime:integer;
  WaitTime:integer;
  RemainTime:integer;
  Constructor Create(cName: string);
end;

Type TStan=class(Tobject)
  Log:TLog;
  Name:string;
  Controls:TStanControls;
  NextStan:TStan;
  Queue:TObjectList;
  Detal:TDetal;
  WorkTime:Integer;
  WaitTime:Integer;
  Active:Boolean;
  Time:TTimeControls;
  DoneNum:integer;
  Constructor Create(cName: string; cParent: TWinControl;cLog:TLog);
  procedure UpdateInfo;
  procedure Tick(dt:integer);
  procedure SetWorkTime;
  procedure CreateTimeControls(cParent:TWinControl);
  procedure Reset;
end;

Type TConvControls=class(Tobject)
  Name:string;
  GroupBox: TGroupBox;
  GroupBox2:TGroupBox;
  TimeRange: TIntegerInput;
  Constructor Create(cName: string; cParent: TWinControl);
  procedure ChangeCoord(X,Y: integer);
  procedure NextTo(CC: TConvControls; delta: integer);
end;

Type TConv=class(Tobject)
  Name:string;
  Log: TLog;
  Parent:TWinControl;
  GroupBox: TGroupBox;
  Controls:TConvControls;
  Stans: TObjectList;
  TimeRemain: integer;
  DoneNum:integer;
  Constructor Create(cName: string; cParent: TWinControl;cLog: TLog);
  procedure AddStan(cName:string);
  procedure ChangeCoord(X,Y: integer);
  procedure NextTo(C: TConv; delta: integer);
  procedure UpdateInfo;
  procedure AddNewDetal(cName:string);
  procedure Tick(dt:integer);
  procedure CreateControls(cParent:TWinControl);
  procedure Reset;
end;

Type TConvMan=class(Tobject)
  Log: TLog;
  Parent:TWinControl;
  ConvList: TObjectList;
  Constructor Create(cParent: TWinControl;cLog: TLog);
  procedure AddConv(cName:string; cStans:integer);
  procedure UpdateInfo;
  procedure Tick(dt:integer);
  procedure CreateControls(cParent:TWinControl);
  procedure Reset;
end;

implementation

Constructor TconvControls.Create(cName: string; cParent: TWinControl);
var lbl4,lbl5:TLabel;
begin
  Name:=cName;
  GroupBox:=TGroupBox.Create(cParent);
  GroupBox.Parent := cParent;
  GroupBox.Caption := name;
  GroupBox.Width := 220;
  groupbox.Height := 220;

  lbl4 := TLabel.Create(GroupBox);
  lbl4.Parent := GroupBox;
  lbl4.AutoSize := true;
  lbl4.Caption := '������� ��������� ������';
  lbl4.Top := 20;
  lbl4.Left := 5;

  TimeRange := TIntegerInput.Create(5,GroupBox);
  TimeRange.Edit.Top := 10;
  TimeRange.Edit.Left := lbl4.Left + lbl4.Width + 5;

  lbl5 := TLabel.Create(GroupBox);
  lbl5.Parent := GroupBox;
  lbl5.AutoSize := true;
  lbl5.Caption := '���.';
  lbl5.Top := lbl4.Top;
  lbl5.Left := TimeRange.Edit.Left + TimeRange.Edit.Width + 5;

  GroupBox2:=TGroupBox.Create(GroupBox);
  GroupBox2.Parent := GroupBox;
  GroupBox2.Caption := '����� ��������� �������:';
  GroupBox2.Width := 180;
  groupbox2.Height := 175;
  GroupBox2.Top := 40;
  GroupBox2.Left := 5;
end;

procedure TTimeControls.ChangeCoord(X,Y: integer);
begin
  Panel.Left:=X;
  Panel.Top :=Y;
end;

procedure TTimeControls.NextTo(C: TTimeControls; delta: integer);
begin
  Panel.Left:=C.Panel.Left;
  Panel.Top:=C.Panel.Top + C.Panel.Height + delta;
end;

Constructor TTimeControls.Create(cName: string; cParent: TWinControl);
var lbl1,lbl2,lbl3:TLabel;
begin
   Panel := TPanel.Create(cParent);
   Panel.Parent := cParent;
   Panel.BevelKind := bkNone;
   Panel.BevelOuter := bvNone;
   Panel.Height := 25;
   Panel.Width := 165;

   lbl1 := TLabel.Create(Panel);
   lbl1.Parent := Panel;
   lbl1.AutoSize := true;
   lbl1.Caption := cName+':';
   lbl1.Top := 7;
   lbl1.Left := 5;

   MinTime := TIntegerInput.Create(3,Panel);
   MinTime.Edit.Top := 0;
   MinTime.Edit.Left := lbl1.Left+lbl1.Width+5;

   lbl2 := TLabel.Create(Panel);
   lbl2.Parent := Panel;
   lbl2.AutoSize := true;
   lbl2.Caption := '-';
   lbl2.Top := MinTime.Edit.Top + 2;
   lbl2.Left := MinTime.Edit.Left + MinTime.Edit.Width +5;

   MaxTime := TIntegerInput.Create(6,Panel);
   MaxTime.Edit.Top := MinTime.Edit.Top;
   MaxTime.Edit.Left := lbl2.Left + lbl2.Width + 5;

   lbl3 := TLabel.Create(Panel);
   lbl3.Parent := Panel;
   lbl3.AutoSize := true;
   lbl3.Caption := '���.';
   lbl3.Top := MinTime.Edit.Top + 7;
   lbl3.Left := MaxTime.Edit.Left + MaxTime.Edit.Width +5;
end;

Constructor TDetal.Create(cName: string);
begin
  Name:=cName;
  DoingTime:=0;
  WaitTime:=0;
  RemainTime:=-1;
end;

Constructor TStanControls.Create(cName: string; cParent: TWinControl);
begin
  Name:=cName;
  GroupBox := TGroupBox.Create(cParent);
  GroupBox.Parent := cParent;
  GroupBox.Caption := Name;
  GroupBox.Width := 165;
  GroupBox.Height := 135;

  StateInfo:=TInfoRecord.Create('���������: ',GroupBox,80);
  StateInfo.ChangeCoord(10,20);

  QueueInfo := TInfoRecord.Create('�������:',GroupBox,80);
  QueueInfo.NextTo(StateInfo,10);

  WorkTimeInfo := TInfoRecord.Create('������:',GroupBox,80);
  WorkTimeInfo.NextTo(QueueInfo,10);

  WaitTimeInfo := TInfoRecord.Create('�������:',GroupBox,80);
  WaitTimeInfo.NextTo(WorkTimeInfo,10);

  KPDInfo := TInfoRecord.Create('�-� �������:',GroupBox,80);
  KPDInfo.NextTo(WaitTimeInfo,10);
end;

procedure TStanControls.ChangeCoord(X,Y: integer);
begin
  GroupBox.Left := X;
  GroupBox.Top := Y;
end;

procedure TStanControls.NextTo(CC: TStanControls; delta: integer);
begin
  GroupBox.Top := CC.GroupBox.Top;
  GroupBox.Left := CC.GroupBox.Left + cc.GroupBox.Width + delta;
end;

Constructor TStan.Create(cName: string; cParent: TWinControl;cLog:TLog);
begin
  Name := cName;
  Log:=cLog;
  Controls := TStanControls.Create(cName,cParent);
  NextStan:=nil;
  Queue:=TObjectList.Create;
  WorkTime:=0;
  WaitTime:=0;
  Active:=false;
  DoneNum:=0;
end;

procedure TStan.Reset;
begin
  Queue.Clear;
  WorkTime:=0;
  WaitTime:=0;
  Active:=false;
  DoneNum:=0;
end;

procedure TStan.UpdateInfo;
var kpd:integer;
begin
  if Active then
  begin
  Controls.StateInfo.Edit.Text := '������';
  Controls.StateInfo.Edit.Font.Color := clRed;
  end
  else
  begin
  Controls.StateInfo.Edit.Text := '��������';
  Controls.StateInfo.Edit.Font.Color := clGreen;
  end;
  Controls.WorkTimeInfo.Edit.Text := IntToStr(WorkTime) + ' ���.';
  Controls.WaitTimeInfo.Edit.Text := IntToStr(WaitTime) + ' ���.';
  Controls.QueueInfo.Edit.Text := IntToStr(Queue.Count);
  if (WorkTime+WaitTime)<>0 then kpd:=Round(100*WaitTime/(WorkTime+WaitTime))
  else kpd:=100;
  Controls.KPDInfo.Edit.Text := IntToStr(kpd) + '%';
end;

procedure TStan.CreateTimeControls(cParent:TWinControl);
begin
  Time := TTimeControls.Create(Name,cParent);
end;

procedure TStan.SetWorkTime;
begin
  Detal.RemainTime:=RandomRange(Time.MinTime.Value,Time.MaxTime.Value);
  Detal.DoingTime := Detal.DoingTime + Detal.RemainTime;
end;

procedure TStan.Tick(dt:integer);
var buf: TDetal;
begin
  if (not(Active))and(Queue.Count>0) then
  begin
    Detal := Queue.Extract(Queue.First) as TDetal;
    Log.Add(Name + ' ����� ������������ '+Detal.Name);
    SetWorkTime;
    Active:=True;
  end;

  if Active then
  begin
    if Detal.RemainTime=0 then
    begin
      Log.Add(Name + ' �������� ������������ '+Detal.Name);
      if NextStan<>nil then
      begin
        Log.Add(Detal.Name + ' ���������� �� '+NextStan.Name);
        NextStan.Queue.Add(Detal);
        Detal:=nil;
        Active:=false;
        DoneNum:=DoneNum+1;
      end
      else
      begin
        Log.Add(Detal.Name + ' ������!');
        Detal:=nil;
        Active:=false;
        DoneNum:=DoneNum+1;
      end;
    end
    else Detal.RemainTime := Detal.RemainTime - dt;
  end;

  if Active then WorkTime:=WorkTime+dt
  else WaitTime:=WaitTime+dt;

end;

Constructor TConv.Create(cName: string; cParent: TWinControl;cLog: TLog);
begin
  Log:=cLog;
  Parent:=cParent;
  Name:=cName;
  Stans := TObjectList.Create;
  GroupBox:= TGroupBox.Create(cParent);
  GroupBox.Parent:=cParent;
  GroupBox.Caption := Name;
  TimeRemain:=5;
end;

procedure TConv.Reset;
var i:integer;
begin
  for i := 0 to Stans.Count - 1 do (Stans[i] as TStan).Reset;
  TimeRemain:=Controls.TimeRange.Value;
end;

procedure TConv.NextTo(C: TConv; delta: integer);
begin
  GroupBox.Left := C.GroupBox.Left;
  GroupBox.Top := C.GroupBox.Top + C.GroupBox.Height + delta;
end;

procedure TConv.CreateControls(cParent:TWinControl);
var i:integer;
    buf:TStan;
begin
  Controls:=TConvControls.Create(Name,cParent);
  for i := 0 to Stans.Count - 1 do
  begin
    buf := Stans[i] as TStan;
    buf.CreateTimeControls(Controls.GroupBox2);
    if i=0 then
    begin
     buf.Time.ChangeCoord(5,25)
    end
    else
    begin
     buf.Time.NextTo((Stans[i-1] as TStan).Time,5);
    end;
  end;    
end;

procedure TConv.AddStan(cName:string);
var buf:TStan;
begin
   buf:=TStan.Create(cName,GroupBox,Log);
   if Stans.Count=0 then buf.Controls.ChangeCoord(10,20)
   else
   begin
      (Stans.Last as TStan).NextStan:=buf;
      buf.Controls.NextTo((Stans.Last as TStan).Controls,10);
   end;
   Stans.Add(buf);
   GroupBox.Height := buf.Controls.GroupBox.Top + buf.Controls.GroupBox.Height + 10;
   GroupBox.Width := buf.Controls.GroupBox.Left + buf.Controls.GroupBox.Width + 10;
end;

procedure TConv.ChangeCoord(X,Y: integer);
begin
  GroupBox.Left := X;
  GroupBox.Top := Y;
end;

procedure TConv.UpdateInfo;
var i:Integer;
begin
  for i := 0 to Stans.Count - 1 do (Stans[i] as TStan).UpdateInfo;
end;

procedure TConv.AddNewDetal(cName:string);
var buf:TDetal;
begin
  buf:=TDetal.Create(cName);
  (Stans.First as TStan).Queue.Add(buf);
  Log.Add('�� '+Name+' �������� '+cName);
end;

procedure TConv.Tick(dt:integer);
var i:integer;
begin
   TimeRemain := TimeRemain - 1;
   if TimeRemain = 0 then
   begin
     TimeRemain:=Controls.TimeRange.Value;
     AddNewDetal('�������');
   end;
   for i := 0 to Stans.Count - 1 do (Stans[i] as TStan).Tick(dt);
end;

procedure TConvMan.AddConv(cName:string; cStans:integer);
var buf:TConv;
    i:integer;
begin
  buf:=TConv.Create(cName,Parent,Log);
  for i := 1 to cStans do
    begin
      buf.AddStan('������'+IntToStr(i));
    end;
  if ConvList.Count>0 then buf.NextTo(ConvList.Last as TConv,10);
  ConvList.Add(buf);
end;

Constructor TConvMan.Create(cParent: TWinControl;cLog: TLog);
begin
  Parent:=cParent;
  Log:=cLog;
  ConvList:=TObjectList.Create;

  AddConv('�������� 1',4);
  AddConv('�������� 2',5);
  AddConv('�������� 3',3);
end;

procedure TConvMan.Reset;
var i:integer;
begin
   for i := 0 to ConvList.Count - 1 do (ConvList[i] as TConv).Reset;     
end;

procedure TConvMan.UpdateInfo;
var i:integer;
begin
  for i := 0 to ConvList.Count - 1 do (ConvList[i] as TConv).UpdateInfo;
end;

procedure TConvMan.Tick(dt:integer);
var i:integer;
begin
  for i := 0 to ConvList.Count - 1 do (ConvList[i] as TConv).Tick(dt);
end;

procedure TConvControls.ChangeCoord(X,Y: integer);
begin
  GroupBox.Left := X;
  GroupBox.Top := Y;
end;

procedure TConvControls.NextTo(CC: TConvControls; delta: integer);
begin
  GroupBox.Top := CC.GroupBox.Top;
  GroupBox.Left := CC.GroupBox.Left + CC.GroupBox.Width + delta;
end;

procedure TConvMan.CreateControls(cParent:TWinControl);
var buf: TConv;
    i:Integer;
begin
   for i := 0 to ConvList.Count - 1 do
     begin
       buf:= ConvList[i] as TConv;
       buf.CreateControls(cParent);
       if i=0 then buf.Controls.ChangeCoord(5,5)
       else buf.Controls.NextTo((ConvList[i-1] as TConv).Controls,10);
     end;
end;

end.
