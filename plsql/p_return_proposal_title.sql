CREATE OR REPLACE PROCEDURE RETURN_PROPOSAL_TITLE
    (P_ID_STUDENT IN STUDENTS.ID%TYPE, P_PROPOSALS_TITLE OUT PROPOSALS.TITLE%TYPE)
IS
BEGIN
    SELECT P.TITLE
    INTO P_PROPOSALS_TITLE
    FROM PROPOSALS P
    INNER JOIN STUDENTS S ON S.ID = P.FK_AUTHOR_UID
    WHERE S.ID = P_ID_STUDENT;
END;
/
SHOW ERRORS;

DECLARE
    V_NAME VARCHAR2(255);
BEGIN
    RETURN_PROPOSAL_TITLE(1, V_NAME);
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;