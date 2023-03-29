function RMSE = plot_ik(RMSE,Subject_IK,result_path,Side,idx_start,idx_end)
    %% Prepare IK data from subject
    [hip_flexion, hip_adduction, hip_rotation, knee_flexion, ankle_dorsiflexion] = prepare_ik_data_subject(Subject_IK,Side,idx_start,idx_end);
    
     %% Prepare IK data from Scaled model
        % 50 mesh points
    [hip_flexion_50, hip_adduction_50, hip_rotation_50, knee_flexion_50, ankle_dorsiflexion_50] = prepare_ik_data(result_path,Side,'Scaled','N50');
        % 100 mesh points
    [hip_flexion_100, hip_adduction_100, hip_rotation_100, knee_flexion_100, ankle_dorsiflexion_100] = prepare_ik_data(result_path,Side,'Scaled','N100');

    
    %% Prepare IK data from Muscle Strength Scale
        % 50 mesh points
    [hip_flexion_muscle50, hip_adduction_muscle50, hip_rotation_muscle50, knee_flexion_muscle50, ankle_dorsiflexion_muscle50] = prepare_ik_data(result_path,Side,'StrengthScaled','N50');
        % 100 mesh points
    [hip_flexion_muscle100, hip_adduction_muscle100, hip_rotation_muscle100, knee_flexion_muscle100, ankle_dorsiflexion_muscle100] = prepare_ik_data(result_path,Side,'StrengthScaled','N100');

     %% Prepare IK data from Muscle Strength Scale EMG
        % 50 mesh points
    [hip_flexion_muscle_emg50, hip_adduction_muscle_emg50, hip_rotation_muscle_emg50,  knee_flexion_muscle_emg50, ankle_dorsiflexion_muscle_emg50] = prepare_ik_data(result_path,Side,'StrengthScaled_EMG','N50');
        % 100 mesh points
    [hip_flexion_muscle_emg100, hip_adduction_muscle_emg100, hip_rotation_muscle_emg100, knee_flexion_muscle_emg100, ankle_dorsiflexion_muscle_emg100] = prepare_ik_data(result_path,Side,'StrengthScaled_EMG','N100');
     
             
    %% Calculate RMSE
    RMSE.(Side).scaled50.hip_flexion =  sqrt(mean((hip_flexion - hip_flexion_50).^2));
    RMSE.(Side).scaled50.hip_adduction =  sqrt(mean((hip_adduction - hip_adduction_50).^2));
    RMSE.(Side).scaled50.hip_rotation =  sqrt(mean((hip_rotation - hip_rotation_50).^2));
    RMSE.(Side).scaled50.knee_flexion =  sqrt(mean((knee_flexion - knee_flexion_50).^2));
    RMSE.(Side).scaled50.ankle_dorsiflexion =  sqrt(mean((ankle_dorsiflexion - ankle_dorsiflexion_50).^2));
    RMSE.(Side).scaled50.total = mean([RMSE.(Side).scaled50.hip_flexion,RMSE.(Side).scaled50.hip_rotation, RMSE.(Side).scaled50.hip_adduction,RMSE.(Side).scaled50.knee_flexion,RMSE.(Side).scaled50.ankle_dorsiflexion]);

    RMSE.(Side).scaled100.hip_flexion =  sqrt(mean((hip_flexion - hip_flexion_100).^2));
    RMSE.(Side).scaled100.hip_adduction =  sqrt(mean((hip_adduction - hip_adduction_100).^2));
    RMSE.(Side).scaled100.hip_rotation =  sqrt(mean((hip_rotation - hip_rotation_100).^2));
    RMSE.(Side).scaled100.knee_flexion =  sqrt(mean((knee_flexion - knee_flexion_100).^2));
    RMSE.(Side).scaled100.ankle_dorsiflexion =  sqrt(mean((ankle_dorsiflexion - ankle_dorsiflexion_100).^2));
    RMSE.(Side).scaled100.total = mean([RMSE.(Side).scaled100.hip_flexion,RMSE.(Side).scaled100.hip_rotation, RMSE.(Side).scaled100.hip_adduction,RMSE.(Side).scaled100.knee_flexion,RMSE.(Side).scaled100.ankle_dorsiflexion]);


    RMSE.(Side).muscle50.hip_flexion =  sqrt(mean((hip_flexion - hip_flexion_muscle50).^2));
    RMSE.(Side).muscle50.hip_adduction =  sqrt(mean((hip_adduction - hip_adduction_muscle50).^2));
    RMSE.(Side).muscle50.hip_rotation =  sqrt(mean((hip_rotation - hip_rotation_muscle50).^2));
    RMSE.(Side).muscle50.knee_flexion =  sqrt(mean((knee_flexion - knee_flexion_muscle50).^2));
    RMSE.(Side).muscle50.ankle_dorsiflexion =  sqrt(mean((ankle_dorsiflexion - ankle_dorsiflexion_muscle50).^2));
    RMSE.(Side).muscle50.total = mean([RMSE.(Side).muscle50.hip_flexion,RMSE.(Side).muscle50.hip_rotation, RMSE.(Side).muscle50.hip_adduction,RMSE.(Side).muscle50.knee_flexion,RMSE.(Side).muscle50.ankle_dorsiflexion]);

    RMSE.(Side).muscle100.hip_flexion =  sqrt(mean((hip_flexion - hip_flexion_muscle100).^2));
    RMSE.(Side).muscle100.hip_adduction =  sqrt(mean((hip_adduction - hip_adduction_muscle100).^2));
    RMSE.(Side).muscle100.hip_rotation =  sqrt(mean((hip_rotation - hip_rotation_muscle100).^2));
    RMSE.(Side).muscle100.knee_flexion =  sqrt(mean((knee_flexion - knee_flexion_muscle100).^2));
    RMSE.(Side).muscle100.ankle_dorsiflexion =  sqrt(mean((ankle_dorsiflexion - ankle_dorsiflexion_muscle100).^2));
    RMSE.(Side).muscle100.total = mean([RMSE.(Side).muscle100.hip_flexion,RMSE.(Side).muscle100.hip_rotation, RMSE.(Side).muscle100.hip_adduction,RMSE.(Side).muscle100.knee_flexion,RMSE.(Side).muscle100.ankle_dorsiflexion]);

    RMSE.(Side).muscle_emg50.hip_flexion =  sqrt(mean((hip_flexion - hip_flexion_muscle_emg50).^2));
    RMSE.(Side).muscle_emg50.hip_adduction =  sqrt(mean((hip_adduction - hip_adduction_muscle_emg50).^2));
    RMSE.(Side).muscle_emg50.hip_rotation =  sqrt(mean((hip_rotation - hip_rotation_muscle_emg50).^2));
    RMSE.(Side).muscle_emg50.knee_flexion =  sqrt(mean((knee_flexion - knee_flexion_muscle_emg50).^2));
    RMSE.(Side).muscle_emg50.ankle_dorsiflexion =  sqrt(mean((ankle_dorsiflexion - ankle_dorsiflexion_muscle_emg50).^2)); 
    RMSE.(Side).muscle_emg50.total = mean([RMSE.(Side).muscle_emg50.hip_flexion,RMSE.(Side).muscle_emg50.hip_rotation, RMSE.(Side).muscle_emg50.hip_adduction,RMSE.(Side).muscle_emg50.knee_flexion,RMSE.(Side).muscle_emg50.ankle_dorsiflexion]);

    RMSE.(Side).muscle_emg100.hip_flexion =  sqrt(mean((hip_flexion - hip_flexion_muscle_emg100).^2));
    RMSE.(Side).muscle_emg100.hip_adduction =  sqrt(mean((hip_adduction - hip_adduction_muscle_emg100).^2));
    RMSE.(Side).muscle_emg100.hip_rotation =  sqrt(mean((hip_rotation - hip_rotation_muscle_emg100).^2));
    RMSE.(Side).muscle_emg100.knee_flexion =  sqrt(mean((knee_flexion - knee_flexion_muscle_emg100).^2));
    RMSE.(Side).muscle_emg100.ankle_dorsiflexion =  sqrt(mean((ankle_dorsiflexion - ankle_dorsiflexion_muscle_emg100).^2)); 
    RMSE.(Side).muscle_emg100.total = mean([RMSE.(Side).muscle_emg100.hip_flexion,RMSE.(Side).muscle_emg100.hip_rotation, RMSE.(Side).muscle_emg100.hip_adduction,RMSE.(Side).muscle_emg100.knee_flexion,RMSE.(Side).muscle_emg100.ankle_dorsiflexion]);

    
    %% Plot IK data
    Labels = {
          'Hip Ab/Adduction' [0 100 -30 30] 'Abd      deg      Add';
          'Hip Flexion/Extension' [0 100 -30 60] 'Ext      deg      Flex';
          'Knee Flexion/Extension' [0 100 -15 80] 'Ext      deg      Flex';
          'Ankle Dorsi/Plantar' [0 100 -50 30] 'Plan      deg      Dors';
          'Hip Rotation' [0 100 -30 40] 'Ext      deg      Int'};

    x_axis = 1:100; %Set x-axis
    color1 = '#384CF5';
    color3 = '#5AA82C';
    color2 = '#A8441D';
    
    LineThick = 3;
    f = figure;
    f.Position = [100 100 1000 800];

    t= tiledlayout(3,3,'TileSpacing','compact');
    nexttile
    plot(x_axis,hip_flexion,'color','black','LineWidth',LineThick + 1);
    hold on
%     plot(x_axis,hip_flexion_muscle50,'color',color1,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,hip_flexion_100,'color',color1,'LineWidth',LineThick,'LineStyle','-');
    plot(x_axis,hip_flexion_muscle100,'color',color3,'LineWidth',LineThick,'LineStyle','-');
%     plot(x_axis,hip_flexion_muscle_emg50,'color',color2,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,hip_flexion_muscle_emg100,'color',color2,'LineWidth',LineThick,'LineStyle','-');
    axis([Labels{2,2}])
%     axis('square')
    title(Labels{2,1})
    xlabel('% GC')
    ylabel(Labels{2,3})
    grid on

    nexttile
    plot(x_axis,hip_adduction,'color','black','LineWidth',LineThick + 1);
    hold on
%     plot(x_axis,hip_adduction_muscle50,'color',color1,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,hip_adduction_100,'color',color1,'LineWidth',LineThick,'LineStyle','-');
    plot(x_axis,hip_adduction_muscle100,'color',color3,'LineWidth',LineThick,'LineStyle','-');
%     plot(x_axis,hip_adduction_muscle_emg50,'color',color2,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,hip_adduction_muscle_emg100,'color',color2,'LineWidth',LineThick,'LineStyle','-');
    axis([Labels{1,2}])
%     axis('square')
    title(Labels{1,1})
    xlabel('% GC')
    ylabel(Labels{1,3})
    grid on

    nexttile
    plot(x_axis,hip_rotation,'color','black','LineWidth',LineThick + 1);
    hold on
%     plot(x_axis,hip_rotation_muscle50,'color',color1,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,hip_rotation_100,'color',color1,'LineWidth',LineThick,'LineStyle','-');
    plot(x_axis,hip_rotation_muscle100,'color',color3,'LineWidth',LineThick,'LineStyle','-');
%     plot(x_axis,hip_rotation_muscle_emg50,'color',color2,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,hip_rotation_muscle_emg100,'color',color2,'LineWidth',LineThick,'LineStyle','-');
    axis([Labels{5,2}])
%     axis('square')
    title(Labels{5,1})
    xlabel('% GC')
    ylabel(Labels{5,3})
    grid on

    nexttile
    plot(x_axis,-knee_flexion,'color','black','LineWidth',LineThick+1);
    hold on
%     plot(x_axis,-knee_flexion_muscle50,'color',color1,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,-knee_flexion_100,'color',color1,'LineWidth',LineThick,'LineStyle','-');
    plot(x_axis,-knee_flexion_muscle100,'color',color3,'LineWidth',LineThick,'LineStyle','-');
%     plot(x_axis,-knee_flexion_muscle_emg50,'color',color2,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,-knee_flexion_muscle_emg100,'color',color2,'LineWidth',LineThick,'LineStyle','-');
    axis([Labels{3,2}])
%     axis('square')
    title(Labels{3,1})
    xlabel('% GC')
    ylabel(Labels{3,3})
    grid on

    nexttile
    plot(x_axis,ankle_dorsiflexion,'color','black','LineWidth',LineThick+1);
    hold on
%     plot(x_axis,ankle_dorsiflexion_muscle50,'color',color1,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,ankle_dorsiflexion_100,'color',color1,'LineWidth',LineThick,'LineStyle','-');
    plot(x_axis,ankle_dorsiflexion_muscle100,'color',color3,'LineWidth',LineThick,'LineStyle','-');
%     plot(x_axis,ankle_dorsiflexion_muscle_emg50,'color',color2,'LineWidth',LineThick,'LineStyle',':');
    plot(x_axis,ankle_dorsiflexion_muscle_emg100,'color',color2,'LineWidth',LineThick,'LineStyle','-');
%     plot(x_axis,ankle_dorsiflexion_emg_muscle50,'color',color3,'LineWidth',LineThick,'LineStyle',':');
%     plot(x_axis,ankle_dorsiflexion_emg_muscle100,'color',color3,'LineWidth',LineThick,'LineStyle','-');
    axis([Labels{4,2}])
%     axis('square')
    title(Labels{4,1})
    xlabel('% GC')
    ylabel(Labels{4,3})
    grid on

%     legend('ID','M50','M100','ME50','ME100','EM50','EM100');
    legend('ID','S100','SM100','SME100');
    lgd = legend;
    lgd.Layout.Tile = 6;
    lgd.FontSize = 14;
    title(t,strcat('Kinematics - ', Side), 'FontSize',20);
    set(gcf,'color','w');
    exportgraphics(gcf,strcat('Kinematics - ', Side,'.png'),'Resolution',300);
end