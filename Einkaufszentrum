-- -----------------------------------------------------
-- Schema einkaufszentrum
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `einkaufszentrum` ;

-- -----------------------------------------------------
-- Schema einkaufszentrum
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `einkaufszentrum` DEFAULT CHARACTER SET utf8 ;
USE `einkaufszentrum` ;

-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Laden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Laden` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Laden` (
  `LadenNr` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`LadenNr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Mitarbeiter` (
  `MitarbeiterNr` INT NOT NULL AUTO_INCREMENT,
  `Vorname` VARCHAR(45) NULL,
  `Nachname` VARCHAR(45) NULL,
  `Position` VARCHAR(45) NULL,
  `Laden_ladenNr1` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`MitarbeiterNr`, `Laden_ladenNr1`),
  INDEX `fk_Mitarbeiter_Laden2_idx` (`Laden_ladenNr1` ASC) VISIBLE,
  CONSTRAINT `fk_Mitarbeiter_Laden2`
    FOREIGN KEY (`Laden_ladenNr1`)
    REFERENCES `einkaufszentrum`.`Laden` (`LadenNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Kunde` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Kunde` (
  `KundeNr` INT NOT NULL AUTO_INCREMENT,
  `Vorname` VARCHAR(45) NOT NULL,
  `Nachname` VARCHAR(45) NOT NULL,
  `Premiumstatus` TINYINT NULL,
  PRIMARY KEY (`KundeNr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Warenkorb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Warenkorb` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Warenkorb` (
  `WarenkorbNr` INT NOT NULL AUTO_INCREMENT,
  `Kunde_kundeNr` INT NULL,
  `Laden_ladenNr` INT NOT NULL,
  `Kaufdatum` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`WarenkorbNr`),
  INDEX `fk_Warenkorb_Kunde1_idx` (`Kunde_kundeNr` ASC) VISIBLE,
  INDEX `fk_Warenkorb_Laden1_idx` (`Laden_ladenNr` ASC) VISIBLE,
  CONSTRAINT `fk_Warenkorb_Kunde1`
    FOREIGN KEY (`Kunde_kundeNr`)
    REFERENCES `einkaufszentrum`.`Kunde` (`KundeNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Warenkorb_Laden1`
    FOREIGN KEY (`Laden_ladenNr`)
    REFERENCES `einkaufszentrum`.`Laden` (`LadenNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Kundenbesuch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Kundenbesuch` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Kundenbesuch` (
  `KundenbesuchNr` INT NOT NULL AUTO_INCREMENT,
  `Abfahrtszeit` TIMESTAMP NOT NULL,
  `Kunde_kundeNr1` INT NOT NULL,
  PRIMARY KEY (`KundenbesuchNr`, `Kunde_kundeNr1`),
  INDEX `fk_Kundenbesuch_Kunde2_idx` (`Kunde_kundeNr1` ASC) VISIBLE,
  CONSTRAINT `fk_Kundenbesuch_Kunde2`
    FOREIGN KEY (`Kunde_kundeNr1`)
    REFERENCES `einkaufszentrum`.`Kunde` (`KundeNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Parkhaus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Parkhaus` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Parkhaus` (
  `Ankunftszeit` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `ParkplatzNr` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kundenbesuch_idKundenbesuch` INT NULL,
  PRIMARY KEY (`ParkplatzNr`),
  INDEX `fk_Parkhaus_Kundenbesuch1_idx` (`Kundenbesuch_idKundenbesuch` ASC) VISIBLE,
  CONSTRAINT `fk_Parkhaus_Kundenbesuch1`
    FOREIGN KEY (`Kundenbesuch_idKundenbesuch`)
    REFERENCES `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
KEY_BLOCK_SIZE = 4;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Artikel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Artikel` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Artikel` (
  `ArtikelNr` INT NOT NULL AUTO_INCREMENT,
  `Kategorie` VARCHAR(45) NULL,
  `Beschreibung` VARCHAR(45) NULL,
  `Preis` FLOAT NOT NULL,
  `Laden_ladenNr` INT NOT NULL,
  PRIMARY KEY (`ArtikelNr`),
  INDEX `fk_Artikel_Laden1_idx` (`Laden_ladenNr` ASC) VISIBLE,
  CONSTRAINT `fk_Artikel_Laden1`
    FOREIGN KEY (`Laden_ladenNr`)
    REFERENCES `einkaufszentrum`.`Laden` (`LadenNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Bestellposition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Bestellposition` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Bestellposition` (
  `BestellpositionNr` INT NOT NULL,
  `Menge` INT NOT NULL,
  `Artikel_ArtikelNr` INT NOT NULL,
  `Warenkorb_warenkorbNr` INT NOT NULL,
  INDEX `fk_Bestellposition_Artikel1_idx` (`Artikel_ArtikelNr` ASC) VISIBLE,
  INDEX `fk_Bestellposition_Warenkorb1_idx` (`Warenkorb_warenkorbNr` ASC) VISIBLE,
  CONSTRAINT `fk_Bestellposition_Artikel1`
    FOREIGN KEY (`Artikel_ArtikelNr`)
    REFERENCES `einkaufszentrum`.`Artikel` (`ArtikelNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bestellposition_Warenkorb1`
    FOREIGN KEY (`Warenkorb_warenkorbNr`)
    REFERENCES `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `einkaufszentrum` ;

-- -----------------------------------------------------
-- procedure UpdatePremiumKunde
-- -----------------------------------------------------

USE `einkaufszentrum`;
DROP procedure IF EXISTS `einkaufszentrum`.`UpdatePremiumKunde`;

DELIMITER $$
USE `einkaufszentrum`$$
CREATE DEFINER=`max`@`%` PROCEDURE `UpdatePremiumKunde`(in KundenNr int)
BEGIN
	SET @KundeNr = KundenNr;
    Update Kunde Set Premiumstatus = IstPremiumkunde(@KundeNr) where KundeNr = @KundeNr;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function IstPremiumKunde
-- -----------------------------------------------------

USE `einkaufszentrum`;
DROP function IF EXISTS `einkaufszentrum`.`IstPremiumKunde`;

DELIMITER $$
USE `einkaufszentrum`$$
CREATE DEFINER=`max`@`%` FUNCTION `IstPremiumKunde`(Kunde_kundeNr int) RETURNS tinyint
begin
	declare AnzahlDerBesuche int;
    declare Premiumstatus tinyint;
    set AnzahlDerBesuche =(select count(*) as AnzahlDerBesuche from Kundenbesuch where Kunde_kundeNr1 = Kunde_kundeNr);
    if AnzahlDerBesuche >= 3 then
		set Premiumstatus = 1;
	else 
		set Premiumstatus = 0;
	end if;
    return Premiumstatus;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- function WarenkorbBerechnung
-- -----------------------------------------------------

USE `einkaufszentrum`;
DROP function IF EXISTS `einkaufszentrum`.`WarenkorbBerechnung`;

DELIMITER $$
USE `einkaufszentrum`$$
CREATE DEFINER=`max`@`%` FUNCTION `WarenkorbBerechnung`(BasketNr int) RETURNS float
BEGIN
declare WarenkorbSumme float;
set WarenkorbSumme = (
	select sum(Gesamtpreis)
	from (	
		select WarenkorbNr, round(Preis * Menge,2) AS Gesamtpreis 
		from Warenkorb
		inner join Bestellposition on Warenkorb.WarenkorbNr=Bestellposition.Warenkorb_warenkorbNr
		inner join Artikel on Bestellposition.Artikel_ArtikelNr=Artikel.ArtikelNr
		group by WarenkorbNr, BestellpositionNr, Menge, Preis, Gesamtpreis
		) as x
	where WarenkorbNr=BasketNr
    );
RETURN WarenkorbSumme;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function GesamtkostenBerechnung
-- -----------------------------------------------------

USE `einkaufszentrum`;
DROP function IF EXISTS `einkaufszentrum`.`GesamtkostenBerechnung`;

DELIMITER $$
USE `einkaufszentrum`$$
CREATE DEFINER=`max`@`%` FUNCTION `GesamtkostenBerechnung`(Kunde_kundeNr int) RETURNS float
BEGIN
declare Standzeit int;
declare Parkkosten float;
declare WarenkorbSumme float;
declare Gesamtkosten float;

declare KMonat Int;
declare KTag int;
declare KJahr int;

set KTag = (
	select Day(Kaufdatum) as tag
	from Kunde
	inner join Kundenbesuch on Kunde.KundeNr=Kundenbesuch.Kunde_kundeNr1
	inner join Warenkorb on Kunde.KundeNr=Warenkorb.Kunde_kundeNr
	where KundeNr=Kunde_kundeNr
	order by tag desc
	Limit 1
	);
	
set KMonat = (
	select Month(Kaufdatum) as monat
	from Kunde
	inner join Kundenbesuch on Kunde.KundeNr=Kundenbesuch.Kunde_kundeNr1
	inner join Warenkorb on Kunde.KundeNr=Warenkorb.Kunde_kundeNr
	where KundeNr=Kunde_kundeNr
	order by monat desc
	Limit 1
	);

set WarenkorbSumme = (
	select sum(Gesamtpreis)
    from(
		select KundeNr, Kaufdatum, WarenkorbNr, round(Preis * Menge,2) AS Gesamtpreis 
		from Warenkorb
		inner join Kunde on Warenkorb.Kunde_kundeNr=Kunde.KundeNr
        inner join Bestellposition on Warenkorb.WarenkorbNr=Bestellposition.Warenkorb_warenkorbNr
		inner join Artikel on Bestellposition.Artikel_ArtikelNr=Artikel.ArtikelNr
		group by WarenkorbNr, Kaufdatum, BestellpositionNr, Menge, Preis, Gesamtpreis
        order by kaufdatum desc
        ) as x
    where KundeNr = Kunde_kundeNr
    );
	
set Standzeit = (
	select timestampdiff(MINUTE, Parkhaus.Ankunftszeit, Kundenbesuch.Abfahrtszeit) AS DiffernzInMin
	from Parkhaus 
	inner join Kundenbesuch
	on Parkhaus.Kundenbesuch_idKundenbesuch=Kundenbesuch.KundenbesuchNr
	inner join Kunde
	on Kundenbesuch.Kunde_kundeNr1=Kunde.KundeNr
    inner join Warenkorb
    on Kunde.KundeNr=Warenkorb.Kunde_kundeNr
	where Kunde_kundeNr1 = Kunde_kundeNr and
	day(Kundenbesuch.Abfahrtszeit) = KTag and
	Month(Kundenbesuch.Abfahrtszeit) = KMonat
    order by Abfahrtszeit DESC
    limit 1
    );
if Standzeit >= 180 then
	set Parkkosten = 3;
else 
	set Parkkosten = (Standzeit / 30)*0.4;
end if;

set Gesamtkosten = Parkkosten + WarenkorbSumme;

RETURN Gesamtkosten;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `einkaufszentrum`.`BesterKunde`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `einkaufszentrum`.`BesterKunde` ;
USE `einkaufszentrum`;
CREATE  OR REPLACE VIEW `BesterKunde` AS
select	Vorname, Nachname, WarenkorbNr, sum(x.Gesamtpreis) as Gesamtpreis
from (select Vorname, Nachname, WarenkorbNr, round(Preis * Menge,2) as Gesamtpreis from Warenkorb 
inner join Bestellposition on Warenkorb.WarenkorbNr=Bestellposition.Warenkorb_warenkorbNr
inner join Artikel on Bestellposition.Artikel_ArtikelNr=Artikel.ArtikelNr
inner join Kunde on Warenkorb.Kunde_kundeNr=Kunde.KundeNr ) as x
group by WarenkorbNr 
order by Gesamtpreis DESC 
Limit 1;

-- -----------------------------------------------------
-- View `einkaufszentrum`.`Top5Artikel`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `einkaufszentrum`.`Top5Artikel` ;
USE `einkaufszentrum`;
CREATE  OR REPLACE VIEW `Top5Artikel` AS
select Beschreibung, Menge
from Bestellposition
inner join Artikel on Bestellposition.Artikel_ArtikelNr=Artikel.ArtikelNr 
order by Menge DESC
Limit 5;

-- -----------------------------------------------------
-- View `einkaufszentrum`.`UmsatzstärksterTag`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `einkaufszentrum`.`UmsatzstärksterTag` ;
USE `einkaufszentrum`;
CREATE  OR REPLACE VIEW `UmsatzstärksterTag` AS
select Kaufdatum, y.Gesamtpreis
from
(select WarenkorbNr, Kaufdatum, sum(x.Gesamtpreis) as Gesamtpreis
from (select WarenkorbNr, Kaufdatum, round(Preis * Menge,2) as Gesamtpreis from Warenkorb 
inner join Bestellposition on Warenkorb.WarenkorbNr=Bestellposition.Warenkorb_warenkorbNr
inner join Artikel on Bestellposition.Artikel_ArtikelNr=Artikel.ArtikelNr)
as x group by WarenkorbNr ) as y
order by y.Gesamtpreis DESC
Limit 1;
USE `einkaufszentrum`;

DELIMITER $$

USE `einkaufszentrum`$$
DROP TRIGGER IF EXISTS `einkaufszentrum`.`PremiumKundeAufstufung` $$
USE `einkaufszentrum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `einkaufszentrum`.`PremiumKundeAufstufung` AFTER INSERT ON `Kunde` FOR EACH ROW
BEGIN
declare WelcherKunde int;
set WelcherKunde = (select Kunde_kundeNr1 from Kundenbesuch order by Abfahrtszeit DESC limit 1);
CALL UpdatePremiumKunde(WelcherKunde);
END$$


USE `einkaufszentrum`$$
DROP TRIGGER IF EXISTS `einkaufszentrum`.`ZuweisungParkplatz_WRONG_SCHEMA` $$
USE `einkaufszentrum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ZuweisungParkplatz` AFTER INSERT ON `Kundenbesuch` FOR EACH ROW
BEGIN
insert into Parkhaus(Ankuftszeit, ParkplatzNr, Kundenbesuch_idKundenbesuch) values (now(), NULL, NEW.Kundenbesuch_idKundenbesuch);
END;$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `einkaufszentrum`.`Laden`
-- -----------------------------------------------------
START TRANSACTION;
USE `einkaufszentrum`;
INSERT INTO `einkaufszentrum`.`Laden` (`LadenNr`, `Name`) VALUES (1, 'Dein Einkaufszentrum');

COMMIT;


-- -----------------------------------------------------
-- Data for table `einkaufszentrum`.`Mitarbeiter`
-- -----------------------------------------------------
START TRANSACTION;
USE `einkaufszentrum`;
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (1, 'Doug', 'Heffernan', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (2, 'Perry', 'Cox', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (3, 'Jessica', 'Pearson', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (4, 'Steve', 'Stifler', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (5, 'Philipp', 'Banks', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (6, 'Tyra', 'Banks', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (7, 'Sheldon', 'Cooper', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (8, 'Leonard', 'Hofstedter', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (9, 'Al', 'Bundy', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (10, 'Nik', 'Tech', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (11, 'Paris', 'Hilton', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (12, 'Judith', 'Dilton', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (13, 'Harvey', 'Specter', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (14, 'Emily', 'Miller', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (15, 'Michael ', 'Scott', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (16, 'Dwright', 'Schrute', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (17, 'Mia ', 'Khalifa', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (18, 'Lana ', 'Rhoades', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (19, 'Shaiden ', 'Rogue', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (20, 'Moe', 'Szyslak', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (21, 'Marta', 'Baumhaus', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (22, 'Charlie', 'Harper', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (23, 'Naomi', 'Lapaglia', 'Mitarbeiter', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (24, 'Lucifer ', 'Morningstar', 'Cheffe', 1);
INSERT INTO `einkaufszentrum`.`Mitarbeiter` (`MitarbeiterNr`, `Vorname`, `Nachname`, `Position`, `Laden_ladenNr1`) VALUES (25, 'Maze', 'Lilim', 'Mitarbeiter', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `einkaufszentrum`.`Kunde`
-- -----------------------------------------------------
START TRANSACTION;
USE `einkaufszentrum`;
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (1, 'Corinna', 'Kopf', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (2, 'Niklas ', 'Sommer', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (3, 'President', 'Business', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (4, 'Abed', 'Mohammed', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (5, 'Reinhardt', 'Hammer', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (6, 'Adi', 'Lette', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (7, 'Musti', 'Mastafa', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (8, 'Betty', 'Schelle', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (9, 'Rachel', 'Green', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (10, 'Monica', 'Geller', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (11, 'Phoebe', 'Buffay', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (12, 'Joey', 'Tribbiani', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (13, 'Chandler', 'Bing', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (14, 'Ross', 'Geller', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (15, 'Homer ', 'Simpson', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (16, 'Bart', 'Simpson', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (17, 'Arthur', 'Spooner', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (18, 'Lou', 'Ferrrigno', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (19, 'Louis', 'Litt', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (20, 'Mr', 'Robot', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (21, 'Marques', 'Brownlee', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (22, 'George', 'Fischer', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (23, 'Assane', 'Diop', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (24, 'Sven', 'Axt', NULL);
INSERT INTO `einkaufszentrum`.`Kunde` (`KundeNr`, `Vorname`, `Nachname`, `Premiumstatus`) VALUES (25, 'Juliette', 'Pellegrini', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `einkaufszentrum`.`Warenkorb`
-- -----------------------------------------------------
START TRANSACTION;
USE `einkaufszentrum`;
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (1, 1, 1, '2022-05-23 16:16:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (2, 2, 1, '2022-05-21 12:53:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (3, 3, 1, '2022-05-14 15:49:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (4, 4, 1, '2022-05-14 09:33:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (5, 5, 1, '2022-05-17 12:21:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (6, 6, 1, '2022-05-14 11:31:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (7, 7, 1, '2022-05-13 13:43:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (8, 8, 1, '2022-05-18 15:43:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (9, 9, 1, '2022-05-28 09:33:00');
INSERT INTO `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`, `Kunde_kundeNr`, `Laden_ladenNr`, `Kaufdatum`) VALUES (10, 10, 1, '2022-05-09 15:50:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `einkaufszentrum`.`Kundenbesuch`
-- -----------------------------------------------------
START TRANSACTION;
USE `einkaufszentrum`;
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (1, '2022-05-23 18:45:00', 1);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (2, '2022-05-21 20:39:00', 2);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (3, '2022-05-14 22:45:00', 3);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (4, '2022-05-15 17:57:00', 3);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (5, '2022-05-17 14:21:00', 3);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (6, '2022-05-14 15:13:00', 6);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (7, '2022-05-13 14:45:00', 7);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (8, '2022-05-18 18:23:00', 7);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (9, '2022-05-28 18:45:00', 9);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (10, '2022-05-09 17:23:00', 8);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (11, '2022-05-14 16:32:00', 10);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (12, '2022-05-15 12:49:00', 11);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (13, '2022-05-21 19:34:00', 12);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (14, '2022-05-12 15:22:00', 13);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (15, '2022-05-11 21:32:00', 14);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (16, '2022-05-09 19:59:00', 15);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (17, '2022-05-08 21:56:00', 16);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (18, '2022-05-06 22:43:00', 17);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (19, '2022-05-11 17:38:00', 18);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (20, '2022-05-02 08:45:00', 19);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (21, '2022-05-04 22:25:00', 20);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (22, '2022-05-08 10:23:00', 21);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (23, '2022-05-05 18:23:00', 22);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (24, '2022-05-04 16:27:00', 23);
INSERT INTO `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`, `Abfahrtszeit`, `Kunde_kundeNr1`) VALUES (25, '2022-05-05 13:37:00', 24);

COMMIT;


-- -----------------------------------------------------
-- Data for table `einkaufszentrum`.`Parkhaus`
-- -----------------------------------------------------
START TRANSACTION;
USE `einkaufszentrum`;
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-23 16:16:00', 1, 1);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-21 12:53:00', 2, 2);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-14 15:49:00', 3, 3);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-15 09:33:00', 4, 4);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-17 12:21:00', 5, 5);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-14 11:31:00', 6, 6);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-13 13:43:00', 7, 7);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-18 15:43:00', 8, 8);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-28 09:33:00', 9, 9);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-09 15:50:00', 10, 10);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-14 08:59:00', 11, 11);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-15 10:50:00', 12, 12);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-21 16:50:00', 13, 13);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-12 12:50:00', 14, 14);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-11 12:11:00', 15, 15);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-09 11:32:00', 16, 16);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-08 16:53:00', 17, 17);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-06 18:11:00', 18, 18);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-11 07:30:00', 19, 19);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-02 08:15:00', 20, 20);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-04 12:35:00', 21, 21);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-08 08:20:00', 22, 22);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-05 16:50:00', 23, 23);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-04 14:30:00', 24, 24);
INSERT INTO `einkaufszentrum`.`Parkhaus` (`Ankunftszeit`, `ParkplatzNr`, `Kundenbesuch_idKundenbesuch`) VALUES ('2022-05-05 10:20:00', 25, 25);

COMMIT;


-- -----------------------------------------------------
-- Data for table `einkaufszentrum`.`Artikel`
-- -----------------------------------------------------
START TRANSACTION;
USE `einkaufszentrum`;
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (1, 'Kleidung', 'Jeans-Lang', 90.99, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (2, 'SportKleidung', 'Shorts', 25.40, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (3, 'Alkohol', 'Jack Daniels Oak No.7', 39.90, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (4, 'Lebensmittel', 'Baerchenwurst', 4.99, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (5, 'Technik', 'Radeon Strix 8GB', 699.99, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (6, 'Technik', 'Razer 105 Cps QWERTY', 12.90, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (7, 'Tabakwaren', 'Drum Light 25g', 6.99, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (8, 'Alkohol', 'Heineken Six Pack', 12.40, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (9, 'Lebensmittel', 'Bauernbrot', 3.20, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (10, 'Sportbekleidung', 'Funktionsshirt XXL', 49.90, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (11, 'AudiogerÃ¤te', 'Razer Nari Ultimate Headset', 169.80, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (12, 'Tabakwaren', 'Selbstzuendende Kohle', 5.80, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (13, 'Kleidung', 'Wintermantel', 230.85, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (14, 'Kleidung', 'Boxershort 6er Pack', 21.90, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (15, 'Lebensmittel', 'Kaeseplatte', 4.90, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (16, 'Lebensmittel', 'Milch 1L 3.8% Fett', 2.10, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (17, 'Lebensmitttel', 'Haenchenbrust 600g', 5.90, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (18, 'Buerozubehoer', 'Briefumschlaege 100 Stk', 4.89, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (19, 'Buerozubehoer', 'Briefmarken Set', 5.90, 1);
INSERT INTO `einkaufszentrum`.`Artikel` (`ArtikelNr`, `Kategorie`, `Beschreibung`, `Preis`, `Laden_ladenNr`) VALUES (20, 'Kleidung', 'Sportschuhe Gr.45', 32.89, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `einkaufszentrum`.`Bestellposition`
-- -----------------------------------------------------
START TRANSACTION;
USE `einkaufszentrum`;
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (1, 1, 1, 1);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (2, 2, 2, 1);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (1, 1, 3, 2);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (2, 2, 4, 2);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (1, 1, 5, 3);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (2, 2, 6, 3);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (3, 1, 7, 3);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (1, 2, 8, 4);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (1, 1, 9, 9);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (1, 2, 10, 10);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (4, 4, 15, 3);
INSERT INTO `einkaufszentrum`.`Bestellposition` (`BestellpositionNr`, `Menge`, `Artikel_ArtikelNr`, `Warenkorb_warenkorbNr`) VALUES (2, 9, 18, 4);

COMMIT;

