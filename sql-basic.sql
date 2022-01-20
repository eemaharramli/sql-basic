create database Library
use Library

create table Books(
    Id int primary key identity ,
    Name nvarchar(50) not null unique ,
    Author nvarchar(50) not null ,
    Price float not null ,
    UpdatedBy nvarchar(20) not null ,
    UpdatedDate date default getdate()
)

select *
from Books;

drop table Books

insert into Books(Name, Author, Price, UpdatedBy) values ('Prestuplenie i nakazanie', 'Fedor Dostoyevskiy', 9.90, 'Elnur'),
                                                         ('Anna Karenina', 'Lev Tolstoy', 12.50, 'Abbas'),
                                                         ('Bratya Karamazovi', 'Fedor Dostoyevskiy', 21.20, 'Orxan'),
                                                         ('Voyna i Mir', 'Lev Tolstoy', 30.00, 'Sabir'),
                                                         ('Master i Marqarita', 'Mixail Bulqakov', 52.10, 'Akif'),
                                                         ('Mertvie Dushi', 'Nikolay Qoqol', 43.40, 'Xeyali'),
                                                         ('Yevgeniy Onegin', 'Aleksandr Pushkin', 33.30, 'Madat');

-- 1. Adinda a herfi olan

select *
from Books
where Name like '%a%';

-- 2. Kitabin adina gore sort ele

select *
from Books
order by Name;

-- 3. Qiymeti 10 AZN-den chox olanlar

select *
from Books
where Price > 10
order by Name desc ;