function  R =genBi2C2Metrix(whichFoot )%���嵽���
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
 
 
%--------------C2---------------
%--------------Hx---------------
 %X������תtheta_1
R1=calRotMetrix('X',theta_1(t));
%--------------Hy---------------
 %Y����ƽ��-l1
R2=calTranMetrix(0,-b1*L1,0);
 %Y������תtheta_2
R3=calRotMetrix('Y',theta_2(t));
 %--------------Knee---------------
 %Z����ƽ��-L2
R4=calTranMetrix(0,0,-a2*L2);

R=R1*R2*R3*R4;
 


end
