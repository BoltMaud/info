CREATE TABLE conference (
    code varchar(100),
    nomComplet varchar(200),
    primary key (code)
);

CREATE TABLE article(
    id integer(5),
    nom varchar(100),
    conference varchar(100),
    annee integer(4),
    lu boolean,
    primary key (id),
    foreign key (conference) references conference(code)
);

CREATE TABLE auteur(
    id number(5),
    nom varchar(120),
    mail varchar(200),
    primary key (id)
);

CREATE TABLE auteur_article(
    idAu number(5),
    idAr number(5),
    foreign key (idAu) references auteur(id),
    foreign key (idAr) references article(id),
    primary key (idAu, idAr)
);

INSERT INTO conference VALUES('ICDM','International Conference on Data Mining');
INSERT INTO conference VALUES('AAA', 'Association for the Advancement of Artificial Intelligence');
INSERT INTO conference VALUES('ICML', 'International Conference on Machine Learning' );
INSERT INTO conference VALUES('ICPM','International Conference on Process Mining,');

INSERT INTO article VALUES(1,'Mining Uncertain Event Data in Process Mining ','ICPM',2019,0);
INSERT INTO article VALUES(2,'From data mining to knowledge discovery in databases','AAA', 1996,0);
INSERT INTO article VALUES(3,'Robust partially observable Markov decision process','AAA', 2015,0);
INSERT INTO article VALUES(4,'Visualization of Salient Subsequences in Time Series','ICDM', 2016,1);
INSERT INTO article VALUES(4,'Mining Graphlet Counts in Online Social Networks','ICDM', 2016,1);


INSERT INTO auteur VALUES(1,'Xiaowei Chen', NULL);
INSERT INTO auteur VALUES(2,'John C. S. Lui', NULL);
INSERT INTO auteur VALUES(3,'Chin-Chia Michael Yeh', NULL);
INSERT INTO auteur VALUES(4,'Helga Van Herle', NULL);
INSERT INTO auteur VALUES(5,'Eamonn Keogh',NULL);
INSERT INTO auteur VALUES(6,'T Osogami',NULL);
INSERT INTO auteur VALUES(7,'U Fayyad',NULL);
INSERT INTO auteur VALUES(8,'G Piatetsky-Shapiro',NULL);
INSERT INTO auteur VALUES(9,'P Smyth',NULL);
INSERT INTO auteur VALUES(10,'Marco Pegoraro',NULL);
INSERT INTO auteur VALUES(11,'Wil van der Aalst',NULL);

INSERT INTO auteur_article VALUES(1,11);
INSERT INTO auteur_article VALUES(1,10);
INSERT INTO auteur_article VALUES(2,9);
INSERT INTO auteur_article VALUES(2,8);
INSERT INTO auteur_article VALUES(2,7);
INSERT INTO auteur_article VALUES(3,6);
INSERT INTO auteur_article VALUES(2,5);
INSERT INTO auteur_article VALUES(2,4);
INSERT INTO auteur_article VALUES(1,3);
INSERT INTO auteur_article VALUES(1,2);
INSERT INTO auteur_article VALUES(1,1);







