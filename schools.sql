USE [schools]
GO
 --J'insére les classes dans le tableau [dbo].[classe]
INSERT INTO [dbo].[classe] ([classe]) VALUES 
	('CP'),
	('CE1'),
	('CE2'),
	('CM1'),
	('CM2'); 
GO
--J'insére les nom de matiéres dans le tableau [dbo].[matiere]
INSERT INTO [dbo].[matiere] (nom_matiere) VALUES
	('Maths'),
	('Sport'),
	('Français'),
	('Anglais'),
	('Histoire'),
	('Géographie');
GO
--J'ai insérer tous les nom et prenom des éléves sur 2 colonnes ainsi que leurs classes d'affection
INSERT INTO [dbo].[eleve] ([nom],[prenom],[id_classe]) VALUES
	('Lemarchand','Bill',1),
	('Chiante','Fille',1),
	('Gros','Boufflon',1),
	('Petite','Salurpe',1),
	('Sucer','Moir',1),
	('Kinder','Surprise',1),
	('Mother','Fuckir',2),
	('Father','Billy',2),
	('Jean','Poitier',2),
	('Jean','Luck',2),
	('Lucky','Luke',2),
	('Les','Dalton',2),
	('Hentai','Me',3),
	('You','Pornik',3),
	('For','Nick',3),
	('Bat','Man',3),
	('Mangez','Moi',3),
	('Mattez','Monboulle',3),
	('Fifty','Fifty',4),
	('Wil','Liam',4),
	('Eric','Zemmoure',4),
	('Poter','Harry',4),
	('Trump','Juliette',4),
	('check','Spear',4),
	('Many','Men',5),
	('Smith','Willy',5),
	('Soldat','Ryan',5),
	('Lenon','Boby',5),
	('Suck','meir',5),
	('Jai','Fini',5);
GO
--J'insére les noms,prénoms et email des professeurs sur 2 colonnes
INSERT INTO [dbo].[professeur] (nom,prenom,email) VALUES
	('Chuck','Nourice','chuck@gmail.com'),
	('Ben','Lasagne','ben@gmail.com'),
	('Bruce','Ligne','bruce@gmail.com'),
	('Silverstone','Lestone','silverstone@yahoo.fr'),
	('MonkeyD','Luffy','monkeyD@shinsekai.com');
GO
--J'insére les notes
INSERT INTO [dbo].[note] ([note],[id_matiere],[id_eleve]) VALUES
	(1,1,1),
	(2,2,1),
	(3,3,2),
	(4,1,2),
	(5,6,3),
	(6,3,3),
	(7,4,4),
	(8,5,4),
	(9,1,5),
	(10,2,5),
	(11,2,6),
	(12.5,1,6),
	(13,4,7),
	(14,6,7),
	(15,5,8),
	(16,1,8),
	(17,2,9),
	(18,6,9),
	(19,1,10),
	(20,2,10),
	(0,3,11),
	(0.5,4,11),
	(5,5,12),
	(1,6,12),
	(7,1,13),
	(9.5,6,13),
	(7,1,14),
	(1,2,14),
	(3.5,2,15),
	(4,5,15),
	(12.5,1,16),
	(13,4,16),
	(12,6,17),
	(12,4,17),
	(15,1,18),
	(17,2,18),
	(18,3,19),
	(18,4,19),
	(19,5,20),
	(17.5,6,20),
	(5,6,21),
	(6,4,21),
	(9,6,22),
	(9,5,22),
	(7.5,1,23),
	(13,3,23),
	(11.5,3,24),
	(11.5,4,24),
	(12,6,25),
	(14.5,4,25),
	(16,1,26),
	(16,2,26),
	(18,4,27),
	(0,6,27),
	(2,1,28),
	(3,4,28),
	(7,5,29),
	(20,2,29),
	(14,2,30),
	(12,3,30);
--UPDATE note
--SET id_eleve=1,
--	id_matiere=1
--WHERE id_note=1;
GO
--Je fais la relation entre la classe et professeur dans la table [attitrer]
INSERT INTO [dbo].[attitrer] ([id_classe],[id_prof]) VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5);
GO
--Il faudra pouvoir afficher toutes les notes des élèves (nom et prénom de l'élève, la note et la matière).
SELECT [nom],[prenom],[dbo].[note].[note],[dbo].[matiere].[nom_matiere]
FROM [dbo].[eleve]
LEFT JOIN [dbo].[note] ON [dbo].[note].[id_eleve]=[dbo].[eleve].[id_classe]
LEFT JOIN [dbo].[matiere] ON [dbo].[note].[id_matiere]=[dbo].[matiere].[id_matiere]
GO
--Il faudra pouvoir afficher la moyenne générale de chaque élève (nom et prénom de l'élève, la classe de l'élève, le nom du professeur principal, la moyenne).
SELECT [dbo].[eleve].[nom],[dbo].[eleve].[prenom],[dbo].[classe].[classe],[dbo].[professeur].[nom] AS [professeur],AVG([dbo].[note].[note]) AS [moyenneEleves]
FROM [dbo].[eleve]
INNER JOIN [dbo].[classe] ON [dbo].[classe].[id_classe]=[dbo].[eleve].[id_classe]
INNER JOIN [dbo].[professeur] ON [dbo].[professeur].[id_prof]=[dbo].[eleve].[id_classe]
INNER JOIN [dbo].[note] ON [dbo].[note].[id_eleve]=[dbo].[eleve].[id_eleve]
GROUP BY [dbo].[eleve].[nom],[dbo].[eleve].[prenom],[dbo].[professeur].[nom],[dbo].[classe].[classe]
ORDER BY [moyenneEleves] ASC
GO
--Il faudra pouvoir afficher tous les élèves d'un professeur (nom et prénom du professeur, la classe du professeur, nom et prénom de l'élève).
SELECT [dbo].[professeur].[nom] AS [nomProfesseur],[dbo].[professeur].[prenom] AS [prenomProfesseur],[dbo].[eleve].[nom] AS [nomEleve],[dbo].[eleve].[prenom] AS [prenomEleve],[dbo].[classe].[classe] 
FROM [dbo].[eleve]
INNER JOIN [dbo].[classe] ON [dbo].[classe].[id_classe]=[dbo].[eleve].[id_classe]
INNER JOIN [dbo].[professeur] ON [dbo].[professeur].[id_prof]=[dbo].[eleve].[id_classe]
INNER JOIN [dbo].[attitrer] ON [dbo].[attitrer].[id_prof]=[dbo].[professeur].[id_prof]
GROUP BY [dbo].[professeur].[nom],[dbo].[eleve].[nom],[dbo].[eleve].[prenom],[dbo].[classe].[classe],[dbo].[professeur].[prenom]