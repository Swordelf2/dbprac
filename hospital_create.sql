alter database hospital
    set datestyle to "ISO, DMY";

set datestyle to "ISO, DMY";

-- Clean the database
create database hospital with TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';

alter database hospital owner TO swordelf;

\connect hospital

-- Create table statements

create table Диагноз (
    Диагноз_ID integer primary key
    Название varchar(30) not null
    Описание varchar(300)
);

create table Специализация (
    Специализация_ID integer primary key,
    Название varchar(30) not null
);

create table Состояние (
    Состояние_ID integer primary key,
    Описание varchar(50) not null
);

create table Социальный_статус (
    Социальный_статус_ID integer primary key,
    Название varchar(30) not null
);

create table Вид_терапии (
    Вид_терапии_ID integer primary key,
    Название varchar(30),
    Описание varchar(300)
);

create table Врач (
    Врач_ID integer primary key,
    Фамилия varchar(30),
    Имя varchar(15),
    Отчество varchar(20),
    Стаж smallint,
    Время_начала time,
    Время_окончания time,
    Кабинет smallint
        constraint check (Время_начала <= Время_окончания)
);

create table Пациент (
    Пациент_ID integer primary key,
    Номер_полиса integer not null,
    Фамилия varchar(30),
    Имя varchar(15),
    Отчество varchar(20),
    Дата_рождения date not null,
    Социальный_статус_ID integer
        constraint check (Дата_рождения between
                1920 and current_date())
);

create table Лечение (
    Лечение_ID integer primary key,
    Пациент_ID integer,
    Диагноз_ID integer
);

create table Терапия (
    Лечение_ID integer,
    Вид_терапии_ID integer,
    Начало timestamp,
    Окончание timestamp
);

create table Прием (
    Прием_ID integer primary key,
    Терапия_ID integer,
    Врач_ID integer,
    Время_начала timestamp,
    Время_окончания timestamp
);


create table Врач_Специализация (
    Врач_ID integer,
    Специализация_ID integer,
        primary key(Врач_ID, Специализация_ID)
);
