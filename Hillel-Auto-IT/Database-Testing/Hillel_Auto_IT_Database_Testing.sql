-- =====================================================
-- BASIC QUERIES AND FILTERING
-- =====================================================

-- Task 1: Sort Users by Name
SELECT name, lastName
FROM user_profiles
ORDER BY name ASC;

-- Task 3: Find Users by Currency and Distance Units
SELECT *
FROM user_settings
WHERE currency = 'gbp'
    AND distanceUnits = 'ml';

-- Task 4: Filter Cars by Brand and Initial Mileage
SELECT id, userId
FROM cars
WHERE carBrandId IN (1, 2, 3)
    AND initialMileage >= 100
ORDER BY id DESC;

-- Task 5: Get Unique Cars and Mileage
SELECT DISTINCT id, mileage
FROM cars;

-- Task 6: Find Users by Name Pattern
SELECT name
FROM user_profiles
WHERE name LIKE '_a%'
  AND name LIKE '%y_';

-- Task 7: Find Cars Added in 2022
SELECT *
FROM cars
WHERE YEAR(carCreatedAt) = 2022;

-- Task 9: Find Users by Last Name Pattern
SELECT *
FROM user_profiles
WHERE lastName LIKE '_a%e%';

-- Task 10: Find Expenses by Mileage and Liters
SELECT carId
FROM expenses
WHERE mileage > 100
  AND liters > 50;

-- Task 11: Find Users by Name Length and Date of Birth
SELECT *
FROM user_profiles
WHERE LENGTH(name) > 5
  AND dateBirth IS NOT NULL
ORDER BY name ASC;

-- Task 12: Find Users by Name Pattern
SELECT *
FROM user_profiles
WHERE name LIKE '%\%%';

-- Task 30: Find Users by Name Length and Characters
SELECT name
FROM user_profiles
WHERE LENGTH(name) > 4
    AND name NOT LIKE '%e%'
    AND name LIKE '%c%';
    
    
-- =====================================================
-- AGGREGATE FUNCTIONS
-- =====================================================

-- Task 15: Count Users by Currency and Distance Units
SELECT COUNT(*) AS usersCount
FROM user_settings
WHERE currency IN ('usd', 'eur')
  AND distanceUnits = 'km';

-- Task 16: Calculate Average Car Mileage
SELECT AVG(mileage) AS averageMileage
FROM cars;

-- Task 17: Find Maximum Car Mileage
SELECT MAX(mileage) AS maxMileage
FROM cars;


-- =====================================================
-- JOIN QUERIES
-- =====================================================

-- Task 2: Get Instructions for BMW and Ford
SELECT instructions.*
FROM instructions
JOIN car_brands
    ON instructions.carBrandId = car_brands.id
WHERE car_brands.title IN ('BMW', 'Ford');

-- Task 8: Find Cars with Mileage Lower than Initial Mileage
SELECT users.*
FROM users
JOIN cars
    ON users.id = cars.userId
WHERE cars.mileage < cars.initialMileage;

-- Task 20: Get Users and Their Car Models
SELECT user_profiles.name, car_models.title AS carModel
FROM user_profiles
JOIN cars
    ON user_profiles.userId = cars.userId
JOIN car_models
    ON cars.carModelId = car_models.id;
    
-- Task 21: Get Users and Their Car Brands
SELECT user_profiles.name, 
       car_brands.title AS carBrand 
FROM user_profiles 
JOIN cars 
    ON user_profiles.userId = cars.userId
JOIN car_brands 
    ON cars.carBrandId = car_brands.id;

-- Task 22: Get User Profile and Currency Information
SELECT users.email,
       user_profiles.name,
       user_profiles.lastName,
       user_settings.currency
FROM users
JOIN user_profiles
    ON users.id = user_profiles.userId
JOIN user_settings
    ON users.id = user_settings.userId;
    
-- Task 23: Find Cars Added in 2022 with Zero Mileage
SELECT user_profiles.name,
       car_brands.title AS carBrand
FROM user_profiles
JOIN cars
    ON user_profiles.userId = cars.userId
JOIN car_brands
    ON cars.carBrandId = car_brands.id
WHERE YEAR(cars.createdAt) = 2022
    AND cars.mileage = 0;
    
    
-- =====================================================
-- GROUPING AND AGGREGATION
-- =====================================================

-- Task 13: Count Instructions by Car Brand
SELECT carBrandId, COUNT(*) AS instructionsCount
FROM instructions
WHERE description NOT LIKE '%Audi%'
GROUP BY carBrandId;

-- Task 14: Find Car Brands with More than 3000 Models
SELECT carBrandId
FROM car_models
GROUP BY carBrandId
HAVING COUNT(*) > 3000;

-- Task 18: Count Cars per User
SELECT users.id, users.email, COUNT(cars.id) AS carsCount
FROM users
JOIN cars
    ON users.id = cars.userId
GROUP BY users.id, users.email
ORDER BY carsCount DESC;

-- Task 19: Calculate Average Mileage for Audi Users
SELECT cars.userId, AVG(cars.mileage) AS averageMileage
FROM cars
JOIN car_brands
    ON cars.carBrandId = car_brands.id
WHERE car_brands.title = 'Audi'
GROUP BY cars.userId
HAVING COUNT(cars.id) > 2
   AND AVG(cars.mileage) BETWEEN 1000 AND 10000
ORDER BY averageMileage ASC;

-- Task 24: Count Cars by Distance Units
SELECT user_settings.distanceUnits,
       COUNT(cars.id) AS carsCount
FROM cars
JOIN user_settings
    ON cars.userId = user_settings.userId
WHERE user_settings.distanceUnits IN ('km', 'ml')
GROUP BY user_settings.distanceUnits;

-- Task 29: Count Cars by Brand Based on Mileage
SELECT car_brands.title AS brand,
       COUNT(cars.id) AS carsCount
FROM cars
JOIN car_brands
    ON cars.carBrandId = car_brands.id
GROUP BY car_brands.id, car_brands.title
HAVING AVG(cars.initialMileage) > MIN(cars.mileage) * 10;


-- =====================================================
-- SUBQUERIES
-- =====================================================

-- Task 25: Find Users with the Longest Name
SELECT name
FROM user_profiles
WHERE LENGTH(name) = (
    SELECT MAX(LENGTH(name))
    FROM user_profiles
);

-- Task 26: Find Cars with Total Expenses Above Average
SELECT car_brands.title AS brand,
       car_models.title AS model,
       SUM(expenses.totalCost) AS totalCost
FROM cars
JOIN car_brands
    ON cars.carBrandId = car_brands.id
JOIN car_models
    ON cars.carModelId = car_models.id
JOIN expenses
    ON cars.id = expenses.carId
GROUP BY cars.id, car_brands.title, car_models.title
HAVING SUM(expenses.totalCost) >= (
    SELECT AVG(totalCost)
    FROM expenses
);

-- Task 27: Find Users with Expenses Above 500
SELECT DISTINCT userId
FROM cars
WHERE id IN (
    SELECT carId
    FROM expenses
    WHERE totalCost > 500
);


-- Task 28: Filter Users and Car Models Using a Subquery
SELECT userId, carModelId
FROM cars
WHERE carModelId BETWEEN 1 AND 5
  AND id IN (
      SELECT carId
      FROM expenses
      WHERE mileage BETWEEN 100 AND 2000
        AND liters > 50
  );