%%%Plot earthquake Density Project
clc;clear;close all
datagmt = load('proSeg1.txt');
lat = datagmt(:,1);
lon = datagmt(:,2);

bin = 0.1;
bin1 = bin;
num1 = (25 - (-25))/bin;
num1 =round(num1);
num2 = (15)/bin;
num2 =round(num2);

X=lat;Y=lon;
A=zeros(num1,num2);
for i=1:num1
for j=1:num2
    A(i,j)=length(find(X<=-20+bin*i&X>-20-bin+bin*i&Y>=0-bin+bin*j&Y<0+bin*j));
    %%%%将0转化为NaN 方便转化成白色
    if A(i,j) ==0
       A(i,j)=NaN;
    end
end
end
A=flipud(A);
b=25-bin1/2:-bin1:-25+bin1/2;
k=0+bin1/2:bin1:15-bin1/2;
h=heatmap(k,b,A,'Colormap',jet,'GridVisible','off');
h.XLimits = [k(:,1),k(:,length(k))];
