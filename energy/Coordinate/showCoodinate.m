function [] = showCoodinate(C,name,rate)
%C.p0֮��Ķ�����ά��C.p0��x����㣬C.x1��x����յ�
% quiver3Ҫ�������λ�ã���������������
%rate�Ǳ���������1����̫���ˣ����ÿ�
text(C.p0.X,C.p0.Y,C.p0.Z,name,'color','r');
quiver3(C.p0.X,  C.p0.Y,  C.p0.Z,   C.x1.X-C.p0.X,   C.x1.Y-C.p0.Y,   C.x1.Z-C.p0.Z  ,rate,'r')  
hold on
quiver3(C.p0.X,C.p0.Y,C.p0.Z,C.y1.X-C.p0.X,C.y1.Y-C.p0.Y,C.y1.Z-C.p0.Z,rate,'b')
hold on
quiver3(C.p0.X,C.p0.Y,C.p0.Z,C.z1.X-C.p0.X,C.z1.Y-C.p0.Y,C.z1.Z-C.p0.Z,rate,'g')
hold on

end

