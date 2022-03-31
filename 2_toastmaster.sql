SELECT 
    event_name Event_Name
FROM
    event
WHERE
    LOWER(event_name) LIKE ('%toastmaster%');
    
 /*This query finds all events that include the word Toastmaster.*/   
 
SELECT 
    event_name Event_Name, city City
FROM
    city
        JOIN
    grp ON city.city_id = grp.city_id
        JOIN
    event ON grp.group_id = event.group_id
WHERE
    LOWER(event_name) LIKE ('%toastmaster%');
    
/*This query displays all events with Toastmaster and their corresponding cities.*/

SELECT 
    city City, COUNT(event_id) Num_of_events
FROM
    city
        JOIN
    grp ON city.city_id = grp.city_id
        JOIN
    event ON grp.group_id = event.group_id
WHERE
    LOWER(event_name) LIKE ('%toastmaster%')
GROUP BY city
ORDER BY COUNT(event_id) DESC;

/*This query shows the amount of events in each city hosted through Toastmaster.*/
