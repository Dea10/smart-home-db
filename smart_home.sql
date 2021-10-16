CREATE DATABASE IF NOT EXISTS smart_home;
USE smart_home;

-- User
CREATE TABLE IF NOT EXISTS User (
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_first_name VARCHAR(255) NOT NULL,
    user_last_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL
);

-- House
CREATE TABLE IF NOT EXISTS House (
    id_house INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    house_name VARCHAR(255) NOT NULL DEFAULT 'my new house',
    house_desc VARCHAR(255) DEFAULT 'house desc',
    FOREIGN KEY (id_user) REFERENCES User(id_user)
);

-- Room
CREATE TABLE IF NOT EXISTS Room (
    id_room INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_house INT NOT NULL,
    room_name VARCHAR(255) NOT NULL DEFAULT 'my new room',
    room_desc VARCHAR(255) DEFAULT 'room desc',
    FOREIGN KEY (id_house) REFERENCES House(id_house)
);

-- DeviceStatus Cat
CREATE TABLE IF NOT EXISTS DeviceStatus (
    id_device_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(255) NOT NULL,
    status_desc VARCHAR(255)
);

-- Device
CREATE TABLE IF NOT EXISTS Device (
    id_device INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_room INT NOT NULL,
    device_name VARCHAR(255) NOT NULL DEFAULT 'my new device',
    device_desc VARCHAR(255) DEFAULT 'device desc',
    id_device_status INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_room) REFERENCES Room(id_room),
    FOREIGN KEY (id_device_status) REFERENCES DeviceStatus(id_device_status)
);

-- INSERT
-- INSERT INTO User(user_name, user_email, user_first_name, user_last_name, user_password) VALUES('dea','mail','daniel','espinosa','123');
-- INSERT INTO User(user_name, user_email, user_first_name, user_last_name, user_password) VALUES('new','mail','new','new','123');