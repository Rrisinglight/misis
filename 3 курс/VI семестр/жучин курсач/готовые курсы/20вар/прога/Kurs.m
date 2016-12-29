N = 100; % ����� �������� 
L = 0.4; % �����
lambda = 200; % ��������
xmin = 0; % ��������� ������� x
ymin = 0; % ��������� �������� y

h = L/N; % ��� 

% ������� �����
for i=1:N+1
    x(i)=xmin + (i-1)*h;
    y(i)=ymin + (i-1)*h;
end;

U = zeros(N+1); 

% ���������� ��������� �������
for i=1:N+1
    for j=1:N+1
        U(N+1,j)=Fi(x(N+1),y(j));
        U(1,j)=Fi(x(1),y(j));
        U(i,1)=U(i,2)-h*Psi(x(i),y(1));
        U(i,N+1)=U(i,N)+h*Psi(x(i),y(N));
    end;
end;

M = 0; % ��������� �����������
e = 0.00001; % ��������
maxK = 50; % ���������� ����� ��������
K=0; % ������� ��������

% ������ ��������
for i=2:N
    for j=2:N
        v = (U(i+1,j)+U(i-1,j)+U(i,j+1)+U(i,j-1)-(-F(x(i),y(j))/lambda)*h*h)/4;
        d = abs(v-U(i,j));
        U(i,j) = v;
        if (M < d) M = d;
        end;
    end;
end;

% ��������� ��������� ��������
while ((M > e) & (K<maxK))  
for i=2:N
    for j=2:N
        v = (U(i+1,j)+U(i-1,j)+U(i,j+1)+U(i,j-1)-(-F(x(i),y(j))/lambda)*h*h)/4;
        d = abs(v-U(i,j));
        U(i,j) = v;
        if (M < d) M = d;
        end;
    end;
end;
K=K+1;
end;

% ����� �������
figure(1);
surf(x,y,U);