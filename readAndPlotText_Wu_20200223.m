% read level and centres
% calculate the absolute height of centres
% -0.003 s for V_i
% 0.005 s for V_j

close all; 
clc;



format shortg
c = clock;
disp(c);

ext = '_test.txt';
% ext = '.txt';

ext_img = '.bmp';
ext_out = '.txt';

go_on ='y';
increaseHight = 0;
i=0;


currentDate = 20200108;
% 20200107 is blank

currentNdl = input('currentNdl: ');
currentHight = input('currentHight:  ');
currentRun = input('currentRun:  ');
% ii = input('reference image ii:  ');
% ii = -1500;
ii = -2500;

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


% prefix_1 = 'C:\Users\lab-admin\Desktop\Lichen_Wu\movies_processed\';
% % prefix_14 = num2str(currentDate);
% prefix_15 = 'ndl';
% prefix_10 = num2str(currentNdl);
% prefix_11 = '_hgt';
% prefix_6 = num2str(currentHight);
% prefix_7 ='_r';
% prefix_2 = num2str(currentRun);
% prefix_3 =strcat('\','ndl');
% % prefix_3 =strcat('\',num2str(currentDate),'_ndl');
% prefix_12 = num2str(currentNdl);
% prefix_13 = '_ht';
% prefix_8 =num2str(currentHight);
% prefix_9 ='_r';
% prefix_4 =num2str(currentRun);
% prefix_5= '_';

% prefix = strcat(prefix_1,prefix_15,prefix_10,prefix_11,prefix_6,...
%         prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext);

while exist(prefix,'file')==0
    ii = ii + 1;
    prefix = strcat(prefix_1,prefix_14,prefix_15,prefix_10,prefix_11,prefix_6,...
        prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext);
    prefix_img = strcat(prefix_1,prefix_14,prefix_15,prefix_10,prefix_11,prefix_6,...
        prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext_img);
end

while go_on == 'Y' || go_on == 'y'

    prefix = strcat(prefix_1,prefix_14,prefix_15,prefix_10,prefix_11,prefix_6,...
        prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext);

    disp(prefix)
    
    prefix_img = strcat(prefix_1,prefix_14,prefix_15,prefix_10,prefix_11,prefix_6,...
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

    outDir = 'C:\Users\lab-admin\Desktop\Lichen_Wu\movies_profiled\';

    filename_out = strcat(outDir,'JetVel',ext_out);
    




    fileID = fopen(prefix);
    C = textscan(fileID, '%f %f');

  
    x = C{1};
    y = 1000 - C{2};

    [heightYY,minH_index] = min(y);
    heightXX = x(minH_index);
    fprintf('img%d impXX=%d  impYY=%d\n',ii,heightXX,heightYY);
    
    yourImage = imread(prefix_img);
    imshow(yourImage);
    hold on;
    plot(x,y);
    
    if i == 0
        heightYY_old = heightYY;
        i = i+1;
%         disp(heightYY_old)
    else
        increaseHight = heightYY_old - heightYY;
        heightYY_old = heightYY;
%         disp(heightYY_old)
    end
    
%     if increaseHight>20
%         ii = ii - 1;
%         prefix = strcat(prefix_1,prefix_15,prefix_10,prefix_11,prefix_6,...
%                 prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext);
% %         fileID = fopen(prefix);
% %         C = textscan(fileID, '%f %f');
% %         x = C{1};
% %         y = 1000 - C{2};
% %         [heightYY,minH_index] = min(y);
% %         heightXX = x(minH_index);
% % 
% %         fid = fopen(filename_out,'a');
% %         fprintf(fid, '%d \t %d \t %d \t %d \t %d \t  %d \t  %d \t  %d \t  %d \t  %d \t %d \t  %d \t %8.2f\n',...
% %             [currentDate;currentNdl;currentHight;currentRun;c(1);c(2);c(3);c(4);c(5);c(6);ii;heightXX;heightYY]); %relative to flat surface
% %         fclose(fid);
%         
%         for i = 1:5
% 
%             fileID = fopen(prefix);
%             C = textscan(fileID, '%f %f');
%             x = C{1};
%             y = 1000 - C{2};
%             [heightYY,minH_index] = min(y);
%             heightXX = x(minH_index);
%             
%             fid = fopen(filename_out,'a');
%             fprintf(fid, '%d \t %d \t %d \t %d \t %d \t  %d \t  %d \t  %d \t  %d \t  %d \t %d \t  %d \t %8.2f\n',...
%                 [currentDate;currentNdl;currentHight;currentRun;c(1);c(2);c(3);c(4);c(5);c(6);ii;heightXX;heightYY]); %relative to flat surface
%             fclose(fid);
%             
%             ii = ii+1;
%             prefix = strcat(prefix_1,prefix_15,prefix_10,prefix_11,prefix_6,...
%                 prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext);
%         end
%         fprintf('%d to %d are jet growing\n', ii-5,ii-1);
%         break
%     end
%     

    if increaseHight>4
        if increaseHight>20
            ii = ii - 1;
            prefix = strcat(prefix_1,prefix_14,prefix_15,prefix_10,prefix_11,prefix_6,...
                prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext);
        end
        for i = 1:5

            fileID = fopen(prefix);
            C = textscan(fileID, '%f %f');
            x = C{1};
            y = 1000 - C{2};
            [heightYY,minH_index] = min(y);
            heightXX = x(minH_index);

            fid = fopen(filename_out,'a');
            fprintf(fid, '%d \t %d \t %d \t %d \t %d \t  %d \t  %d \t  %d \t  %d \t  %d \t %d \t  %d \t %8.2f\n',...
                [currentDate;currentNdl;currentHight;currentRun;c(1);c(2);c(3);c(4);c(5);c(6);ii;heightXX;heightYY]); %relative to flat surface
            fclose(fid);

            ii = ii+1;
            prefix = strcat(prefix_1,prefix_14,prefix_15,prefix_10,prefix_11,prefix_6,...
                prefix_7,prefix_2,prefix_3,prefix_12,prefix_13,prefix_8,prefix_9,prefix_4,prefix_5,num2str(ii, '%05g'),ext);
        end
        fprintf('%d to %d are jet growing\n', ii-5,ii-1);
        break
    end
 
%     go_on = input('Continue to process NEXT image? Y/N [Y]: ','s');
    go_on = 'y';
    if contains('y', go_on)
        go_on = 'Y';
        ii = ii+1;
    elseif contains('nN', go_on)
        break 
    end
end

disp('---------------')
diary jetVelocities