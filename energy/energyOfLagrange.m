clear
warning('off')
addpath(genpath('.\simple'));%�򻯵ĺ���
addpath(genpath('.\genTransform'));%�򻯵ĺ���
syms Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3 real
syms L1 L2 L3    a1 a2 a3 b1 real
syms g m1 m2 m3 real
syms theta_1(t) theta_2(t) theta_3(t) t real
syms theta_1_d(t) theta_2_d(t) theta_3_d(t)   real
syms theta_1_dd(t) theta_2_dd(t) theta_3_dd(t)   real
%��˵һ������ϵ���ã�body�������������ĵ��Ǹ�����ϵ��bi���������ȵļ������ϵ�������bodyһ��
%֮���abad��hip,knee��mit��һ�£��������Ȳ���������������

%a1 a2 a3 b1���Ȳ��������������λ�ã����Կ��ҵ�ͼʾ
%Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3���Ȳ��������������Ĵ��Ĺ���������ϵ����͸ø�������ϵһ��
% --------------Part1.�������ת������-------------
%-------------omiga1---------------
R_b2Abad=genBi2AbadMetrix(1);
R_b2Abad=R_b2Abad(1:3,1:3);
omiga_L1=calOmigaFromRotMat(R_b2Abad);
omiga_L1=simplify(subTime(omiga_L1));


%-------------omiga2---------------
R_b2Hip=genBi2HipMetrix(1);
R_b2Hip=R_b2Hip(1:3,1:3);
omiga_L2=calOmigaFromRotMat(R_b2Hip);
omiga_L2=simplify(subTime(omiga_L2));

%-------------omiga3---------------
R_b2Knee=genBi2KneeMetrix(1);
R_b2Knee=simplify(R_b2Knee(1:3,1:3));
omiga_L3=calOmigaFromRotMat(R_b2Knee);
omiga_L3=simplify(subTime(omiga_L3));

%-------------ת������---------------
I1=diag([Ixx1 ,Iyy1, Izz1]);
I2=diag([Ixx2 ,Iyy2, Izz2]);
I3=diag([Ixx3 ,Iyy3, Izz3]);
%ת�����ص���bi��ͬ����
I1_bi=R_b2Abad*I1*R_b2Abad';
I2_bi=R_b2Hip*I2*R_b2Hip';
I3_bi=R_b2Knee*I3*R_b2Knee';

I1_bi=simplify(subTime(I1_bi));
I2_bi=simplify(subTime(I2_bi));
I3_bi=simplify(subTime(I3_bi));
%-------------ת������---------------
Ek_r=(omiga_L1'*I1_bi*omiga_L1  + omiga_L2'*I2_bi*omiga_L2  +  omiga_L3'*I3_bi*omiga_L3)/2


 

%--------------Part2.��������ƽ������-------------
% --------------C1---------------
R=genBi2C1Metrix(1);%��򵽵�һ��������c1�ı仯����
P1=R(1:3,4);%�õ�c1�ڼ������ϵ�µ�λ��
J1=Jocobian(P1,[theta_1(t),theta_2(t),theta_3(t)]);%���bi��c1���ſɱȾ���

%--------------C2---------------
R=genBi2C2Metrix(1);
P2=R(1:3,4);
J2=Jocobian(P2,[theta_1(t),theta_2(t),theta_3(t)]);

%--------------C3---------------
R=genBi2C3Metrix(1);
P3=R(1:3,4);
J3=Jocobian(P3,[theta_1(t),theta_2(t),theta_3(t)]);

q_d=[theta_1_d ;theta_2_d; theta_3_d];%�����ؽڵĽ��ٶ�

v1=J1*q_d ;
v2=J2*q_d ;
v3=J3*q_d ;
% Ek_t=(q_d'*J1'*m1*J1*q_d + q_d'*J2'*m2*J2*q_d  +  q_d'*J2'*m3*J2*q_d   )/2%�Ȳ�ƽ���ܶ���
Ek_t=(v1'*m1*v1 +v2'*m2*v2 +  v3'*m3*v3   )/2%�Ȳ�ƽ���ܶ���
Ek_t=subTime(Ek_t);
Ek=Ek_t+Ek_r
 



%--------------Part3.���������������-------------
%�����������ܵľ���
v=[0;0;1];%���淨����
h1=simplify(P1'*v);%��һ����������z�᷽�򵽼������ϵԭ��ľ���,���ǵ����ֱ���ϵ�λ�����Ķ���
h2=simplify(P2'*v);
h3=simplify(P3'*v);

h1=subTime(h1);
h2=subTime(h2);
h3=subTime(h3);

Ep=m1*g*h1+m2*g*h2+m3*g*h3;
%�������շ�������������һ����Ե�������
Ep_dp=[dif(Ep,theta_1);dif(Ep,theta_2) ;dif(Ep,theta_3)]


% --------------Part4.�������չ�ʽ����ÿ���ؽ�Ť��-------------
 

L=Ek-Ep;%��ʽ��
L=subTime(L);%ֻ�а�(t)ȥ��������ƫ��������ֻ�м���ʱ�����ȫ������������

 
L_dqd= [dif(L,theta_1_d);dif(L,theta_2_d) ;dif(L,theta_3_d)];%L_dqd��ʾL��theta_1_dƫ��
L_dqd=addTime(L_dqd);
L_dqd_dt=dif(L_dqd);%L_dqd_dt��ʾL_dqd��t��ȫ��
L_dqd_dt=subTime(L_dqd_dt);

L_dq= [dif(L,theta_1);dif(L,theta_2) ;dif(L,theta_3)];%��theta_1ƫ�� 
 

Q=L_dqd_dt-L_dq;

 
% --------------Part5.����ʽ���������D��C,����G-------------
%��simple��main����������Ҳ����Щ���룬����ֻҪ����theta_1_dd�ͻ��Դ���t��,���ô�����

theta_dd=[theta_1_dd ;theta_2_dd;theta_3_dd];
theta_d=[theta_1_d ;theta_2_d;theta_3_d];
theta=[theta_1;theta_2 ;theta_3];
theta_dd=subTime(theta_dd);
theta_d=subTime(theta_d);
theta=subTime(theta);

Q_col=collect(Q,theta_dd);%����ȡһ�£���Ȼmatlab������

D=equationsToMatrix(Q_col,theta_dd)%���׵���ϵ��
%
Q_col=simplify( Q_col-D*theta_dd - Ep_dp);%�Ѻ��ж��׵��Ĳ���,���������ܲ���ȥ��


Q_col=collect(Q_col,theta_d);

C=equationsToMatrix_NonLinear(Q_col, theta_d)

G=Ep_dp

% --------------Part6.��theta_dd-------------

%�Ǽ��ٶȵ�Ȼ����ͨ���ٶ��������ˣ�����
%���ݹ�ʽtheta_dd=J_inverse*(a - *Jd * theta_d)

R=genBi2FootMetrix(1);%�����˵ı仯����
P1=R(1:3,4);%�õ�c1�ڼ������ϵ�µ�λ��
J=Jocobian(P1,[theta_1(t),theta_2(t),theta_3(t)]);%���bi��c1���ſɱȾ���
J_str=addTime(J);%�Ƕȱ��ʱ��ĺ�����֮�������
Jd=diff(J_str);%�󵼣��õ��ſɱȾ���ĵ���
Jd=subTime(Jd)%��ط���











