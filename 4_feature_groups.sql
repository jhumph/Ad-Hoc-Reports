SELECT 
    CASE
        WHEN rating >= 1 AND rating <= 1.99 THEN '1-1.99'
        WHEN rating >= 2 AND rating <= 2.99 THEN '2-2.99'
        WHEN rating >= 3 AND rating <= 3.99 THEN '3-3.99'
        WHEN rating >= 4 AND rating <= 4.99 THEN '4-4.99'
        WHEN rating = 5 THEN '5.00'
        ELSE 'No rating'
    END Group_rating,
    COUNT(group_id) Number_of_Groups
FROM
    grp
GROUP BY Group_rating
ORDER BY Group_rating;

/*This query finds the number of groups within each of the rating ranges from 1 to 5. It also shows the number of groups with no rating.*/

SELECT 
    group_name Group_name, members Members
FROM
    grp
WHERE
    rating = 5
ORDER BY members DESC;

/*This query shows the number of members for each group with a 5.00 rating. It will serve as way to see which groups have the most members out of this subset.*/

SELECT 
    group_name Group_name,
    members Members,
    city City,
    category_name Category
FROM
    grp
        JOIN
    city ON grp.city_id = city.city_id
        JOIN
    category ON grp.category_id = category.category_id
WHERE
    rating = 5
ORDER BY members DESC;

/*This query shows not only the number of members for each group rated 5.00, but also the city and category that the group belongs to.*/

SELECT 
    category_name Category, COUNT(group_id) Number_of_groups
FROM
    category
        JOIN
    grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(group_id) DESC;

/*This additional query gives an idea of which categories are the most popular by how many groups are categorized within them.*/

