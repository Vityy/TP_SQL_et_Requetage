-- Exo a --

SELECT *
FROM article
ORDER BY designation;

-- Exo b --

SELECT *
FROM article
ORDER BY prix DESC;

-- Exo c --

SELECT *
FROM article
WHERE designation LIKE '%boulon%'
ORDER BY prix;

-- Exo d --

SELECT *
FROM article
WHERE designation LIKE '%sachet%';

-- Exo e --

SELECT *
FROM article
WHERE LOWER(designation) LIKE '%sachet%';

-- Exo f --

SELECT *
FROM article, fournisseur
WHERE article.id_fou = fournisseur.id
ORDER BY fournisseur.nom ASC, article.prix DESC;

-- Exo g --

SELECT *
FROM article, fournisseur
WHERE article.id_fou = fournisseur.id && fournisseur.nom = 'Dubois & Fils';

-- Exo h --

SELECT AVG(prix)
FROM article, fournisseur
WHERE article.id_fou = fournisseur.id && fournisseur.nom = 'Dubois & Fils';

-- Exo i --

SELECT fournisseur.nom, AVG(prix)
FROM article, fournisseur
WHERE article.id_fou = fournisseur.id
GROUP BY fournisseur.nom;

-- Exo j --

SELECT * 
FROM bon 
WHERE date_cmde BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

-- Exo k --

SELECT DISTINCT bon.numero 
FROM bon, compo, article 
WHERE bon.id = compo.id_bon && compo.id_art = article.id && LOWER(designation) like '%boulon%';

-- Exo l --

SELECT DISTINCT bon.numero, fournisseur.nom 
FROM bon, compo, article, fournisseur 
WHERE bon.id = compo.id_bon && bon.id_fou = fournisseur.id && compo.id_art = article.id && LOWER(designation) like '%boulon%';

-- Exo m --

SELECT id_bon, SUM(qte * prix) 
FROM bon, compo, article 
WHERE bon.id = compo.id_bon && compo.id_art = article.id
GROUP BY id_bon;

-- Exo n --

SELECT id_bon, SUM(qte)
FROM bon, compo, article 
WHERE bon.id = compo.id_bon && compo.id_art = article.id
GROUP BY id_bon;

-- Exo o --

SELECT id_bon, SUM(qte)
FROM bon, compo, article 
WHERE bon.id = compo.id_bon && compo.id_art = article.id
GROUP BY id_bon 
HAVING SUM(qte)>25;

-- Exo p --

SELECT SUM(qte * prix) 
FROM bon, compo, article 
WHERE bon.id = compo.id_bon && compo.id_art = article.id
AND MONTH(date_cmde) = 4;





-- Exo a difficile --

SELECT * 
FROM article a, article b
WHERE a.designation = b.designation && a.id_fou != b.id_fou;

-- Exo b difficile --

SELECT YEAR(date_cmde), MONTH(date_cmde), SUM(qte*prix) 
FROM bon, compo, article 
WHERE bon.id = compo.id_bon && compo.id_art = article.id
GROUP BY YEAR(date_cmde), MONTH(date_cmde);

-- Exo c difficile --

SELECT * FROM bon b
WHERE NOT EXISTS (
    SELECT id_bon FROM compo WHERE id_bon = b.id
);

-- Exo d difficile --

SELECT bon.id_fou, AVG(virtual_table.cout) 
FROM bon, (
    SELECT bon.id, SUM(qte * prix) AS cout
    FROM bon, compo, article 
    WHERE bon.id = compo.id_bon and compo.id_art = article.id
    GROUP BY bon.id) AS virtual_table 
WHERE BON.id= virtual_table.id
GROUP BY BON.id_fou;