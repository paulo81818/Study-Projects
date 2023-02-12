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
    
    
SELECT 
    a.Id,			
    hour,				
    AVGHourTotalIntensity,				
    MinIntensity,				
    MaxIntensity,				
    AverageSteps,				
    AverageCalories,
    GroupNum
FROM `myproject8888-357816.FitBit_data.StepsCaloriesIntensity` AS a
INNER JOIN `myproject8888-357816.FitBit_data.StepsGroupNums` AS b
    ON a.Id = b.Id 
ORDER BY a.Id, hour


SELECT 
    a.Id,				
    date,				
    Weekday,				
    TotalSleepRecords,				
    TotalHoursAsleep,				
    TotalHoursInBEd,
    GroupNum
FROM `myproject8888-357816.FitBit_data.SleepDayQuered`  AS a
INNER JOIN `myproject8888-357816.FitBit_data.StepsGroupNums` AS b
    ON a.Id = b.Id 


SELECT 
    Id,
    hour, 
    date, 
    TotalIntensity,			
    AverageIntensity,
 FROM
     (SELECT
        CAST(Id AS string) AS Id, 
        EXTRACT(DATE FROM ActivityHour) AS date,
        EXTRACT(HOUR FROM ActivityHour) AS hour,
        EXTRACT(DAYOFWEEK FROM ActivityHour) AS WeekDay,
        TotalIntensity,			
        AverageIntensity, 
        FROM
            `myproject8888-357816.FitBit_data.HourlyIntencity`)
            
            
            
        
CREATE OR REPLACE TABLE myproject8888-357816.FitBit_data.AVGHourlyIntencity
AS
SELECT *
FROM 
    `myproject8888-357816.FitBit_data.AVGHourlyIntencity` 
ORDER BY
    Id, hour ASC


SELECT
    Id, 
    EXTRACT(DATE FROM ActivityHour) AS date,
    EXTRACT(HOUR FROM ActivityHour) AS hour,
    EXTRACT(DAYOFWEEK FROM ActivityHour) AS WeekDay,
    Calories
FROM `myproject8888-357816.FitBit_data.HourlyCalories` 


CREATE TABLE IF NOT EXISTS myproject8888-357816.FitBit_data.AverageCalories
AS
SELECT
    Id, 
    hour, 
    ROUND(AVG(Calories), 2) AS AverageCalories
FROM
    (SELECT
        CAST(Id AS STRING) AS Id, 
        EXTRACT(DATE FROM ActivityHour) AS date,
        EXTRACT(HOUR FROM ActivityHour) AS hour,
        EXTRACT(DAYOFWEEK FROM ActivityHour) AS WeekDay,
        Calories
    FROM `myproject8888-357816.FitBit_data.HourlyCalories`) 
GROUP BY 
    Id, hour
ORDER BY
    Id, hour ASC
    
    
SELECT
    Id,
    SUM(AverageSteps) AS AverageDailySteps
FROM
    (SELECT
        *
        FROM
            `myproject8888-357816.FitBit_data.StepsCaloriesIntensity`)

GROUP BY Id      



CREATE TABLE IF NOT EXISTS `myproject8888-357816.FitBit_data.AvgHourSteps`
AS
SELECT
    Id, 
    hour, 
    ROUND(AVG(StepTotal), 2) AS AverageSteps
 FROM
    (SELECT
        Id, 
        EXTRACT(DATE FROM ActivityHour) AS date,
        EXTRACT(HOUR FROM ActivityHour) AS hour,
        EXTRACT(DAYOFWEEK FROM ActivityHour) AS WeekDay,
        StepTotal
    FROM `myproject8888-357816.FitBit_data.HourSteps`) 
GROUP BY 
    Id, hour
    
    

CREATE TABLE IF NOT EXISTS myproject8888-357816.FitBit_data.Group1
AS
SELECT 
    Id,			
    hour,				
    AVGHourTotalIntensity,				
    MinIntensity,			
    MaxIntensity,				
    AverageSteps,			
    AverageCalories
FROM
    `myproject8888-357816.FitBit_data.StepsCaloriesIntensityGroups`
WHERE
    GroupNum = 1
ORDER BY Id, hour



CREATE TABLE IF NOT EXISTS myproject8888-357816.FitBit_data.Group3
AS
SELECT 
    Id,			
    hour,				
    AVGHourTotalIntensity,				
    MinIntensity,			
    MaxIntensity,				
    AverageSteps,			
    AverageCalories
FROM
    `myproject8888-357816.FitBit_data.StepsCaloriesIntensityGroups`
WHERE
    GroupNum = 3
ORDER BY Id, hour



SELECT 
   Id,
   AverageDailySteps,
   CASE
      WHEN AverageDailySteps < 7500 THEN 1 
      WHEN AverageDailySteps > 10000 THEN 3 
      ELSE 2 
      END AS GroupNum
FROM `myproject8888-357816.FitBit_data.AverageDailySteps` 
ORDER BY Id



CREATE TABLE IF NOT EXISTS myproject8888-357816.FitBit_data.OverallByHour
AS
SELECT
    hour,
    ROUND(AVG(AVGHourTotalIntensity), 2) AS AverageIntensity,
    ROUND(AVG(AverageSteps), 2) AS AverageSteps,
    ROUND(AVG(AverageCalories), 2) AS AverageCalories
    FROM `myproject8888-357816.FitBit_data.StepsCaloriesIntensityGroups` 
GROUP BY hour
ORDER BY hour


CREATE TABLE IF NOT EXISTS myproject8888-357816.FitBit_data.OverallGroup1
AS
SELECT			
    hour,				
    ROUND(AVG(AVGHourTotalIntensity), 2) AS AVGhourTotalIntencity,				
    ROUND(AVG(MinIntensity), 2) AS AVGminIntensity,			
    ROUND(AVG(MaxIntensity), 2) AS AVGmaxIntensity,				
    ROUND(AVG(AverageSteps), 2) AS AVGsteps,			
    ROUND(AVG(AverageCalories), 2) AS AVGcalories   
FROM `myproject8888-357816.FitBit_data.Group1`
GROUP BY hour
ORDER BY hour



CREATE TABLE IF NOT EXISTS myproject8888-357816.FitBit_data.OverallGroup3
AS
SELECT			
    hour,				
    ROUND(AVG(AVGHourTotalIntensity), 2) AS AVGhourTotalIntencity,				
    ROUND(AVG(MinIntensity), 2) AS AVGminIntensity,			
    ROUND(AVG(MaxIntensity), 2) AS AVGmaxIntensity,				
    ROUND(AVG(AverageSteps), 2) AS AVGsteps,			
    ROUND(AVG(AverageCalories), 2) AS AVGcalories   
FROM `myproject8888-357816.FitBit_data.Group3`
GROUP BY hour
ORDER BY hour



CREATE OR REPLACE TABLE myproject8888-357816.FitBit_data.SleepGroup1BYId
AS
SELECT  
    Id,
    ROUND(AVG(TotalHoursAsleep), 2) AS AverageSleepHours,
    ROUND(AVG(TotalHoursInBEd),2 ) AS AverageHoursInBed,
    MAX(TotalHoursAsleep) AS MAXhoursAsleep,
    MIN(TotalHoursAsleep) AS MinhoursAsleep,
    MAX(TotalHoursInBEd) AS MAXhoursInBed,
    MIN(TotalHoursInBEd) AS MinhoursInBed
FROM `myproject8888-357816.FitBit_data.SleepGroup1` 
GROUP BY
    Id
    
    
    
SELECT 
    Id,
    EXTRACT(DATE FROM SleepDay) AS date,
    EXTRACT(DAYOFWEEK FROM SleepDay) AS Weekday,
    TotalSleepRecords, 
    ROUND(TotalMinutesAsleep / 60, 2) AS TotalHoursAsleep,
    ROUND(TotalTimeInBed / 60, 2) AS TotalHoursInBEd
FROM 
    `myproject8888-357816.FitBit_data.SleepDay`
    
    
    
SELECT 
    Id, 
    EXTRACT(DATE FROM ActivityHour) AS date,
    EXTRACT(HOUR FROM ActivityHour) AS hour,
    EXTRACT(DAYOFWEEK FROM ActivityHour) AS WeekDay,
    TotalIntensity,
    AverageIntensity
FROM `myproject8888-357816.FitBit_data.HourIntencies` 



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
    


CREATE TABLE IF NOT EXISTS myproject8888-357816.FitBit_data.SleepGroup1 
AS
SELECT
    *  
FROM 
    `myproject8888-357816.FitBit_data.SleepDayQueredGroups` 
WHERE 
    GroupNum = 1
ORDER BY
    Id, date 
    
    
SELECT
    Id, 
    EXTRACT(DATE FROM ActivityHour) AS date,
    EXTRACT(HOUR FROM ActivityHour) AS hour,
    EXTRACT(DAYOFWEEK FROM ActivityHour) AS WeekDay,
    StepTotal
 FROM `myproject8888-357816.FitBit_data.HourSteps`     
 
 
 
        
CREATE OR REPLACE TABLE myproject8888-357816.FitBit_data.AvgHourSteps
AS
SELECT
    CAST(Id AS STRING) AS Id,
    hour,
    AverageSteps
FROM `myproject8888-357816.FitBit_data.AvgHourSteps` 
ORDER BY 
    Id, hour ASC


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
    
    
    
    
