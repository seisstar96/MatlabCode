clc;clear;
ch = load ('chinacatalog.txt');
path= 'utccatalog.txt';
fid = fopen(path,'w');
for i=1:1:505 
    mon=ch(i,1);
    day=ch(i,2);
    hour=ch(i,3);
    min=ch(i,4);
    sec=ch(i,5);
    time=hour*3600+min*60+sec;
    time1=time-8*3600;
    if time1>0
       hour1=hour-8;
       fprintf(fid,'%d %d %d %d %d\n',mon,day,round(hour1),round(min),round(sec));
    end
    if time1<0
       day2=day-1;
       time2=time1+86400;
       hour2=round(time2/3600)-1;
       min2=round((time2-hour2*3600)/60)+60;
       sec2=time2-hour2*3600-min2*60;
       fprintf(fid,'%d %d %d %d %d\n',mon,day2,round(hour2),round(min2),round(sec2));
    end
end
fclose(fid)
