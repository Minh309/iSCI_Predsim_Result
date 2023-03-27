% ----------------------------------------------------------------------- %
% The OpenSim API is a toolkit for musculoskeletal modeling and           %
% simulation. See http://opensim.stanford.edu and the NOTICE file         %
% for more information. OpenSim is developed at Stanford University       %
% and supported by the US National Institutes of Health (U54 GM072970,    %
% R24 HD065690) and by DARPA through the Warrior Web program.             %
%                                                                         %   
% Copyright (c) 2005-2017 Stanford University and the Authors             %
% Author(s): Dan Lichtwark                                                %
%                                                                         %
% Licensed under the Apache License, Version 2.0 (the "License");         %
% you may not use this file except in compliance with the License.        %
% You may obtain a copy of the License at                                 %
% http://www.apache.org/licenses/LICENSE-2.0.                             %
%                                                                         % 
% Unless required by applicable law or agreed to in writing, software     %
% distributed under the License is distributed on an "AS IS" BASIS,       %
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or         %
% implied. See the License for the specific language governing            %
% permissions and limitations under the License.                          %
% ----------------------------------------------------------------------- %

% strengthScaler.m                                                        
% Author: Dan Lichtwark

function strengthScaler(Model_In, Model_Out)
% OSIMstrength_scaler(scaleFactor, Model_In, Model_Out)
% Test program to load muscles and change strength of muscles and re-save
% model
%
% Inputs - scaleFactor (double) - amount to scale all muscle forces
%          Model_In (string) - existing model path and file name 
%          Model_Out (string) - new model path and file name 
%
% eg. strengthScaler(2)
% eg. strengthScaler(2, 'mySimpleBlockModel.osim')
% eg. strengthScaler(2, 'mySimpleBlockModel.osim', 'myStrongerBlockModel.osim')
%
% Author: Glen Lichtwark (The University of Queensland)
% with invaluable assistance from Ayman Habib (Stanford University)
% Initial code replicating the muscleStrengthScaler.cpp file developed by
% Edith Arnold and Ajay Seth

import org.opensim.modeling.*

error(nargchk(1, 3, nargin));

%% List of muscle group needed to be scaled
    % Hip Flexors
Hip_Flexors_Left = {'add_brev_l','iliacus_l','pect_l','psoas_l','rect_fem_l','sar_l','tfl_l'};
Hip_Flexors_Right = {'add_brev_r','iliacus_r','pect_r','psoas_r','rect_fem_r','sar_r','tfl_r'};
    % Hip Extensors
Hip_Extensors_Left = {'add_mag1_l','add_mag2_l','add_mag3_l','glut_max1_l','glut_max2_l','glut_max3_l','glut_med3_l','glut_min3_l'};
Hip_Extensors_Right = {'add_mag1_r','add_mag2_r','add_mag3_r','glut_max1_r','glut_max2_r','glut_max3_r','glut_med3_r','glut_min3_r'};
    % Hip Abductors
Hip_Abductors_Left = {'glut_med1_l','glut_med2_l','glut_med3_l','glut_min1_l','glut_min2_l','peri_l'};
Hip_Abductors_Right = {'glut_med1_r','glut_med2_r','glut_med3_r','glut_min1_r','glut_min2_r','peri_r'};
    % Knee Extensors
Knee_Extensors_Left = {'vas_int_l','vas_lat_l','vas_med_l'};
Knee_Extensors_Right = {'vas_int_r','vas_lat_r','vas_med_r'};
    % Knee Flexors
Knee_Flexors_Left = {'bifemlh_l','bifemsh_l','grac_l','sar_l','semimem_l','semiten_l'};
Knee_Flexors_Right = {'bifemlh_r','bifemsh_r','grac_r','sar_r','semimem_r','semiten_r'};
    % Dorsiflexors
Dorsiflexors_Left = {'tib_ant_l'};
Dorsiflexors_Right = {'tib_ant_r'};
    % PlantarFlexors
Plantarflexors_Left = {'med_gas_l','lat_gas_l','soleus_l','tib_post_l'};
Plantarflexors_Right = {'med_gas_r','lat_gas_r','soleus_r','tib_post_r'};

%% Read the scaler
Scaler = [];
Left = readtable('SubjectStrength.xlsx','Sheet','Left');
Right = readtable('SubjectStrength.xlsx','Sheet','Right');
Scaler.Left = Left;
Scaler.Right = Right;

if nargin < 2
    [Model_In, path] = uigetfile('.osim');
    fileoutpath = [Model_In(1:end-5),'_Muscle.osim'];    
    filepath = [path Model_In];
elseif nargin < 3
    fileoutpath = [Model_In(1:end-5),'_Muscle.osim'];
    filepath = Model_In;
else
    filepath = Model_In;
    fileoutpath = Model_Out;
end

%Create the Original OpenSim model from a .osim file
Model1 = Model(filepath);
Model1.initSystem;

% Create a copy of the original OpenSim model for the Modified Model
Model2 = Model(Model1);
Model2.initSystem;

% Rename the modified Model so that it comes up with a different name in
% the GUI navigator
Model2.setName('modelModified');

% Get the set of muscles that are in the original model
Muscles1 = Model1.getMuscles(); 

%Count the muscles
nMuscles = Muscles1.getSize();

disp(['Number of muscles in orginal model: ' num2str(nMuscles)]);

% Get the set of forces that are in the scaled model
% (Should be the same as the original at this point.)
Muscles2 = Model2.getMuscles();

% loop through forces and scale muscle Fmax accordingly (index starts at 0)
for i = 0:nMuscles-1
        
    %get the muscle that the original muscle set points to
    %to read the muscle type and the max isometric force
    currentMuscle = Muscles1.get(i);
    
    %define the muscle in the modified model for changing
    newMuscle = Muscles2.get(i);

    %define the new muscle force by multiplying current muscle max
    %force by the scale factor
    
    name = string(currentMuscle);
    %% Scale the left side
    if ismember(name,Hip_Flexors_Left)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Left.Hip_Flexors/100);
    elseif ismember(name,Hip_Extensors_Left)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Left.Hip_Extensors/100);
    elseif ismember(name,Hip_Abductors_Left)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Left.Hip_Abductors/100);
    elseif ismember(name,Knee_Extensors_Left)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Left.Knee_Extensors/100);
    elseif ismember(name,Knee_Flexors_Left)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Left.Knee_Flexors/100);
    elseif ismember(name,Dorsiflexors_Left)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Left.Dorsiflexors/100);
    elseif ismember(name,Plantarflexors_Left)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Left.Plantar_Flexors/100);
    end
    %% Scale the Right Side
    if ismember(name,Hip_Flexors_Right)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Right.Hip_Flexors/100);
    elseif ismember(name,Hip_Extensors_Right)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Right.Hip_Extensors/100);
    elseif ismember(name,Hip_Abductors_Right)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Right.Hip_Abductors/100);
    elseif ismember(name,Knee_Extensors_Right)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Right.Knee_Extensors/100);
    elseif ismember(name,Knee_Flexors_Right)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Right.Knee_Flexors/100);
    elseif ismember(name,Dorsiflexors_Right)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Right.Dorsiflexors/100);
    elseif ismember(name,Plantarflexors_Right)
        newMuscle.setMaxIsometricForce(currentMuscle.getMaxIsometricForce()*Scaler.Right.Plantar_Flexors/100);
    end



end
 
% save the updated model to an OSIM xml file
Model2.print(fileoutpath)
disp(['The new model has been saved at ' fileoutpath]);

end
