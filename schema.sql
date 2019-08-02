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
    id serial primary key,
    owner_id int,
    name varchar(100),
    image varchar(100),
    status varchar(100),
    auction_price int
);

ALTER TABLE users
ADD gold int;

item = Item.new;
item.owner_id = 20;
item.name = 'Ancient scroll of fart jokes';
item.image = '/assets/scroll_1.png';
item.status = 'inventory';
item.auction_price = 0;
item.save;