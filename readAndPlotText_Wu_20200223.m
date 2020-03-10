close all; 
clc;

currentDate = 20200108;
% 20200107 is blank

currentNdl = input('currentNdl: ');
currentHight = input('currentHight:  ');
currentRun = input('currentRun:  ');

prefix_1 = 'C:\Users\lab-admin\Desktop\Lichen_Wu\movies_processed\';
prefix_14 = num2str(currentDate);
prefix_15 = '_ndl';
prefix_10 = num2str(currentNdl);
prefix_11 = '_hgt';
prefix_6 = num2str(currentHight);
prefix_7 ='_r';
prefix_2 = num2str(currentRun);
prefix_3 =strcat('\',num2str(currentDate),'_ndl');
prefix_12 = num2str(currentNdl);
prefix_13 = '_ht';
prefix_8 =num2str(currentHight);
prefix_9 ='_r';
prefix_4 =num2str(currentRun);
prefix_5= '_';

prefix = strcat(prefix_1,prefix_14,prefix_15,prefix_10,prefix_11,prefix_6,...
    prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5);

filename_out = strcat(prefix, num2str(ii, '%05g'),ext_out);


fileID = fopen('ndl14_h4_r1_-800.txt');
C = textscan(fileID, '%f %f');

% yourImage = imread('ndl14_h4_r1_-0800.bmp');
% imshow(yourImage);
% hold on;

x = C{1};
y = 1000 - C{2};

plot(x,y);

diary profileVelocities