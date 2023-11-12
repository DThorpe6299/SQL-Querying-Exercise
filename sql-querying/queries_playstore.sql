-- Comments in SQL Start with dash-dash --
--Find the app with an ID of 1880.--
SELECT id, app_name FROM analytics WHERE id = 1880;

--Find the ID and app name for all apps that were last updated on August 01, 2018.--
SELECT id, app_name, last_updated FROM analytics WHERE last_updated IN('2018-08-01');

--Count the number of apps in each category, e.g. “Family | 1972”.--
SELECT category, COUNT(app_name) FROM analytics GROUP BY category;

--Find the top 5 most-reviewed apps and the number of reviews for each.--
SELECT app_name, COUNT(reviews) AS review_count FROM analytics GROUP BY app_name ORDER BY review_count DESC LIMIT 5;

--Find the app that has the most reviews with a rating greater than equal to 4.8.--
SELECT app_name, MAX(reviews) AS max_reviews FROM analytics GROUP BY app_name ORDER BY max_reviews DESC LIMIT 1;

--Find the average rating for each category ordered by the highest rated to lowest rated.--
SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;

--Find the name, price, and rating of the most expensive app with a rating that’s less than 3.--
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

--Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.--
SELECT app_name, min_installs, rating FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

--Find the names of all apps that are rated less than 3 with at least 10000 reviews.--
app_name, rating, SUM(reviews) FROM analytics WHERE rating < 3 GROUP BY app_name, rating HAVING SUM(reviews) >= 10000;

--Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.--
SELECT app_name, MAX(reviews), price FROM analytics WHERE price BETWEEN 0.10 AND 1.00 GROUP BY app_name, price ORDER BY MAX(reviews) DESC LIMIT 10;

--Find the most out of date app.--
SELECT app_name, MIN(last_updated) FROM analytics GROUP BY app_name ORDER BY MIN(last_updated) LIMIT 1;

--Find the most expensive app --
SELECT app_name, MAX(price) FROM analytics GROUP BY app_name ORDER BY MAX(price) DESC LIMIT 1;

--Count all the reviews in the Google Play Store.--
SELECT COUNT(reviews) FROM analytics;

--Find all the categories that have more than 300 apps in them.--
SELECT category, COUNT(app_name) FROM analytics GROUP BY category HAVING COUNT(app_name) > 300;

--Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.--
SELECT app_name, COUNT(reviews), min_installs, min_installs/COUNT(reviews) AS ratio FROM analytics WHERE min_installs >= 100000 GROUP BY app_name, min_installs ORDER BY ratio DESC LIMIT 1;