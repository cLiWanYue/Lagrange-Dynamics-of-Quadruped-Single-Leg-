function [R] = calEachBiMetrix(whichOne)
global LB1  LB2 LB3 L1  theta_B1 theta_B2 theta_B3 theta_R theta_P theta_1  H_Body

switch( whichOne)
    case 1
        %�������y�᷽���z�᷽��
        %%%%%%%%%%��һ�����%%%%%%%%%%%%%
        %--------------B2b---------------
        %Z������תthetaB1
        R1=calRotMetrix('Z','theta_B1');
        %X����ƽ��LB1
        R2=calTranMetrix('LB1',0,0);
        %Y������תthetaB2
        R3=calRotMetrix('Y','theta_B2');
        %X����ƽ��LB2,Y����ƽ��-LB3
        R4=calTranMetrix('LB2','-LB3',0);
        
      
        R=R1*R2*R3*R4;

    case 2
        %%%%%%%%%%�ڶ������%%%%%%%%%%%%%Lb3=-LB3  l1=-L1
        %--------------B2b---------------
        %Z������תthetaB1
        R1=calRotMetrix('Z','theta_B1');
        %X����ƽ��LB1
        R2=calTranMetrix('LB1',0,0);
        %Y������תthetaB2
        R3=calRotMetrix('Y','theta_B2');
        %X����ƽ��LB2,Y����ƽ��-LB3
        R4=calTranMetrix('LB2','LB3',0);
        
       R=R1*R2*R3*R4;
    case 3
        %%%%%%%%%%���������%%%%%%%%%%%%%Lb3=-LB3 l1=-L1
        %--------------B2b---------------
        %X����ƽ��-LB1
        R2=calTranMetrix('-LB1',0,0);
        %Y������תthetaB3
        R3=calRotMetrix('Y','theta_B3');
        %X����ƽ��-LB2,Y����ƽ��-LB3
        R4=calTranMetrix('-LB2','LB3',0);
        
       R=R2*R3*R4;
        
    case 4
        %%%%%%%%%%���������%%%%%%%%%%%%%
        %--------------B2b---------------
        %X����ƽ��-LB1
        R2=calTranMetrix('-LB1',0,0);
        %Y������תthetaB3
        R3=calRotMetrix('Y','theta_B3');
        %X����ƽ��-LB2,Y����ƽ��-LB3
        R4=calTranMetrix('-LB2','-LB3',0);
        
       R=R2*R3*R4;
end
end

