USE dellLaptops1;

/*
--fixing type mistakes
ALTER TABLE `dellLaptops`.`Orders` 
	MODIFY COLUMN `storage_size` INT NOT NULL,
    MODIFY COLUMN `screen_size` DECIMAL(3,2) NOT NULL;
    */
    
-- Altering the table definition
ALTER TABLE `dellLaptops1`.`screen_size` MODIFY COLUMN `size` DECIMAL(4,2) NOT NULL;

-- inserting screen sizes into screen_size table:
INSERT INTO `screen_size` (`size`) VALUES (15.0),(14.0), (13.0), (16.0);

-- changing screen_size table and products table relationship:

/*CREATE TABLE IF NOT EXISTS `dellLaptops`.`product_has_screen_size` (
  `product_id` INT NOT NULL,
  `screen_size_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `screen_size_id`),
  CONSTRAINT `fk_product_screen_size_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `dellLaptops`.`products` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_screen_size_screen_size`
    FOREIGN KEY (`screen_size_id`)
    REFERENCES `dellLaptops`.`screen_size` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;
*/

-- getting rid of unecessary column screen_size_id on table products:
-- ALTER TABLE `products` DROP FOREIGN KEY `fk_product_screen_size1`;
-- ALTER TABLE `products` DROP COLUMN `screen_size_id`;

-- Inserting laptops products on table products:
INSERT INTO `products` (`product_name`) VALUES ('Vostro'), ('Inspiron'), ('Latitude'), ('XPS'), ('G');

-- inserting relationships on products_has_screen_size table:
INSERT INTO `product_has_screen_size` (`product_id`,`screen_size_id`) 
	VALUES (5,1);
INSERT INTO `product_has_screen_size` (`product_id`,`screen_size_id`) 
	VALUES (4,3);
INSERT INTO `product_has_screen_size` (`product_id`,`screen_size_id`) 
	VALUES (3,1),
    (3,2),
    (3,3);

INSERT INTO `product_has_screen_size` (`product_id`,`screen_size_id`) 
	VALUES (2,3),
    (2,1);

INSERT INTO `product_has_screen_size` (`product_id`,`screen_size_id`) 
	VALUES (1,1),
    (1,4);
    
-- inserting processor generations and platforms
INSERT INTO `processor` (`processor_gen_platform`) VALUES ('Intel Core de 12ª Geração'), ('Intel Core de 11ª Geração'), ('AMD Ryzen série 5000');
INSERT INTO `processor` (`processor_gen_platform`) VALUES ('Intel Evo'), ('Intel Core de 13ª Geração');
INSERT INTO `processor` (`processor_gen_platform`) VALUES ('Intel Evo vPro'), ('Intel vPro');

-- creating links for products and processor gens on intermediate table:

INSERT INTO `product_has_processor` (`products_id`, `processor_id`) VALUES (1,1), (1,2),(1,3);
INSERT INTO `product_has_processor` (`products_id`,`processor_id`) VALUES (2,1), (2,2), (2,3), (2,4), (2,5);
INSERT INTO `product_has_processor` (`products_id`,`processor_id`) VALUES (3,1), (3,2), (3,4), (3,6), (3,7);
INSERT INTO `product_has_processor` (`products_id`,`processor_id`) VALUES (4,5), (4,4);
INSERT INTO `product_has_processor` (`products_id`,`processor_id`) VALUES (5,4);

-- getting rid of bad alocated or uncessary foreign keys: 

-- ALTER TABLE `graphic_cards` DROP FOREIGN KEY `fk_graphic_cards_product_has_graphic_card1`;
-- ALTER TABLE `product_has_graphic_card` DROP FOREIGN KEY `fk_product_has_graphic_card_products1`;
-- ALTER TABLE `graphic_cards` DROP COLUMN `product_has_graphic_card_products_id`;

-- inserting registers in graphic_cards table

INSERT INTO `graphic_cards` (`graphic_card_model`) VALUES ('AMD Radeon™ Graphics com memória gráfica compartilhada'),('Intel® UHD com memória gráfica compartilhada'), 
('Intel® Iris® Xe com memória gráfica compartilhada'),('NVIDIA® GeForce RTX™ 3050 Ti, 4GB GDDR6'),('NVIDIA® GeForce® MX550, 2GB GDDR6');
 
 INSERT INTO `graphic_cards` (`graphic_card_model`) VALUES 
 ('NVIDIA® GeForce® MX350, 2GB GDDR5 ');
 INSERT INTO `graphic_cards` (`graphic_card_model`) VALUES 
 ('AMD Radeon™ Graphics com memória gráfica compartilhada ');
 INSERT INTO `graphic_cards` (`graphic_card_model`) VALUES 
 ('NVIDIA® GeForce® RTX™ 3050, 6GB GDDR6'), ('NVIDIA® GeForce® RTX™ 4050, 6GB GDDR6 ');

-- deleting register included by mistake before setting constraint do avoid duplicates:

DELETE FROM `graphic_cards` WHERE `id`  = 7;

-- creating  column on intermediate table that will represent the id of one table
-- ALTER TABLE `dellLaptops1`.`product_has_graphic_card` ADD COLUMN `graphic_card_id` INT NOT NULL;

-- creating foreign key on intermediate table  
/*ALTER TABLE `dellLaptops1`.`product_has_graphic_card`
ADD CONSTRAINT `fk_product_has_graphic_card_graphic_cards`
FOREIGN KEY (`graphic_card_id`)
REFERENCES `dellLaptops1`.`graphic_cards` (`id`)
ON DELETE CASCADE
ON UPDATE CASCADE;*/

-- fixing problem with column as primary key that shouldn't be: 
/*ALTER TABLE `dellLaptops1`.`product_has_graphic_card`
DROP INDEX `PRIMARY`;*/

-- setting the intermediate  `product_has_graphic_card` table to don't accept duplicates
/*ALTER TABLE product_has_graphic_card
ADD CONSTRAINT unique_products_graphic_card
UNIQUE (products_id, graphic_card_id);*/

-- inserting register on product_has_graphic_card

INSERT INTO `product_has_graphic_card` (`products_id`,`graphic_card_id`) VALUES (1,1), (1,2), (1,3), (1,4), (1,5);
INSERT INTO `product_has_graphic_card` (`products_id`,`graphic_card_id`) VALUES (2,6),(2,5);
INSERT INTO `product_has_graphic_card` (`products_id`,`graphic_card_id`) VALUES (2,3), (2,2),(2,1);
INSERT INTO `product_has_graphic_card` (`products_id`,`graphic_card_id`) VALUES (3,3), (3,2);
INSERT INTO `product_has_graphic_card` (`products_id`,`graphic_card_id`) VALUES (4,3);
INSERT INTO `product_has_graphic_card` (`products_id`,`graphic_card_id`) VALUES (5,8),(5,9);

-- inserting register on  table memory and respective intermediate table:

 INSERT INTO `memory` (`memory_size`) VALUES (4),(8),(16),(32),(64);
 -- saw that the column  was accepting CHAR values instead of INT. deleting and changing it:
 DELETE FROM `memory` WHERE id < 6;
 ALTER TABLE `memory` MODIFY COLUMN memory_size INT; 
 INSERT INTO `memory` (`memory_size`) VALUES (4),(8),(16),(32),(64);
 
-- because of the previous problem I had to edit the id manually:
SET SQL_SAFE_UPDATES = 0;

SET @new_id = 0;
UPDATE `memory` SET id = @new_id:=@new_id+1;
 
 SET SQL_SAFE_UPDATES = 1;
 
INSERT INTO `product_has_memory` (`products_id`,`memory_id`) VALUES (1,2),(1,3);
INSERT INTO `product_has_memory` (`products_id`,`memory_id`) VALUES (2,2),(2,3);
INSERT INTO `product_has_memory` (`products_id`,`memory_id`) VALUES (3,2),(3,3),(3,1);
INSERT INTO `product_has_memory` (`products_id`,`memory_id`) VALUES (4,3),(4,4);
INSERT INTO `product_has_memory` (`products_id`,`memory_id`) VALUES (5,2),(5,3);

INSERT INTO `Resolution` (`resolution`) VALUES ('Full HD+'),('Full HD'),('Quad HD+'),('HD'),('Ultra HD+');

INSERT INTO `product_has_resolution` (`products_id`,`Resolution_id`) VALUES (1,1),(1,2);
INSERT INTO `product_has_resolution` (`products_id`,`Resolution_id`) VALUES (2,2),(2,3);
INSERT INTO `product_has_resolution` (`products_id`,`Resolution_id`) VALUES (3,2),(3,4);
INSERT INTO `product_has_resolution` (`products_id`,`Resolution_id`) VALUES (4,1),(4,5);
INSERT INTO `product_has_resolution` (`products_id`,`Resolution_id`) VALUES (5,2);

INSERT INTO `storage` (`storage_size`) VALUES (256),(512),(1000);

INSERT INTO `product_has_storage` (`products_id`,`storage_id`) VALUES (1,1),(1,2),(1,3);
INSERT INTO `product_has_storage` (`products_id`,`storage_id`) VALUES (2,1),(2,2),(2,3);
INSERT INTO `product_has_storage` (`products_id`,`storage_id`) VALUES (3,1),(3,2);
INSERT INTO `product_has_storage` (`products_id`,`storage_id`) VALUES (4,3);
INSERT INTO `product_has_storage` (`products_id`,`storage_id`) VALUES (5,1),(5,2),(5,3);

INSERT INTO `Color` (`color`) VALUES ('Preto'),('Cinza'),('Prata');

INSERT INTO `product_has_color` (`products_id`,`Color_id`) VALUES (1,1),(1,2);
INSERT INTO `product_has_color` (`products_id`,`Color_id`) VALUES (2,1),(2,3);
INSERT INTO `product_has_color` (`products_id`,`Color_id`) VALUES (3,1);
INSERT INTO `product_has_color` (`products_id`,`Color_id`) VALUES (4,2);
INSERT INTO `product_has_color` (`products_id`,`Color_id`) VALUES (5,1);
 
-- After noticing that the relationship between  products and product_has_graphic_card was not created or was undone, through some tests, 
-- now I will create the relationship:

/*ALTER TABLE product_has_graphic_card
ADD CONSTRAINT fk_product_has_graphic_card_products
FOREIGN KEY (products_id)
REFERENCES products (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;*/
