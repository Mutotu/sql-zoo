-- SELECT BASICS
--1
SELECT population FROM world
  WHERE name = 'Germany';

--2)
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway',  'Denmark');

--3)
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;
--Select Quiz C, E, E, C, C, C, C






--Select From World

--1)
SELECT name, continent, population FROM world;

--2
SELECT name FROM world
WHERE population > 200000000;

--3)
SELECT name, gdp/population FROM world
WHERE population > 200000000;

--4)
SELECT name, population/1000000  from world where continent = 'South America';

--5)
select name, population from world where name = 'France' OR name = 'Germany' OR name = 'Italy';

--6)
SELECT name from world where name LIKE '%United%';

--7
select name, population, area from world where area > 3000000 or population > 250000000;

--8 
select name, population, area from world where ((population > 250000000) OR (area > 3000000)) 
       AND NOT ((population > 250000000) AND (area > 3000000));

--9 
select name , round(population/1000000, 2), round(gdp/1000000000, 2) from world where continent = 'South America';

--10 
select name, round(gdp/population/1000) * 1000 from world where gdp > 1000000000000;

--11
SELECT name,  capital
  FROM world
 WHERE length(name) = length(capital);

 --12
 SELECT name, capital from world
where LEFT(name, 1) = LEFT(capital, 1) XOR name = capital

--13
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';

--Select From quiz E, D, B, D, B, D, C

--Select nobel
--1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

--2
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

--3
Select yr, subject from nobel where winner ='Albert Einstein';

--4
select winner from nobel where yr > 1999 and subject='Peace';

--5
select yr, subject, winner FROM nobel
where subject = 'Literature' and yr between 1980 and 1989;

--6

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');;

--7
select winner from nobel where winner Like 'John%';

--8
SELECT yr, subject, winner FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR
subject = 'Chemistry' AND yr = 1984;

--9
select yr, subject, winner from nobel where yr = 1980 and not subject='Chemistry' and not subject='Medicine';

--10

select * from nobel
where yr < 1910 and subject = 'Medicine' or
yr >= 2004 and subject = 'Literature';

--11
select * from nobel where winner = 'PETER GRÜNBERG';

--12
select * from nobel where winner = 'EUGENE O''NEILL';

--13
select winner, yr, subject from nobel where winner like 'Sir%';

--14
SELECT winner, subject 
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner;

 --Nobel QUIZ E,C,B,C,C,C,D

 --JOIN OPeration 
 --1


SELECT matchid, player FROM goal

--2
SELECT id,stadium,team1,team2
  FROM game
where id = 1012;

--3
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

--4
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';


--5
SELECT player, teamid, coach, gtime
  FROM goal join eteam ON teamid=id
 WHERE gtime<=10;


 --6
 select mdate,teamname from game join eteam on team1=eteam.id
where coach  = 'Fernando Santos'
 

 --7

 select player from game join goal on id=matchid where stadium = 'National Stadium, Warsaw';

--8

select distinct player
  from game join goal on matchid = id
    where (team1='GER' or team2='GER') and   goal.teamid <> 'GER';


--9

SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
 group BY teamname;

 --10
 select stadium, count(player) from game join goal on id=matchid
group by stadium;

--11
SELECT matchid,mdate,count(matchid)
FROM game JOIN goal ON id=matchid
where team1= 'POL' or team2='POL'
group by matchid, mdate;

--12
select matchid,mdate,count(teamid)
from game join goal on matchid=id
where (teamid='GER' )
group by matchid, mdate

--13
-----
SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
 team2,sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game left JOIN goal ON matchid = id
group by mdate, team1, team2
order by mdate,matchid,team1,team2
---Join quiz D,C,A,A,B,C,B
