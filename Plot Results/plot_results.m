% This code is to plot the kinematics between the subject's inverse
% kinematics and the models' generated motions 
import org.opensim.modeling.*      % Import OpenSim Libraries
% Define gait cycle for left and right
Time_left = [6.34 7.46];
Time_right = [6 7.14];


% Load Result path 
path = pwd;
[parentFolder, thisFolder] = fileparts(path);
data_path = fullfile(parentFolder,'\Data\');
result_path = fullfile(parentFolder,'\Results\');

% Get IK left
filepath = fullfile(data_path,'\IK\Left\RSS15_IK_L.mot');
opensimTable = TimeSeriesTable(filepath);
IK_left = osimTableToStruct(opensimTable);

% Get IK right
filepath = fullfile(data_path,'\IK\Right\RSS15_IK_R.mot');
opensimTable = TimeSeriesTable(filepath);
IK_right = osimTableToStruct(opensimTable);

% Find the index pointing the first heel strike and the next heel strike to
% define a full gait cycle
    % Left gait cycle
idx_start_L = find(IK_left.time == Time_left(1));
idx_end_L = find(IK_left.time == Time_left(2));
    
    %Right gait cycle
idx_start_R = find(IK_right.time == Time_right(1));
idx_end_R = find(IK_right.time == Time_right(2));

% Plot kinematics data for left cycle
% Plot_IK()
% Plot kinematics data for right cycle
rmse = [];
rmse = plot_ik(rmse,IK_left,result_path,'Left',idx_start_L,idx_end_L);
rmse = plot_ik(rmse,IK_right,result_path,'Right',idx_start_R,idx_end_R);

% Write RMSE
filename = 'RMSE.mat';
save(filename,'rmse');