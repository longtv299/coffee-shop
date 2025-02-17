CREATE DATABASE coffeeshop
GO
USE coffeeshop
GO

CREATE TABLE Category (
    categoryID CHAR(6) NOT NULL,
    name VARCHAR(20) NOT NULL,
    parentID CHAR(6),

    CONSTRAINT Category_pk PRIMARY KEY (categoryID)
)
GO

CREATE TABLE Product (
    productID CHAR(9) NOT NULL,
    categoryID CHAR(6) NOT NULL,
    name VARCHAR(30) NOT NULL,
    description varchar(1000),
    image VARCHAR(150),
    rating FLOAT,
    
    CONSTRAINT Product_pk PRIMARY KEY (productID),
    CONSTRAINT Product_fk_Category FOREIGN KEY (categoryID)
        REFERENCES Category (categoryID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
GO

CREATE TABLE ProductItem (
    productItemID INT NOT NULL IDENTITY(1,1),
    productID CHAR(9) NOT NULL,
    size VARCHAR(20) NOT NULL,
    quantity INT,
    price FLOAT,

    CONSTRAINT ProductItem_pk PRIMARY KEY (productItemID),
    CONSTRAINT ProductItem_fk_Product FOREIGN KEY (productID)
        REFERENCES Product(productID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
GO

CREATE TABLE Customer (
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    fullname NVARCHAR(100) NOT NULL,
    address NVARCHAR(150) NOT NULL,
    phone CHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    
    CONSTRAINT Customer_pk PRIMARY KEY (username)
)
GO


-- insert data
INSERT INTO Category (categoryID, name, parentID)
VALUES  ('COFT00', 'Coffee', NULL),
        ('TEAT00', 'Tea', NULL),
        ('CAKT00', 'Cake', NULL),
        ('COFT01', 'Blend', 'COF000'),
        ('COFT02', 'Collaboration', 'COF000'),
        ('COFT03', 'Single Origin', 'COF000'),
        ('COFT04', 'Steeped', 'COF000'),
        ('TEAT01', 'Black tea', 'TEA000'),
        ('TEAT02', 'Green tea', 'TEA000'),
        ('TEAT03', 'Caffeine tea', 'TEA000'),
        ('TEAT04', 'White tea', 'TEA000'),
        ('TEAT05', 'Matcha tea', 'TEA000'),
        ('CAKT01', 'Vegan Cakes', 'CAK000'),
        ('CAKT02', 'Heart Shaped Cakes', 'CAK000'),
        ('CAKT03', 'Party Cakes', 'CAK000'),
        ('CAKT04', 'Midnight Cakes', 'CAK000')
GO

INSERT INTO Product (productID, categoryID, name, description)
VALUES  ('COFT01P01', 'COFT01', 'Blue Boy', 'Blue Boy is made of a blend of Guatemala, Ixlama and Colombia, Frontera de Planadas. The Guatemalan component is the culmination of work by over 100 family producers in the Guatemalan municipalities of San Pedro Necta and La Libertad in the department of Huehuetenango, a region known for rugged landscapes and high elevation. The Colombian component is sourced from several small quality farms in Colombias'' Tolima region. Together they form a classic blend.'),
        ('COFT01P02', 'COFT01', 'Belly Warmer', 'Belly Warmer is made up of equal parts Costa Rica, La Pastora and Brazil, Dulce Signature. The Costa Rican component is brought to us from the CoopeTarrazu cooperative group in the San Jose province of Costa Rica. The co-op represents over 3,500 partners in the province, and is committed to the welfare of those partners and their communities. The Brazilian component is the culmination of work by two female producers in the S ão Palo region of Brazil. Together they make Belly Warmer, a laid-back blend geared for nostalgia.'),
        ('COFT01P03', 'COFT01', 'Play Nice', 'We wanted to create a blend that would be friendly to everyones taste. A coffee that would taste great as espresso, be pleasant as morning cup of drip coffee, and stand up well in your espresso + milk. This is currently consisting of our Honduras El Rincon Del Sabor and our natural Ethiopia Sidama.'),
		('COFT03P01', 'COFT03', 'Ethiopia, Dur Feres', 'All coffee falls somewhere on a grading scale. Coffees scoring higher than an 80 is deemed specialty grade, and these coffees make up around 5% of the total coffee market. The 88+ scoring coffees are the easiest to sell due to their interesting flavor profiles and they also bring the highest profits. But farmers then have to find buyers for the rest of their lot which is typically the majority of their crop. This is where Michael McIntyre comes into the story. Michael developed Dur Feres, a carefully selected blend of coffee from families and communities where the highest priced lots have already been sold. Dur Feres offers the same level of traceability, organic certification, and iconic Ethiopian flavor profile, but provides a steady rotation of fresh crop and a dependable flavor profile for buyers. Truly a clever solution to a sustainability problem.'),
		('TEAT01P01', 'TEAT01', 'Black Plum Tea', 'Black Plum was created as a part of the Zadiko Tea Company partnership with Zach Kornfeld of The Try Guys. Yeah, Black Plum is delicious hot. But have you tried it iced? Whether you are pouring a steeped cup over cubes (3-5 minutes at 206°) or - our fave - cold brewing it in the fridge overnight, there is something about this iced that just hits right. Life is good when you have got a cup of the sweet stuff by your side. Know this: the best is yet to plum.'),
        ('TEAT01P02', 'TEAT01', 'Chaga Chai Mushroom Tea', 'A balanced and grounding black tea blend, this twist on our best-selling Tali''s Masala Chai is certain to delight all of your senses. Chaga Chai is a fusion of organic Assam tea that is hand blended together with ashwagandha, Chaga mushroom, and fragrant spices. With smooth and earthy flavor notes, this blend provides a well-rounded cup for each brew.'),
		('TEAT02P01', 'TEAT02', 'Matcha Cocoa', 'Introducing Matcha Cocoa, a delicious and energizing blend of Grade A Matcha with Cocoa Rouge Unsweetened Cocoa Powder from iconic Bay Area-based Guittard Chocolate Company. The resulting beverage is rich, balanced, and perfect for cozying up. Looking for an even more indulgent treat? Our Matcha Cocoa Bundle pairs Matcha Cocoa with custom hand-crafted “matchamallows” from Little Flower Candy Co. This bundle is only available in a limited release, grab yours today!')
GO

INSERT INTO ProductItem (productID, size, quantity, price)
VALUES  ('COFT01P01', '12oz', 15, 17.00),
		-- ('COFT01P01', '2lb', 10, 40.00),
		-- ('COFT01P01', '5lb', 12, 78.00),
		('COFT01P02', '12oz', 15, 17.00),		
		-- ('COFT01P02', '2lb', 18, 36.00),		
		-- ('COFT01P02', '5lb', 15, 77.00),
		('COFT01P03', '12oz', 11, 18.00),
		-- ('COFT01P03', '2lb', 10, 40.00),
		-- ('COFT01P03', '5lb', 3, 79.00),
		('COFT03P01', '12oz', 5, 18.50),
		-- ('COFT03P01', '2lb', 3, 41.00),
		-- ('COFT03P01', '5lb', 10, 90.00),
		('TEAT01P01', '3oz', 9, 20.00),
		-- ('TEAT01P01', '4oz', 7, 29.99),
		-- ('TEAT01P02', '3oz', 29, 20.00),
		('TEAT01P02', '4oz', 21, 32.00),
		-- ('TEAT01P02', '1lb', 5, 106.00),
		-- ('TEAT02P01', '8oz', 6, 37.00),
		('TEAT02P01', '10oz', 12, 45.00)
GO

-- create procedures
CREATE PROC getAllProductGeneralInfoByID
@productID CHAR(9)
AS
SELECT p.productID, p.name, i.price, i.size, c.parentID
FROM Category c JOIN Product p ON c.categoryID = p.categoryID
	 JOIN ProductItem i ON p.productID = i.productID
WHERE p.productID = @productID
GO

CREATE PROC getProductGeneralInfo AS
SELECT p.productID, p.name, i.price, i.size, c.parentID
FROM Category c JOIN Product p ON c.categoryID = p.categoryID
	 JOIN ProductItem i ON p.productID = i.productID
