function  R = Body2B(whichFoot)%���嵽���
%Body2B2��-LB3  
 
if whichFoot==1  
     R = Body2B1(1)  ;
elseif whichFoot==2
     R = Body2B1(2)  ;
elseif whichFoot==3
     R = Body2B4(3)  ;
else % whichFoot==4
     R = Body2B4(4)  ;     
end  

 
function  R = Body2B1(whichFoot)
LB1=sym('LB1');
LB2=sym('LB2');
LB3=sym('LB3');
theta_B1=sym('theta_B1');
theta_B2=sym('theta_B2');
theta_B3=sym('theta_B3');

%Body2B2��-LB3  
Lb3=LB3;
if whichFoot==2
    Lb3=-LB3  ;
elseif whichFoot==1
    Lb3=LB3  ;
end  

%--------------��ֵ����---------------
 %Z������תtheta_B1
R1=calRotMetrix('Z',theta_B1);


 %X����ƽ��LB1
R2=calTranMetrix(LB1,0,0);
 %Y������תtheta_B2
R3=calRotMetrix('Y',theta_B2);
 %X����ƽ��LB2,Y����ƽ��-LB3
R4=calTranMetrix(LB2,-Lb3,0);
R=R1*R2*R3*R4;


function  R = Body2B4(whichFoot)
LB1=sym('LB1');
LB2=sym('LB2');
LB3=sym('LB3');
theta_B1=sym('theta_B1');
theta_B2=sym('theta_B2');
theta_B3=sym('theta_B3');

%Body2B2��-LB3  
Lb3=LB3 ;
if whichFoot==3
    Lb3=-LB3  ;
elseif whichFoot==4
    Lb3=LB3  ;
end  

%--------------��ֵ����---------------
 

 %X����ƽ��-LB1
R2=calTranMetrix(-LB1,0,0);
 %Y������תtheta_B3
R3=calRotMetrix('Y',theta_B3);
 %X����ƽ��-LB2,Y����ƽ��-LB3
R4=calTranMetrix(-LB2,-Lb3,0);
 
R=R2*R3*R4;



