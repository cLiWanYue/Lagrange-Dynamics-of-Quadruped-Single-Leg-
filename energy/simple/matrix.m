function [mat] = matrix(mat_cell)
%ʹ��evalʱϵͳ������������

size_mat=size(mat_cell) ;
row=size_mat(2);
if(class(mat_cell)==sym('symfun'))
    out='���뺯��symfun��һ������ѽ������1*3��'
    %     mat=mat_cell*eye(3);
     syms t;
    mat=mat_cell(t);%symfun ��Ҫ������δ֪���ﴫһ�������Ż�����ͨ����
end
%����



if(row>4)%����
    row=row^(1/2) ;
    t=1;
    for i=1:row
        mat(i,1:row)=mat_cell(t:t+row-1);
        t=t+row;
    end
else
    mat(1:row)=mat_cell(1:row);
    mat=mat';
    
end


%Ϊ��ʹ��eval��������д��

end

