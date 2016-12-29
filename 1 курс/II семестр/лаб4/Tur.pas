unit Tur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, DB, StdCtrls, Grids, DBGrids, DBTables,
  ExtCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Query1: TQuery;
    Table: TTable;
    DBNavigator1: TDBNavigator;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
with Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Kod_Ufo,Prodoljit');
      SQL.Add('FROM ":UFO:UFO"');
      {SQL.Add('WHERE');
      SQL.Add('(Prodolgitelnost <= "8")'); }
      SQL.Add('ORDER BY Prodoljit');
      Open;
      if RecordCount<>0
        then DataSource1.DataSet:=Query1
        else ShowMessage('� �� ��� �������, ���������������'+#13+'������� �������.');
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DataSource1.DataSet:=Table;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
with Query1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT Tip,Kategoria,Prodolgitelnost,Cena,Data,Chislo');
     SQL.Add('FROM ":Turburo:Turburo.db"');
     SQL.Add('ORDER BY Chislo');
     Open;
     if RecordCount<>0
       then DataSource1.DataSet:=Query1
       else ShowMessage('� �� ��� �������, ���������������'+#13+'������� �������.');
   end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Close;
end;



end.
