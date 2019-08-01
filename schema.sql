CREATE DATABASE wizard

CREATE TABLE users (
    id serial primary key,
    user_name varchar(20),
    password_digest varchar(100),
    avatar varchar(200);
);

CREATE TABLE messages (
    message_id serial primary key,
    sender_id int,
    reciver_id int,
    subject varchar(100),
    body text
);

CREATE TABLE auctions (
    auction_id serial primary key,
    seller_id int,
    item_id int,
    sell_price int
);

CREATE TABLE items (
    item_id serial primary key,
    owner_id int,
    item_name varchar(100),
    item_image varchar(100)
);
