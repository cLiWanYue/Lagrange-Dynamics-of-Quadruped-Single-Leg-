function [R] = genBody2TrapMetrix(isInverse)%��������ϵ����������ϵ

syms LB1  LB2 LB3 L1  theta_B1 theta_B2 theta_B3 theta_R theta_P theta_1  H_Body a b c d e f

 
if(isInverse)%�����
  %Z������ת���thetaB1
R3=calRotMetrix('Z',-theta_B1/2);
 %Z����ƽ��-LB2*sin(theta_B2)
R2=calTranMetrix(0,0,LB2*sin(theta_B2));
 %Y����ƽ��(LB1+LB2)*cos(theta_B1/2)
R1=calTranMetrix(0,-(LB1+LB2*cos(theta_B2))*sin(theta_B1/2),0);

else
 %Z������ת���thetaB1
R1=calRotMetrix('Z',theta_B1/2);
 %Z����ƽ��-LB2*sin(theta_B2)
R2=calTranMetrix(0,0,-LB2*sin(theta_B2));
 %Y����ƽ��(LB1+LB2)*cos(theta_B1/2)
R3=calTranMetrix(0,(LB1+LB2*cos(theta_B2))*sin(theta_B1/2),0);

end 
  
R=R1*R2*R3 ;


end

