function  R = b2Foot(whichFoot)%ʹ�õ�Ч��,������
L1=sym('L1');
L2_f=sym('L2_f');
theta_1=sym('theta_1');
theta_2_f=sym('theta_2_f');
 
%�ڶ�����������-l1 
if whichFoot==1
     l1=L1  ;
elseif whichFoot==2
     l1=-L1 ;
elseif whichFoot==3
     l1=-L1 ;
elseif whichFoot==4
     l1=L1  ;  
end  

%--------------��ֵ����---------------
 %X������תtheta1
R1=calRotMetrix('X',theta_1);

 %Y����ƽ��-l1
R2=calTranMetrix(0,-l1,0);
 %Y������תtheta2
R3=calRotMetrix('Y',theta_2_f);
 
 %Z����ƽ��-L2
R4=calTranMetrix(0,0,-L2_f);

R=R1*R2*R3*R4;
end

