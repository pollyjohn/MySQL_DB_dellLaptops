USE dellLaptops;

SELECT * FROM Orders;

INSERT INTO `dellLaptops`.`Orders` (
  `product_name`,
  `graphic_card_model`,
  `processor_gen_platform`,
  `memory_size`,
  `storage_size`,
  `screen_size`,
  `resolution`,
  `color`,
  `graphic_card_id`,
  `processor_id`,
  `memory_id`,
  `storage_id`,
  `screen_size_id`,
  `resolution_id`,
  `color_id`
)
SELECT
  p.`product_name`,
  gc.`graphic_card_model`,
  pr.`processor_gen_platform`,
  m.`memory_size`,
  s.`storage_size`,
  ss.`size`,
  r.`resolution`,
  c.`color`,
  p_c.`Color_id`,
  p_pr.`processor_id`,
  p_m.`memory_id`,
  p_s.`storage_id`,
  p_ss.`screen_size_id`,
  p_r.`Resolution_id`,
  p_c2.`Color_id`
FROM
  `dellLaptops`.`products` p
JOIN
  `dellLaptops`.`product_has_graphic_card` p_gc ON p.`id` = p_gc.`products_id`
JOIN
  `dellLaptops`.`graphic_cards` gc ON p_gc.`graphic_card_id` = gc.`id`
JOIN
  `dellLaptops`.`product_has_processor` p_pr ON p.`id` = p_pr.`products_id`
JOIN
  `dellLaptops`.`processor` pr ON p_pr.`processor_id` = pr.`id`
JOIN
  `dellLaptops`.`product_has_memory` p_m ON p.`id` = p_m.`products_id`
JOIN
  `dellLaptops`.`memory` m ON p_m.`memory_id` = m.`id`
JOIN
  `dellLaptops`.`product_has_storage` p_s ON p.`id` = p_s.`products_id`
JOIN
  `dellLaptops`.`storage` s ON p_s.`storage_id` = s.`id`
JOIN
  `dellLaptops`.`product_has_screen_size` p_ss ON p.`id` = p_ss.`product_id`
JOIN
  `dellLaptops`.`screen_size` ss ON p_ss.`screen_size_id` = ss.`id`
JOIN
  `dellLaptops`.`product_has_resolution` p_r ON p.`id` = p_r.`products_id`
JOIN
  `dellLaptops`.`Resolution` r ON p_r.`Resolution_id` = r.`id`
JOIN
  `dellLaptops`.`product_has_color` p_c ON p.`id` = p_c.`products_id`
JOIN
  `dellLaptops`.`Color` c ON p_c.`Color_id` = c.`id`
JOIN
  `dellLaptops`.`product_has_color` p_c2 ON p.`id` = p_c2.`products_id`
JOIN
  `dellLaptops`.`Color` c2 ON p_c2.`Color_id` = c2.`id`;