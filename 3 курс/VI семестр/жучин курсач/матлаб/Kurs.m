%      �������� ������ �� �������������� ����������.
%      ����: "������� ������� ����� ��� ��������� � ������� ����������� ������� �����"
%      �������� ������� ������ ���-06-1 ������ �������.

N = 50;                   %������ �������
EndX = 2*pi;              %�������� �������� ���������� �
EndT = 100;               %�������� �������� ���������� t
a = 0.1;                  %�������� ���������� a � gamma
gamma = -0.1;              
h = EndX/N;               %��� �� �
tau = EndT/N;             %��� �� t

% ����������� ������������� �������

a1 = 1;
b = -a*a*tau;
c = h*h+2*a*a*tau;
d = -a*a*tau;
p = 1;
q = -4;
r = 3+2*h*gamma;

% ���������� �������

A = zeros(N+1);
for i=1:N+1
   for j=1:N+1
      A(i,i) = c;
      A(i,i+1) = d;
      A(i+1,i) = b;
   end
end
A = A(1:N+1,1:N+1);
A(1,1) = a1;
A(1,2) = 0;
A(N+1,N+1) = r;
A(N+1,N) = q;
A(N+1,N-1) = p;

% ���������� ������� � ���������������� ����

Temp = -p;
for i=1:N+1
   A(N,i) = A(N,i)/b;
   A(N+1,i) = A(N+1,i)+A(N,i)*Temp;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ������ ��������� �������

for j=1:N+1 
   x=h*(j-1);
   U(1,j) = Phi(x);
end

%                         ���������� ������� ������� ������
for i=2:N+1
   t = tau*(i-2);
   for j=1:N+1
      x = h*(j-1);
      RightSides(j) = tau*h*h*(F(x,t) + in0(j))+U(i-1,j)*h*h;  
   end                                                     
   RightSides(1) = Alfa(t);                                   
   RightSides(N+1) = 0;                                          
   RightSides(N) = RightSides(N)/b;                                      
   RightSides(N+1) = RightSides(N+1)+RightSides(N)*Temp;  

  
   Y = bicg(A,RightSides,0.0001,60);                           
   for jj=1:N+1
      U(i+1,jj) = Y(jj);        
   end
end
out0 = Y;
out1 = U;
plot(Y)


