create database if not exists movie_booking ;
use movie_booking;
create table `role`(
`id` int primary key auto_increment,
`name` varchar(250) not null
);
create table `user`(
`id` int primary key auto_increment,
`code` varchar(45) unique not null,
`full_name` varchar(250) not null,
`card_id` varchar(45) not null,
`date_of_birth` date not null,
`email` varchar(250) not null,
`address` varchar(250),
`password` varchar(45) not null,
`gender` boolean not null,
`status` boolean not null,
`phone_number` varchar(40),
`role_id` int,
foreign key (`role_id`) references `role`(id)
);
create table kind_of_film(
	id int primary key auto_increment,
    `name` varchar(45) not null
    );
create table status_film(
	id int primary key auto_increment,
    `name` varchar(45) not null
    );
create table movie(
	id int primary key auto_increment,
    `movie_name` varchar(250),
    `release_date` time not null,
    `duration` varchar(45) not null,
    actor varchar(255) not null,
    director varchar(255) not null,
    studio varchar(255) not null,
    content varchar(255) not null,
    trailer varchar(255) not null,
    avatar varchar(255) not null,
	status_film_id int not null,
	kind_of_film_id int not null,
	foreign key (`status_film_id`) references `status_film`(id),
	foreign key (`kind_of_film_id`) references `kind_of_film`(id)
);
CREATE TABLE room (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `room_name` VARCHAR(45) NOT NULL,
  `quality_seat` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL
);

CREATE TABLE seat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `seat_number` VARCHAR(45) NOT NULL,
    `description` TEXT,
    `room_id` int,
    `price` int ,
    foreign key (`room_id`) references `room`(id)
);
create table showtime(
	id int primary key auto_increment,
    movie_id int not null,
    room_id int not null,
    show_date date not null,
    start_time datetime not null,
    foreign key (`movie_id`) references `movie`(id),
    foreign key (`room_id`) references `room`(id)
);
create table `booking_status`(
id int primary key auto_increment,
`name` varchar(45));
create table `booking`(
id int primary key auto_increment,
`code_booking` varchar(45) unique not null,
`date_booking` varchar(45) not null,
`total_amount` double not null,
`booking_status_id` int,
`user_id` int,
`showtime_id` int,
`seat_id` int,
foreign key (`showtime_id`) references `showtime`(id),
foreign key (`seat_id`) references `seat`(id),
foreign key (`booking_status_id`) references `booking_status`(id),
foreign key (`user_id`) references `user`(id)
);
