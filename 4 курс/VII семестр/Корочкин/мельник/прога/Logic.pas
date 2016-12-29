unit Logic;

interface
uses classes, Sysutils, Contnrs, Myclasses, Forms,Controls,StdCtrls,ComCtrls,ExtCtrls,Graphics,Math,Grids;

Type TClient=Class(TObject)
  Name: string;
  PurchaseTime: Integer;
  WaitTime: Integer;
  RemainPurchaseTime: Integer;
  EatTime: Integer;
  Eat: Integer;
  InTime,OutTime:integer;
  Constructor Create(cName: string);
end;

Type TIntSettings=Class(TObject)
  Parent: TWinControl;
  TimeRange: TIntegerInput;
  MinRequest: TIntegerInput;
  MaxRequest: TIntegerInput;
  Constructor Create(cParent: TWinControl; cmin,cmax,crange:integer);
  //procedure ChangeCoord(X,Y:integer);
  //procedure RightTo(S: TSellerSettings; delta:integer);
end;

Type TSellerSettings=Class(TObject)
  Panel: TPanel;
  NameEdit: TEdit;
  MinServeTime: TIntegerInput;
  MaxServeTime: TIntegerInput;
  Constructor Create(cName: string; cParent: TWinControl);
  procedure ChangeCoord(X,Y:integer);
  procedure RightTo(S: TSellerSettings; delta:integer);
  procedure SetTime(min,max:integer);
end;

Type TSeller=Class(TObject)
  Log: TLog;
  Name:string;
  Active: Boolean;
  WaitTime: integer;
  WorkTime: integer;
  InfoControls: TInfoControls;
  ClientList: TObjectList;
  ServedClientsList: TObjectList;
  Settings: TSellerSettings;
  sum,avg:integer;
  Constructor Create(cName: string; cParent: TWinControl; cLog: TLog; cServedClientsList: TObjectList);
  procedure UpdateInfo;
  procedure Tick(dt: integer);
  procedure SetWaitTime(Cl: TClient);
  procedure CreateSettings(cParent: TWinControl);
  procedure NewName(Sender: TObject);
  procedure Reset;
end;

Type TTable=Class(TObject)
  Log: TLog;
  Places: integer;
  Clients:TObjectList;
  EndClientsList: TObjectList;
  MinTime,MaxTime:integer;
  Constructor Create(cPlaces:integer; cMin,cMax:integer; cLog: TLog);
  procedure Tick(dt:integer);
end;

Type TSellerMan=Class(TObject)
  Log:TLog;
  Parent:TWinControl;
  Sellers: TObjectList;
  ServedClientsList: TObjectList;
  Constructor Create(cParent: TWinControl; cLog: TLog; cServedClientsList: TObjectList);
  procedure AddSeller(cName:string);
  procedure UpdateInfos;
  function FindMinQueue:TSeller;
  procedure Tick(dt: integer);
end;

Type TSceneMan=Class(TObject)
  Log:TLog;
  SellerMan: TSellerMan;
  TotalClients: integer;
  ServedClientsList: TObjectList;
  Table: TTable;
  Stat:TStringGrid;
  Itens:TIntSettings;
  Noserved:integer;
  Constructor Create(cLog: TLog);
  procedure CreateSellerMan(cParent: TWinControl);
  procedure UpdateInfo;
  procedure Tick(dt: integer);
  procedure FindTableTick(dt: integer);
  procedure NewClient;
  procedure UpdateStat;
  procedure Reset;
end;

implementation

procedure TSellerSettings.SetTime(min,max:integer);
begin
  MinServeTime.Edit.Text := IntToStr(min);
  MinServeTime.Value := min;
  MaxServeTime.Edit.Text := IntToStr(max);
  MaxServeTime.Value := max;
end;

Constructor TSellerSettings.Create(cName: string; cParent: TWinControl);
var lbl6,lbl7,lbl8: TLabel;
begin
   Panel := TPanel.Create(cParent);
   Panel.Parent := cParent;
   Panel.BevelKind := bkTile;
   Panel.BevelOuter := bvNone;
   Panel.Height := 140;
   Panel.Width := 170;
   //Panel.Color := clRed;

   NameEdit := TEdit.Create(Panel);
   NameEdit.Parent := Panel;
   NameEdit.Text := cName;
   NameEdit.Left := 5;
   NameEdit.Top := 5;
   //NameEdit.Font.Color := clRed;
   NameEdit.Font.Size := 10;
   NameEdit.Width := 160;

   lbl6 := TLabel.Create(Panel);
   lbl6.Parent := Panel;
   lbl6.AutoSize := true;
   lbl6.Caption := '����� ������������'+#10+#13+'�������:';
   lbl6.Top := NameEdit.Top + NameEdit.Height + 5;
   lbl6.Left := NameEdit.Left;

   MinServeTime := TIntegerInput.Create(45,Panel);
   MinServeTime.Edit.Top := lbl6.Top + lbl6.Height + 5;
   MinServeTime.Edit.Left := NameEdit.Left;

   lbl7 := TLabel.Create(Panel);
   lbl7.Parent := Panel;
   lbl7.AutoSize := true;
   lbl7.Caption := '-';
   lbl7.Top := MinServeTime.Edit.Top + 2;
   lbl7.Left := MinServeTime.Edit.Left + MinServeTime.Edit.Width +5;

   MaxServeTime := TIntegerInput.Create(120,Panel);
   MaxServeTime.Edit.Top := MinServeTime.Edit.Top;
   MaxServeTime.Edit.Left := lbl7.Left + lbl7.Width + 5;

   lbl8 := TLabel.Create(Panel);
   lbl8.Parent := Panel;
   lbl8.AutoSize := true;
   lbl8.Caption := '���.';
   lbl8.Top := lbl7.Top + 5;
   lbl8.Left := MaxServeTime.Edit.Left + MaxServeTime.Edit.Width + 5;
end;

procedure TSellerSettings.ChangeCoord(X,Y:integer);
begin
  Panel.Top := Y;
  Panel.Left := X;
end;

procedure TSellerSettings.RightTo(S: TSellerSettings; delta:integer);
begin
  Panel.Top := S.Panel.Top;
  Panel.Left := S.Panel.Left + S.Panel.Width + delta;
end;

Constructor TSeller.Create(cName: string; cParent: TWinControl; cLog: TLog; cServedClientsList: TObjectList);
begin
  Log:=cLog;
  Name:=cName;
  ServedClientsList := cServedClientsList;
  InfoControls := TInfoControls.Create(cName, cParent);
  Active := false;
  WaitTime := 0;
  WorkTime := 0;
  sum:=0;
  avg:=0;
  ClientList := TObjectList.Create;
end;

procedure TSeller.Reset;
begin
  Active := false;
  WaitTime := 0;
  WorkTime := 0;
  sum:=0;avg:=0;
  ClientList.Clear;
end;

procedure TSeller.NewName(Sender: TObject);
begin
  Name := Settings.NameEdit.Text;
  InfoControls.GroupBox.Caption := Name;
end;

procedure TSeller.UpdateInfo;
begin
  InfoControls.QueueInfo.Edit.Text := IntToStr(ClientList.Count)+ ' ���.';
  if Active then
  begin
    InfoControls.StateInfo.Edit.Text := '������';
    InfoControls.StateInfo.Edit.Font.Color := clGreen;
  end
  else
  begin
    InfoControls.StateInfo.Edit.Text := '��������';
    InfoControls.StateInfo.Edit.Font.Color := clRed;
  end;
  //InfoControls.WaitInfo.Edit.Text := FloatToStrF(WaitTime/60,ffFixed,3,0) + ' ���.';
  if sum<>0 then InfoControls.WaitInfo.Edit.Text := IntToStr(Round(avg/sum))+ ' ���';
  InfoControls.WorkInfo.Edit.Text := FloatToStrF(WorkTime/60,ffFixed,3,0) + ' ���.';
  if (WorkTime + WaitTime)<>0 then InfoControls.WaitPercent.Edit.Text := FloatToStrF(100 - 100*WaitTime/(WorkTime + WaitTime),ffFixed,3,0) + ' %';
end;

procedure TSeller.SetWaitTime(Cl: TClient);
var Time:integer;
begin
  Time := RandomRange(Settings.MinServeTime.Value,Settings.MaxServeTime.Value);
  Cl.RemainPurchaseTime := Time;
  Cl.PurchaseTime := Time;
end;

procedure TSeller.CreateSettings(cParent: TWinControl);
begin
  Settings:=TSellerSettings.Create(Name, cParent);
  Settings.NameEdit.OnChange := NewName;
end;

procedure TSeller.Tick(dt: integer);
var buf:TClient;
    i:Integer;
begin
  if ClientList.Count<>0 then buf:=(ClientList.First as TClient) else buf:=nil;
  if (not(Active))and(buf<>nil) then
  begin
    Active:=true;
    SetWaitTime(buf);
    Log.Add(Name+' ����� ����������� '+buf.Name);
    sum:=sum+1;
    avg:=avg+buf.PurchaseTime;
  end;
  if Active then buf.RemainPurchaseTime := buf.RemainPurchaseTime - dt;
  if Active then WorkTime := WorkTime + dt else WaitTime := WaitTime + dt;
  if ((Active)and(buf.RemainPurchaseTime=0)) then
  begin
    Log.Add(Name+' �������� ����������� '+buf.Name+'. ����� ������������: '+IntToStr(buf.PurchaseTime)+' ���.');

    buf:=ClientList.Extract(ClientList.First) as TClient;
    ServedClientsList.Add(buf);
    //ClientList.Remove(ClientList.First);
    Active:=False;
  end;

  // �������
  for i := 1 to ClientList.Count - 1 do (ClientList[i] as TClient).WaitTime := (ClientList[i] as TClient).WaitTime + dt;
end;

procedure TSellerMan.AddSeller(cName:string);
var buf: TSeller;
begin
   buf:= TSeller.Create(cName,Parent,Log,ServedClientsList);
   if Sellers.Count=0 then buf.InfoControls.ChangeCoord(10,20)
   else buf.InfoControls.RightTo((Sellers.Last as TSeller).InfoControls, 5);
   Sellers.Add(buf);
end;

Constructor TSellerMan.Create(cParent: TWinControl; cLog: TLog; cServedClientsList: TObjectList);
begin
  Log:=cLog;
  ServedClientsList:=cServedClientsList;
  Sellers:= TObjectList.Create;
  Parent:=cParent;
  AddSeller('������ 1-� ���������');
  AddSeller('������ 1-� ���������');
  AddSeller('������ 2-� ���������');
end;

procedure TSellerMan.UpdateInfos;
var i: integer;
begin
   for i := 0 to Sellers.Count - 1 do (Sellers[i] as TSeller).UpdateInfo;
end;

procedure TSellerMan.Tick(dt: integer);
var i: integer;
begin
   for i := 0 to Sellers.Count - 1 do (Sellers[i] as TSeller).Tick(dt);
end;

function TSellerMan.FindMinQueue:TSeller;
var i:integer;
    Res,buf: TSeller;
begin
  Res:=nil;
  if RandomRange(1,100)<70 then
  begin
  for i := 0 to Sellers.Count - 2 do
    begin
      buf:=Sellers[i] as TSeller;
      if i=0 then Res:=buf else if buf.ClientList.Count<Res.ClientList.Count then Res:=buf;
    end;
  Result:=Res;
  end
  else
  Result:=Sellers.Last as TSeller;
end;

Constructor TSceneMan.Create(cLog: TLog);
begin
  Log := cLog;
  TotalClients := 0;
  Noserved:=0;
  ServedClientsList:=TObjectList.Create;
  Table:=TTable.Create(25,1,1,Log);
end;

procedure TSceneMan.CreateSellerMan(cParent: TWinControl);
begin
  SellerMan := TSellerMan.Create(cParent,Log,ServedClientsList);
end;

procedure TSceneMan.UpdateStat;
var i:integer;
    buf:TClient;
begin
  Stat.RowCount := Table.EndClientsList.Count + 1;

  for i:= 1 to Table.EndClientsList.Count do
    begin
      buf := Table.EndClientsList[i-1] as TClient;

      Stat.Cells[0,i] := buf.Name;
      Stat.Cells[1,i] := Log.MakeTimeString(buf.InTime);
      Stat.Cells[2,i] := IntToStr(buf.WaitTime)+' ���.';
      Stat.Cells[3,i] := IntToStr(buf.PurchaseTime)+' ���.';
      Stat.Cells[4,i] := IntToStr(buf.Eat)+' ���.';
      Stat.Cells[5,i] := IntToStr(buf.WaitTime + buf.PurchaseTime + buf.Eat)+' ���.';
      Stat.Cells[6,i] := Log.MakeTimeString(buf.OutTime);
    end;
end;

procedure TSceneMan.Reset;
var i:integer;
begin
  for i:= 0 to SellerMan.Sellers.Count - 1 do (SellerMan.Sellers[i] as TSeller).Reset;
  ServedClientsList.Clear;
  Table.Clients.Clear;
  Table.EndClientsList.Clear;
  Log.ListBox.Clear;
  Log.Time:= 12 * 3600;
  Noserved:=0;
end;

procedure TSceneMan.UpdateInfo;
begin
  SellerMan.UpdateInfos;
  //UpdateStat;
end;

procedure TSceneMan.FindTableTick(dt: integer);
var i:integer;
    buf:TClient;
begin
   while (Table.Clients.Count<Table.Places)and(ServedClientsList.Count>0) do
   begin
      buf:=ServedClientsList.Extract(ServedClientsList.First) as TClient;
      Table.Clients.Add(buf);
      //ServedClientsList.Remove(ServedClientsList.First);
      buf.EatTime:=RandomRange(Table.MinTime,Table.MaxTime);
      buf.Eat:=buf.EatTime;

      Log.Add(buf.Name+' ��� �� ���� � ����� ����. �������� ����: '+IntToStr(Table.Places - Table.Clients.Count)+'/'+IntToStr(Table.Places)+'.');
   end;  

   for i := 0 to ServedClientsList.Count - 1 do
     begin
       buf:= ServedClientsList[i] as TClient;
       buf.WaitTime := buf.WaitTime + dt;
     end;
end;

procedure TSceneMan.Tick(dt: integer);
var rnd:single;
    i,j:integer;
    buf:TClient;
    from,bb:TSeller;
begin
  Log.Tick(dt);
  SellerMan.Tick(dt);
  FindTableTick(dt);
  Table.Tick(dt);
  rnd:=Random;
  if rnd < RandomRange(Itens.MinRequest.Value,Itens.MaxRequest.Value)/(Itens.TimeRange.Value*60) then
  begin
    NewClient;
  end;

  from:=nil;
  buf:=nil;

  for i := 0 to SellerMan.Sellers.Count - 1 do
  begin
    bb:=SellerMan.Sellers[i] as Tseller;
    if bb.ClientList.Count>5 then
    begin
    for j := 5 to bb.ClientList.Count - 1 do
    if random(1000)=147 then
    begin
      buf:= bb.ClientList[j] as Tclient;
      from:=bb;
    end;
    end;
  end;

  if from<>nil then
  begin
  from.ClientList.Remove(buf);
  Noserved:=Noserved+1;
  end;
  

end;

procedure TSceneMan.NewClient;
var Min:TSeller;
    cl:TClient;
begin
  TotalClients := TotalClients + 1;
  cl:=TClient.Create('������ �'+IntToStr(TotalClients));
  Log.Add(cl.Name + ' ������ � ����.');
  Min:=SellerMan.FindMinQueue;
  Min.ClientList.Add(cl);
  cl.InTime:=Log.Time;
end;

Constructor TClient.Create(cName: string);
begin
  Name:=cName;
  PurchaseTime:=0;
  WaitTime:=0;
  RemainPurchaseTime:=-1;
  EatTime:=-1;
  Eat:=0;
end;

Constructor TTable.Create(cPlaces:integer; cMin,cMax:integer; cLog: TLog);
begin
  Log:=cLog;
  Places:=cPlaces;
  MinTime:=cMin;
  MaxTime:=cMax;
  Clients:=TObjectList.Create;
  EndClientsList:=TObjectList.Create;
end;

procedure TTable.Tick(dt:integer);
var i:integer;
    buf:TClient;
begin
  i:=0;
  while (i <> Clients.Count) do
    begin
      buf:=Clients[i] as TClient;
      buf.EatTime := buf.EatTime - dt;
      if buf.EatTime = 0 then
      begin
        Log.Add(buf.Name+' �������� ���� � �������� ����.');
        buf.OutTime:=Log.Time;
        buf := Clients.Extract(Clients[i]) as TClient;
        EndClientsList.Add(buf);
        i:=i-1;
      end;
      i:=i+1;
    end;
end;

Constructor TIntSettings.Create(cParent: TWinControl; cmin,cmax,crange:integer);
var lbl1,lbl2,lbl3,lbl5:TLabel;
begin
   Parent := cParent;

   lbl1 := TLabel.Create(Parent);
   lbl1.Parent := Parent;
   lbl1.AutoSize := true;
   lbl1.Caption := '������������� ������� ��������:';
   lbl1.Top := 25;
   lbl1.Left := 15;

   MinRequest := TIntegerInput.Create(cmin,Parent);
   MinRequest.Edit.Top := lbl1.Top + lbl1.Height + 5;
   MinRequest.Edit.Left := lbl1.Left;

   lbl2 := TLabel.Create(Parent);
   lbl2.Parent := Parent;
   lbl2.AutoSize := true;
   lbl2.Caption := '-';
   lbl2.Top := MinRequest.Edit.Top + 2;
   lbl2.Left := MinRequest.Edit.Left + MinRequest.Edit.Width +5;

   MaxRequest := TIntegerInput.Create(cmax,Parent);
   MaxRequest.Edit.Top := MinRequest.Edit.Top;
   MaxRequest.Edit.Left := lbl2.Left + lbl2.Width + 5;

   lbl3 := TLabel.Create(Parent);
   lbl3.Parent := Parent;
   lbl3.AutoSize := true;
   lbl3.Caption := '���. ������';
   lbl3.Top := MinRequest.Edit.Top + 7;
   lbl3.Left := MaxRequest.Edit.Left + MaxRequest.Edit.Width +5;


   TimeRange := TIntegerInput.Create(crange,Parent);
   TimeRange.Edit.Top := MaxRequest.Edit.Top;
   TimeRange.Edit.Left := lbl3.Left + lbl3.Width + 5;

   lbl5 := TLabel.Create(Parent);
   lbl5.Parent := Parent;
   lbl5.AutoSize := true;
   lbl5.Caption := '���.';
   lbl5.Top := lbl3.Top;
   lbl5.Left := TimeRange.Edit.Left + TimeRange.Edit.Width + 5;
end;

end.
