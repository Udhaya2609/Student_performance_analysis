#create database
create database studentperformance_db;
use studentperformance_db;

#data clean dup check;
SELECT gender, `race/ethnicity`, `math score`, COUNT(*)
FROM studentperformance_db.`student performance`
GROUP BY gender, `race/ethnicity`, `math score`
HAVING COUNT(*) > 1;

#performance by gender;
SELECT gender, 
       AVG(`math score`) AS Avg_Math, 
       AVG(`reading score`) AS Avg_Reading, 
       AVG(`writing score`) AS Avg_Writing
FROM studentperformance_db.`student performance`
GROUP BY gender;

#top performer;
SELECT * FROM studentperformance_db.`student performance`
ORDER BY (`math score` + `reading score` + `writing score`) DESC
LIMIT 5;

#total count of student
SELECT COUNT(*) AS total_students
FROM `student performance`;

#display 1000 records
SELECT * FROM studentperformance_db.`student performance`;

#Score Statistics (Avg, Max, Min)
SELECT
    ROUND(AVG(`math score`), 2)    AS avg_math,
    MAX(`math score`)              AS max_math,
    MIN(`math score`)              AS min_math,
    ROUND(AVG(`reading score`), 2) AS avg_reading,
    MAX(`reading score`)           AS max_reading,
    MIN(`reading score`)           AS min_reading,
    ROUND(AVG(`writing score`), 2) AS avg_writing,
    MAX(`writing score`)           AS max_writing,
    MIN(`writing score`)           AS min_writing
FROM `student performance`;


