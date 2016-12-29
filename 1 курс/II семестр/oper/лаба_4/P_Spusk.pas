program prim;
uses crt, ustp, VibFn, metodbf, idvvod;
{*------������祭�� ���㫥�------*
UstP     - ��⠭���� ��ࠬ��஢ � ⨯��, ����⨥ 䠩�� ��� ࠡ���
VibFn   - �ᯮ����⥫�� ��楤��� (�뢮� ᯨ᪠ �㭪権 �� �࠭,
           ���᫥��� ���祭�� �㭪権 � �� �ࠤ���⮢) - ��� ���஢����!
Metodbf - ��⮤� ��宦����� ��⨬㬠 �㭪樨 N-��६����� ��� ��࠭�祭��
IDVvod   - ��楤��� ����� ��室��� ������ ��� ��⮤�� ��⨬���樨
}
type          { ������� ⨯� ����� }
   punkt=record
   x,y:integer;
   s:string[50];
end;
const
   msg1='��� �롮� �㭪� ���� '+'�ᯮ���� ������:'+chr(25)+Chr(24)+'<Enter>';
var
    d,d1,r:real;
    m2,i:integer;
    p:mas;
    nom,Nk:integer;
    fil,fil_name:text;
    z,ff:string;
   mas:array[1..3] of punkt;
   nr,num:integer;
   ch:char;

  {$F+} {- ��易⥫쭮 ��������� ��४⨢�!!! }

procedure menu;

procedure main;
 Begin
   textbackground(1);
   { ������ ���訢��騩 䮭 �࠭� }
   textcolor(15);
   { ������ ���訢��騩 ⥪�� }
   Clrscr;
   writeln('��宦����� ��⨬㬠 �� ��⮤� �����न��⭮�� ��᪠');
   {--����祭�� ����� 䠩�� ��� ����� १���⮢--}
   GetInputName(fil_name);

   {--�롮� �㭪樨--}
   v_fun(nom,Nk);
   writeln(fil_name,'�㭪�� (�����) - ',nom,'.  ��᫮ ��६����� = ',Nk);

   {--���� ��室��� ������--}
   VvodIsxD_PS(Nk,p,d,d1,r,m2,fil_name);

   {--���᫥��� ��⨬㬠--}
   PkoordSp(f,p,nom,Nk,m2,d,d1,r,fil_name);

   close(fil_name);
   readkey;

end;

procedure print;     { �뢮� ���ᨢ� ����ᥩ �� �࠭ }
 begin
    textbackground(1);
    { ������ ���訢��騩 䮭 �࠭� }
    textcolor(15);
    { ������ ���訢��騩 ⥪�� }
    clrscr;
    writeln('      ������ ��� 䠩��, ����� �㦭� ��ᬮ����');
    readln(ff);
    assign(fil,ff);
    reset(fil);
    while not Eof(fil) do
       begin
          readln(fil,z);
          writeln(z);
       end;
    close(fil);
    readkey;
 end;

 begin
   clrscr;
   mas[1].y:=14; mas[1].s:='1) ��⮤ "�����न��⭮�� ��᪠"';
   mas[2].y:=16; mas[2].s:='2) ��������, ����ᠭ�� � 䠩� ';
   mas[3].y:=18; mas[3].s:='3) ��室 ';
   nr:=1;
   while true do
      begin
         textattr:=24;
         { ��⠭���� 梥� }
         clrScr;
         for i:=1 to 3 do
            begin
               GoToXy(23,mas[i].y);
               { ���室 � �㦭�� ���� �࠭� }
               write(mas[i].s);
            end;
         writeln;
         Gotoxy(15,22);
         { ���室 � �㦭�� ���� �࠭� }
         textattr:=28;
         { ��⠭���� 梥� }
         writeln(msg1);
         { �뢮� ᮮ�饭�� �� �࠭ }
         textattr:=26;
         { ��⠭���� 梥� }
         gotoxy(1,3);
         { ���室 � �㦭�� ���� �࠭� }
         begin
            write('********************************************************************************');
            write('<<<<<<<<<<<<<<<<<<<<<<<<<<<< ');
            textattr:=28;
            write('������ୠ� ࠡ�� � 4 ');
            textattr:=26;
            write('>>>>>>>>>>>>>>>>>>>>>>>>>>>');
            write('::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
            write('!!!!!!!!!!!!!!!!!!');
            textattr:=28;
            write('�믮���� ��㤥�� ��㯯� 02��1 ������� ���३');
            textattr:=26;
            write('!!!!!!!!!!!!!!!');
            Write('################################################################################');
            Write(' ');
            textattr:=28;
            write('����: ��⮤ "�����न��⭮�� ��᪠" ');
            textattr:=26;
            write('');
            Write('');
            Writeln;
         end;
         textattr:=27;
         { ��⠭���� 梥� }
         gotoxy(23,mas[nr].y);
         { ���室 � �㦭�� ���� �࠭� }
         write(mas[nr].s);
         ch:=readkey;
         { �������� ������ ������ }
         case ch of
         { ������ ��������� ᨬ���� }
            #13:begin { ENTER }
                case nr of
                { ������ ��஭���� �㭪� }
                  1:main;  { ��楤�� �஢�ન ��⮤� }
                  2:print;  { ��楤�� �⥭�� ����� �� 䠩�� }
                  3:Halt;  { ��楤�� ��室� �� �ணࠬ�� }
               end;
               end;
            #0:begin  { ��஢���騩 ᨬ��� }
               ch:=readkey;
               { �������� ������ ������ }
               case ch of
               { ������ ��������� ᨬ���� }
                  #80:if nr<3 then nr:=nr+1 { ��५�� ����� }
                  else
                    nr:=1;
                  #72:if nr>1 then nr:=nr-1 { ��५�� ���� }
                  else
                    nr:=3;
               end;
            end;
         end;
      end;
   end;


{--------------------------------------------------------------------------------
                          �᭮���� ⥫� �ணࠬ��
------------------------------------------------------------------------------}
 begin
    textbackground(1);
    { ������ ���訢��騩 䮭 �࠭� }
    textcolor(15);
    { ������ ���訢��騩 ⥪�� }
    clrscr;
    menu;
    { �맮� ��楤��� }
 end.