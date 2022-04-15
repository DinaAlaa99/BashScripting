CREATE DATABASE lab3;

************************

CREATE TABLE inv_master (
       id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
       custname VARCHAR(30) NOT NULL,
       invdate date,
       invtotal INT(10)
        );

************************

create table inv_details(
     id int(6) AUTO_INCREMENT ,
     itemname varchar(30),
     invid int(6) UNSIGNED,
     quantity int(6),
     unitprice int(6),
     primary key (id),
     foreign key (invid) references inv_master(id)
     );
