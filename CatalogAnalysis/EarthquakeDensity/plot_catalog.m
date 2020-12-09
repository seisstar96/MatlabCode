%%%Plot earthquake Density
clc;clear;close all
datagmt = load('Jz_all_catalog.txt');
lat = datagmt(:,1);
lon = datagmt(:,2);

bin = 0.001;
num = (33.4 - 33)/bin;
num =round(num);
X=lat;
Y=lon;
A=zeros(num,num);
%%%计算每个网格中有多少个地震%%%
for i=1:num
for j=1:num
    A(j,i)=length(find(X<=103.6+bin*i&X>103.6-bin+bin*i&Y>=33-bin+bin*j&Y<33+bin*j));
   %%%%将0转化为NaN 方便转化成白色
    if A(j,i) ==0
       A(j,i)=NaN;
    end
end
end
A=flipud(A);
b=33.4-bin/2:-bin:33+bin/2;
k=103.6+bin/2:bin:104-bin/2;
h=heatmap(k,b,A,'Colormap',jet,'GridVisible','off');
