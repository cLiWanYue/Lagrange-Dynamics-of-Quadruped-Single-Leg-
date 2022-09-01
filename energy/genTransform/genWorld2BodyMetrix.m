function [R] = genWorld2BodyMetrix(isInverse)%isInverse��ʾ�ǲ��Ƿ�������
syms LB1  LB2 LB3 L1  theta_B1 theta_B2 theta_B3 theta_R theta_P theta_1  H_Body LW_x  LW_y  LW_z theta_World
if (isInverse == true)%����Body����������ϵ�ı仯���� genBody2WorldMetrix()
    
    T_B5toT5 = genBody2TrapMetrix(false);
    
    %Y������תthetaB2
    R3 = calRotMetrix('X', -theta_R);
    %Y������תthetaB2
    R4 = calRotMetrix('Y', -theta_P);
    
    T_T5toB3 = R3 * R4;
    
    T_T3toB3 = genBody2TrapMetrix(true);
    
    
    
    %X����ƽ��LB1
    R1 = calTranMetrix(0, 0, -LB2 * sin(theta_B2));
    %Z����ƽ��H_Body
    R2 = calTranMetrix(0, 0, -H_Body);
    
    
    T_B3toW = R1 * R2;
    
    T_WtoW0 = calRotMetrix('Z', -theta_World)*calTranMetrix(-LW_x, -LW_y, -LW_z);
    
    R = T_B5toT5 * T_T5toB3*T_T3toB3*T_B3toW*T_WtoW0;
    
elseif (isInverse == false)%������������ϵ��Body�ı仯����
    
    
    T_W0toW = calTranMetrix(LW_x, LW_y, LW_z)*calRotMetrix('Z', theta_World);%һ��������W0��ʾ�������������꣬W�ǹ������·����Ǹ��ֲ�����
    %Z����ƽ��H_Body
    R1 = calTranMetrix(0, 0, H_Body);
    %X����ƽ��LB1
    R2 = calTranMetrix(0, 0, LB2*sin(theta_B2));
    
    T_WtoB3 = T_W0toW * R1 * R2;
    
    T_B3toT3 = genBody2TrapMetrix(false);
    
    %Y������תthetaB2
    R3 = calRotMetrix('Y', theta_P);
    %Y������תthetaB2
    R4 = calRotMetrix('X', theta_R);
    
    T_T3toT5 = R3 * R4;
    
    
    T_T5toB5 = genBody2TrapMetrix(true);
    % R = T_WtoB3 * T_B3toT3;
    R = T_W0toW*T_WtoB3 * T_B3toT3*T_T3toT5*T_T5toB5;
    
end

end

