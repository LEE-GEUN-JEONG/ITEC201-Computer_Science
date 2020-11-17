clc; close all; clear;

x = rand(10,1);
y = Quick_Sort(x);

plot(x); 
hold on;
grid on;
plot(y);

f_id = fopen('array.txt', 'w');


fprintf(f_id, 'Our unsorted array is :\n');
fprintf(f_id, '%f\n', x);

fprintf(f_id, 'Our sorted array is : \n');
fprintf(f_id, '%f\n', y);