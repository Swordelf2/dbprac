-- Clean the database
drop database hospital;
create database hospital with TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
alter database hospital owner TO swordelf;
\connect hospital

-- "Create table" statements
alter database hospital
    set datestyle to "ISO, DMY";

set datestyle to "ISO, DMY";

create table Диагноз (
    Диагноз_ID integer primary key,
    Название varchar(80) not null,
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
    Кабинет smallint,
        constraint check_time check (Время_начала <= Время_окончания),
        constraint check_cab check (Кабинет is null or
            Кабинет between 1 and 400)
);

create table Пациент (
    Пациент_ID integer primary key,
    Номер_полиса integer not null,
    Фамилия varchar(30),
    Имя varchar(15),
    Отчество varchar(20),
    Дата_рождения date not null,
    Социальный_статус_ID integer,
        constraint check_date check (Дата_рождения between
                '1918-01-01' and current_date)
);

create table Лечение (
    Лечение_ID integer primary key,
    Пациент_ID integer,
    Диагноз_ID integer
);

create table Терапия (
    Терапия_ID integer primary key,
    Лечение_ID integer,
    Вид_терапии_ID integer,
    Начало date,
    Окончание date
);

create table Прием (
    Прием_ID integer primary key,
    Терапия_ID integer,
    Врач_ID integer,
    Время_начала timestamp,
    Время_окончания timestamp
);

create table История_болезней (
    Пациент_ID integer,
    Дата_изменения date,
    Состояние_ID integer,
        primary key(Пациент_ID, Дата_изменения)
);

create table Врач_Специализация (
    Врач_ID integer,
    Специализация_ID integer,
        primary key(Врач_ID, Специализация_ID)
);

-- alter statements
alter table Пациент
    add foreign key (Социальный_статус_ID)
        references Социальный_статус(Социальный_статус_ID);

alter table Лечение
    add foreign key (Пациент_ID)
        references Пациент(Пациент_ID),
    add foreign key (Диагноз_ID)
        references Диагноз(Диагноз_ID);

alter table Терапия
    add foreign key (Лечение_ID)
        references Лечение(Лечение_ID),
    add foreign key (Вид_терапии_ID)
        references Вид_терапии(Вид_терапии_ID);

alter table Прием
    add foreign key (Терапия_ID)
        references Терапия(Терапия_ID),
    add foreign key (Врач_ID)
        references Врач(Врач_ID);

alter table История_болезней
    add foreign key (Состояние_ID)
        references Состояние(Состояние_ID),
    add foreign key (Пациент_ID)
        references Пациент(Пациент_ID);

alter table Врач_Специализация
    add foreign key (Врач_ID)
        references Врач(Врач_ID),
    add foreign key (Специализация_ID)
        references Специализация(Специализация_ID);
