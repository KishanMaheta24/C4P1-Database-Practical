USE orders;

-- user table created

-- CREATE TABLE user_details(
-- 	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
-- 	first_name VARCHAR(30) NOT NULL,
--     last_name VARCHAR(30) NOT NULL,
--     contact_no VARCHAR(10) NOT NULL,
--     address VARCHAR(255) NOT NULL,
--     email VARCHAR(50) NOT NULL,
--     gender VARCHAR(1) NOT NULL
-- );

-- ALTER TABLE user_details RENAME COLUMN GENDER to gender;


-- product

-- CREATE TABLE products(
-- 	product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     product_name VARCHAR(50) NOT NULL,
--     product_catagory VARCHAR(50) NOT NULL,
--     product_price INT NOT NULL,
--     product_description VARCHAR(100) NOT NULL
-- );


-- order

-- CREATE TABLE orders(
-- 	order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     order_user_id INT NOT NULL,
--     order_status VARCHAR(20) NOT NULL,
--     order_date DATE,
--     FOREIGN KEY(order_user_id) REFERENCES user_details(user_id) ON DELETE CASCADE
-- );

-- order details

-- CREATE TABLE order_details(
-- 	order_id INT NOT NULL,
--     product_id INT NOT NULL,
--     order_quantity INT NOT NULL,
--     expected_delivery VARCHAR(2),
--     FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
--     FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE CASCADE,
--     PRIMARY KEY(order_id,product_id)
-- )

-- INSERT INTO user_details (first_name,last_name,contact_no,address,email,gender) values ("kishan","maheta","1245654632","a/23 near iscon temple,ahm,india","mahetakishan01@gmal.com","M");
-- INSERT INTO user_details (first_name,last_name,contact_no,address,email,gender) values ("John","Doe","9991233365","a/24 near railway station,ahm,india","mahetakishan01@gmal.com","M");
-- INSERT INTO user_details (first_name,last_name,contact_no,address,email,gender) values ("hawk","eye","8887755566","6th floor, avengers building,new york","hawkeye@gmail.com","M");
-- INSERT INTO user_details (first_name,last_name,contact_no,address,email,gender) values ("wanda","vision","8887755566","8th floor, avengers building,new york","hawkeye@gmail.com","F");
-- INSERT INTO user_details (first_name,last_name,contact_no,address,email,gender) values ("tim","cook","9874563210","Apple headquarters,building no.1,xz street,california","timcook@apple.com","F");
-- INSERT INTO user_details (first_name,last_name,contact_no,address,email,gender) values ("virat","kohli","7774136525","A/123, xyz building,santa cruez, mumbai","viratkohli@bcci.com","F");
-- INSERT INTO user_details (first_name,last_name,contact_no,address,email,gender) values ("dummy1","surname1","7454136525","near xyz school, thaltej,ahmedabad.","dummysurname1@gmail.com","F");
-- INSERT INTO user_details (first_name,last_name,contact_no,address,email,gender) values ("dummy2","surname2","9876543210","near xyz school, vastrapur,ahmedabad.","dummysurname1@gmail.com","F");



-- INSERT INTO products (product_name,product_catagory,product_price,product_description) values("iphone 14","electronics",70000,"dummy description");
-- INSERT INTO products (product_name,product_catagory,product_price,product_description) values("Smart TV","electronics",40000,"dummy description");
-- INSERT INTO products (product_name,product_catagory,product_price,product_description) values("Nike Sneakers","fashion",5000,"dummy description");
-- INSERT INTO products (product_name,product_catagory,product_price,product_description) values("Men's Jeans","fashion",1000,"dummy description");
-- INSERT INTO products (product_name,product_catagory,product_price,product_description) values("laptop Table","accessories",4000,"dummy description");
-- INSERT INTO products (product_name,product_catagory,product_price,product_description) values("Queen Bed","Home Decor",4000,"dummy description");
-- INSERT INTO products (product_name,product_catagory,product_price,product_description) values("Table Lamps","Home Decor",3000,"dummy description");

-- INSERT INTO orders (order_date,order_user_id,order_status) values ("2023-02-10",1,"Dipatched");
-- INSERT INTO orders (order_date,order_user_id,order_status) values ("2023-01-26",1,"Delivered");
-- INSERT INTO orders (order_date,order_user_id,order_status) values ("2023-02-02",2,"Not Dispatched");
-- INSERT INTO orders (order_date,order_user_id,order_status) values ("2023-02-01",2,"Cancelled");
-- INSERT INTO orders (order_date,order_user_id,order_status) values ("2023-01-15",3,"Delivered");
-- INSERT INTO orders (order_date,order_user_id,order_status) values ("2023-01-20",4,"Delivered");
-- INSERT INTO orders (order_date,order_user_id,order_status) values ("2023-01-01",8,"Delivered");
-- INSERT INTO orders (order_date,order_user_id,order_status) values ("2023-01-31",1,"Dispatched");


-- ALTER TABLE order_details DROP COLUMN product_quantities;

-- INSERT INTO order_details(order_id,product_id,order_quantity,expected_delivery) values (1,1,2,"0");
--  INSERT INTO order_details(order_id,product_id,order_quantity,expected_delivery) values (2,7,1,"0");
-- INSERT INTO order_details(order_id,product_id,order_quantity,expected_delivery) values (3,3,2,"5");
-- INSERT INTO order_details(order_id,product_id,order_quantity,expected_delivery) values (4,4,5,"--");
-- INSERT INTO order_details(order_id,product_id,order_quantity,expected_delivery) values (5,5,1,"0");
-- INSERT INTO order_details(order_id,product_id,order_quantity,expected_delivery) values (6,2,1,"0");
-- INSERT INTO order_details(order_id,product_id,order_quantity,expected_delivery) values (7,1,1,"0");
-- INSERT INTO order_details(order_id,product_id,order_quantity,expected_delivery) values (8,2,1,"3");


-- QUARIES

-- 1. All undelivered Orders

-- SELECT order_id,first_name,last_name,order_date,order_status FROM orders 
-- INNER JOIN user_details ON order_user_id=user_id AND order_status NOT IN ("Delivered");

-- 2. top 5 recent orders

-- SELECT * FROM orders INNER JOIN user_details ON order_user_id=user_id ORDER BY order_date DESC LIMIT 5 ;

-- 3. top 5 active users

-- SELECT order_user_id,concat(first_name," ",last_name) as "name", count(order_user_id) from orders INNER JOIN user_details ON user_id=order_user_id GROUP BY order_user_id LIMIT 5;

-- 4. inactive users
-- SELECT * FROM user_details WHERE user_id NOT IN (SELECT DISTINCT order_user_id from orders) ;
-- SELECT * FROM user_details left join orders on user_id=order_user_id;

-- 5. top 5 purchased products
-- SELECT products.product_id,product_name,count(products.product_id) FROM products inner join order_details on products.product_id=order_details.product_id group by products.product_id LIMIT 5;

-- 6. Most expensive and cheapest orders
-- SELECT orders.order_id,user_details.user_id,user_details.first_name,products.product_id,product_name,order_details.order_quantity,(order_details.order_quantity*products.product_price) as "total" FROM user_details
-- inner join orders on user_details.user_id=orders.order_user_id
-- inner join order_details on orders.order_id=order_details.order_id
-- inner join products on products.product_id=order_details.product_id order by total DESC;

-- max
-- SELECT orders.order_id,MAX(order_details.order_quantity*products.product_price) as "total" FROM user_details
-- inner join orders on user_details.user_id=orders.order_user_id inner join order_details on orders.order_id=order_details.order_id inner join products on products.product_id=order_details.product_id GROUP BY orders.order_id LIMIT 1;
-- min
-- SELECT *,(order_details.order_quantity*products.product_price) as "total" FROM user_details
-- inner join orders on user_details.user_id=orders.order_user_id inner join order_details on orders.order_id=order_details.order_id inner join products on products.product_id=order_details.product_id order by total ASC  LIMIT 1 ;;