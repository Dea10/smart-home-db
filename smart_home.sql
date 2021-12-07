DROP DATABASE IF EXISTS smart_home;
CREATE DATABASE IF NOT EXISTS smart_home;
USE smart_home;

-- User status catalog
CREATE TABLE IF NOT EXISTS UserStatusCat (
    id_user_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_status VARCHAR(255)
);

-- User
CREATE TABLE IF NOT EXISTS User (
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_first_name VARCHAR(255) NOT NULL,
    user_last_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    id_user_status INT NOT NULL,
    FOREIGN KEY (id_user_status) REFERENCES UserStatusCat(id_user_status)
);

-- House status catalog
CREATE TABLE IF NOT EXISTS HouseStatusCat (
    id_house_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    house_status VARCHAR(255) NOT NULL
);

-- House
CREATE TABLE IF NOT EXISTS House (
    id_house INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    house_name VARCHAR(255) NOT NULL DEFAULT 'my new house',
    house_desc VARCHAR(255) DEFAULT 'house desc',
    id_house_status INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES User(id_user),
    FOREIGN KEY (id_house_status) REFERENCES HouseStatusCat(id_house_status)
);

-- Room status catalog
CREATE TABLE IF NOT EXISTS RoomStatusCat (
    id_room_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    room_status VARCHAR(255) NOT NULL
);

-- Room
CREATE TABLE IF NOT EXISTS Room (
    id_room INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_house INT NOT NULL,
    room_name VARCHAR(255) NOT NULL DEFAULT 'my new room',
    room_desc VARCHAR(255) DEFAULT 'room desc',
    id_room_status INT NOT NULL,
    FOREIGN KEY (id_house) REFERENCES House(id_house),
    FOREIGN KEY (id_room_status) REFERENCES RoomStatusCat(id_room_status)
);

-- Device status catalog
CREATE TABLE IF NOT EXISTS DeviceStatusCat (
    id_device_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    device_status VARCHAR(255) NOT NULL
);

-- Device
CREATE TABLE IF NOT EXISTS Device (
    id_device INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_room INT NOT NULL,
    device_name VARCHAR(255) NOT NULL DEFAULT 'my new device',
    device_desc VARCHAR(255) DEFAULT 'device desc',
    id_device_status INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_room) REFERENCES Room(id_room),
    FOREIGN KEY (id_device_status) REFERENCES DeviceStatusCat(id_device_status)
);
