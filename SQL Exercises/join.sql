SELECT 
    a.Id,
    a.hour,
    AVGHourTotalIntensity,
    MinIntensity,
    MaxIntensity, 
    AverageSteps,
    AverageCalories
FROM `myproject8888-357816.FitBit_data.AVGHourlyIntencity` AS a 
INNER JOIN 
    `myproject8888-357816.FitBit_data.AvgHourSteps`  AS b
    ON a.hour = b.hour AND a.Id = b.Id
INNER JOIN 
    `myproject8888-357816.FitBit_data.AverageCalories` AS c 
    ON a.hour = c.hour AND a.Id = c.Id
