DROP TABLE INDIVIDU;
DROP TABLE ANIMAL;
DROP TABLE MENAGE;
DROP TABLE PIECE;

-- CREATION DES TABLES
CREATE TABLE PIECE(IdP integer PRIMARY KEY, surface integer, etage integer);
CREATE TABLE INDIVIDU(IdI number(5) PRIMARY KEY, prenom varchar(100), chambre integer, age integer, foreign key (chambre) references PIECE);
CREATE TABLE MENAGE( dateM DATE ,typeM varchar(15) ,IdP integer , iDI integer , CONSTRAINT Pk_menage PRIMARY KEY (dateM,typeM, idP), foreign key (idI) references INDIVIDU, foreign key (idP) references PIECE);
CREATE TABLE ANIMAL(nom varchar(100) PRIMARY KEY, type varchar(100), poids integer, idI integer, foreign key (idI) references INDIVIDU );

-- il y a 4 pièces numérotées : 2-3-4-5
INSERT INTO PIECE VALUES(4,22,3);
INSERT INTO PIECE VALUES(3,16,3);
INSERT INTO PIECE VALUES(2,10,2);
INSERT INTO PIECE VALUES(5,12,2);

-- Léo habite chambre 4 et a 19 ans
INSERT INTO INDIVIDU VALUES(1,'Léo', 4, 19);
-- Léa habite chambre 2 et a 18 ans
INSERT INTO INDIVIDU VALUES(2,'Léa', 3, 18);
-- Amine habite chambre 5 et a 22 ans
INSERT INTO INDIVIDU VALUES(3,'Amine', 5,22);

-- Léo a lavé une fois la pièce 4 et deux fois la pièce 2 dont une fois après le 13-03-2019
INSERT INTO MENAGE VALUES(to_date('12-03-2019','DD-MM-YYYY'), 'laver le sol', 2, 1 );
INSERT INTO MENAGE VALUES(to_date('16-03-2019','DD-MM-YYYY'), 'laver le sol', 2, 1 );
INSERT INTO MENAGE VALUES(to_date('11-03-2019','DD-MM-YYYY'), 'ranger', 4, 1 );

-- Léa a lavé une fois la pièce 2 et une fois la pièce 3
INSERT INTO MENAGE VALUES(to_date('11-02-2019','DD-MM-YYYY'), 'laver le sol', 3, 2 );
INSERT INTO MENAGE VALUES(to_date('11-02-2019','DD-MM-YYYY'), 'laver le sol', 2, 2 );

-- Amine a lavé une fois la pièce 2 
INSERT INTO MENAGE VALUES(to_date('11-03-2019','DD-MM-YYYY'), 'laver le sol', 2, 3 );

-- il y a trois animaux et ils sont tous à Léo 
INSERT INTO ANIMAL VALUES('Tigrou', 'chat' , 12,1);
INSERT INTO ANIMAL VALUES('Vanou', 'chien' , 11,1);
INSERT INTO ANIMAL VALUES('Minou', 'chat' , 2,1);

-- affichage des données
SELECT * FROM INDIVIDU;
SELECT * FROM PIECE;
SELECT * FROM ANIMAL;
SELECT * FROM MENAGE ;

-- nom & poids des animaux du plus lourd au plus léger
select nom, poids from animal order by poids desc; 

-- prenom & age des individus du plus vieux au plus jeune 
select prenom, age from individu order by age desc; 

-- la surface de pièce la plus grande 
select max(surface) from piece;
select p1.surface from piece p1 where p1.surface > All (select p2.surface from piece p2 where p2.idp<>p1.idp);

-- les pièces nettoyées qu'une fois 
select p1.idp from menage p1 group by p1.idp  having count(p1.idp)=1;
select m1.idP from menage m1 where not exists (select * from menage m2 where (m1.dateM <> m2.dateM or m1.typeM <> m2.typeM) and m2.idP = m1.idP);

-- les individus ayant fait un seul ménage
select p1.idI from menage p1 group by p1.idI  having count(*)=1;
select i.idI from individu i where 1 = ( select count(m.idI) from menage m where i.idI=m.idI);
select m1.idI from menage m1 where not exists (select * from menage m2 where (m1.dateM <> m2.dateM or m1.typeM <> m2.typeM or m2.Idp<> m1.idP) and m2.idI = m1.idI);
-- erreur : Léa a fait deux ménages différents mais à la même date ! Attention à la clé primaire
select m1.idI from menage m1 where not exists (select * from menage m2 where (m1.dateM <> m2.dateM ) and m2.idI = m1.idI);

-- les individus n'ayant pas fait de ménage depuis le 12-03-2019
select i.idI from individu i where i.idI <> ALL (select m.idI from menage m where dateM > to_date( '12-03-2019' , 'DD-MM-YYYY'));

-- les pièces qui n'ont pas été lavées depuis le 12-03-2019
select p.idp from piece p where to_date( '12-03-2019' , 'DD-MM-YYYY') > ALL (select m.dateM from menage m where m.idp=p.idp);

-- les étages où la moyenne d'age est supérieur à 19 ans
select p.etage from piece p, individu i where i.chambre=p.idp group by p.etage having avg(i.age)> 19;

-- les dates où la surface nettoyée est supérieur à 30 
select dateM from menage m, piece p where p.idP=m.idP group by dateM having sum(surface)>30; 

-- les individus qui ont fait tous les types de ménage qui existent dans la base de données
select m.idI from menage m group by m.idI having count(distinct m.typeM) = (select count(distinct m2.typeM) from menage m2);

-- les pièces qui ont été lavées au moins une fois par tous les individus
select m.idp from menage m group by m.idp having count(distinct idi) = (select count(*) from individu);



