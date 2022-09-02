clc;clear;close all
[lat,lon,depth]=textread('geo_sa.txt','%f%f%f');

data=depth;
lonlim1=min(lon);
lonlim2=max(lon);
latlim1=min(lat);
latlim2=max(lat);

### generating grid data
space_shp=0.05;
xi=lonlim1:space_shp:lonlim2;
yi=latlim1:space_shp:latlim2;
[XI,YI]=meshgrid(xi,yi);

##  inter
vq = griddata(lon,lat,data,XI,YI,'natural');

#### plot result
h=surf(XI,YI,vq);
set(h,'edgecolor','none')
colormap('jet');
### range
caxis([1.6 1.9])
####
colorbar
grid off
hold on
