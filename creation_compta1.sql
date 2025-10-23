-------------------------
-- CREATION DES TABLES --
-------------------------

CREATE TABLE article(
	id INT(11) PRIMARY KEY,
    ref VARCHAR(13) UNIQUE NOT NULL,
    designation VARCHAR(255) UNIQUE,
    prix DECIMAL(7, 2) NOT NULL,
    id_fou INT(11)
);

CREATE TABLE fournisseur(
    id INT(11) PRIMARY KEY,
    nom VARCHAR(25) NOT NULL
);

CREATE TABLE bon(
	id INT(11) PRIMARY KEY,
    numero INT(11) NOT NULL,
    date_cmde DATETIME DEFAULT CURRENT_TIMESTAMP,
    delai int(11),
    id_fou INT(11)
);

CREATE TABLE compo(
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    qte INT(4) NOT NULL,
    id_art INT(11),
    id_bon INT(11)
);

--------------------------
-- AJOUT DE CONTRAINTES --
--------------------------

ALTER TABLE article ADD CONSTRAINT FOREIGN KEY (id_fou) REFERENCES fournisseur(id);
ALTER TABLE bon     ADD CONSTRAINT FOREIGN KEY (id_fou) REFERENCES fournisseur(id);
ALTER TABLE compo   ADD CONSTRAINT FOREIGN KEY (id_art) REFERENCES article(id);
ALTER TABLE compo   ADD CONSTRAINT FOREIGN KEY (id_bon) REFERENCES bon(id);

---------------
-- INSERTION --
---------------

-- INSERT TO fournisseur VALUES (1, 'Robin & Co');
-- INSERT TO fournisseur(id, nom) VALUES (1, 'Robin & Co');
-- INSERT TO fournisseur(nom, id) VALUES ('Robin & Co', 1);