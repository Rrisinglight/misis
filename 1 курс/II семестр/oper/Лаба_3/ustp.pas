unit ustp;
interface
const n_m=40;
type mas=array[1..n_m] of real;
type mass=array[1..n_m,1..n_m] of real;

type fyn=function (x:real; n:integer; var fil:text):real;
type fun=function (x:mas; n_f:integer; var fil:text):real;
type fpr=function (x:mas; n_f,n:integer; var g:mas; var fil:text):real;

type funo=function (x:real):real;
type funn=function (x:mas):real;
type funpr=function (x:mas; n:integer; var g:mas):real;

{--����祭�� ����� 䠩�� ��� ����� १���⮢--}
procedure GetInputName(var fil_name:Text);
{--�஢�ઠ ᮮ⢥��⢨� ���祭��--}
procedure proverka(x:real; var p:byte; var fil:text);
{--��।������ �����--}
function sgn(c:real; b:real):real;
{--���������� �᫠ (��ࠦ����) � �⥯��� k (楫��)--}
function stp(y:real;k:integer):real;


implementation
uses crt;
  {$F+}
{--����祭�� ����� 䠩�� ��� ����� १���⮢--}
procedure GetInputName(var fil_name:Text);
  var FName:string;
      IOCode:word;
  begin
    repeat
    writeln('������ ��� 䠩�� � ����� �㤥� �뢮���� १�����');
{    writeln('(��� �뢮�� �� ��࠭ - CON)');}
    HighVideo;
    readln(FName);
    LowVideo;
    writeln('���᪠���: ���� १���⮢ ��室����� � ��४�ਨ �� ���ன');
    writeln('           �� ����饭 䠩� turbo.exe  ���  �ணࠬ�� (*.exe).');
    Assign(fil_name,FName);
   {$I-} { �⪫���� ���਩��� �����襭�� �� ������������� �訡�� I/O}
    Reset(fil_name);
   {$I+}
   IOCode:=IOResult;
   if IOCode>0 then begin
               Rewrite(fil_name);
               writeln(fil_name,'�������� ��宦����� ��⨬㬠');
               Exit;
              end
          else begin
               Append(fil_name);
               writeln(fil_name,'�������� ��宦����� ��⨬㬠');
               end;
   until IOCode=0;
end;


{--�஢�ઠ ᮮ⢥��⢨� ���祭��--}
procedure proverka(x:real; var p:byte; var fil:text);
begin
 if abs(x) >= 1e+17 then
      begin writeln('�訡��! ��९�������! ������ �� ������ !!!');
            writeln('���ᬮ��� ������� ��ࠬ����!');
            writeln(fil,'�訡��! ��९�������! ������ �� ������!');
            writeln(fil,'���ᬮ��� ������� ��ࠬ����!');
            writeln(fil);close(fil);
            p:=1; delay(2500); Halt(1);
      end
    else p:=0;
end;


{--��।������ �����--}
function sgn(c:real; b:real):real;
   var a:real;
    begin
      a:=c-b;
       if a>=0 then sgn:=1
          else sgn:=-1;
    end;


{--���������� �᫠ (��ࠦ����) � �⥯��� k (楫��)--}
function stp(y:real;k:integer):real;
var i:integer;
    s:real;
begin
      s:=1;
      for i:=1 to k do s:=s*y;
      stp:=s;
end;

end.

