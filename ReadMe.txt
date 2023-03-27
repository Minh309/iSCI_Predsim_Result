This is a repository for asymetrical predictive simulation on an individual with incomplete spinal cord injury. 
Here are the structure of the folders in this repository:

************************ Data ************************ 
- Data -- EMG --- Left  --- EMG_gaitl.mot
	 |      |       
       |      --- Right --- EMG_gaitr.mot
	 |
       -- ID  --- Left  --- ID_gait_L2.sto
	 |      | 
       |      --- Right --- ID_gait_R2.sto
	 |
       -- IK  --- Left  --- RSS15_IK_L.mot
	 |      |
       |      --- Right --- RSS15_IK_R.mot
	 |
       -- Strength Measurements  --- Muscle Strength Measurement.xlsx


************************ Model ************************ 
- Model -- Scaled --- Hamner_modified_RSS15_Scaled.osim
	 |
        -- StrengthScaled --- Hamner_modified_RSS15_Scaled_Muscle.osim
	 |
        -- StrengthScaled_EMG --- Hamner_modified_RSS15_Scaled_Muscle_R_L.osim
	 |
        -- EMG_StrengthScaled --- Hamner_modified_RSS15_Scaled_R_L_Muscle.osim

************************ Muscle Strength Scaler ************************ 
- Muscle Strength Scale -- SubjectStrength.xlsx
	 			|
       			-- strengthScaler.m 

************************ Results ************************ 
- Results -- EMG-Driven Parameter Estimation  --- EMG_StrengthScaled ---- Results_RSS15_MRS_Muscle_Right
	    | 				          |			        |
	    |						    |				   ---- Results_RSS15_MRS_Muscle_Left
	    |						    |
	    |						    --- StrengthScaled_EMG ---- Results_RSS15_Muscle_MRS_Right
	    |									        |
	    |										   ---- Results_RSS15_Muscle_MRS_Left
	    -- Predictive Simulation            --- StrengthScaled     ---- Left ----- N50
							    |				   |         |
							    |				   |         ----- N100			
							    |                      | 
							    |                      ---- Right----- N50
							    |				             |
							    |				             ----- N100			
							    |				   
							    --- StrengthScaled_EMG ---- Left ----- N50
							    |				   |         |
							    |				   |         ----- N100			
							    |                      | 
							    |                      ---- Right----- N50
							    |				             |
							    |				             ----- N100			
							    --- EMG_StrengthScaled ---- Left ----- N50
							    				   |         |
							    				   |         ----- N100			
							                           | 
							                           ---- Right----- N50
							    				             |
							    				             ----- N100			
							    					   