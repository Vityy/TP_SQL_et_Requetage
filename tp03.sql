-- Exo a

SELECT *
FROM article

-- Exo b

SELECT ref, designation
FROM article
WHERE prix > 2;

-- Exo c

SELECT *
FROM article
WHERE prix >= 2 && article.prix <= 6.25;

-- Exo d

SELECT *
FROM article
WHERE prix BETWEEN 2 AND 6.25;

-- Exo e

SELECT *
FROM article
WHERE (article.prix < 2 || article.prix > 6.25) AND article.id_fou = 1
ORDER BY prix DESC;

-- Exo f

SELECT *
FROM article
WHERE id_fou = 1 || article.id_fou = 3;

-- Exo g

SELECT *
FROM article
WHERE id_fou IN(1, 3);

-- Exo h

SELECT *
FROM article
WHERE id_fou NOT IN(1, 3);

-- Exo i

SELECT *
FROM bon
WHERE date_cmde BETWEEN '2019/02/01' AND '2019/04/30';

