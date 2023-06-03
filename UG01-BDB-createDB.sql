CREATE TABLE BIRDWATCHER 
(
Email VARCHAR (255), 
Name VARCHAR (255) NOT NULL,
CONSTRAINT Pk_email PRIMARY KEY(Email)
);

/*select * from BIRDWATCHER; */


CREATE TABLE HABITAT 
(
HabitatType VARCHAR (15) CHECK (HabitatType  in ('Terrestrial', 'Aquatic')), 
HabitatClassification VARCHAR (255),
CONSTRAINT pk_habitat PRIMARY KEY(HabitatType,HabitatClassification)
);

/*select * from HABITAT; */

CREATE TABLE AVES 
(
ScientificName VARCHAR (255), 
CommonName VARCHAR (255) NOT NULL, 
Nesting VARCHAR (255)NOT NULL, 
NumberEggs INT, 
Young INT, 
AvesSize FLOAT NOT NULL, 
WingShape VARCHAR (255) NOT NULL,
CONSTRAINT pk_ScientificName PRIMARY KEY(ScientificName),
CONSTRAINT uk_CommonName UNIQUE(CommonName)
);

/*select * from AVES;*/

CREATE TABLE EVES_LOCATION 
(
LocLatitude FLOAT, 
LocLongitude FLOAT, 
Country VARCHAR (100) NOT NULL, 
State VARCHAR (100) NOT NULL,
CONSTRAINT Pk_loc PRIMARY KEY(LocLatitude,LocLongitude)
);

/*SELECT * FROM EVES_LOCATION ; */

CREATE TABLE AVES_Color 
(
Aves VARCHAR (255), 
Color VARCHAR (50),
CONSTRAINT pk_AvesColor PRIMARY KEY(Aves,Color),
CONSTRAINT fk_AvesColor FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from AVES_Color ;*/

CREATE TABLE AVES_Activity 
(
Aves VARCHAR (255), 
Activity VARCHAR (255),
CONSTRAINT pk_AvesActivity PRIMARY KEY(Aves,Activity),
CONSTRAINT fk_AvesActivity FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from AVES_Activity  ;*/

CREATE TABLE AVES_TailShape 
(
Aves VARCHAR (255), 
TailShape VARCHAR (255),
CONSTRAINT pk_AvesTailShape PRIMARY KEY(Aves,TailShape),
CONSTRAINT fk_AvesTailShape FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from AVES_TailShape  ;*/

CREATE TABLE AVES_Diet 
(
Aves VARCHAR (255), 
Diet VARCHAR (255),
CONSTRAINT pk_AvesDiet PRIMARY KEY(Aves,Diet),
CONSTRAINT fk_AvesDiet FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from AVES_Diet  ; */

CREATE TABLE AVES_FeedingBehavior 
(
Aves VARCHAR (255), 
FeedingBehavior VARCHAR (255),
CONSTRAINT pk_AvesFeedingBehavior PRIMARY KEY(Aves,FeedingBehavior),
CONSTRAINT fk_AvesFeedingBehavior FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from AVES_FeedingBehavior ; */


CREATE TABLE CLIMATE_AFFECTED 
(
Aves VARCHAR (255), 
WarmingScenario VARCHAR (255) NOT NULL, 
RegionGained FLOAT NOT NULL,
RegionMaintained FLOAT NOT NULL, 
RegionLost FLOAT NOT NULL,
CONSTRAINT pk_AvesClimateAffected PRIMARY KEY(Aves),
CONSTRAINT fk_AvesClimateAffected FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
); 

/*select * from CLIMATE_AFFECTED ;*/



CREATE TABLE ENDANGERED_AVES 
(
Aves VARCHAR (255), 
EndangermentLevel VARCHAR (25)  CHECK(EndangermentLevel  in('Least Concern', 'Near Threatened', 'Vulnerable', 'Endangered', 'Critically Endangered', 'Extinct in the Wild', 'Extinct')),
CONSTRAINT pk_EndangeredAves PRIMARY KEY(Aves),
CONSTRAINT fk_EndangeredAves FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from ENDANGERED_AVES ; */

CREATE TABLE ENDANGERED_AVES_Threats 
(
EAves VARCHAR (255), 
Threat VARCHAR (255),
CONSTRAINT pk_AvesThreats PRIMARY KEY(EAves,Threat),
CONSTRAINT fk_AvesThreats FOREIGN KEY(EAves) REFERENCES ENDANGERED_AVES ON  DELETE CASCADE
);

/*select * from ENDANGERED_AVES_Threats  ; */


CREATE TABLE ENDANGERED_AVES_ConservationActions
(
EAves VARCHAR (255), 
ConservationAction VARCHAR (255),
CONSTRAINT pk_AvesAction PRIMARY KEY(EAves,ConservationAction),
CONSTRAINT fk_AvesAction FOREIGN KEY(EAves) REFERENCES ENDANGERED_AVES ON  DELETE CASCADE
);

/*select * from ENDANGERED_AVES_ConservationActions ;*/

CREATE TABLE EVES_PICTURE
(
Aves VARCHAR (255), 
PicDate DATE,
CONSTRAINT pk_PicDate PRIMARY KEY(Aves,PicDate),
CONSTRAINT fk_PicDate FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from EVES_PICTURE ; */



CREATE TABLE PICTURE_Colors 
(
Aves VARCHAR (255), 
PicDate DATE, 
Color VARCHAR (10) CHECK(Color  in ('Color', 'Black', 'White')),
CONSTRAINT pk_PicColors PRIMARY KEY(Aves,PicDate,Color),
CONSTRAINT fk_PicColors FOREIGN KEY(Aves,PicDate) REFERENCES EVES_PICTURE ON  DELETE CASCADE
);

/*select * from PICTURE_Colors ;*/

CREATE TABLE PICTURE_Textures 
(
Aves VARCHAR (255), 
PicDate DATE, 
Texture VARCHAR (10) CHECK(Texture  in ('Smooth', 'Rough')),
CONSTRAINT pk_PicTextures  PRIMARY KEY(Aves,PicDate,Texture),
CONSTRAINT fk_PicTextures  FOREIGN KEY(Aves,PicDate) REFERENCES EVES_PICTURE ON  DELETE CASCADE
);

/*select * from PICTURE_Textures  ;*/


CREATE TABLE EVES_VOICE 
(
Aves VARCHAR (255), 
Loudness VARCHAR (10) CHECK(Loudness in ('Low', 'Medium', 'High')), 
Pitch VARCHAR (10) NOT NULL CHECK(Pitch in ('Low', 'Medium', 'High')), 
VoiceType VARCHAR (255) NOT NULL,
CONSTRAINT pk_EvesVoice PRIMARY KEY(Aves,Loudness),
CONSTRAINT fk_EvesVoice FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from EVES_VOICE; */

CREATE TABLE  EVES_ORDER 
(
Aves VARCHAR (255), 
OrderName VARCHAR (255) NOT NULL,
CONSTRAINT pk_EvesOrder PRIMARY KEY(Aves),
CONSTRAINT fk_EvesOrder FOREIGN KEY(Aves) REFERENCES AVES ON  DELETE CASCADE
);

/*select * from EVES_ORDER; */

CREATE TABLE SIGHTING 
(
sDateTime TIMESTAMP,  
Observer VARCHAR (255) NOT NULL, 
LocLatitude FLOAT NOT NULL, 
LocLongitude FLOAT NOT NULL,
CONSTRAINT pk_sDateTime PRIMARY KEY(sDateTime),
CONSTRAINT fk_Observer FOREIGN KEY(Observer) REFERENCES BIRDWATCHER ON  DELETE CASCADE,
CONSTRAINT fk_Location FOREIGN KEY(LocLatitude,LocLongitude) REFERENCES EVES_LOCATION ON  DELETE CASCADE
);

/*SELECT * FROM SIGHTING; */

CREATE TABLE SIGHTING_USER_PICTURES 
(
sDateTime Timestamp,
PicNo INT,
UserPicture BLOB NOT NULL,
CONSTRAINT pk_sDateTimePic PRIMARY KEY(sDateTime, picNo),
CONSTRAINT fk_sDateTime FOREIGN KEY(sDateTime) REFERENCES SIGHTING
);

/*SELECT * FROM SIGHTING_USER_PICTURES;*/

CREATE TABLE SIGHTING_FIELD_NOTES
(
sDateTime TIMESTAMP, 
fNoteNo INT,
FieldNote VARCHAR (8000) NOT NULL,
CONSTRAINT pk_sDateTimeFNoteNo PRIMARY KEY(sDateTime, fNoteNo),
CONSTRAINT fk_sDateTimeNotes FOREIGN KEY(sDateTime) REFERENCES SIGHTING 
);

/*SELECT * FROM SIGHTING_FIELD_NOTES; */

CREATE TABLE is_at 
(
HabitatType VARCHAR (15) CHECK(HabitatType in('Terrestrial', 'Aquatic')), 
HabitatClassification VARCHAR (255), 
LocLatitude FLOAT, 
LocLongitude FLOAT,
CONSTRAINT pk_is_at PRIMARY KEY(HabitatType, HabitatClassification, LocLatitude, LocLongitude),
CONSTRAINT fk_is_at_Habitat FOREIGN KEY(HabitatType, HabitatClassification) REFERENCES HABITAT ON  DELETE CASCADE,
CONSTRAINT fk_is_at_Location FOREIGN KEY(LocLatitude, LocLongitude) REFERENCES EVES_LOCATION ON  DELETE CASCADE
);
 
/*select * from is_at ; */


CREATE TABLE inhibits 
(
Aves VARCHAR (255), 
HabitatType  VARCHAR (15) CHECK(HabitatType in ('Terrestrial', 'Aquatic')), 
HabitatClassification VARCHAR(255),
CONSTRAINT pk_inhibits PRIMARY KEY(Aves, HabitatType, HabitatClassification),
CONSTRAINT fk_inhibits FOREIGN KEY(HabitatType, HabitatClassification) REFERENCES HABITAT ON  DELETE CASCADE
);

/*select * from inhibits ; */

CREATE TABLE identified_as 
(
Bird VARCHAR (255), 
sDateTime TIMESTAMP,
CONSTRAINT pk_identified_as PRIMARY KEY(Bird,sDateTime),
CONSTRAINT fk_identified_as_Eves FOREIGN KEY(Bird) REFERENCES AVES,
CONSTRAINT fk_identified_as_sDT FOREIGN KEY(sDateTime) REFERENCES SIGHTING
);

/*select * from identified_as; */


/*
To retreive all table

select * from BIRDWATCHER;
select * from  identified_as;
select * from  inhibits ;
select * from  is_at ;
select * from  SIGHTING_FIELD_NOTES;
select * from  SIGHTING_USER_PICTURES;
select * from  SIGHTING;
select * from  EVES_ORDER;
select * from  EVES_VOICE;
select * from  PICTURE_Textures  ;
select * from  PICTURE_Colors ;
select * from  EVES_PICTURE ;
select * from  ENDANGERED_AVES_ConservationActions ;
select * from  ENDANGERED_AVES_Threats  ;
select * from  ENDANGERED_AVES ;
select * from  CLIMATE_AFFECTED ;
select * from  AVES_FeedingBehavior ;
select * from  AVES_Diet;
select * from  AVES_TailShape  ; 
select * from  AVES_Activity  ;
select * from  AVES_Color ;
select * from  EVES_LOCATION ;
select * from  AVES;
select * from  HABITAT;
select * from  BIRDWATCHER;
*/

/*
To REMOVE all table

drop table identified_as;
drop table inhibits ;
drop table is_at ;
drop table SIGHTING_FIELD_NOTES;
drop table SIGHTING_USER_PICTURES;
drop table SIGHTING;
drop table EVES_ORDER;
drop table EVES_VOICE;
drop table PICTURE_Textures  ;
drop table PICTURE_Colors ;
drop table EVES_PICTURE ;
drop table ENDANGERED_AVES_ConservationActions ;
drop table ENDANGERED_AVES_Threats  ;
drop table ENDANGERED_AVES ;
drop table CLIMATE_AFFECTED ;
drop table AVES_FeedingBehavior ;
drop table AVES_Diet;
drop table AVES_TailShape  ; 
drop table AVES_Activity  ;
drop table AVES_Color ;
drop table EVES_LOCATION ;
drop table AVES;
drop table HABITAT;
drop table BIRDWATCHER;
*/
