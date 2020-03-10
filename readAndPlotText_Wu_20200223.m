% read level and centres
% calculate the absolute height of centres
% -0.003 s for V_i
% 0.005 s for V_j

close all; 
clc;



format shortg
c = clock;
disp(c);

ext = '.txt';
ext_img = '.bmp';
ext_out = '.txt';


currentDate = 20200107;
% 20200107 is blank

currentNdl = input('currentNdl: ');
currentHight = input('currentHight:  ');
currentRun = input('currentRun:  ');

ii = input('ii:  ');


prefix_1 = 'C:\Users\lab-admin\Desktop\Lichen_Wu\movies_processed\';
% prefix_14 = num2str(currentDate);
prefix_15 = 'ndl';
prefix_10 = num2str(currentNdl);
prefix_11 = '_hgt';
prefix_6 = num2str(currentHight);
prefix_7 ='_r';
prefix_2 = num2str(currentRun);
prefix_3 =strcat('\','ndl');
% prefix_3 =strcat('\',num2str(currentDate),'_ndl');
prefix_12 = num2str(currentNdl);
prefix_13 = '_ht';
prefix_8 =num2str(currentHight);
prefix_9 ='_r';
prefix_4 =num2str(currentRun);
prefix_5= '_';

prefix = strcat(prefix_1,prefix_15,prefix_10,prefix_11,prefix_6,...
    prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext);

prefix_img = strcat(prefix_1,prefix_15,prefix_10,prefix_11,prefix_6,...
    prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext_img);
% 
% prefix_1 = 'C:\Users\lab-admin\Desktop\Lichen_Wu\movies_processed\';
% prefix_14 = num2str(currentDate);
% prefix_15 = '_ndl';
% prefix_10 = num2str(currentNdl);
% prefix_11 = '_hgt';
% prefix_6 = num2str(currentHight);
% prefix_7 ='_r';
% prefix_2 = num2str(currentRun);
% prefix_3 =strcat('\',num2str(currentDate),'_ndl');
% prefix_12 = num2str(currentNdl);
% prefix_13 = '_ht';
% prefix_8 =num2str(currentHight);
% prefix_9 ='_r';
% prefix_4 =num2str(currentRun);
% prefix_5= '_';
% 
% prefix = strcat(prefix_1,prefix_14,prefix_15,prefix_10,prefix_11,prefix_6,...
%     prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5);

outDir = 'C:\Users\lab-admin\Desktop\Lichen_Wu\matlab\profileVelocity\';

filename_out = strcat(outDir,'JetVel',ext_out);



fileID = fopen(prefix);
C = textscan(fileID, '%f %f');

yourImage = imread(prefix_img);
imshow(yourImage);
hold on;

x = C{1};
y = 1000 - C{2};

height = max(y)

plot(x,y);


% fid = fopen(filename_out,'a');
% fprintf(fid, '%d \t %d \t %d \t %d \t %d \t  %d \t  %d \t  %d \t  %d \t  %d \t %d \t %8.2f \t %8.2f \t %8.2f\n',...
%     [currentDate;currentNdl;currentHight;currentRun;c(1);c(2);c(3);c(4);c(5);c(6);ii;cenXX; cenYY;radii]); %relative to flat surface
% fclose(fid);
diary jetVelocities