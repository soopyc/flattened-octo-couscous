/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                                                      */
/*                       CSCI235 Database Systems                       */
/*                                                                      */
/*                   Sample database: Job Applications                  */
/*                             Count the rows                           */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* Turn off a pager                                                     */
\pset pager 0

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT (SELECT COUNT(*) FROM SKILL) AS SKILL,
       (SELECT COUNT(*) FROM APPLICANT) AS APPLICANT,
       (SELECT COUNT(*) FROM EMPLOYER) AS EMPLOYER,
       (SELECT COUNT(*) FROM EMPLBY) AS EMPLBY,
       (SELECT COUNT(*) FROM POSITION) AS POSITION,
       (SELECT COUNT(*) FROM SPOSSESSED) AS SPOSSESSED,
       (SELECT COUNT(*) FROM SNEEDED) AS SNEEDED,
       (SELECT COUNT(*) FROM APPLIES) AS APPLIES;

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */  




