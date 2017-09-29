clc
clear all
close all
% %  -----  2.���� ������ ---------- % % 


x1= input('������� ���-�� �������� (�� 4 �� 10), x1=');%��� �����
for i=1:5 % �������� ������� ������ X1, ������ ���� ������ ������ ������ �����
if x1<4 || x1>10 
    x1= input('������� ���-�� �������� (�� ����� 10 !!! � �� ����� 4 !!!), x1='); 
else
    if x1>=4 && x1<=10  % ������� ��������, ���� ���-�� �������� ���� �� 4 �� 10
    break 
        end
end

if i==5
         fprintf('�� ������� ���������....:) '), return 
end

end

x2= input('������� ���-�� ���������� (�� ����� ��� ���-� ��������), x2=');% � ��������� ������������ �����: ('������� ���-�� ���������� (�� ����� ��� ���-� ��������), x2=');
% 
for i=1:5 % ���� ������� ������� ��� ���������� ����� ������, ���� ��� ������� ������� 
if  x2>x1 && x2<1
x2= input('��������� ���-�� ���������� �� ����������. ������� �� ����� ��� ���-� �������� � �� ������ 0, x2=');
else if x2<=x1
    break
        end
end

if i==5
         fprintf('�� ������� ���������....:) '), return
end

end

% (��������� ����������� ������ ��������������!!!)
tn=input('������� ����� �� ����� (�����), tn=');%�������� ������.... ������� ����� �� ����� (�����)
tv=input('������ ����� ������������� ����������������� (�����), tv=');%�������� ������.... ������� ����� ������������� ����������������� (�����)


% ----- ����� ����� ������ -------------


% % -------  3.���������� ����� ��������� ----  
% (��������� ����� ����� ����������� � �������� ���������� ������, ������ ��� graph.m ����� ��������������)

fprintf(' ------------------------------------------------------------------------------------------------------------------------------------------------------------------ \n'); % ������� ������ �� � ����� ����������� ����� � �������

[Lam_mas,Mu_mas]=graph_my(x1,x2); % ��������� ���� �������, ������� ������ ���� ���������. 

fprintf(' ------------------------------------------------------------------------------------------------------------------------------------------------------------------ \n');
% -------  ���������� ����� ��������� ---- 


%% % ---- 4.������� ���������� ----


Lam=1/tn; % ������������� �������
fprintf('������������� �������, Lamda=%1.4f \n',Lam);
Mu=1/tv; % ������������� ������������� ������������������
fprintf('������������� ������������� ������������������, Mu=%1.4f \n',Mu);
q=Lam/Mu; % ����������� ������������� ���������, ��������� �������� ��������� ������ � ��, ��� ���������� �����.
fprintf('����������� ������������� ���������, q=%1.4f \n',q);
q_mas=Lam_mas./Mu_mas; % ������������ ��� qi
disp('������������ ��� qi:')
disp(q_mas)

q_i=q_mas.*q; % ������ i-��� ������������� ���������
disp('������������ ������������� ����������, qi:')
disp(q_i)


% --- ������ ����������� ���������������� ��������� (�0)

for i=1:x1
Q_i(i)=prod(q_i(1:i)); % ������ ��������� ��� ����������� ����������������� ���� �������� (P0) (���: ������ i-��� / �� i-���)
end

P0=1./(1+sum(Q_i));
disp('����������� ���������������� ���������, P0:')
disp(P0)
% ----

% --- ������ Pi ---
format shortEng
P_i=Q_i.*P0; % ������ Pi
disp('����������� ���������� ������� � ������ ����������, Pi:')
disp(P_i)
format short
% ----


% --- ������ ������� ��������� ������ ��������� (k)

Kp=Mu_mas./x2;% ������ ����������� ��� �
disp('���������� ��� � ��� ������� ��������� ��������� (k):')
disp(Kp)

K=sum(Kp.*P_i); % ������ �
disp('������� ��������� ������ ���������, k:')
disp(K)
% ---

% --- ������� �������� ����� ����������� �������� W
W= sum(fliplr(Lam_mas).*P_i);
disp('������� ����� ����������� ��������, W:')
disp(W)
% --- 