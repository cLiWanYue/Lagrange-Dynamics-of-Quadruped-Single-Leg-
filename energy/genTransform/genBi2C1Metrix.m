function  R =genBi2C1Metrix(whichFoot )%���嵽���
syms L1 L2 L3    a1 a2 a3 b1 real
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

 
%�ڶ�����������-l1
%-------------omiga1---------------
%X������תtheta_1
R1=calRotMetrix('X',theta_1(t));

%Y����ƽ��-l1
R2=calTranMetrix(0,-a1*L1,0);

R=R1*R2;
 



end
