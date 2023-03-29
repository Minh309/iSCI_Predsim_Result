function [hip_flexion, hip_adduction, hip_rotation, knee_flexion, ankle_dorsiflexion] = prepare_ik_data(result_path,Side,Model,MeshPoint)
    import org.opensim.modeling.*

    filepath = fullfile(result_path,'\Predictive Simulation\',Model,'\',Side,'\',MeshPoint,'\motion.mot');
    opensimTable = TimeSeriesTable(filepath);
    IK = osimTableToStruct(opensimTable);
    
    if strcmp(Side,'Left')
        hip_flexion = IK.hip_flexion_l;   
        hip_adduction = IK.hip_adduction_l;
        hip_rotation = IK.hip_rotation_l;
        knee_flexion = IK.knee_angle_l;
        ankle_dorsiflexion = IK.ankle_angle_l;
    else
        hip_flexion = IK.hip_flexion_r; 
        hip_adduction = IK.hip_adduction_r;
        hip_rotation = IK.hip_rotation_r;
        knee_flexion = IK.knee_angle_r;
        ankle_dorsiflexion = IK.ankle_angle_r;
    end

    % Spline fit
    x = linspace(0,100,size(IK.time,1));
    xx = linspace(0,100,100);
    
    hip_flexion = spline(x,hip_flexion,xx);
    hip_adduction = spline(x,hip_adduction,xx);
    hip_rotation = spline(x,hip_rotation,xx);
    knee_flexion = spline(x,knee_flexion,xx);
    ankle_dorsiflexion = spline(x,ankle_dorsiflexion,xx); 
end