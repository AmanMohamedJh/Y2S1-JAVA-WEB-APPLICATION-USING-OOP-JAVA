


use HotelReservation;



/*first one*/
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    hotel_id INT,
    checkin DATE,
    checkout DATE,
    rooms INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(CustomerID),
    FOREIGN KEY (hotel_id) REFERENCES hotel_list(hotel_id)
);






SELECT * FROM hotelreservation.customer;
SELECT * from hotel_list;
SELECT * FROM hotelreservation.booking;


SELECT `customer`.`CustomerID`,
    `customer`.`CusName`,
    `customer`.`CusEmail`,
    `customer`.`UserName`,
    `customer`.`Password`,
    `customer`.`Phone`,
    `customer`.`Address`
FROM `hotelreservation`.`customer`;




INSERT INTO hotel_list (hotel_id, hotel_name, room_type, price, rating, review_count, location, description)
VALUES 
(1, 'Ocean View Resort', 'Deluxe', 150.00, 4.5, 230, 'Miami Beach, FL', 'A luxury resort with breathtaking ocean views and modern amenities.'),
(2, 'Mountain Lodge', 'Suite', 200.00, 4.7, 180, 'Aspen, CO', 'Cozy lodge nestled in the mountains, perfect for winter sports enthusiasts.'),
(3, 'City Center Hotel', 'Standard', 120.00, 4.3, 320, 'New York, NY', 'Conveniently located in the heart of the city, with easy access to shopping and dining.'),
(4, 'Lakeside Inn', 'Executive', 180.00, 4.8, 150, 'Lake Tahoe, CA', 'A quiet, peaceful inn by the lake, ideal for relaxation and water activities.'),
(5, 'Desert Oasis', 'Villa', 250.00, 4.6, 210, 'Palm Springs, CA', 'A luxurious desert retreat with private villas and a world-class spa.');

INSERT INTO hotel_list (hotel_id, hotel_name, room_type, price, rating, review_count, location, description)
VALUES 
(6, 'Tropical Paradise Resort', 'Bungalow', 220.00, 4.9, 195, 'Maui, HI', 'Experience a serene getaway with private bungalows and pristine beaches.'),
(7, 'Ski Haven', 'Suite', 300.00, 4.7, 160, 'Whistler, BC', 'A premier ski-in/ski-out resort with luxurious suites and breathtaking mountain views.'),
(8, 'Urban Chic Hotel', 'Penthouse', 350.00, 4.5, 140, 'San Francisco, CA', 'Modern, stylish penthouse suites with panoramic city views and high-end amenities.'),
(9, 'Historic Grand Hotel', 'King', 175.00, 4.4, 250, 'Charleston, SC', 'A beautifully restored historic hotel with Southern charm and elegance.'),
(10, 'Beachfront Villas', 'Villa', 400.00, 4.9, 120, 'Malibu, CA', 'Luxury beachfront villas with private pools and direct access to the beach.');


SELECT * FROM hotelreservation.bookings;



CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    hotel_name VARCHAR(100),
    checkin_date DATE,
    checkout_date DATE,
    room_type VARCHAR(50),
    price DECIMAL(10, 2),
    FOREIGN KEY (hotel_id) REFERENCES hotel_list(hotel_id)
);

CREATE TABLE hotel_list (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    rating FLOAT CHECK (rating BETWEEN 0 AND 5),
    review_count INT DEFAULT 0,
    location VARCHAR(100) NOT NULL,
    description TEXT
);


SELECT * FROM hotelreservation.bookings;



/*2nd one again without hotelid*/
CREATE TABLE booking (
    booking_id INT(11) NOT NULL AUTO_INCREMENT,
    customer_id INT(11),
    num_of_rooms INT(11),
    checkin_date DATE,
    checkout_date DATE,
    room_type VARCHAR(50),
    total_cost DECIMAL(10, 2),
    PRIMARY KEY (booking_id),
    FOREIGN KEY (customer_id) REFERENCES customer(CustomerID)
);



SELECT * FROM hotelreservation.hotel_list;
SELECT * FROM hotelreservation.customer;
SELECT * FROM hotelreservation.booking;
SELECT * FROM hotelreservation.feedback;
use hotelreservation;



CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Hotel VARCHAR(255) NOT NULL,  
    Feedback TEXT NOT NULL
);

SELECT Phone, Address FROM customer WHERE UserName='RAMZY';
