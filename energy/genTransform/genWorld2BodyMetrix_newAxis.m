function [R] = genWorld2BodyMetrix_newAxis()%���ϣ�����������������������������������
%������z����ˮƽ���ϵ�ͶӰ����ת������������

syms LB1  LB2 LB3 L1  theta_B1 theta_B2 theta_B3 theta_R theta_P theta_1  H_Body

 
 %Z����ƽ��H_Body 
R1=calTranMetrix(0,0,H_Body );
 %X����ƽ��LB1
R2=calTranMetrix(0,0,LB2*sin(theta_B2) );

T_WtoB3=R1*R2;

T_B3toT3=genBody2TrapMetrix(false);

 %Y������תthetaB2
R3=calRotMetrix('Y',theta_P);
 %Y������תthetaB2
R4=calRotMetrix('X',theta_R);

T_T3toT5=R3*R4;


T_T5toB5=genBody2TrapMetrix(true);
% R=T_WtoB3*T_B3toT3;
R=T_WtoB3*T_B3toT3*T_T3toT5*T_T5toB5;
 
end



