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
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`LadenNr`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Artikel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Artikel` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Artikel` (
  `ArtikelNr` INT NOT NULL AUTO_INCREMENT,
  `Kategorie` VARCHAR(45) NULL DEFAULT NULL,
  `Beschreibung` VARCHAR(45) NULL DEFAULT NULL,
  `Preis` FLOAT NOT NULL,
  `Laden_ladenNr` INT NOT NULL,
  PRIMARY KEY (`ArtikelNr`),
  INDEX `fk_Artikel_Laden1_idx` (`Laden_ladenNr` ASC) VISIBLE,
  CONSTRAINT `fk_Artikel_Laden1`
    FOREIGN KEY (`Laden_ladenNr`)
    REFERENCES `einkaufszentrum`.`Laden` (`LadenNr`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Kunde` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Kunde` (
  `KundeNr` INT NOT NULL AUTO_INCREMENT,
  `Vorname` VARCHAR(45) NOT NULL,
  `Nachname` VARCHAR(45) NOT NULL,
  `Premiumstatus` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`KundeNr`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Warenkorb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Warenkorb` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Warenkorb` (
  `WarenkorbNr` INT NOT NULL AUTO_INCREMENT,
  `Kunde_kundeNr` INT NOT NULL,
  `Laden_ladenNr` INT NOT NULL,
  `Kaufdatum` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`WarenkorbNr`),
  INDEX `fk_Warenkorb_Kunde1_idx` (`Kunde_kundeNr` ASC) VISIBLE,
  INDEX `fk_Warenkorb_Laden1_idx` (`Laden_ladenNr` ASC) VISIBLE,
  CONSTRAINT `fk_Warenkorb_Kunde1`
    FOREIGN KEY (`Kunde_kundeNr`)
    REFERENCES `einkaufszentrum`.`Kunde` (`KundeNr`),
  CONSTRAINT `fk_Warenkorb_Laden1`
    FOREIGN KEY (`Laden_ladenNr`)
    REFERENCES `einkaufszentrum`.`Laden` (`LadenNr`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


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
    REFERENCES `einkaufszentrum`.`Artikel` (`ArtikelNr`),
  CONSTRAINT `fk_Bestellposition_Warenkorb1`
    FOREIGN KEY (`Warenkorb_warenkorbNr`)
    REFERENCES `einkaufszentrum`.`Warenkorb` (`WarenkorbNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


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
    REFERENCES `einkaufszentrum`.`Kunde` (`KundeNr`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Mitarbeiter` (
  `MitarbeiterNr` INT NOT NULL AUTO_INCREMENT,
  `Vorname` VARCHAR(45) NULL DEFAULT NULL,
  `Nachname` VARCHAR(45) NULL DEFAULT NULL,
  `Position` VARCHAR(45) NULL DEFAULT NULL,
  `Laden_ladenNr1` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`MitarbeiterNr`, `Laden_ladenNr1`),
  INDEX `fk_Mitarbeiter_Laden2_idx` (`Laden_ladenNr1` ASC) VISIBLE,
  CONSTRAINT `fk_Mitarbeiter_Laden2`
    FOREIGN KEY (`Laden_ladenNr1`)
    REFERENCES `einkaufszentrum`.`Laden` (`LadenNr`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `einkaufszentrum`.`Parkhaus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Parkhaus` ;

CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Parkhaus` (
  `Ankunftszeit` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `ParkplatzNr` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kundenbesuch_idKundenbesuch` INT NOT NULL,
  PRIMARY KEY (`ParkplatzNr`),
  INDEX `fk_Parkhaus_Kundenbesuch1_idx` (`Kundenbesuch_idKundenbesuch` ASC) VISIBLE,
  CONSTRAINT `fk_Parkhaus_Kundenbesuch1`
    FOREIGN KEY (`Kundenbesuch_idKundenbesuch`)
    REFERENCES `einkaufszentrum`.`Kundenbesuch` (`KundenbesuchNr`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb3
KEY_BLOCK_SIZE = 4;

USE `einkaufszentrum` ;

-- -----------------------------------------------------
-- Placeholder table for view `einkaufszentrum`.`BesterKunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`BesterKunde` (`Vorname` INT, `Nachname` INT, `WarenkorbNr` INT, `Gesamtpreis` INT);

-- -----------------------------------------------------
-- Placeholder table for view `einkaufszentrum`.`Top5Artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`Top5Artikel` (`Beschreibung` INT, `Menge` INT);

-- -----------------------------------------------------
-- Placeholder table for view `einkaufszentrum`.`UmsatzstärksterTag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `einkaufszentrum`.`UmsatzstärksterTag` (`Kaufdatum` INT, `Gesamtpreis` INT);

-- -----------------------------------------------------
-- function GesamtkostenBerechnung
-- -----------------------------------------------------

USE `einkaufszentrum`;
DROP function IF EXISTS `einkaufszentrum`.`GesamtkostenBerechnung`;

DELIMITER $$
USE `einkaufszentrum`$$
CREATE DEFINER=``@`%` FUNCTION `GesamtkostenBerechnung`(Kunde_kundeNr int) RETURNS float
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
-- function IstPremiumKunde
-- -----------------------------------------------------

USE `einkaufszentrum`;
DROP function IF EXISTS `einkaufszentrum`.`IstPremiumKunde`;

DELIMITER $$
USE `einkaufszentrum`$$
CREATE DEFINER=`sal`@`%` FUNCTION `IstPremiumKunde`(Kunde_kundeNr int) RETURNS tinyint
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
-- procedure UpdatePremiumKunde
-- -----------------------------------------------------

USE `einkaufszentrum`;
DROP procedure IF EXISTS `einkaufszentrum`.`UpdatePremiumKunde`;

DELIMITER $$
USE `einkaufszentrum`$$
CREATE DEFINER=`sal`@`%` PROCEDURE `UpdatePremiumKunde`(in KundenNr int)
BEGIN
	SET @KundeNr = KundenNr;
    Update Kunde Set Premiumstatus = IstPremiumkunde(@KundeNr) where KundeNr = @KundeNr;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function WarenkorbBerechnung
-- -----------------------------------------------------

USE `einkaufszentrum`;
DROP function IF EXISTS `einkaufszentrum`.`WarenkorbBerechnung`;

DELIMITER $$
USE `einkaufszentrum`$$
CREATE DEFINER=`sal`@`%` FUNCTION `WarenkorbBerechnung`(BasketNr int) RETURNS float
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
-- View `einkaufszentrum`.`BesterKunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`BesterKunde`;
DROP VIEW IF EXISTS `einkaufszentrum`.`BesterKunde` ;
USE `einkaufszentrum`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`sal`@`%` SQL SECURITY DEFINER VIEW `einkaufszentrum`.`BesterKunde` AS select `x`.`Vorname` AS `Vorname`,`x`.`Nachname` AS `Nachname`,`x`.`WarenkorbNr` AS `WarenkorbNr`,sum(`x`.`Gesamtpreis`) AS `Gesamtpreis` from (select `einkaufszentrum`.`Kunde`.`Vorname` AS `Vorname`,`einkaufszentrum`.`Kunde`.`Nachname` AS `Nachname`,`einkaufszentrum`.`Warenkorb`.`WarenkorbNr` AS `WarenkorbNr`,round((`einkaufszentrum`.`Artikel`.`Preis` * `einkaufszentrum`.`Bestellposition`.`Menge`),2) AS `Gesamtpreis` from (((`einkaufszentrum`.`Warenkorb` join `einkaufszentrum`.`Bestellposition` on((`einkaufszentrum`.`Warenkorb`.`WarenkorbNr` = `einkaufszentrum`.`Bestellposition`.`Warenkorb_warenkorbNr`))) join `einkaufszentrum`.`Artikel` on((`einkaufszentrum`.`Bestellposition`.`Artikel_ArtikelNr` = `einkaufszentrum`.`Artikel`.`ArtikelNr`))) join `einkaufszentrum`.`Kunde` on((`einkaufszentrum`.`Warenkorb`.`Kunde_kundeNr` = `einkaufszentrum`.`Kunde`.`KundeNr`)))) `x` group by `x`.`WarenkorbNr` order by `Gesamtpreis` desc limit 1;

-- -----------------------------------------------------
-- View `einkaufszentrum`.`Top5Artikel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`Top5Artikel`;
DROP VIEW IF EXISTS `einkaufszentrum`.`Top5Artikel` ;
USE `einkaufszentrum`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`sal`@`%` SQL SECURITY DEFINER VIEW `einkaufszentrum`.`Top5Artikel` AS select `einkaufszentrum`.`Artikel`.`Beschreibung` AS `Beschreibung`,`einkaufszentrum`.`Bestellposition`.`Menge` AS `Menge` from (`einkaufszentrum`.`Bestellposition` join `einkaufszentrum`.`Artikel` on((`einkaufszentrum`.`Bestellposition`.`Artikel_ArtikelNr` = `einkaufszentrum`.`Artikel`.`ArtikelNr`))) order by `einkaufszentrum`.`Bestellposition`.`Menge` desc limit 5;

-- -----------------------------------------------------
-- View `einkaufszentrum`.`UmsatzstärksterTag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `einkaufszentrum`.`UmsatzstärksterTag`;
DROP VIEW IF EXISTS `einkaufszentrum`.`UmsatzstärksterTag` ;
USE `einkaufszentrum`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `einkaufszentrum`.`UmsatzstärksterTag` AS select `y`.`Kaufdatum` AS `Kaufdatum`,`y`.`Gesamtpreis` AS `Gesamtpreis` from (select `x`.`WarenkorbNr` AS `WarenkorbNr`,`x`.`Kaufdatum` AS `Kaufdatum`,sum(`x`.`Gesamtpreis`) AS `Gesamtpreis` from (select `einkaufszentrum`.`Warenkorb`.`WarenkorbNr` AS `WarenkorbNr`,`einkaufszentrum`.`Warenkorb`.`Kaufdatum` AS `Kaufdatum`,round((`einkaufszentrum`.`Artikel`.`Preis` * `einkaufszentrum`.`Bestellposition`.`Menge`),2) AS `Gesamtpreis` from ((`einkaufszentrum`.`Warenkorb` join `einkaufszentrum`.`Bestellposition` on((`einkaufszentrum`.`Warenkorb`.`WarenkorbNr` = `einkaufszentrum`.`Bestellposition`.`Warenkorb_warenkorbNr`))) join `einkaufszentrum`.`Artikel` on((`einkaufszentrum`.`Bestellposition`.`Artikel_ArtikelNr` = `einkaufszentrum`.`Artikel`.`ArtikelNr`)))) `x` group by `x`.`WarenkorbNr`) `y` order by `y`.`Gesamtpreis` desc limit 1;

