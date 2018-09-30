alter database hospital
    set datestyle to "ISO, DMY";

set datestyle to "ISO, DMY";

create table Лечение (
    Лечение_ID integer primary key,
    Пациент_ID integer,
    Врач_ID integer,
    Дата_начала date,
    Дата_окончания date,
    Диагноз varchar(300),
    Состояние_ID integer
);

create table Прием (
    Прием_ID integer primary key,
    Лечение_ID integer,
    Кабинет integer,
    Время_начала timestamp,
    Время_окончания timestamp
);

create table Врач (
    Врач_ID integer primary key,
    Фамилия varchar(30),
    Имя varchar(15),
    Отчество varchar(20)
);

create table Специализация (
    Специализация_ID integer primary key,
    Название varchar(30)
);

create table Врач_Специализация (
    Врач_ID integer,
    Специализация_ID integer,
        primary key(Врач_ID, Специализация_ID)
);

create table Пациент (
    Пациент_ID integer primary key,
    Номер_полиса integer not null,
    Фамилия varchar(30),
    Имя varchar(15),
    Отчество varchar(20),
    Год_рождения smallint,
    Социальный_статус_ID integer
);

create table Состояние (
    Состояние_ID integer primary key,
    Описание varchar(50)
);

create table Социальный_статус (
    Социальный_статус_ID integer primary key,
    Описание varchar(50)
);

alter table Лечение 
    add foreign key (Пациент_ID)
        references Пациент(Пациент_ID)
