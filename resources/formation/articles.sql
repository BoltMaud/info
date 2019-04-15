CREATE TABLE conference (
    code varchar(100),
    nomComplet varchar(200),
    primary key (code)
);

CREATE TABLE article(
    id number(5),
    nom varchar(100),
    conference varchar(100),
    annee number(4),
    lu NUMBER(1,0),
    primary key (id),
    foreign key (conference) references conference
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
    foreign key (idAu) references auteur,
    foreign key (idAr) references article, 
    primary key (idAu, idAr)
);

INSERT INTO TABLE conference VALUES('ICDM','International Conference on Data Mining'); 
INSERT INTO TABLE conference VALUES('AAA', 'Association for the Advancement of Artificial Intelligence'); 
INSERT INTO TABLE conference VALUES('ICML', 'International Conference on Machine Learning' ); 
INSERT INTO TABLE conference VALUES('ICPM','International Conference on Process Mining,'); 

INSERT INTO TABLE article VALUES(1,'Mining Uncertain Event Data in Process Mining ','ICPM',2019,0); 
INSERT INTO TABLE article VALUES(2,'From data mining to knowledge discovery in databases','AAA', 1996,0); 
INSERT INTO TABLE article VALUES(3,'Robust partially observable Markov decision process','AAA', 2015,0); 
INSERT INTO TABLE article VALUES(4,'Visualization of Salient Subsequences in Time Series','ICDM', 2016,1); 
INSERT INTO TABLE article VALUES(4,'Mining Graphlet Counts in Online Social Networks','ICDM', 2016,1); 


INSERT INTO TABLE auteur VALUES(1,'Xiaowei Chen', NULL);
INSERT INTO TABLE auteur VALUES(2,'John C. S. Lui', NULL);
INSERT INTO TABLE auteur VALUES(3,'Chin-Chia Michael Yeh', NULL);
INSERT INTO TABLE auteur VALUES(4,'Helga Van Herle', NULL);
INSERT INTO TABLE auteur VALUES(5,'Eamonn Keogh',NULL);
INSERT INTO TABLE auteur VALUES(6,'T Osogami',NULL);
INSERT INTO TABLE auteur VALUES(7,'U Fayyad',NULL);
INSERT INTO TABLE auteur VALUES(8,'G Piatetsky-Shapiro',NULL);
INSERT INTO TABLE auteur VALUES(9,'P Smyth',NULL);
INSERT INTO TABLE auteur VALUES(10,'Marco Pegoraro',NULL);
INSERT INTO TABLE auteur VALUES(11,'Wil van der Aalst',NULL);

INSERT INTO TABLE auteur_article VALUES(1,11);
INSERT INTO TABLE auteur_article VALUES(1,10);
INSERT INTO TABLE auteur_article VALUES(2,9);
INSERT INTO TABLE auteur_article VALUES(2,8);
INSERT INTO TABLE auteur_article VALUES(2,7);
INSERT INTO TABLE auteur_article VALUES(3,6);
INSERT INTO TABLE auteur_article VALUES(2,5);
INSERT INTO TABLE auteur_article VALUES(2,4);
INSERT INTO TABLE auteur_article VALUES(1,3);
INSERT INTO TABLE auteur_article VALUES(1,2);
INSERT INTO TABLE auteur_article VALUES(1,1);







