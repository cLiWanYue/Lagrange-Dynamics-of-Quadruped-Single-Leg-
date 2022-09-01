function [R] = genBi2FootMetrix(whichFoot)

syms L1 L2 L3   real
syms theta_1(t) theta_2(t) theta_3(t) t real
l1=sym('L1');
%�ڶ�����������-l1 
if whichFoot==1
     l1=l1  ;
elseif whichFoot==2
     l1=-l1 ;
elseif whichFoot==3
     l1=-l1 ;
elseif whichFoot==4
     l1=l1  ;  
end  

%--------------��ֵ����-------------- -
%X������תtheta_1 
R1 = calRotMetrix('X', theta_1(t));

%Y����ƽ�� - l1
R2 = calTranMetrix(0, -l1, 0);
%Y������תtheta_2
R3 = calRotMetrix('Y', theta_2(t));
%Z����ƽ�� - L2
R4 = calTranMetrix(0, 0, -L2);

%Y������תtheta_2
R5 = calRotMetrix('Y', theta_3(t));
%Z����ƽ�� - L2
R6 = calTranMetrix(0, 0, -L3);


R = R1 * R2*R3*R4*R5*R6;

end

