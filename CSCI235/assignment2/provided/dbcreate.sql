/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                                                      */
/*                       CSCI235 Database Systems                       */
/*                                                                      */
/*                   Sample database: Job Applications                  */
/*                       CREATE TABLE statements                        */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE SKILL(
sname	      VARCHAR(30)     NOT NULL,   /* Skill name                 */
	CONSTRAINT SKILL_pkey PRIMARY KEY ( sname ) );

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE APPLICANT(			  /* Applicants			*/
anumber         DECIMAL(6)      NOT NULL, /* Applicant number           */
fname           VARCHAR(20)     NOT NULL, /* First name                 */
lname		VARCHAR(30)	NOT NULL, /* Last name			*/
dob         	DATE     	NOT NULL, /* Date of birth		*/
city		VARCHAR(30)	NOT NULL, /* City			*/
state		VARCHAR(20)	NOT NULL, /* State			*/
phone		DECIMAL(10)	NOT NULL, /* Phone number		*/
fax		DECIMAL(10)		, /* Fax number			*/
email		VARCHAR(50)		, /* E-mail address		*/
	CONSTRAINT APPLICANT_pkey PRIMARY KEY ( anumber ) );

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE EMPLOYER(			  /* Employers			*/
ename        	VARCHAR(100)    NOT NULL, /* Employer name              */
city            VARCHAR(30)     NOT NULL, /* City                       */
state           VARCHAR(20)     NOT NULL, /* State                      */
phone           DECIMAL(10)     NOT NULL, /* Phone number               */
fax             DECIMAL(10)             , /* Fax number                 */
email           VARCHAR(50)             , /* E-mail address             */
web             VARCHAR(50)             , /* Web site address           */
        CONSTRAINT EMPLOYER_pkey PRIMARY KEY ( ename ) );

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE EMPLBY(			  /* Former employers		*/
anumber         DECIMAL(6)      NOT NULL, /* Applicant number           */
ename		VARCHAR(100)	NOT NULL, /* Employer name		*/
fromdate	DATE		NOT NULL, /* Employed from		*/
todate		DATE			, /* Employed to		*/
	CONSTRAINT EMPLBY_pkey PRIMARY KEY ( anumber, ename, fromdate ),
	CONSTRAINT EMPLBY_fkey1 FOREIGN KEY ( anumber )
		REFERENCES APPLICANT( anumber ),
	CONSTRAINT EMPLBY_fkey2 FOREIGN KEY ( ename )
		REFERENCES EMPLOYER( ename ) );

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE POSITION(			  /* Advertised positions	*/
pnumber         DECIMAL(8)       NOT NULL, /* Position number            */
title           VARCHAR(30)     NOT NULL, /* Position title             */
salary		DECIMAL(9,2)	NOT NULL, /* Salary			*/
extras		VARCHAR(50)	        , /* Extras			*/
bonus		DECIMAL(9,2)		, /* End of year bonus		*/
specification   VARCHAR(2000)	NOT NULL, /* Specification		*/
ename		VARCHAR(100)	NOT NULL, /* Employer name		*/
	CONSTRAINT POSITION_pkey PRIMARY KEY ( pnumber ),
	CONSTRAINT POSITION_fkey FOREIGN KEY ( ename)
		REFERENCES EMPLOYER( ename ) );

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE SPOSSESSED(
anumber        	DECIMAL(6) 	NOT NULL, /* Applicant number           */
sname		VARCHAR(30)	NOT NULL, /* Skill name                 */
slevel		DECIMAL(2)	NOT NULL, /* Skill level                */
	CONSTRAINT SPOSSESSED_pkey PRIMARY KEY ( anumber, sname ),
	CONSTRAINT SPOSSESSED_fkey1 FOREIGN KEY ( anumber )
				REFERENCES APPLICANT ( anumber )
				ON DELETE CASCADE,
	CONSTRAINT SPOSSESSED_fkey2 FOREIGN KEY ( sname )
				REFERENCES SKILL ( sname ),
	CONSTRAINT SPOSSESSED_check1 CHECK ( slevel IN
					( 1,2,3,4,5,6,7,8,9,10 ) ) );


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE SNEEDED(
pnumber        	DECIMAL(8) 	NOT NULL, /* Position number            */
sname		VARCHAR(30)	NOT NULL, /* Skill name                 */
slevel		DECIMAL(2)	NOT NULL, /* Skill level                */
	CONSTRAINT SNEEDED_pkey PRIMARY KEY ( pnumber, sname ),
	CONSTRAINT SNEEDED_fkey1 FOREIGN KEY ( pnumber )
				REFERENCES POSITION ( pnumber )
				ON DELETE CASCADE,
	CONSTRAINT SNEEDED_fkey2 FOREIGN KEY ( sname )
				REFERENCES SKILL ( sname ),
	CONSTRAINT SNEEDED_check1 CHECK ( slevel IN
					( 1,2,3,4,5,6,7,8,9,10 ) ) );


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE APPLIES(
anumber		DECIMAL(6)	NOT NULL, /* Applicant number		*/
pnumber		DECIMAL(8)	NOT NULL, /* Position number		*/
appdate		DATE		NOT NULL, /* Application date 		*/
	CONSTRAINT APPLIES_pkey PRIMARY KEY ( anumber, pnumber, appdate ),
	CONSTRAINT APPLIES_fkey1 FOREIGN KEY ( anumber )
				REFERENCES APPLICANT ( anumber )
				ON DELETE CASCADE,
	CONSTRAINT APPLIES_fkey2 FOREIGN KEY ( pnumber )
				REFERENCES POSITION ( pnumber )
				ON DELETE CASCADE);
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
