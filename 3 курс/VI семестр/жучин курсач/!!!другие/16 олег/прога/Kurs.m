N = 30; % ��������� ������
M = 60; % ��������� �������

L = 0.5; %�����
T = 50; %�����
T2 = 2; %���������
ro = 0.05; %���������
a1 = 1.5;

aa = T2/ro; % ��������
gamma = -a1/T2; % ��������

h = L/N; %��� �� �
tau = T/M; %��� �� t

% ������� ���������������-��������� �����
for i=1:N+1
    x(i)=(i-1)*h;  
end;
for i=1:M+1
    t(i)=(i-1)*tau;
end;

% ������������ ��������� ���������
b = -aa*tau*tau;
c = h*h+2*aa*tau*tau;
d = -aa*tau*tau;

% ������������ ���������� �������
p = 2*h*gamma-3;
r = 4;
q = -1;

% ���������� �������

A = zeros(N+1);
for i=2:N
    A(i,i-1) = d;
    A(i,i) = c;
    A(i,i+1) = b;
end

A(1,1)=p;
A(1,2)=r;
A(1,3)=q;

A(N+1,N+1) = 1;

% ������ ��������� �������

for i=1:N+1
    U(1,i) = Fi(x(i));
    U(2,i) = tau * Psi(x(i)) + U(1,i);
end

% ������� ������� ������

for j=3:M+1
    for i=2:N
        D(i) = h*h*tau*tau*(F(x(i),t(j))/ro) + 2*h*h*U(j-1,i)-h*h*U(j-2,i);   
    end
    D(1)=0;
    D(N+1) = Beta(t(j));
    Y=bicg(A,D');
    for s=1:N+1
        U(j,s)=Y(s);
    end
end;

% ����������� ����� �����������

num = 0;
for p= 1:15:61
num = num+1;
scrsz = get(0,'ScreenSize'); %���������� ������
w = scrsz(3)/3; %���������� ������ ���� ��������
h2 = 80; %������ ��������� ����
h = (scrsz(4)-2*h2)/2; %������ ���� ��������
figure(num);
if num<=3 upos = [(num-1)*w, h+h2, w, h] ; %1 ���
else    upos = [(num-4)*w, 0, w, h] ; %2 ���
end;
set(figure(num),'Position',upos);
plot(x,U(p,:));
axis([0 L -0.005 0.005]);
end

% 3D
figure(6);
upos = [2*w, 0, w, h] ;
set(figure(num+1),'Position',upos);
surf(x,t,U);