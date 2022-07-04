CREATE TABLE `lessons_learnt`.`lessons_learnt` (`discipline` VARCHAR(20) NOT NULL , 

`type_ll` VARCHAR(10) NOT NULL , 

`seq_id` INT(10) DEFAULT '0000'  , 

`project_name` VARCHAR(50) NOT NULL , 

`client` VARCHAR(50) NOT NULL , 

`facility_category` VARCHAR(50) NOT NULL , 

`subject` VARCHAR(50) NOT NULL , 

`title` VARCHAR NOT NULL , 

`bg_ll` VARCHAR NOT NULL , 

`root_cause` VARCHAR NOT NULL , 

`corrective_action` VARCHAR NOT NULL , 

`originator` VARCHAR NOT NULL , 

`approver` VARCHAR NOT NULL , 

`attachment` BLOB NOT NULL ) ENGINE = InnoDB;



CREATE TRIGGER `seq_id_update`

BEFORE INSERT ON `lesson_learnt`

FOR EACH ROW 

BEGIN

    IF NEW.seq_id IS NULL THEN
    
        SET NEW.seq_id = (SELECT seq_id FROM lesson_learnt ORDER BY seq_id DESC LIMIT 1) + 1;
        
    END IF;
    
END;
