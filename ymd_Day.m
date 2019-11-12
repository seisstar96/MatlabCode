clc;clear;
ch = load('Ljy.dat');
%%%%% year month day .... %%%%%
path='output.txt';
fid = fopen(path,'w');
y = ch(:,1);
m = ch(:,2);
d = ch(:,3);
months = [0,31,59,90,120,151,181,212,243,273,304,334]';
for i =1:length(y)
    da=m(i);
    day(i)=months(da)+d(i);
    fprintf(fid,'%4d%2.2d%2.2d  %4d\n',y(i),m(i),d(i),day(i));
end
fclose(fid);
%%%%%% output : yearmonday day
%%%%            20181220 320 
