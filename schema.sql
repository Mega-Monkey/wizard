CREATE DATABASE wizard

CREATE TABLE users (
    id serial primary key,
    user_name varchar(20),
    password_digest varchar(100),
    avatar varchar(200);
);

CREATE TABLE messages (
    message_id serial primary key,
    sent varchar(100),
    recived varchar(100),
    body text
);