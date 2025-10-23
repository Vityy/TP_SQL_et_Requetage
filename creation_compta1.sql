CREATE TABLE article(
	id INT PRIMARY KEY,
    ref INT,
    designation TEXT,
    prix DECIMAL,
    id_fou INT
);

CREATE TABLE fournisseur(
    id INT PRIMARY KEY,
    nom TEXT
);

CREATE TABLE bon(
	id INT PRIMARY KEY,
    numero INT,
    date_cmde DATE,
    delai DECIMAL,
    id_fou INT
);

CREATE TABLE compo(
	id INT PRIMARY KEY,
    qte INT,
    id_art INT,
    id_bon INT
);