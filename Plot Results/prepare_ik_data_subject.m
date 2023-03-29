function [hip_flexion, hip_adduction, hip_rotation, knee_flexion, ankle_dorsiflexion] = prepare_ik_data_subject(IK,Side,idx_start,idx_end)

    % Find the sampling frequency
    f = 100;
    if strcmp(Side,'Left')
        % Linear envelope (6Hz lowpass)
        LP = 6;
        NyqFreq = f/2;
        Wp = LP/NyqFreq;
        [F,E] = butter (4,Wp,'low');

        hip_flexion = IK.hip_flexion_l;
        hip_flexion = filtfilt(F,E,hip_flexion);
        hip_flexion = hip_flexion(idx_start:idx_end);
        
        hip_adduction = IK.hip_adduction_l;
        hip_adduction = filtfilt(F,E,hip_adduction);
        hip_adduction = hip_adduction(idx_start:idx_end);

        hip_rotation = IK.hip_rotation_l;
        hip_rotation = filtfilt(F,E,hip_rotation);
        hip_rotation = hip_rotation(idx_start:idx_end);      

        knee_flexion = IK.knee_angle_l;
        knee_flexion = filtfilt(F,E,knee_flexion);
        knee_flexion = knee_flexion(idx_start:idx_end);

        ankle_dorsiflexion = IK.ankle_angle_l;
        ankle_dorsiflexion = filtfilt(F,E,ankle_dorsiflexion);
        ankle_dorsiflexion = ankle_dorsiflexion(idx_start:idx_end);
    else
        LP = 6;
        NyqFreq = f/2;
        Wp = LP/NyqFreq;
        [F,E] = butter (4,Wp,'low');

        hip_flexion = IK.hip_flexion_r;
        hip_flexion = filtfilt(F,E,hip_flexion);
        hip_flexion = hip_flexion(idx_start:idx_end);
        
        hip_adduction = IK.hip_adduction_r;
        hip_adduction = filtfilt(F,E,hip_adduction);
        hip_adduction = hip_adduction(idx_start:idx_end);
        
        hip_rotation = IK.hip_rotation_r;
        hip_rotation = filtfilt(F,E,hip_rotation);
        hip_rotation = hip_rotation(idx_start:idx_end);    

        knee_flexion = IK.knee_angle_r;
        knee_flexion = filtfilt(F,E,knee_flexion);
        knee_flexion = knee_flexion(idx_start:idx_end);

        ankle_dorsiflexion = IK.ankle_angle_r;
        ankle_dorsiflexion = filtfilt(F,E,ankle_dorsiflexion);
        ankle_dorsiflexion = ankle_dorsiflexion(idx_start:idx_end);
    end

    % Spline fit
    x = linspace(0,100,size(IK.time(idx_start:idx_end),1));
    xx = linspace(0,100,100);
    
    hip_flexion = spline(x,hip_flexion,xx);
    hip_adduction = spline(x,hip_adduction,xx);
    hip_rotation = spline(x,hip_rotation,xx);
    knee_flexion = spline(x,knee_flexion,xx);
    ankle_dorsiflexion = spline(x,ankle_dorsiflexion,xx); 
end