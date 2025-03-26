CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE items (
    id INT PRIMARY KEY AUTO_INCREMENT,  
    type ENUM('sword', 'shield', 'armor') NOT NULL,  
    name VARCHAR(255) NOT NULL  
);

CREATE TABLE accounts_items (
    account_id INT,
    item_id INT,
    quality ENUM('common', 'rare', 'epic'),
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (item_id) REFERENCES items(id)
);