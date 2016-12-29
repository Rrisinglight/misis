unit LogicClasses;

interface
uses classes, Sysutils, Contnrs, Myclasses, Forms;

Type TClient=Class(TObject)
private
  mNumber: integer;
  mWaitTime: integer;
  mTotalTime: integer;
  mWaitTimer: integer;
  mNeedTer: Boolean;
  mNeedHir: Boolean;
  mNeedPsi: Boolean;
public
  Constructor Create(cNumber: integer);
  Destructor Destroy; override;
  property TotalTime: integer read mTotalTime write mTotalTime;
  property WaitTime: integer read mWaitTime write mWaitTime;
  property WaitTimer: integer read mWaitTimer write mWaitTimer;
  property NeedTer: Boolean read mNeedTer write mNeedTer;
  property NeedHir: Boolean read mNeedHir write mNeedHir;
  property NeedPsi: Boolean read mNeedPsi write mNeedPsi;
  property Number: integer read mNumber write mNumber;
end;

Type TLogicNode=Class(TObject)
private
  mQueue: integer;
  mActive: Boolean;
  mWaitTime: integer;
  mWorkTime: integer;
  mInfoControls: TInfoControls;
  mClientList: TObjectList;
  mClient: TClient;
public
  Constructor Create(cName: string; cForm: TForm);
  Destructor Destroy; override;
  property Ctrl: TInfoControls read mInfoControls write mInfoControls;
  property ClientList: TObjectList read mClientList write mClientList;
  property Client: TClient read mClient write mClient;
  property Active: Boolean read mActive write mActive;
  property WaitTime: integer read mWaitTime write mWaitTime;
  property WorkTime: integer read mWorkTime write mWorkTime;
  property InfoControls: TInfoControls read mInfoControls write mInfoControls;
  procedure UpdateInfo;
  procedure Tick(dt: integer);
end;

procedure ClientFromQueueToNode(Node: TLogicNode);
procedure ClientFromNodeToQueue(NodeFrom, NodeTo: TLogicNode);

implementation

Constructor TLogicNode.Create(cName: string; cForm: TForm);
begin
  mInfoControls := TInfoControls.Create(cName, cForm);
  mQueue := 0;
  mActive := false;
  mWaitTime := 0;
  mWorkTime := 0;
  mClient := nil;
  mClientList := TObjectList.Create;
end;

Destructor TLogicNode.Destroy;
begin
  inherited;
end;

procedure TLogicNode.UpdateInfo;
begin
  mInfoControls.QueueInfo.Edit.Text := IntToStr(mQueue)+ ' ���.';
  if mActive then mInfoControls.StateInfo.Edit.Text := '������'
  else mInfoControls.StateInfo.Edit.Text := '��������';
  mInfoControls.WaitInfo.Edit.Text := FloatToStrF(mWaitTime/60,ffFixed,3,1) + ' ���.';
  mInfoControls.WorkInfo.Edit.Text := FloatToStrF(mWorkTime/60,ffFixed,3,1) + ' ���.';
  if (mWorkTime + mWaitTime)<>0 then mInfoControls.WaitPercent.Edit.Text := FloatToStrF(100 - 100*mWaitTime/(mWorkTime + mWaitTime),ffFixed,3,0) + ' %';
end;

procedure TLogicNode.Tick(dt: integer);
begin
  mQueue := mClientList.Count;
  if (mQueue>0)and(mActive=false) then ClientFromQueueToNode(Self);
  if mActive then mWorkTime := mWorkTime + dt
  else mWaitTime := mWaitTime + dt;
end;

Constructor TClient.Create(cNumber: integer);
begin
  mNumber := cNumber;
  mWaitTime := 0;
  mTotalTime := 0;
  mWaitTimer := -1;
  mNeedTer := False;
  mNeedHir := False;
  mNeedPsi := False;
end;

Destructor TClient.Destroy;
begin
  inherited;
end;

procedure ClientFromQueueToNode(Node: TLogicNode);
begin
   Node.Client := node.ClientList[0] as TClient;
   Node.ClientList.Extract(Node.ClientList.First);
   Node.Active := true;
end;

procedure ClientFromNodeToQueue(NodeFrom, NodeTo: TLogicNode);
begin
  NodeTo.ClientList.Add(NodeFrom.Client);
  NodeFrom.Client := nil;
  NodeFrom.Active := false; 
end;

end.
