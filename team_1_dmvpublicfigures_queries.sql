USE dmvpublicfigures;

/*Satisfies requirement A, requirement B, requirement C, requirement D*/
DROP VIEW IF EXISTS person_occupation;
CREATE VIEW person_occupation AS 
SELECT CONCAT(fname,' ', lname) AS name, start_year, occupation_title
FROM person
JOIN person_career USING(person_id)
JOIN occupation USING(occupation_id)
WHERE AGE <= 74;
SELECT * FROM person_occupation;

/*Satisfies Requirement A, requirement B, requirement C*/
DROP VIEW IF EXISTS social_media_count;
CREATE VIEW social_media_count AS 
SELECT CONCAT(fname, ' ', lname) AS name, age, state, handle, follower_count, ROUND(AVG(follower_count),0) AS average_follower_count
FROM person
JOIN social_media USING(person_id)
JOIN info USING(person_id)
WHERE follower_count IS NOT NULL
GROUP BY follower_count WITH ROLLUP;
SELECT * FROM social_media_count;

/*Satisfies requirement A, requirement B, requirement C*/
DROP VIEW IF EXISTS occupation_count;
CREATE VIEW occupation_count AS
SELECT CONCAT(fname, ' ', lname) AS name, state, school, COUNT(occupation_title) AS number_of_occupations
FROM person 
JOIN info i USING(person_id)
JOIN person_career USING(person_id)
JOIN occupation USING(occupation_id)
JOIN school s on i.school_id = s.school_id
GROUP BY name;
SELECT * FROM occupation_count;

/*Satisfies requirement A, Requirement B, requirement C*/
DROP VIEW IF EXISTS state_born;
CREATE VIEW state_born AS
SELECT state, MAX(state_count) AS total_state_count
FROM info
JOIN (
SELECT state, COUNT(person_id) AS state_count
FROM info 
GROUP BY state
) AS count_table USING (state) 
GROUP BY state;
SELECT * FROM state_born;


/*Satisfies requirement B, requirement D, requirement E*/
DROP VIEW IF EXISTS occupation_type;
CREATE VIEW occupation_type AS
SELECT CONCAT(fname, ' ', lname) AS name, age, occupation_title
FROM person 
JOIN person_career USING(person_id)
JOIN occupation USING(occupation_id)
WHERE occupation_id IN (
SELECT occupation_id
FROM occupation
WHERE occupation_title = 'Television'
);
SELECT * FROM occupation_type;






