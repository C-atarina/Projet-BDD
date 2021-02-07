#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Divinite
#------------------------------------------------------------

CREATE TABLE Divinite(
        ID  Int  Auto_increment  NOT NULL ,
        Nom Varchar (50) NOT NULL
	,CONSTRAINT Divinite_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Artisan
#------------------------------------------------------------

CREATE TABLE Artisan(
        ID  Int  Auto_increment  NOT NULL ,
        Nom Varchar (50)
	,CONSTRAINT Artisan_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Pouvoir
#------------------------------------------------------------

CREATE TABLE Pouvoir(
        ID           Int  Auto_increment  NOT NULL ,
        Denomination Varchar (50) NOT NULL
	,CONSTRAINT Pouvoir_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Decoration
#------------------------------------------------------------

CREATE TABLE Decoration(
        ID           Int  Auto_increment  NOT NULL ,
        Denomination Varchar (50)
	,CONSTRAINT Decoration_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TypeEquipement
#------------------------------------------------------------

CREATE TABLE TypeEquipement(
        ID           Int  Auto_increment  NOT NULL ,
        Denomination Varchar (50) NOT NULL
	,CONSTRAINT TypeEquipement_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Mois
#------------------------------------------------------------

CREATE TABLE Mois(
        ID          Int  Auto_increment  NOT NULL ,
        Nom         Varchar (25) NOT NULL ,
        ID_Divinite Int NOT NULL
	,CONSTRAINT Mois_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: DemiDieu
#------------------------------------------------------------

CREATE TABLE DemiDieu(
        ID          Int  Auto_increment  NOT NULL ,
        Nom         Varchar (50) NOT NULL ,
        ID_Divinite Int NOT NULL
	,CONSTRAINT DemiDieu_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: octroie
#------------------------------------------------------------

CREATE TABLE octroie(
        ID          Int NOT NULL ,
        ID_Divinite Int NOT NULL
	,CONSTRAINT octroie_PK PRIMARY KEY (ID,ID_Divinite)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: permet
#------------------------------------------------------------

CREATE TABLE permet(
        ID          Int NOT NULL ,
        ID_Divinite Int NOT NULL
	,CONSTRAINT permet_PK PRIMARY KEY (ID,ID_Divinite)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Lieu
#------------------------------------------------------------

CREATE TABLE Lieu(
        ID      Int  Auto_increment  NOT NULL ,
        Nom     Varchar (25) NOT NULL ,
        ID_Lieu Int NOT NULL
	,CONSTRAINT Lieu_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vente
#------------------------------------------------------------

CREATE TABLE Vente(
        ID                Int  Auto_increment  NOT NULL ,
        Date              Varchar (25) NOT NULL ,
        Quantite          Int NOT NULL ,	
        ID_TypeEquipement Int NOT NULL ,
        ID_Divinite       Int ,
        ID_Pouvoir        Int ,
        ID_Lieu           Int ,
        ID_DemiDieu       Int
	,CONSTRAINT Vente_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Oberon
#------------------------------------------------------------

CREATE TABLE Oberon(
        ID                      Int  Auto_increment  NOT NULL ,
        Denomination            Varchar (50) NOT NULL ,
        CoefficientDeConversion Int ,
        ID_Oberon               Int NOT NULL
	,CONSTRAINT Oberon_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Guerre
#------------------------------------------------------------

CREATE TABLE Guerre(
        ID      Int  Auto_increment  NOT NULL ,
        Annee   Int NOT NULL ,
        ID_Lieu Int NOT NULL
	,CONSTRAINT Guerre_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fabrique
#------------------------------------------------------------

CREATE TABLE fabrique(
        ID         Int NOT NULL ,
        ID_Artisan Int NOT NULL
	,CONSTRAINT fabrique_PK PRIMARY KEY (ID,ID_Artisan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: possede
#------------------------------------------------------------

CREATE TABLE possede(
        ID            Int NOT NULL ,
        ID_Decoration Int NOT NULL
	,CONSTRAINT possede_PK PRIMARY KEY (ID,ID_Decoration)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: rapporte
#------------------------------------------------------------

CREATE TABLE rapporte(
        ID        Int NOT NULL ,
        ID_Oberon Int NOT NULL ,
        Quantite  BigInt NOT NULL
	,CONSTRAINT rapporte_PK PRIMARY KEY (ID,ID_Oberon)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: participe
#------------------------------------------------------------

CREATE TABLE participe(
        ID          Int NOT NULL ,
        ID_DemiDieu Int NOT NULL
	,CONSTRAINT participe_PK PRIMARY KEY (ID,ID_DemiDieu)
)ENGINE=InnoDB;




ALTER TABLE Mois
	ADD CONSTRAINT Mois_Divinite0_FK
	FOREIGN KEY (ID_Divinite)
	REFERENCES Divinite(ID);

ALTER TABLE DemiDieu
	ADD CONSTRAINT DemiDieu_Divinite0_FK
	FOREIGN KEY (ID_Divinite)
	REFERENCES Divinite(ID);

ALTER TABLE octroie
	ADD CONSTRAINT octroie_Pouvoir0_FK
	FOREIGN KEY (ID)
	REFERENCES Pouvoir(ID);

ALTER TABLE octroie
	ADD CONSTRAINT octroie_Divinite1_FK
	FOREIGN KEY (ID_Divinite)
	REFERENCES Divinite(ID);

ALTER TABLE permet
	ADD CONSTRAINT permet_Decoration0_FK
	FOREIGN KEY (ID)
	REFERENCES Decoration(ID);

ALTER TABLE permet
	ADD CONSTRAINT permet_Divinite1_FK
	FOREIGN KEY (ID_Divinite)
	REFERENCES Divinite(ID);

ALTER TABLE Lieu
	ADD CONSTRAINT Lieu_Lieu0_FK
	FOREIGN KEY (ID_Lieu)
	REFERENCES Lieu(ID);

ALTER TABLE Lieu 
	ADD CONSTRAINT Lieu_Lieu0_AK 
	UNIQUE (ID_Lieu);

ALTER TABLE Vente
	ADD CONSTRAINT Vente_TypeEquipement0_FK
	FOREIGN KEY (ID_TypeEquipement)
	REFERENCES TypeEquipement(ID);

ALTER TABLE Vente
	ADD CONSTRAINT Vente_Divinite1_FK
	FOREIGN KEY (ID_Divinite)
	REFERENCES Divinite(ID);

ALTER TABLE Vente
	ADD CONSTRAINT Vente_Pouvoir2_FK
	FOREIGN KEY (ID_Pouvoir)
	REFERENCES Pouvoir(ID);

ALTER TABLE Vente
	ADD CONSTRAINT Vente_Lieu3_FK
	FOREIGN KEY (ID_Lieu)
	REFERENCES Lieu(ID);

ALTER TABLE Vente
	ADD CONSTRAINT Vente_DemiDieu4_FK
	FOREIGN KEY (ID_DemiDieu)
	REFERENCES DemiDieu(ID);

ALTER TABLE Oberon
	ADD CONSTRAINT Oberon_Oberon0_FK
	FOREIGN KEY (ID_Oberon)
	REFERENCES Oberon(ID);

ALTER TABLE Oberon 
	ADD CONSTRAINT Oberon_Oberon0_AK 
	UNIQUE (ID_Oberon);

ALTER TABLE Guerre
	ADD CONSTRAINT Guerre_Lieu0_FK
	FOREIGN KEY (ID_Lieu)
	REFERENCES Lieu(ID);

ALTER TABLE fabrique
	ADD CONSTRAINT fabrique_Vente0_FK
	FOREIGN KEY (ID)
	REFERENCES Vente(ID);

ALTER TABLE fabrique
	ADD CONSTRAINT fabrique_Artisan1_FK
	FOREIGN KEY (ID_Artisan)
	REFERENCES Artisan(ID);

ALTER TABLE possede
	ADD CONSTRAINT possede_Vente0_FK
	FOREIGN KEY (ID)
	REFERENCES Vente(ID);

ALTER TABLE possede
	ADD CONSTRAINT possede_Decoration1_FK
	FOREIGN KEY (ID_Decoration)
	REFERENCES Decoration(ID);

ALTER TABLE rapporte
	ADD CONSTRAINT rapporte_Vente0_FK
	FOREIGN KEY (ID)
	REFERENCES Vente(ID);

ALTER TABLE rapporte
	ADD CONSTRAINT rapporte_Oberon1_FK
	FOREIGN KEY (ID_Oberon)
	REFERENCES Oberon(ID);

ALTER TABLE participe
	ADD CONSTRAINT participe_Guerre0_FK
	FOREIGN KEY (ID)
	REFERENCES Guerre(ID);

ALTER TABLE participe
	ADD CONSTRAINT participe_DemiDieu1_FK
	FOREIGN KEY (ID_DemiDieu)
	REFERENCES DemiDieu(ID);
