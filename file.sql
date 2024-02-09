create database swapnil;
use swapnil;
create table tutorials_tbl(
   tutorial_id INT NOT NULL,
   tutorial_title VARCHAR(100) NOT NULL,
   tutorial_author VARCHAR(40) NOT NULL
);
insert into tutorials_tbl values (1,'alpha','beta'),(2,'alpha1','beta2');
