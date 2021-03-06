clear all;
close all;
files=dir('data/labview/*.csv');
counter=1;
for file=files'
    name=strcat('data/labview/',file.name)
    if str2num(name(28))>4 && str2num(name(28))<9   %change this to toggle between horizontal and vertical edges
        continue;
    end
%     name='data/labview/obj1_sub1_edge2_pass1_labview.csv';
    [debFx,debFy,debFz,t,d, debCenter, debRad, debEnd, debX1, debY1, debZ1, ...
    debX2, debY2, debZ2, debX3, debY3, debZ3,debTime,debVelMag,A,B,C,D,E,F,G,H]=processData(name);
%     animateDeburring(debFx,debFy,debFz,t, debCenter, debRad, debEnd, debX1, debY1, debZ1, ...
%     debX2, debY2, debZ2, debX3, debY3, debZ3,A,B,C,D,E,F,G,H);
    hfig=figure('Name',name);
    hax=axes('Parent',hfig);
    plot(hax,t);
    hold on;
    plot(hax,d);
    plot(hax,debFx);
    plot(hax,debFy);
    plot(hax,debFz);
    plot(hax,debVelMag);
    name2=strcat(name(1:end-4),'.bmp');
    legend('t','d','Fx','Fy','Fz','vel');
    saveas(hfig,name2);
    %pause()
    close all;
    collateddebFx{counter}=debFx;
    collateddebFy{counter}=debFy;
    collateddebFz{counter}=debFz;
    collatedt{counter}=t;
    collatedd{counter}=d;
    collateddebEnd{counter}=debEnd;
    collatedName{counter}=cellstr(name(1:end-4));
    collatedTime{counter}=debTime;
    collatedVelMag{counter}=debVelMag;
    counter=counter+1;
%     figure()
%     plot(t,debVelMag);
    %break;
end

save('horizontalData3.mat');