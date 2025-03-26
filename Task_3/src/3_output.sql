CREATE VIEW v1 AS
SELECT 
    ai.account_id,
    a.username,
    i.type,
    MAX(ai.quality) AS best_quality
FROM 
    accounts_items ai 
JOIN 
    items i ON ai.item_id = i.id 
JOIN 
    accounts a ON ai.account_id = a.id
GROUP BY 
    ai.account_id, a.username, i.type
ORDER BY 
    ai.account_id, i.type;


CREATE VIEW v2 AS
SELECT 
    ai.account_id,
    i.type,
    i.name,
    ai.quality
FROM 
    accounts_items ai
JOIN 
    items i ON ai.item_id = i.id;


SELECT 
    v1.username AS username,
    v1.type AS type,
    v1.best_quality as advised_type,
    GROUP_CONCAT(DISTINCT v2.name ORDER BY v2.name SEPARATOR ', ') AS advised_names
FROM 
    v1 
JOIN 
    v2 ON 
    v1.account_id = v2.account_id AND
    v1.type = v2.type AND
    v1.best_quality = v2.quality
GROUP BY 
    v1.username, v1.type, v1.best_quality
ORDER BY 
    v1.username, v1.type;