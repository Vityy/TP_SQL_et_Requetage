CREATE TABLE article(
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    ref INT(11),
    designation VARCHAR(50),
    prix DECIMAL,
    id_fou INT(11)
);

CREATE TABLE fournisseur(
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE bon(
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    numero INT(15),
    date_cmde DATE,
    delai DATE,
    id_fou INT(11)
);

CREATE TABLE compo(
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    qte INT(2),
    id_art INT(11),
    id_bon INT(11)
);