CREATE TABLE IF NOT EXISTS PERSON (
    id CHAR(9) PRIMARY KEY,
    name VARCHAR(20),
    age INTEGER,
    username VARCHAR(10),
    password VARCHAR(15)
);

--ALTER TABLE PERSON ADD CHECK (age>=18);
--INSERT INTO PERSON VALUES ('000000001','ADMINISTRATOR','99','kkarakamis','1234');


CREATE TABLE IF NOT EXISTS FOODS (
    id SERIAL PRIMARY KEY NOT NULL,
    food_type VARCHAR(15),
    food_name VARCHAR(255),
    calorie INT
);


CREATE TABLE IF NOT EXISTS MENU (
    dy VARCHAR(15),
    repast VARCHAR(20),
    soup INTEGER,
    main INTEGER,
    side INTEGER,
    extras INTEGER,
    PRIMARY KEY(dy, repast),
    FOREIGN KEY(soup) REFERENCES FOODS(id),
    FOREIGN KEY(main) REFERENCES FOODS(id),
    FOREIGN KEY(side) REFERENCES FOODS(id),
    FOREIGN KEY(extras) REFERENCES FOODS(id)
);


CREATE TABLE IF NOT EXISTS LOCATION (
    id SERIAL PRIMARY KEY NOT NULL,
    classroom VARCHAR(255),
    building VARCHAR(255),
    dy VARCHAR(255),
    capacity INT DEFAULT 80
);

CREATE TABLE IF NOT EXISTS CLASS (
    crn INTEGER PRIMARY KEY NOT NULL ,
    course_code VARCHAR(7),
    loc_id INTEGER REFERENCES LOCATION(id) ON DELETE SET NULL,
    credit NUMERIC(1)
);


CREATE TABLE IF NOT EXISTS FACULTY (
    id SERIAL PRIMARY KEY NOT NULL,
    fac_name VARCHAR(255),
    dean_id CHAR(9) REFERENCES PERSON(id) ON DELETE SET NULL,
    stu_delegate CHAR(9)
);


CREATE TABLE IF NOT EXISTS STUDENT (
    ID CHAR(9) PRIMARY KEY NOT NULL REFERENCES PERSON(id) ON DELETE CASCADE,
    GPA NUMERIC(3, 2) DEFAULT NULL,
    COMP_CREDITS INT NOT NULL DEFAULT 0,
    FAC_ID INTEGER REFERENCES FACULTY(id) ON DELETE CASCADE NOT NULL,
    CHECK (COMP_CREDITS >= 0),
    CHECK (GPA >= 0),
    CHECK (GPA <= 4)
);


CREATE TABLE IF NOT EXISTS ENROLLMENT (
    STUDENT_ID CHAR(9) REFERENCES STUDENT(ID) NOT NULL,
    CRN INTEGER REFERENCES CLASS ON DELETE CASCADE NOT NULL,
    ATTENDANCE INT DEFAULT 0,
    CHECK (ATTENDANCE >= 0),
    PRIMARY KEY (STUDENT_ID, CRN)
);


CREATE TABLE IF NOT EXISTS GRADES (
    STUDENT_ID CHAR(9) REFERENCES STUDENT(ID) NOT NULL,
    CRN INTEGER REFERENCES CLASS ON DELETE CASCADE NOT NULL,
    TAKEN_FROM VARCHAR(15) NOT NULL,
    PERCENTAGE INT NOT NULL,
    GRADE INT NOT NULL,
    CHECK (PERCENTAGE >= 0),
    CHECK (PERCENTAGE <= 100),
    CHECK (GRADE >= 0),
    CHECK (GRADE <= 100),
    PRIMARY KEY (STUDENT_ID, CRN, TAKEN_FROM)
);
