	 CREATE TABLE IF NOT EXISTS PERSON (
      id CHAR(9) PRIMARY KEY,
      name VARCHAR(20),
      age INTEGER,
      username VARCHAR(10),
      password VARCHAR(15)
    );

   ALTER TABLE PERSON ADD CHECK (age>=18);

	-- CREATE INDEX person_name ON person(name)



	 CREATE TABLE IF NOT EXISTS QUIZ (
      quiz_numb INTEGER NOT NULL,
      ques_numb INTEGER NOT NULL,
      ques_text VARCHAR(250) NOT NULL,
      right_ans VARCHAR(25) NOT NULL,
      wrong_ans1 VARCHAR(25) NOT NULL,
      wrong_ans2 VARCHAR(25),
      wrong_ans3 VARCHAR(25),
	        PRIMARY KEY(quiz_numb,ques_numb)
	  );


	 CREATE TABLE IF NOT EXISTS ANSWERS (
      quiz_numb INTEGER NOT NULL,
      ques_numb INTEGER NOT NULL,
      id CHAR(9),
      given_ans VARCHAR(25)NOT NULL,
	    PRIMARY KEY (quiz_numb,ques_numb,id),
	    FOREIGN KEY (id) REFERENCES person(id)
	  );






	--ENES FURKAN ÖRNEK
	CREATE TABLE IF NOT EXISTS LOCATION (
	  id SERIAL PRIMARY KEY NOT NULL,
     class VARCHAR(255),
     building VARCHAR(255),
     day VARCHAR(255),
     capacity INT DEFAULT 80
     --start_time TIME,
     --end_time TIME,
     --year NUMERIC(4),

  );

	CREATE TABLE IF NOT EXISTS CLASS (
     crn CHAR(5) PRIMARY KEY NOT NULL ,
     course_code VARCHAR(7),
     loc_id INTEGER REFERENCES LOCATION(id),
     credit NUMERIC(1)
  );


	CREATE TABLE IF NOT EXISTS DEPARTMENT (
	id SERIAL PRIMARY KEY NOT NULL,
    dep_name VARCHAR(30),
    fac_name VARCHAR(30),
    dean_id CHAR(9) REFERENCES PERSON(id),
    stu_delegate CHAR(9) REFERENCES PERSON(id)
  );


	--MEHMET FATİH YILDIRIM

	CREATE TABLE IF NOT EXISTS STUDENT (
	  id SERIAL PRIMARY KEY NOT NULL,
		person CHAR(9) REFERENCES PERSON(id),
		GPA NUMERIC(3, 2),
		COMP_CREDITS INT NOT NULL DEFAULT 0,
		dep_id INTEGER REFERENCES DEPARTMENT(id) NOT NULL,
		CHECK (COMP_CREDITS >= 0),
		CHECK (GPA >= 0),
		CHECK (GPA <= 4)
	);


	CREATE TABLE IF NOT EXISTS ENROLLMENT (
		ID CHAR(9) REFERENCES PERSON NOT NULL,
		CRN CHAR(5) REFERENCES CLASS NOT NULL,
		ATTENDANCE INT,
		CHECK (ATTENDANCE >= 0),
		PRIMARY KEY (ID, CRN)
	);


	CREATE TABLE IF NOT EXISTS GRADES (
		ID CHAR(9) REFERENCES PERSON NOT NULL,
		CRN CHAR(5) REFERENCES CLASS NOT NULL,
		TAKEN_FROM VARCHAR(15) NOT NULL,
		PERCENTAGE INT NOT NULL,
		GRADE INT NOT NULL,
		CHECK (PERCENTAGE >= 0),
		CHECK (PERCENTAGE <= 100),
		CHECK (GRADE >= 0),
		CHECK (GRADE <= 100),
		PRIMARY KEY (ID, CRN, TAKEN_FROM)
	);