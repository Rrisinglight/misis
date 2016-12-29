N = 25; % ��������� ������� �� �����
M = 25; % ��������� �������

% ���������� ���������
lambda = 390; % ����������� ����������������
c = 380; % ������������
ro = 9000; % ���������
alfa2 = 50;

% ��������� ������
L = 0.4; % �����
T = 600; % �����
aa = lambda/(c*ro); % ��������
delta = alfa2/lambda; % ��������

% ������� ���������������-��������� �����
h = L/N; % ��� �� �
tau = T/M; % ��� �� t

for i=1:N+1
    x(i)=(i-1)*h;  
end;
for i=1:M+1
    t(i)=(i-1)*tau;
end;

% ������������ ��������� ���������
b = -aa*tau;
c = h*h+2*aa*tau;
d = -aa*tau;

% ������������ ���������� �������
p = 1;
r = -4;
q = 3 + 2*h*delta;
  
% ���������� 3-� ������������ �������
A = zeros(N+1);
for i=2:N
    A(i,i-1) = d;
    A(i,i) = c;
    A(i,i+1) = b;
end

A(1,1)=1;

k = p/d;
A(N+1,N-1) = p-d*k;
A(N+1,N) = r-c*k;
A(N+1,N+1) = q-b*k;

% ������ ��������� �������
for i=1:N+1
    U(1,i) = Phi(x(i));
end

% ������� ������� ������
for j=2:M+1
    D(1)=Alfa(t(j));
    for i=2:N
        D(i) = h*h*tau*F(x(i),t(j)) + h*h*U(j-1,i);
    end
    D(N+1) = 0 - D(N)*k;
    Y=Progonka(A,D,N);
    for s=1:N+1
        U(j,s)=Y(s);
    end
end;

% ����������� ����� �����������

period = 5; %�������� ������ ��������

for p= 1:M/period
scrsz = get(0,'ScreenSize'); %���������� ������
w = scrsz(3)/3; %���������� ������ ���� ��������
h2 = 80; %������ ��������� ����
h = (scrsz(4)-2*h2)/2; %������ ���� ��������
figure(p);
if p<=3 upos = [(p-1)*w, h+h2, w, h] ; %1 ���
else    upos = [(p-4)*w, 0, w, h] ; %2 ���
end;
set(figure(p),'Position',upos);
plot(x,U(p+(p-1)*period,:))
axis([0 L 0 120]);
end
% 3D
figure(6);
upos = [2*w, 0, w, h] ;
set(figure(p+1),'Position',upos);
surf(x,t,U);
