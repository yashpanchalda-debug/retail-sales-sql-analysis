-- ============================================================
-- Retail Sales Database Schema + Seed Data
-- Compatible with SQLite
-- ============================================================

-- Drop tables if they exist (for easy re-runs)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- ============================================================
-- TABLE DEFINITIONS
-- ============================================================

CREATE TABLE customers (
    customer_id   INTEGER PRIMARY KEY,
    name          TEXT NOT NULL,
    email         TEXT,
    region        TEXT NOT NULL,
    joined_date   TEXT NOT NULL
);

CREATE TABLE products (
    product_id    INTEGER PRIMARY KEY,
    name          TEXT NOT NULL,
    category      TEXT NOT NULL,
    unit_price    REAL NOT NULL
);

CREATE TABLE orders (
    order_id      INTEGER PRIMARY KEY,
    customer_id   INTEGER NOT NULL,
    order_date    TEXT NOT NULL,
    status        TEXT NOT NULL DEFAULT 'completed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id       INTEGER PRIMARY KEY,
    order_id      INTEGER NOT NULL,
    product_id    INTEGER NOT NULL,
    quantity      INTEGER NOT NULL,
    unit_price    REAL NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================================
-- SEED DATA: CUSTOMERS (20 customers, 4 regions)
-- ============================================================

INSERT INTO customers VALUES
(1,  'Alice Martin',    'alice@email.com',   'North', '2022-01-15'),
(2,  'Bob Chen',        'bob@email.com',     'South', '2022-03-22'),
(3,  'Carol Davis',     'carol@email.com',   'East',  '2022-02-10'),
(4,  'Dan Wilson',      'dan@email.com',     'West',  '2022-04-05'),
(5,  'Eva Brown',       'eva@email.com',     'North', '2022-05-18'),
(6,  'Frank Lee',       'frank@email.com',   'East',  '2022-06-30'),
(7,  'Grace Kim',       'grace@email.com',   'South', '2022-07-14'),
(8,  'Henry Scott',     'henry@email.com',   'West',  '2022-08-09'),
(9,  'Isla Torres',     'isla@email.com',    'North', '2022-09-25'),
(10, 'Jake Murphy',     'jake@email.com',    'East',  '2022-10-11'),
(11, 'Karen White',     'karen@email.com',   'South', '2022-11-03'),
(12, 'Liam Johnson',    'liam@email.com',    'West',  '2022-12-19'),
(13, 'Mia Garcia',      'mia@email.com',     'North', '2023-01-07'),
(14, 'Noah Martinez',   'noah@email.com',    'East',  '2023-02-28'),
(15, 'Olivia Taylor',   'olivia@email.com',  'South', '2023-03-15'),
(16, 'Paul Anderson',   'paul@email.com',    'West',  '2023-04-20'),
(17, 'Quinn Thomas',    'quinn@email.com',   'North', '2023-05-05'),
(18, 'Rachel Harris',   'rachel@email.com',  'East',  '2023-06-12'),
(19, 'Sam Clark',       'sam@email.com',     'South', '2023-07-30'),
(20, 'Tina Lewis',      'tina@email.com',    'West',  '2023-08-22');

-- ============================================================
-- SEED DATA: PRODUCTS (20 products, 5 categories)
-- ============================================================

INSERT INTO products VALUES
(1,  'Laptop Pro 15',      'Electronics', 1299.99),
(2,  'Wireless Mouse',     'Electronics',   29.99),
(3,  'USB-C Hub',          'Electronics',   49.99),
(4,  'Mechanical Keyboard','Electronics',   89.99),
(5,  'Monitor 27"',        'Electronics',  349.99),
(6,  'Office Chair',       'Furniture',    299.99),
(7,  'Standing Desk',      'Furniture',    549.99),
(8,  'Bookshelf',          'Furniture',    179.99),
(9,  'Desk Lamp',          'Furniture',     39.99),
(10, 'File Cabinet',       'Furniture',    129.99),
(11, 'Running Shoes',      'Sports',        89.99),
(12, 'Yoga Mat',           'Sports',        34.99),
(13, 'Dumbbell Set',       'Sports',       129.99),
(14, 'Resistance Bands',   'Sports',        19.99),
(15, 'Water Bottle',       'Sports',        24.99),
(16, 'SQL for Beginners',  'Books',         29.99),
(17, 'Data Analysis Guide','Books',         39.99),
(18, 'Python Cookbook',    'Books',         44.99),
(19, 'Winter Jacket',      'Clothing',     119.99),
(20, 'Casual T-Shirt',     'Clothing',      24.99);

-- ============================================================
-- SEED DATA: ORDERS (50 orders across 2023)
-- ============================================================

INSERT INTO orders VALUES
(1,  1,  '2023-01-05', 'completed'),
(2,  3,  '2023-01-12', 'completed'),
(3,  5,  '2023-01-20', 'completed'),
(4,  2,  '2023-01-28', 'completed'),
(5,  7,  '2023-02-03', 'completed'),
(6,  9,  '2023-02-14', 'completed'),
(7,  11, '2023-02-22', 'completed'),
(8,  4,  '2023-03-01', 'completed'),
(9,  6,  '2023-03-10', 'completed'),
(10, 8,  '2023-03-18', 'completed'),
(11, 10, '2023-03-25', 'completed'),
(12, 12, '2023-04-02', 'completed'),
(13, 1,  '2023-04-09', 'completed'),
(14, 14, '2023-04-15', 'completed'),
(15, 2,  '2023-04-22', 'completed'),
(16, 16, '2023-05-01', 'completed'),
(17, 3,  '2023-05-11', 'completed'),
(18, 18, '2023-05-19', 'completed'),
(19, 5,  '2023-05-27', 'completed'),
(20, 7,  '2023-06-04', 'completed'),
(21, 9,  '2023-06-13', 'completed'),
(22, 20, '2023-06-21', 'completed'),
(23, 11, '2023-06-29', 'completed'),
(24, 13, '2023-07-07', 'completed'),
(25, 15, '2023-07-15', 'completed'),
(26, 17, '2023-07-24', 'completed'),
(27, 19, '2023-08-01', 'completed'),
(28, 4,  '2023-08-10', 'completed'),
(29, 6,  '2023-08-18', 'completed'),
(30, 8,  '2023-08-27', 'completed'),
(31, 10, '2023-09-04', 'completed'),
(32, 12, '2023-09-12', 'completed'),
(33, 14, '2023-09-20', 'completed'),
(34, 16, '2023-09-28', 'completed'),
(35, 1,  '2023-10-06', 'completed'),
(36, 2,  '2023-10-14', 'completed'),
(37, 3,  '2023-10-22', 'completed'),
(38, 18, '2023-10-30', 'completed'),
(39, 20, '2023-11-07', 'completed'),
(40, 5,  '2023-11-15', 'completed'),
(41, 7,  '2023-11-23', 'completed'),
(42, 9,  '2023-12-01', 'completed'),
(43, 11, '2023-12-09', 'completed'),
(44, 13, '2023-12-15', 'completed'),
(45, 15, '2023-12-20', 'completed'),
(46, 17, '2023-12-26', 'completed'),
(47, 19, '2023-12-28', 'completed'),
(48, 6,  '2023-11-30', 'completed'),
(49, 8,  '2023-12-05', 'completed'),
(50, 10, '2023-12-18', 'completed');

-- ============================================================
-- SEED DATA: ORDER ITEMS
-- ============================================================

INSERT INTO order_items VALUES
(1,  1,  1,  1, 1299.99),
(2,  1,  2,  2,   29.99),
(3,  2,  6,  1,  299.99),
(4,  2,  9,  2,   39.99),
(5,  3,  11, 1,   89.99),
(6,  3,  12, 1,   34.99),
(7,  4,  19, 2,  119.99),
(8,  4,  20, 3,   24.99),
(9,  5,  5,  1,  349.99),
(10, 5,  3,  1,   49.99),
(11, 6,  7,  1,  549.99),
(12, 7,  16, 2,   29.99),
(13, 7,  17, 1,   39.99),
(14, 8,  1,  1, 1299.99),
(15, 8,  4,  1,   89.99),
(16, 9,  13, 1,  129.99),
(17, 9,  14, 2,   19.99),
(18, 10, 8,  1,  179.99),
(19, 10, 10, 1,  129.99),
(20, 11, 18, 1,   44.99),
(21, 11, 20, 2,   24.99),
(22, 12, 5,  1,  349.99),
(23, 12, 3,  2,   49.99),
(24, 13, 19, 1,  119.99),
(25, 14, 6,  2,  299.99),
(26, 14, 9,  1,   39.99),
(27, 15, 11, 2,   89.99),
(28, 15, 15, 3,