program spusk;
uses crt,ustp,vibfn,metodgf,idvvod;
type          { ������� ⨯� ����� }
   punkt=record
   x,y:integer;
   s:string[50];
 end;
 const
   msg1='��� �롮� �㭪� ���� '+'�ᯮ���� ������:'+chr(25)+Chr(24)+'<Enter>';
 var
   x:mas;
   h,eps:real;
   n1,n:integer;
   z,ff:string;
   fil:text;
   mas:array[1..3] of punkt;
   i,nr,num:integer;
   ch:char;
 {$F+} {- ��易⥫쭮 ��������� ��४⨢�!!! }

procedure menu;

procedure main; {�ࠤ�����, ���᪮३襣� ��᪠}
begin
   textbackground(1);
    { ������ ���訢��騩 䮭 ��࠭� }
    textcolor(15);
    { ������ ���訢��騩 ⥪�� }

    clrscr;

   writeln('��宦����� ��⨬㬠 �� ��⮤� ���᪮३襣� ��᪠');
   {--����祭�� ����� 䠩�� ��� ����� १���⮢--}
   GetInputName(fil);

   {--�롮� �㭪樨--}
   {v_fun(n1,n);
   writeln(fil,'  ��᫮ ��६����� = ',n);
   writeln('    ��᫮ ��६����� = ',n);

   {--���� ��室��� ������--}
   VvodIsxD_NS(n,x,h,eps,fil);

   {--���᫥��� ��⨬㬠--}
   NSpusk(f,pr,x,n1,n,h,eps,fil);


   close(fil);

   readkey;

end;

procedure print;     { �뢮� ���ᨢ� ����ᥩ �� ��࠭ }
 begin
    textbackground(1);
    { ������ ���訢��騩 䮭 ��࠭� }
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
   mas[1].y:=14; mas[1].s:='1) ��⮤ "���᪮३襣� ��᪠"';
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
               { ���室 � �㦭�� ���� ��࠭� }
               write(mas[i].s);
            end;
         writeln;
         Gotoxy(15,22);
         { ���室 � �㦭�� ���� ��࠭� }
         textattr:=28;
         { ��⠭���� 梥� }
         writeln(msg1);
         { �뢮� ᮮ�饭�� �� ��࠭ }
         textattr:=26;
         { ��⠭���� 梥� }
         gotoxy(1,3);
         { ���室 � �㦭�� ���� ��࠭� }
         begin
            write('********************************************************************************');
            write('<<<<<<<<<<<<<<<<<<<<<<<<<<<< ');
            textattr:=28;
            write('������ୠ� ࠡ�� � 3 ');
            textattr:=26;
            write('>>>>>>>>>>>>>>>>>>>>>>>>>>>');
            write('::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
            write('!!!!!!!!!!!!!!!!!!');
            textattr:=28;
            write('�믮���� ��㤥�� ��㯯� 02��1 ������� ���३');
            textattr:=26;
            write('!!!!!!!!!!!!!!!');
            Write('################################################################################');
            Write(' ');
            textattr:=28;
            write('����: ��⮤ "���᪮३襣� ��᪠" ');
            textattr:=26;
            write('');
            Write('');
            Writeln;
         end;
         textattr:=27;
         { ��⠭���� 梥� }
         gotoxy(23,mas[nr].y);
         { ���室 � �㦭�� ���� ��࠭� }
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
    { ������ ���訢��騩 䮭 ��࠭� }
    textcolor(15);
    { ������ ���訢��騩 ⥪�� }
    clrscr;
    menu;
    { �맮� ��楤��� }
 end.



