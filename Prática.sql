--QUESTÃO 1
SELECT COUNT("endDate") AS "currentExperiences" 
FROM experiences

--QUESTÃO 2
SELECT educations."userId" AS id, COUNT(id) AS educations
FROM educations
GROUP BY educations."userId"

--QUESTÃO 3
SELECT users.name AS writer, COUNT(testimonials.id) AS "testimonialCount" 
FROM testimonials
JOIN users
ON testimonials."writerId" = users.id
WHERE testimonials."writerId" = 435
GROUP BY users.name

--QUESTÃO 4
SELECT MAX(j.salary) AS "maximumSalary", r.name AS role
FROM jobs j
JOIN roles r
ON j."roleId" = r.id
WHERE j.active = true
GROUP BY role
ORDER BY "maximumSalary" ASC

--BONUS
SELECT s.name AS school, c.name AS course, COUNT(e.id) AS "studentsCount" 
FROM educations e
JOIN schools s ON e."schoolId" = s.id
JOIN courses c ON e."courseId" = c.id
WHERE e.status = 'ongoing' OR e.status='finished'
GROUP BY school, course
ORDER BY "studentsCount" DESC
LIMIT 3