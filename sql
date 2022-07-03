CREATE TABLE `lessons_learnt`.`lessons_learnt` (`discipline` VARCHAR(20) NOT NULL , 
`type_ll` VARCHAR(10) NOT NULL , 
`sequence_no` INT(10) NOT NULL , 
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

DEFAULT 0000


CREATE TRIGGER `order_guide_insert_trigger`
BEFORE INSERT ON `order_guide`
FOR EACH ROW 
BEGIN
    IF NEW.Sort_Placement IS NULL THEN
        SET NEW.Sort_Placement = (SELECT ID FROM order_Guide ORDER BY id DESC LIMIT 1) + 1;
    END IF;
END;
