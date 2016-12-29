unit Myclasses;

interface
uses classes, Sysutils, Contnrs, Forms, Windows, Controls, StdCtrls, ComCtrls;

Type TLog=Class(TObject)
private
  mListBox: TListBox;
public
  Constructor Create(Form: TForm);
  procedure Add(Time:integer; S:string);
  property ListBox:TListBox read mListBox;
  function MakeTimeString(Time: integer):string;
end;

Type TInfoRecord=Class(TObject)
private
  mLabel: TLabel;
  mEdit: TEdit;
  mDelta: integer;
public
  Constructor Create(cName: string; cParent: TWinControl; delta: integer);
  Destructor Destroy; override;
  Property InfoLabel: TLabel read mLabel write mLabel;
  Property Edit: TEdit read mEdit write mEdit;
  procedure ChangeCoord(X,Y: integer);
  procedure NextTo(Rec: TInfoRecord; delta: integer);
end;

Type TIntegerSelect=Class(TObject)
private
  mNameLabel: TLabel;
  mEdit: TEdit;
  mUpDown: TUpDown;
  mValue: integer;
  mText: string;
public
  Constructor Create(cName: string; cParent: TWinControl);
  procedure ChangeCoord(X,Y: integer);
  procedure ChangeValue(Sender: TObject; var AllowChange: Boolean;NewValue: Smallint; Direction: TUpDownDirection);
  property Text:string read mText write mText;
  property Edit:TEdit read mEdit write mEdit;
  property UpDown:TUpDown read mUpDown write mUpDown;
  procedure SetBorders(Min,Max,Value: integer);
end;

Type TMinMaxSelect=Class(TObject)
private
  mNameLabel: TLabel;
  mMin: TIntegerSelect;
  mMax: TIntegerSelect;
  mName: string;
public
  Constructor Create(cName: string; cParent: TWinControl);
  property Min:TIntegerSelect read mMin write mMin;
  property Max:TIntegerSelect read mMax write mMax;
  procedure ChangeCoord(X,Y: integer);
end;

Type TInfoControls=Class(TObject)
private
  mForm: TForm;
  mGroupBox: TGroupBox;
  mQueueInfo: TInfoRecord;
  mStateInfo: TInfoRecord;
  mWaitInfo: TInfoRecord;
  mWorkInfo: TInfoRecord;
  mWaitPercent: TInfoRecord;
  mName: string;
  mDelta: integer;
  mLeft: integer;
public
  Constructor Create(cName: string; cForm: TForm);
  Destructor Destroy; override;
  Property Name: string read mName write mName;
  Property GroupBox: TGroupBox read mGroupBox write mGroupBox;
  Property QueueInfo: TInfoRecord read mQueueInfo write mQueueInfo;
  Property StateInfo: TInfoRecord read mStateInfo write mStateInfo;
  Property WaitInfo: TInfoRecord read mWaitInfo write mWaitInfo;
  Property WorkInfo: TInfoRecord read mWorkInfo write mWorkInfo;
  Property WaitPercent: TInfoRecord read mWaitPercent write mWaitPercent;
  procedure ChangeCoord(X,Y: integer);
  procedure RightTo(IC: TInfoControls; delta: integer);
end;

Type TStatControls=Class(TObject)
private
  mForm: TForm;
  mGroupBox: TGroupBox;
  mName: string;
  mDelta: integer;
  mLeft: integer;
  mClientsDone: TInfoRecord;
  mClientsNow: TInfoRecord;
  mAvgTotalTime: TInfoRecord;
  mAvgWaitTime: TInfoRecord;
public
  Constructor Create(cForm: TForm);
  Property Name: string read mName write mName;
  Property GroupBox: TGroupBox read mGroupBox write mGroupBox;
  Property ClientsDone: TInfoRecord read mClientsDone write mClientsDone;
  Property ClientsNow: TInfoRecord read mClientsNow write mClientsNow;
  Property AvgTotalTime: TInfoRecord read mAvgTotalTime write mAvgTotalTime;
  Property AvgWaitTime: TInfoRecord read mAvgWaitTime write mAvgWaitTime;
end;

implementation

Constructor TIntegerSelect.Create(cName: string; cParent: TWinControl);
begin
  mText := ' ���.';

  mNameLabel := TLabel.Create(cParent);
  mNameLabel.Parent := cParent;
  mNameLabel.Caption := cName;

  mEdit := TEdit.Create(cParent);
  mEdit.Parent := cParent;
  mEdit.ReadOnly := True;
  mEdit.Width := 50;

  mUpDown := TUpDown.Create(cParent);
  mUpDown.Parent := cParent;

  mEdit.Text := IntToStr(mUpDown.Position) + mText;
end;

procedure TIntegerSelect.ChangeCoord(X,Y: integer);
begin
  mNameLabel.Left := X;
  mNameLabel.Top := Y;

  mEdit.Left := X + mNameLabel.Width + 10;
  mEdit.Top :=  mNameLabel.Top + mNameLabel.Height - mEdit.Height;

  mUpDown.Height := mEdit.Height;
  mUpDown.Top := mEdit.Top;
  mUpDown.Left := mEdit.Left + mEdit.Width;

  mUpDown.OnChangingEx := ChangeValue;
end;

procedure TIntegerSelect.ChangeValue(Sender: TObject; var AllowChange: Boolean;
  NewValue: Smallint; Direction: TUpDownDirection);
begin
  if (mUpDown.Min<=NewValue)and(mUpDown.Max>=NewValue) then
  mEdit.Text := IntToStr(NewValue) + mText;
end;

procedure TIntegerSelect.SetBorders(Min,Max,Value: integer);
begin
  mUpDown.Min := Min;
  mUpDown.Max := Max;
  mUpDown.Position := Value;
end;

procedure TMinMaxSelect.ChangeCoord(X,Y: integer);
begin
  mNameLabel.Left := X;
  mNameLabel.Top := Y;

  mMin.ChangeCoord(X,Y+30);
  mMax.ChangeCoord(X,Y+60);
end;

Constructor TMinMaxSelect.Create(cName: string; cParent: TWinControl);
begin
  mNameLabel := TLabel.Create(cParent);
  mNameLabel.Parent := cParent;
  mName := cName;
  mNameLabel.Caption := mName;

  mMin:= TIntegerSelect.Create('�� ',cParent);
  mMax:= TIntegerSelect.Create('�� ',cParent);

  ChangeCoord(0,0);
end;

Constructor TStatControls.Create(cForm: TForm);
begin
  mName := '����������';
  mForm := cForm;
  mDelta := 20;
  mLeft := 10;
  mGroupBox := TGroupBox.Create(mForm);
  mGroupBox.Parent := mForm;
  mGroupBox.Caption := mName;
  mGroupBox.Height := 210;
  mGroupBox.Width := 230;

  mClientsDone := TInfoRecord.Create('������ �����������: ', mGroupBox, 125);
  mClientsDone.ChangeCoord(mLeft,25);

  mClientsNow := TInfoRecord.Create('������ ��������: ', mGroupBox, 125);
  mClientsNow.NextTo(mClientsDone, mDelta);

  mAvgTotalTime := TInfoRecord.Create('������� �����'+#10#13+'�����������: ', mGroupBox, 125);
  mAvgTotalTime.NextTo(mClientsNow, mDelta);

  AvgWaitTime := TInfoRecord.Create('������� �����'+#10#13+'��������: ', mGroupBox, 125);
  AvgWaitTime.NextTo(mAvgTotalTime, mDelta);

end;

Constructor TLog.Create(Form: TForm);
begin
  mListBox := TListBox.Create(Form);
  mListBox.Parent := Form;
  mListBox.Left := 10;
  mListBox.Top := 340;
  mListBox.Height := 205;
  mListBox.Width := 500;
end;

procedure TLog.Add(Time:integer; S:string);
begin
  mListBox.AddItem('['+MakeTimeString(Time)+']: '+ S,mListBox);
  mListBox.ItemIndex := mListBox.Items.Count - 1;
end;

function TLog.MakeTimeString(Time: integer):string;
var s,m,h : integer;
    s1,s2,s3: string;
begin
  s := Round(Time);
  h := s div 3600;
  s := s - h*3600;
  if h>23 then h := 0;
  m:= s div 60;
  s := s - m*60;
  if s<10 then s1 := '0' else s1 := '';
  if m<10 then s2 := '0' else s2 := '';
  if h<10 then s3 := '0' else s3 := '';

  
  Result := s3 + IntToStr(h) + ':' + s2 + IntToStr(m) + ':' + s1 + IntToStr(s);
end;

Constructor TInfoRecord.Create(cName: string; cParent: TWinControl; delta: integer);
begin
  mLabel := TLabel.Create(cParent);
  mLabel.Parent := cParent;
  mLabel.Caption := cName;

  mEdit := TEdit.Create(cParent);
  mEdit.Parent := cParent;
  mEdit.ReadOnly := True;
  mEdit.Width := 58;
  mDelta := delta;
end;

Destructor TInfoRecord.Destroy;
begin
  inherited;
end;

procedure TInfoRecord.ChangeCoord(X,Y: integer);
begin
  mLabel.Left := X;
  mLabel.Top := Y;

  mEdit.Top := mLabel.Top + mLabel.Height - mEdit.Height;
  mEdit.Left := mLabel.Left + mDelta;
end;

procedure TInfoRecord.NextTo(Rec: TInfoRecord; delta: integer);
begin
  mLabel.Left := Rec.InfoLabel.Left;
  mLabel.Top := Rec.InfoLabel.Top + Rec.InfoLabel.Height + delta;

  mEdit.Top := mLabel.Top + mLabel.Height - mEdit.Height;
  mEdit.Left := mLabel.Left + mDelta;
end;

Constructor TInfoControls.Create(cName: string; cForm: TForm);
begin
  mName := cName;
  mForm := cForm;
  mDelta := 20;
  mLeft := 10;
  mGroupBox := TGroupBox.Create(mForm);
  mGroupBox.Parent := mForm;
  mGroupBox.Caption := mName;
  mGroupBox.Height := 180;
  mGroupBox.Width := 150;

  mQueueInfo := TInfoRecord.Create('�������: ', mGroupBox, 75);
  mQueueInfo.ChangeCoord(mLeft,25);

  mStateInfo := TInfoRecord.Create('���������: ', mGroupBox, 75);
  mStateInfo.NextTo(mQueueInfo, mDelta);

  mWaitInfo := TInfoRecord.Create('�������: ', mGroupBox, 75);
  mWaitInfo.NextTo(mStateInfo, mDelta);

  mWorkInfo := TInfoRecord.Create('������: ', mGroupBox, 75);
  mWorkInfo.NextTo(mWaitInfo, mDelta);

  mWaitPercent := TInfoRecord.Create('���������: ', mGroupBox, 75);
  mWaitPercent.NextTo(mWorkInfo, mDelta);

end;

Destructor TInfoControls.Destroy;
begin
  inherited;
end;

procedure TInfoControls.ChangeCoord(X,Y: integer);
begin
  mGroupBox.Left := X;
  mGroupBox.Top := Y;
end;

procedure TInfoControls.RightTo(IC: TInfoControls; delta: integer);
begin
  mGroupBox.Top := IC.GroupBox.Top;
  mGroupBox.Left := IC.GroupBox.Left + IC.GroupBox.Width + delta;
end;

end.
