-- Questão 1

CREATE SCHEMA avaliacaocontinua;

-- Questão 2

CREATE TABLE avaliacaocontinua.company
(
    company_name VARCHAR(100) NOT NULL PRIMARY KEY,
    city VARCHAR(50)
);

-- Questão 3

CREATE TABLE avaliacaocontinua.employee
(
    person_name VARCHAR(100) NOT NULL PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50)
);

-- Questão 4

CREATE TABLE avaliacaocontinua.manages
(
    person_name VARCHAR(100) NOT NULL PRIMARY KEY,
    manager_name VARCHAR(100)
);

-- Questão 5

CREATE TABLE avaliacaocontinua.works
(
    person_name VARCHAR(100) NOT NULL PRIMARY KEY,
    company_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2)
);

-- Questao 6

ALTER TABLE avaliacaocontinua.employee
    ADD CONSTRAINT fk_person_name
    FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.works(person_name)
    ON UPDATE CASCADE 
    ON DELETE CASCADE;

-- Questão 7

ALTER TABLE avaliacaocontinua.works
    ADD CONSTRAINT fk_company_name
    FOREIGN KEY (company_name) REFERENCES avaliacaocontinua.company(company_name)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Questão 8

ALTER TABLE avaliacaocontinua.employee
    ADD CONSTRAINT fk_person_name_m
    FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.manages(person_name)
    ON UPDATE CASCADE 
    ON DELETE CASCADE;

