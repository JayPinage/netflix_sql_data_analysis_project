
create database netflix_data;

use netflix_data;

rename table netflix_data to netflix

select * from netflix limit 10;

desc netflix;

-- 1. What is the total number of 'Movies' and 'TV Shows' on Netflix?
select type ,
count(*) as total_counts 
from netflix
group by type; 


-- 2.Which country has produced the most content (Movies + TV Shows) on Netflix? List the top 5 countries.

select country ,
 count(*) as total_content
 from netflix
 group by country 
 order by total_content desc limit 5;
 
 -- 3. Retrieve a list of all movies and TV shows released in the year 2020.
 
 select title,type
 from netflix
 where release_year=2020
 limit 10;
 
 select count(*) as total_content from netflix where release_year=2020;
 
 -- 4.What are the titles of all movies directed by 'Kirsten Johnson'?
 
 select title, type
 from netflix 
 where director ='Kirsten Johnson'
 and type = 'Movie';
 
 -- 5. Which content rating is the most common on Netflix? (Count of titles by rating).
 
 select rating,
 count(*) as total_rating
 from netflix 
 group by rating
 order by total_rating desc;
 
 -- 6. Find the list of all 'TV Shows' that have 5 or more seasons.
 
 select title,duration 
 from netflix 
 where type= 'TV Show' and 
 cast(substring_index(duration," ",1)as unsigned ) >=5;
 
 select 
 count(*)as total_tvshows from netflix 
 where type= 'TV Show' and 
 cast(substring_index(duration," ",1)as unsigned ) >=5;
 
 -- 7. List all the movies produced in 'India' that belong to the 'Comedies' category.
 
 select title,listed_in 
 from netflix
 where type = 'Movie'
 and country='India'
 and listed_in like '%Comedies%';
 
 select count(*) as total_movies
 from netflix
 where type = 'Movie'
 and country='India'
 and listed_in like '%Comedies%';
 
 -- 8. How many new shows/movies were released each year? Sort the results in descending order of the release year.
 
 select count(type) as total_containt , release_year
 from netflix
 group by release_year
 order by release_year desc
 limit 10;
 
 -- 9. Who are the top 5 directors with the highest number of directed movies (excluding 'Not Given')?
 
 select director, count(*) as no_movies
 from netflix 
 where type='Movie' and director != ''
 group by director 
 order by no_movies desc limit 5;
 
 -- 10. In which year did Netflix add the highest amount of content to its platform?
 
 select right(date_added ,4)as year_released, count(*) as higest_no_of_content
 from netflix 
 group by right(date_added ,4)
 order by higest_no_of_content
 desc limit 1;
 
 -- 11. Which are the 5 oldest movies released in India on Netflix?
 
 
 select title, release_year 
 from netflix
 where type = 'Movie' and Country = 'India'
 order by release_year
 asc limit 5;
 
 
 -- 12. Find the titles of all movies listed as 'Documentaries' that were released after the year 2015.
 
 select title,release_year 
 from netflix
 where type='Movie' and listed_in like '%Documentaries%'
 and release_year >= 2015;

 -- 13. Which movie has the longest duration in minutes on Netflix?
 
 select title , cast(substring_index(duration,' ',1)as unsigned) as duration_minutes
 from netflix
 where type = 'Movie'
 order by  duration_minutes desc limit 1; 
 
 -- 14. What is the most recently released movie for each country?
 
-- 15. Identify the release years in which more than 50 movies from India were released.
 
 select release_year, count(*) as no_of_movies
 from netflix where type = 'Movie' 
 and Country = 'India'
 group by release_year
 having no_of_movies > 50
 order by no_of_movies desc;