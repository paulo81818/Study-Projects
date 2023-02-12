SELECT
    station_id,
    name,
    number_of_rides AS number_of_rides_starting_at_station
FROM
    (SELECT
        start_station_id,
        COUNT(*) number_of_rides
        FROM
            bigquery-public-data.new_york.citibike_trips
            GROUP BY
                start_station_id)
    AS station_num_trips
    INNER JOIN
        bigquery-public-data.new_york.citibike_stations ON station_id = start_station_id
    ORDER BY 
        number_of_rides DESC
        
        
   SELECT 
    EXTRACT(YEAR FROM STARTTIME) AS year,
    COUNT(*) AS number_of_rides
FROM 
    `bigquery-public-data.new_york_citibike.citibike_trips` 
GROUP BY
    year
ORDER BY
    year DESC
    
    
    
SELECT  
    Date,
    Region,
    Total_Bags,
    Small_bags,
    (Small_Bags / Total_Bags)*100 AS Small_Bags_Percent  
FROM `myproject8888-357816.avocado_data.avocado_price` 
WHERE
    Total_Bags != 0 
    
    
    
SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    ProductId,
    ROUND(MAX(UnitPrice), 2) AS UnitPrice,
    SUM(Quantity) AS UnitSold
FROM 
    `myproject8888-357816.sales.sales_info` 
GROUP BY 
   Year,
   Month,
   ProductId
ORDER BY  
   Year,
   Month,
   ProductId;
   
   
SELECT 
    COUNT(*) AS null_values, 
    EXTRACT(YEAR FROM Date) AS Year
FROM 
    `myproject8888-357816.Bitcoin_price.Bitcoin`
WHERE 
    Change__ = 0
GROUP BY
  Year
ORDER BY
    Year DESC
