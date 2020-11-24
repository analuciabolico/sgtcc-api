create or replace FUNCTION GET_DATE_SCHEDULED_BOARD(P_NAME_STUDENT IN VARCHAR2)
    RETURN VARCHAR2
IS
    DATE_BOARD VARCHAR2(30);
BEGIN
    select to_char(DATE_SCHEDULED, 'DD/MM/YYYY HH24:MI')
    INTO DATE_BOARD
    from STUDENTS S
    inner join PROPOSALS P on S.ID = P.FK_AUTHOR_UID
    inner join BOARDS B on B.FK_PROPOSAL_UID = P.id
    where lower(S.NAME) = lower(P_NAME_STUDENT);
    RETURN DATE_BOARD;
END;
