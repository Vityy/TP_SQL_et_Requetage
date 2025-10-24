SELECT *
FROM client
-- WHERE client.ville='Nantes' or client.ville='Montpellier'
WHERE client.ville IN('Nantes', 'Montpellier');
WHERE client.age BETWEEN 25 && 35;