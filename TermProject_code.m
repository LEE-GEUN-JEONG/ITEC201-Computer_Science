clc; close all; clear;
% clc : ���â�� �ڵ带 ����
% close : ����� â�� ����
% clear : ���� �������� �޸𸮿��� ����
% ===> ���ο� �ڵ带 ���� ��ų �� ���Ű����� �浹������ ���� ���������� clear �����ش�.

f_id = fopen('source_JPARK2019_vfinal.txt', 'r');
format_read = '%2s';
% fopen(filename, permission) : �ش��̸��� ������ �а�, ����� �����Ѵ�. => txt ������ �а�, 
%'r'(read) �б� ��ɸ� ���ɵ��� �����Ѵ�.(����,÷�� �Ұ���)
% ==> �ùٸ��� ������ �������� 3 �̻��� ���� ��ȯ��.
% '%2s' : ���ڿ��� 2�� �ʵ������� �д´�.

datafile = fscanf(f_id,format_read);
% fscanf(f_id,format,size) : fopen���� ���� file�� id, format(������ ���� ����),
% size(��� m*n ����) ==> ��ĵ�� ������ datafile ��Ŀ� �����Ѵ�. datafile�� 1*100000�� ũ�⸦ ����

datafile_length = length(datafile);
% length(X) : X ����� ���� ū ������ ���̸� ��ȯ. ==> datafile�� ���� ū ������ ���̸� ��ȯ�Ѵ�. ==> 100,000�� ���̸� ����.

datareal_number = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% datafile�� 1���� 10���� ������ ��� ���ĺ��� ������ �����ϱ� ���� ���(1*26), ���ʿ� 0���� �ʱ�ȭ�Ѵ�.

for i=1:1:100000 
    if datafile(1,i)=='a', datareal_number(1,1)=datareal_number(1,1)+1;
    elseif datafile(1,i)=='b', datareal_number(1,2)=datareal_number(1,2)+1;
    elseif datafile(1,i)=='c', datareal_number(1,3)=datareal_number(1,3)+1;
    elseif datafile(1,i)=='d', datareal_number(1,4)=datareal_number(1,4)+1;
    elseif datafile(1,i)=='e', datareal_number(1,5)=datareal_number(1,5)+1;
    elseif datafile(1,i)=='f', datareal_number(1,6)=datareal_number(1,6)+1;
    elseif datafile(1,i)=='g', datareal_number(1,7)=datareal_number(1,7)+1;
    elseif datafile(1,i)=='h', datareal_number(1,8)=datareal_number(1,8)+1;
    elseif datafile(1,i)=='i', datareal_number(1,9)=datareal_number(1,9)+1;
    elseif datafile(1,i)=='j', datareal_number(1,10)=datareal_number(1,10)+1;
    elseif datafile(1,i)=='k', datareal_number(1,11)=datareal_number(1,11)+1;
    elseif datafile(1,i)=='l', datareal_number(1,12)=datareal_number(1,12)+1;
    elseif datafile(1,i)=='m', datareal_number(1,13)=datareal_number(1,13)+1;
    elseif datafile(1,i)=='n', datareal_number(1,14)=datareal_number(1,14)+1;
    elseif datafile(1,i)=='o', datareal_number(1,15)=datareal_number(1,15)+1;
    elseif datafile(1,i)=='p', datareal_number(1,16)=datareal_number(1,16)+1;
    elseif datafile(1,i)=='q', datareal_number(1,17)=datareal_number(1,17)+1;
    elseif datafile(1,i)=='r', datareal_number(1,18)=datareal_number(1,18)+1;
    elseif datafile(1,i)=='s', datareal_number(1,19)=datareal_number(1,19)+1;
    elseif datafile(1,i)=='t', datareal_number(1,20)=datareal_number(1,20)+1;
    elseif datafile(1,i)=='u', datareal_number(1,21)=datareal_number(1,21)+1;
    elseif datafile(1,i)=='v', datareal_number(1,22)=datareal_number(1,22)+1;
    elseif datafile(1,i)=='w', datareal_number(1,23)=datareal_number(1,23)+1;
    elseif datafile(1,i)=='x', datareal_number(1,24)=datareal_number(1,24)+1;
    elseif datafile(1,i)=='y', datareal_number(1,25)=datareal_number(1,25)+1;
    else                     , datareal_number(1,26)=datareal_number(1,26)+1;
    end
end
% for���� ���� datafile�� 1���� 10�� ��° ������ ��� data�� �����Ͽ� ��� ���ĺ��� ������ ī�����ϰ� datareal_number ��Ŀ� �����ϴ� �ڵ�

datareal_prob = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
for i=1:1:26
    datareal_prob(1,i) = datareal_number(1,i)/datafile_length;
end

huffman_source = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
% huffmandict �Լ��� ����ϱ� ���� source(a~z ������ ���ĺ��� ������ �ű�)�� ����

huffman_output = huffmandict(huffman_source,datareal_prob);
huffman_codelength = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% huffman encoding���� ���� �� ��Ʈ�� ����(code length)�� �����ϱ� ���� ���

for i=1:1:26
    huffman_codelength(1,i)=length(huffman_output{i,2});
end
huffman_usingbit=0;
for i=1:1:26
huffman_usingbit = huffman_usingbit + (huffman_codelength(1,i).* (datareal_number(1,i)));
end

