clc; close all; clear;
% clc : 명령창의 코드를 삭제
% close : 띄어진 창을 삭제
% clear : 사용된 변수들을 메모리에서 삭제
% ===> 새로운 코드를 실행 시킬 때 과거값과의 충돌방지를 위해 습관적으로 clear 시켜준다.

f_id = fopen('source_JPARK2019_vfinal.txt', 'r');
format_read = '%2s';
% fopen(filename, permission) : 해당이름의 파일을 읽고, 기능을 설정한다. => txt 파일을 읽고, 
%'r'(read) 읽기 기능만 가능도록 설정한다.(수정,첨부 불가능)
% ==> 올바르게 파일이 읽혔으면 3 이상의 값이 반환됨.
% '%2s' : 문자열을 2의 필드폭으로 읽는다.

datafile = fscanf(f_id,format_read);
% fscanf(f_id,format,size) : fopen으로 읽은 file의 id, format(데이터 형식 지정),
% size(행렬 m*n 지정) ==> 스캔한 정보를 datafile 행렬에 저장한다. datafile은 1*100000의 크기를 가짐

datafile_length = length(datafile);
% length(X) : X 행렬의 가장 큰 차원의 길이를 반환. ==> datafile의 가장 큰 차원의 길이를 반환한다. ==> 100,000의 길이를 가짐.

datareal_number = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% datafile의 1에서 10만개 까지의 모든 알파벳의 개수를 저장하기 위한 행렬(1*26), 최초에 0으로 초기화한다.

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
% for문을 통해 datafile의 1에서 10만 번째 까지의 모든 data에 접근하여 모든 알파벳의 개수를 카운팅하고 datareal_number 행렬에 저장하는 코드

datareal_prob = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
for i=1:1:26
    datareal_prob(1,i) = datareal_number(1,i)/datafile_length;
end

huffman_source = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
% huffmandict 함수를 사용하기 위해 source(a~z 까지의 알파벳의 순번을 매김)를 생성

huffman_output = huffmandict(huffman_source,datareal_prob);
huffman_codelength = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% huffman encoding으로 구한 각 비트의 길이(code length)를 저장하기 위한 행렬

for i=1:1:26
    huffman_codelength(1,i)=length(huffman_output{i,2});
end
huffman_usingbit=0;
for i=1:1:26
huffman_usingbit = huffman_usingbit + (huffman_codelength(1,i).* (datareal_number(1,i)));
end

