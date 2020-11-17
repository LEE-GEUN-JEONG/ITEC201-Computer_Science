# ITEC201 / 컴퓨터학개론 / 2019년도 / 1학기 / 박정훈
## Term Project에 대한 설명을 상세히 나열함.
## matlab을 이용하여 데이터 압축 알고리즘을 코딩 및 설계함.

### 과제 1
huffman encoding을 이용한 데이터 압축 알고리즘 설계
![1](https://user-images.githubusercontent.com/58419421/69968484-dcdf8780-155d-11ea-9709-1880eb5487c0.jpg)
<과제1>

참고) 1. 첨부된 hwp 파일은 term project 제출 보고서임.
      2. 첨부된 txt 파일은 data compression을 필요로 하는 파일임. 

#### 알고리즘 설계
![1](https://user-images.githubusercontent.com/58419421/69973225-7c087d00-1566-11ea-9c8b-d9b8e6e2d858.jpg)
![2](https://user-images.githubusercontent.com/58419421/69973224-7c087d00-1566-11ea-9228-7961126c441a.jpg)
![3](https://user-images.githubusercontent.com/58419421/69973227-7c087d00-1566-11ea-9c61-86ecb94bce10.jpg)

#### 코드 설명
첨부된 m 파일을 참고하십시오.

#### 설계결과
![4](https://user-images.githubusercontent.com/58419421/69973228-7ca11380-1566-11ea-94a5-5083e73b6655.jpg)
![5](https://user-images.githubusercontent.com/58419421/69973229-7ca11380-1566-11ea-8464-451f3960f302.jpg)
![6](https://user-images.githubusercontent.com/58419421/69973532-fdf8a600-1566-11ea-8532-ea89f58529a6.jpg)


## 소스코드
clc; close all; clear;
% clc : 명령창의 코드를 삭제
% close : 띄어진 창을 삭제
% clear : 사용된 변수들을 메모리에서 삭제
% ===> 새로운 코드를 실행 시킬    때 과거값과의 충돌방지를 위해 습관적으로 clear 시켜준다.

f_id = fopen('source_JPARK2019_vfinal.txt', 'r');
format_read = '%2s';
% fopen(filename, permission) : 해당이름의 파일을 읽고, 기능을 설정한다. => txt 파일을 읽고,,
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

for datasample = 1:1:1000 
    % 1에서 1000까지의 sample(표본)을 설정
    
datasample_number = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% 1에서 sample까지의 data가 가지고 있는 알파벳 개수를 저장하기 위한 행렬
datasample_prob = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% 1에서 sample까지의 data를 통해 추출한 각 알파벳이 등장할 확률을 저장하기 위한 행렬

for i=1:1:datasample
    if datafile(1,i)=='a', datasample_number(1,1)=datasample_number(1,1)+1;
    elseif datafile(1,i)=='b', datasample_number(1,2)=datasample_number(1,2)+1;
    elseif datafile(1,i)=='c', datasample_number(1,3)=datasample_number(1,3)+1;
    elseif datafile(1,i)=='d', datasample_number(1,4)=datasample_number(1,4)+1;
    elseif datafile(1,i)=='e', datasample_number(1,5)=datasample_number(1,5)+1;
    elseif datafile(1,i)=='f', datasample_number(1,6)=datasample_number(1,6)+1;
    elseif datafile(1,i)=='g', datasample_number(1,7)=datasample_number(1,7)+1;
    elseif datafile(1,i)=='h', datasample_number(1,8)=datasample_number(1,8)+1;
    elseif datafile(1,i)=='i', datasample_number(1,9)=datasample_number(1,9)+1;
    elseif datafile(1,i)=='j', datasample_number(1,10)=datasample_number(1,10)+1;
    elseif datafile(1,i)=='k', datasample_number(1,11)=datasample_number(1,11)+1;
    elseif datafile(1,i)=='l', datasample_number(1,12)=datasample_number(1,12)+1;
    elseif datafile(1,i)=='m', datasample_number(1,13)=datasample_number(1,13)+1;
    elseif datafile(1,i)=='n', datasample_number(1,14)=datasample_number(1,14)+1;
    elseif datafile(1,i)=='o', datasample_number(1,15)=datasample_number(1,15)+1;
    elseif datafile(1,i)=='p', datasample_number(1,16)=datasample_number(1,16)+1;
    elseif datafile(1,i)=='q', datasample_number(1,17)=datasample_number(1,17)+1;
    elseif datafile(1,i)=='r', datasample_number(1,18)=datasample_number(1,18)+1;
    elseif datafile(1,i)=='s', datasample_number(1,19)=datasample_number(1,19)+1;
    elseif datafile(1,i)=='t', datasample_number(1,20)=datasample_number(1,20)+1;
    elseif datafile(1,i)=='u', datasample_number(1,21)=datasample_number(1,21)+1;
    elseif datafile(1,i)=='v', datasample_number(1,22)=datasample_number(1,22)+1;
    elseif datafile(1,i)=='w', datasample_number(1,23)=datasample_number(1,23)+1;
    elseif datafile(1,i)=='x', datasample_number(1,24)=datasample_number(1,24)+1;
    elseif datafile(1,i)=='y', datasample_number(1,25)=datasample_number(1,25)+1;
    else                     , datasample_number(1,26)=datasample_number(1,26)+1;
    end
end
% 1에서 sample 까지의 data가 가지고 있는 알파벳의 개수를 조사하여 datasample_number에 저장

for i=1:1:26
    datasample_prob(1,i) = datasample_number(1,i)/datasample;
end
% 1에서 sample까지의 data에서 각 알파벳이 등장할 확률을 구하는 코드

huffman_source = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
% huffmandict 함수를 사용하기 위해 source(a~z 까지의 알파벳의 순번을 매김)를 생성

huffman_output = huffmandict(huffman_source,datasample_prob);
% huffmandict(source,prob) : 소스와 소스의 각 요소에 해당하는 확률을 입력하여 huffman encoding을
% 한다. 결과로 huffman dictionary(i*2)행렬이 생성된다. 각 행렬의 2열에 해당하는 값이 각 요소의
% code(bit)이다. ==> huffman_output 행렬에 huffman dictionary 행렬을 저장하였음

huffman_codelength = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% huffman encoding으로 구한 각 비트의 길이(code length)를 저장하기 위한 행렬

for i=1:1:26
    huffman_codelength(1,i)=length(huffman_output{i,2});
end
% huffman encoding으로 구한 각 알파벳 code의 길이를 구하여 huffman_codelength 행렬에 저장한다.

ascii_usingbit = 7.*datasample;
% huffman encoding을 위해 datasample개의 data를 읽었으므로 data(알파벳) 1개 당 7비트가 사용되었다.
% ==> 표준 아스키 코드는 알파벳을 나타내기 위한 알파벳 1개당 7bit가 사용됨.
% 따라서 7*datasample 만큼의 비트가 추가적으로 사용되었음을 나타낸다.
huffman_usingbit = 0;
% huffman encoding을 통해 사용된 bit를 저장하기 위한 변수, 최초 0으로 초기화.

for i=1:1:26
huffman_usingbit = huffman_usingbit + (huffman_codelength(1,i).* (datareal_number(1,i) - datasample_number(1,i)));
end
% huffman encoding으로 얻은 각 알파벳의 code length를 바탕으로 datasample+1 ~ 100,000번 째까지의 data를 나타내기 위한 사용된 bit를 구함.

total_usingbit = ascii_usingbit + huffman_usingbit;
% 1~datasample번째 까지 사용된 bit(ASCII코드에 의해) + datasample+1 ~ 100,000번 째까지 사용된 bit(huffman encoding에 의해)의 합

result(1,datasample)=total_usingbit;
% datasample(1~1000까지의 범위)을 선택하였을 때 각각의 선택된 datasample값에 의해 사용된 total bit를 나타내기 위한 결과를 저장하는 행렬
end

datasample=1:1:datasample;
plot(datasample,result(1,datasample));
% plot(x,y) : x축, y축의 2차원에서의 그래프를 도시해줌.
% ==> 1에서~datasample(1 <= datasample <= 1000)까지의 x값 변화에 대한 y값(data를 나타내기 위해 사용된 총 bit)를 도시하는 그래프
