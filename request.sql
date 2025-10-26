SELECT *
FROM client
-- WHERE client.ville='Nantes' or client.ville='Montpellier'
WHERE client.ville IN('Nantes', 'Montpellier');
WHERE client.age BETWEEN 25 && 35;



-- ALIAS --

SELECT c.ville
FROM client as


-- JOINTURE --

SELECT *
FROM article
    JOIN fournisseur ON article.id_fou = fournisseur.id
WHERE !(article.prix > 2 AND article.prix < 6.25)
    AND fournisseur.nom like 'Française d''imports'
ORDER BY article.prix DESC;