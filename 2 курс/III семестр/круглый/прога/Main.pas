unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ComCtrls, Mask, DBCtrls, DB, DBTables, ExtCtrls,
  RpCon, RpConDS, RpConBDE, RpBase, RpSystem, RpDefine, RpRave, Zapros, ShellAPI;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Button_Add: TButton;
    Button_Refresh: TButton;
    Button_Del: TButton;
    Button_Abitur: TButton;
    Button_Ex: TButton;
    PageControl1: TPageControl;
    Abiturient: TTabSheet;
    Examen: TTabSheet;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    Table1: TTable;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBNavigator2: TDBNavigator;
    DataSource2: TDataSource;
    Table2: TTable;
    N12: TMenuItem;
    N13: TMenuItem;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvTableConnection1: TRvTableConnection;
    RvTableConnection2: TRvTableConnection;
    Label10: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Button1: TButton;
    Label12: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Query1: TQuery;
    Query2: TQuery;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    procedure Button_AbiturClick(Sender: TObject);
    procedure Button_ExClick(Sender: TObject);
    procedure Button_AddClick(Sender: TObject);
    procedure Button_RefreshClick(Sender: TObject);
    procedure Button_DelClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button_AbiturClick(Sender: TObject);
begin
   PageControl1.ActivePage:=Abiturient;
end;

procedure TForm1.Button_ExClick(Sender: TObject);
begin
   PageControl1.ActivePage:=Examen;
end;

procedure TForm1.Button_AddClick(Sender: TObject);
begin
   If PageControl1.ActivePage=Abiturient then DBNavigator2.BtnClick(nbInsert) else DBNavigator1.BtnClick(nbInsert);
end;

procedure TForm1.Button_RefreshClick(Sender: TObject);
begin
   If PageControl1.ActivePage=Abiturient then DBNavigator2.BtnClick(nbRefresh) else DBNavigator1.BtnClick(nbRefresh);
end;

procedure TForm1.Button_DelClick(Sender: TObject);
begin
   If PageControl1.ActivePage=Abiturient then DBNavigator2.BtnClick(nbDelete) else DBNavigator1.BtnClick(nbDelete);
end;

procedure TForm1.N5Click(Sender: TObject);
begin
   If PageControl1.ActivePage=Abiturient then DBNavigator2.BtnClick(nbInsert) else DBNavigator1.BtnClick(nbInsert);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
   If PageControl1.ActivePage=Abiturient then DBNavigator2.BtnClick(nbRefresh) else DBNavigator1.BtnClick(nbRefresh);
end;

procedure TForm1.N7Click(Sender: TObject);
begin
   If PageControl1.ActivePage=Abiturient then DBNavigator2.BtnClick(nbDelete) else DBNavigator1.BtnClick(nbDelete);
end;

procedure TForm1.N8Click(Sender: TObject);
begin
   If PageControl1.ActivePage=Abiturient then DBNavigator2.BtnClick(nbEdit) else DBNavigator1.BtnClick(nbEdit);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
    RvProject1.Close;
    RvProject1.ProjectFile:='Abiturient.rav';
    RvProject1.Execute;

end;

procedure TForm1.N13Click(Sender: TObject);
begin
    RvProject1.Close;
    RvProject1.ProjectFile:='Examen.rav';
    RvProject1.Execute;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
    ShowMessage('���� ������������ � ��������. ����������: ������� ������� ���-06-1');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   Query1.Close;
   Query1.ParamByName('Bal').AsInteger := StrToInt(Edit1.Text); 
   Query1.Open;
   Form2.DBGrid1.DataSource:=DataSource3;
   Form2.DBNavigator1.DataSource:=DataSource3;
   Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Query2.Close;
   Query2.ParamByName('Aud').AsInteger:=StrToInt(Edit2.Text);
   Query2.Open;
   Form2.DBGrid1.DataSource:=DataSource4;
   Form2.DBNavigator1.DataSource:=DataSource4;
   Form2.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
   ShellExecute(Form1.Handle,nil,'Help.doc',nil,nil,SW_RESTORE);
end;

end.
