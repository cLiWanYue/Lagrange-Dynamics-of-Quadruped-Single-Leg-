function [ R] = genWorld2BiMetrix(whichFoot,isInverse)

global LB1  LB2 LB3 L1  theta_B1 theta_B2 theta_R theta_P theta_1  H_Body
%
% T_World2Body=genWorld2BodyMetrix();
%
% T_Body2Bi=Body2B(whichOne);
% T_World2Bi= T_World2Body* T_Body2Bi;
if (isInverse == false)%���絽���
    
    R1 = genWorld2BodyMetrix(false);%���絽����
    R2 = genBody2biMetrix(whichFoot, false);%���嵽���
    
    
    
elseif (isInverse == true)%�������
    
    R1 = genBody2biMetrix(whichFoot, true);%�������
    R2 = genWorld2BodyMetrix(true);%���嵽����
end
R = R1 * R2;

end