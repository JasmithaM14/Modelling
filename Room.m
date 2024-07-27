% Create a new fuzzy inference system
fis = mamfis('Name', 'LivingRoomControl');

% Define input variables
fis = addInput(fis, [0 40], 'Name', 'Temperature');
fis = addInput(fis, [0 1000], 'Name', 'LightLevel');
fis = addInput(fis, [0 100], 'Name', 'Humidity');
fis = addInput(fis, [0 24], 'Name', 'TimeOfDay');
fis = addInput(fis, [0 1], 'Name', 'Motion');

% Define output variables
fis = addOutput(fis, [0 100], 'Name', 'FanSpeed');
fis = addOutput(fis, [0 100], 'Name', 'LightIntensity');
fis = addOutput(fis, [0 100], 'Name', 'HeaterLevel');

% Define membership functions for Temperature
fis = addMF(fis, 'Temperature', 'trimf', [0 0 20], 'Name', 'Low');
fis = addMF(fis, 'Temperature', 'trimf', [10 20 30], 'Name', 'Medium');
fis = addMF(fis, 'Temperature', 'trimf', [20 40 40], 'Name', 'High');

% Define membership functions for LightLevel
fis = addMF(fis, 'LightLevel', 'trimf', [0 0 500], 'Name', 'Dark');
fis = addMF(fis, 'LightLevel', 'trimf', [200 500 800], 'Name', 'Dim');
fis = addMF(fis, 'LightLevel', 'trimf', [500 1000 1000], 'Name', 'Bright');

% Define membership functions for Humidity
fis = addMF(fis, 'Humidity', 'trimf', [0 0 50], 'Name', 'Low');
fis = addMF(fis, 'Humidity', 'trimf', [25 50 75], 'Name', 'Medium');
fis = addMF(fis, 'Humidity', 'trimf', [50 100 100], 'Name', 'High');

% Define membership functions for TimeOfDay
fis = addMF(fis, 'TimeOfDay', 'trimf', [0 0 12], 'Name', 'Morning');
fis = addMF(fis, 'TimeOfDay', 'trimf', [6 12 18], 'Name', 'Afternoon');
fis = addMF(fis, 'TimeOfDay', 'trimf', [12 24 24], 'Name', 'Evening');

% Define membership functions for Motion
fis = addMF(fis, 'Motion', 'trimf', [0 0 0.5], 'Name', 'NoMotion');
fis = addMF(fis, 'Motion', 'trimf', [0 1 1], 'Name', 'MotionDetected');

% Define membership functions for FanSpeed
fis = addMF(fis, 'FanSpeed', 'trimf', [0 0 50], 'Name', 'Low');
fis = addMF(fis, 'FanSpeed', 'trimf', [25 50 75], 'Name', 'Medium');
fis = addMF(fis, 'FanSpeed', 'trimf', [50 100 100], 'Name', 'High');

% Define membership functions for LightIntensity
fis = addMF(fis, 'LightIntensity', 'trimf', [0 0 50], 'Name', 'Low');
fis = addMF(fis, 'LightIntensity', 'trimf', [25 50 75], 'Name', 'Medium');
fis = addMF(fis, 'LightIntensity', 'trimf', [50 100 100], 'Name', 'High');

% Define membership functions for HeaterLevel
fis = addMF(fis, 'HeaterLevel', 'trimf', [0 0 50], 'Name', 'Low');
fis = addMF(fis, 'HeaterLevel', 'trimf', [25 50 75], 'Name', 'Medium');
fis = addMF(fis, 'HeaterLevel', 'trimf', [50 100 100], 'Name', 'High');

% Define rules
ruleList = [
    "Temperature==High & Humidity==Low => FanSpeed=High"
    "Temperature==Medium & Humidity==Medium => FanSpeed=Medium"
    "Temperature==Low & Humidity==High => FanSpeed=Low"
    "LightLevel==Dark & TimeOfDay==Morning => LightIntensity=High"
    "LightLevel==Dim & TimeOfDay==Afternoon => LightIntensity=Medium"
    "LightLevel==Bright & TimeOfDay==Evening => LightIntensity=Low"
    "Temperature==Low & Motion==NoMotion => HeaterLevel=High"
    "Temperature==Medium & Motion==MotionDetected => HeaterLevel=Medium"
    "Temperature==High & Motion==MotionDetected => HeaterLevel=Low"
];

% Add rules to FIS
for i = 1:length(ruleList)
    fis = addRule(fis, ruleList(i));
end

% Save FIS to a file
writeFIS(fis, 'LivingRoomControl');

% Load FIS from the file (for testing purpose)
fis = readFIS('LivingRoomControl');
