CREATE database charanait;
use charanait;

-- Hospital Performance Comparison with Statewide Average:
SELECT Hospital,`Hospital Observed Adverse Events Rate (%)`,`Statewide Adverse Events Rate (%)`, 
       CASE 
           WHEN `Hospital Observed Adverse Events Rate (%)`>`Statewide Adverse Events Rate (%)` THEN 'Above Average' 
           WHEN `Hospital Observed Adverse Events Rate (%)`<`Statewide Adverse Events Rate (%)` THEN 'Below Average' 
           ELSE 'Equal to Average' 
       END AS Performance_Comparison FROM california LIMIT 10;



-- Percentage of Hospitals with Adverse Events Rate Above Statewide Average by County:
SELECT County, 
       COUNT(*) AS Total_Hospitals, 
       COUNT(CASE WHEN `Hospital Observed Adverse Events Rate (%)` > `Statewide Adverse Events Rate (%)` THEN 1 END) AS Hospitals_Above_Average,
       (COUNT(CASE WHEN `Hospital Observed Adverse Events Rate (%)` > `Statewide Adverse Events Rate (%)` THEN 1 END) * 100.0 / COUNT(*)) AS Percentage_Above_Average
FROM california GROUP BY County LIMIT 10;



-- Percentage of Total CABG Cases Reported by County:
SELECT County, 
       SUM(`Total Hospital CABG Cases`) AS Total_CABG_Cases,
       (SUM(`Total Hospital CABG Cases`) * 100.0 / (SELECT SUM(`Total Hospital CABG Cases`) FROM california)) AS Percentage_Total_CABG_Cases
FROM california GROUP BY County LIMIT 10;









