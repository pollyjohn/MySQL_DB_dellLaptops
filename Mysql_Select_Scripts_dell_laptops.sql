USE dellLaptops;

SELECT * FROM products;

SELECT products. product_name, screen_size.size FROM product_has_screen_size
INNER JOIN products on product_has_screen_size.product_id = products.id
INNER JOIN screen_size ON product_has_screen_size.screen_size_id = screen_size.id
ORDER BY size;

SELECT product_name, graphic_card_model,products_id,graphic_card_id FROM product_has_graphic_card
INNER JOIN products
ON product_has_graphic_card.products_id = products.id
INNER JOIN graphic_cards
ON product_has_graphic_card.graphic_card_id = graphic_cards.id;

SELECT * FROM `memory`;
SELECT * FROM products;
SELECT * FROM product_has_resolution;
SELECT * FROM Resolution;
SELECT * FROM product_has_color; 

SELECT product_name, memory_size, products_id, memory_id FROM product_has_memory
INNER JOIN products
ON product_has_memory.products_id = products.id
INNER JOIN `memory`
ON product_has_memory.memory_id = `memory`.id;

SELECT product_name, resolution,products_id,Resolution_id FROM product_has_resolution
INNER JOIN products
ON product_has_resolution.products_id = products.id
INNER JOIN Resolution
ON product_has_resolution.Resolution_id = Resolution.id;

SELECT product_name, storage_size,products_id,storage_id FROM product_has_storage
INNER JOIN products
ON product_has_storage.products_id = products.id
INNER JOIN storage
ON product_has_storage.storage_id = storage.id
ORDER BY product_name;

SELECT product_name, color,products_id,color_id FROM product_has_color
INNER JOIN products
ON product_has_color.products_id = products.id
INNER JOIN Color
ON product_has_color.color_id = Color.id
ORDER BY product_name;

SELECT product_name, size,product_id,screen_size_id FROM product_has_screen_size
INNER JOIN products
ON product_has_screen_size.product_id = products.id
INNER JOIN screen_size
ON product_has_screen_size.screen_size_id = screen_size.id
ORDER BY product_name;

SELECT product_name, graphic_card_model,products_id,graphic_card_id FROM product_has_graphic_card
INNER JOIN products
ON product_has_graphic_card.products_id = products.id
INNER JOIN graphic_cards
ON product_has_graphic_card.graphic_card_id = graphic_cards.id
ORDER BY product_name;

-- 		I did some reverse engineering on the current table and noticed on the schema and model that one relationship did not exist. Vizualing foreing keys
-- to double check.

SELECT
    CONSTRAINT_NAME,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    information_schema.KEY_COLUMN_USAGE
WHERE
    TABLE_SCHEMA = 'dellLaptops' AND
    REFERENCED_TABLE_NAME IS NOT NULL;
    
SELECT
    p.product_name,
    g.graphic_card_model,
    pr.processor_gen_platform,
    m.memory_size,
    s.storage_size,
    ss.size,
    r.resolution,
    c.color
FROM products p
JOIN product_has_graphic_card pg ON p.id = pg.products_id
JOIN graphic_cards g ON pg.graphic_card_id = g.id
JOIN product_has_processor pp ON p.id = pp.products_id
JOIN processor pr ON pp.processor_id = pr.id
JOIN product_has_memory pm ON p.id = pm.products_id
JOIN memory m ON pm.memory_id = m.id
JOIN product_has_storage ps ON p.id = ps.products_id
JOIN storage s ON ps.storage_id = s.id
JOIN product_has_screen_size pss ON p.id = pss.product_id
JOIN screen_size ss ON pss.screen_size_id = ss.id
JOIN product_has_resolution prs ON p.id = prs.products_id
JOIN Resolution r ON prs.Resolution_id = r.id
JOIN product_has_color pc ON p.id = pc.products_id
JOIN Color c ON pc.Color_id = c.id;

