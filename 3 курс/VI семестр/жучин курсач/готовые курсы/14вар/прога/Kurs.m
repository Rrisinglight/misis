N = 50; % ��������� ������
M = 40; % ��������� �������

L = 0.5; %�����
T = 0.4; %�����
T2 = 0.8; %���������
ro = 0.15; %���������
aa = T2/ro; % ��������

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
p = -3;
r = 4;
q = -1;

p2 = 1;
r2 = -4;
q2 = 3;

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

A(N+1,N-1) = p2;
A(N+1,N) = r2;
A(N+1,N+1) = q2;

% ������ ��������� �������

for i=1:N+1
    U(1,i) = Fi(x(i));
    U(2,i) = tau * Psi(x(i)) + U(1,i);
end

% ������� ������� ������

for j=3:M+1
    for i=2:N
        D(i) = h*h*tau*tau*(F(x(i),t(j))) + 2*h*h*U(j-1,i)-h*h*U(j-2,i);   
    end
    D(1)=2*h*Alfa(t(j));
    D(N+1) = 2*h*Beta(t(j));
    Y=bicg(A,D');
    for s=1:N+1
        U(j,s)=Y(s);
    end
end;

% ����������� ����� �����������

num = 0;
for p= 1:10:41
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
axis([0 L -0.01 0.05]);
end

% 3D
figure(6);
upos = [2*w, 0, w, h] ;
set(figure(num+1),'Position',upos);
surf(x,t,U);