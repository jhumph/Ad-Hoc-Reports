SELECT 
    YEAR(MIN(joined)) year_joined
FROM
    grp_member
GROUP BY member_id;

/*This is a subquery that finds the year of the earliest join date of each member. This is put in place as a proxy for when they joined the site.*/

SELECT 
    Year_joined, COUNT(year_joined) Number_of_joins
FROM
    (SELECT 
        YEAR(MIN(joined)) Year_joined
    FROM
        grp_member
    GROUP BY member_id) min_join
GROUP BY Year_joined
ORDER BY Year_joined;

/*Using the subquery, this query finds the number of new members for each year by their first join of a group. It serves as a proxy for when they joined the site. */

SET SQL_SAFE_UPDATES = 0;

/*This is not a query, but a SQL command that allows for the tables in the database to be updated. It must be set to 0 before any updates can be performed.*/

UPDATE grp_member 
SET 
    city = 'Chicago'
WHERE
    LOWER(city) IN ('east chicago' , 'west chicago',
        'north chicago',
        'chicago heights',
        'chicago ridge',
        'chicago');
UPDATE grp_member 
SET 
    city = 'San Francisco'
WHERE
    LOWER(city) IN ('san francisco' , 'south san francisco');
UPDATE grp_member 
SET 
    city = 'New York'
WHERE
    LOWER(city) IN ('new york' , 'west new york');

/*The above queries rename all cities in the grp_member table to the appropriate larger urban areas of New York, San Francisco, and Chicago.*/

SET SQL_SAFE_UPDATES = 1;

/*This command puts the update safe feature back into place. No more updates can be done after this point unless it is set back to 0.*/

SELECT 
    Year_joined, COUNT(year_joined) Number_of_joins
FROM
    (SELECT 
        YEAR(MIN(joined)) Year_joined
    FROM
        grp_member
    WHERE
        city = 'Chicago'
    GROUP BY member_id) min_join
GROUP BY Year_joined
ORDER BY Year_joined;

/* This query finds the number of new members each year for only the city of Chicago.*/

SELECT 
    Year_joined, COUNT(year_joined) Number_of_joins
FROM
    (SELECT 
        YEAR(MIN(joined)) Year_joined
    FROM
        grp_member
    WHERE
        city = 'San Francisco'
    GROUP BY member_id) min_join
GROUP BY Year_joined
ORDER BY Year_joined;

/*This query finds the number of new members each year for only the city of San Francisco.*/

SELECT 
    Year_joined, COUNT(year_joined) Number_of_joins
FROM
    (SELECT 
        YEAR(MIN(joined)) Year_joined
    FROM
        grp_member
    WHERE
        city = 'New York'
    GROUP BY member_id) min_join
GROUP BY Year_joined
ORDER BY Year_joined;

/*This query finds the number of new members each year for only the city of New York.*/

SELECT 
    Month_joined, COUNT(month_joined) Number_of_joins
FROM
    (SELECT 
        MONTH(MIN(joined)) Month_joined
    FROM
        grp_member
    WHERE
        YEAR(joined) = 2017
    GROUP BY member_id) mmin_join
GROUP BY Month_joined
ORDER BY Month_joined;

/*This query finds the number of new members for the year of 2017. It breaks down the results by month.*/
