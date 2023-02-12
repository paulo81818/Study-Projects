CREATE TABLE IF NOT EXISTS `myproject8888-357816.FitBit_data.AVGHourlyIntencity`
AS
SELECT 
    Id,
    hour,
    AVG(TotalIntensity) AS AVGHourTotalIntensity,
    MIN(TotalIntensity) AS MinIntensity,
    MAX(TotalIntensity) AS MaxIntensity 
FROM 
    (SELECT
    CAST(Id AS string) AS ID, 
    EXTRACT(DATE FROM ActivityHour) AS date,
    EXTRACT(HOUR FROM ActivityHour) AS hour,
    EXTRACT(DAYOFWEEK FROM ActivityHour) AS WeekDay,
    TotalIntensity,			
    AverageIntensity, 
    FROM `myproject8888-357816.FitBit_data.HourlyIntencity`) 
GROUP BY 
    ID, hour
