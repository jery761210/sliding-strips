store sliding strips degradation path data and Remaining Useful Lifetime calculation MATLAB code
The folder MATLAB_pcode_DREAM_PACKAGE_V2.0 needs to be extracted before it can be used.
The main.m file provides a calculation example. Since this program utilizes a package developed by others, you need to manually input the commands.
The modelSelect.m file is responsible for model selection, while posterior1.m performs parameter inference. The posterior.m file handles parameter inference without prior information, and the prior.m file calculates the sample space of prior distribution parameters.
The data.mat file contains data for all 20 vehicles, stored in line6_allVehicle according to vehicle ID and position. The testData.mat file contains 20 samples used for testing.
