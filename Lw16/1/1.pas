PROGRAM SortMonth(INPUT, OUTPUT);
USES
  DateIO;
VAR
  Mo1, Mo2: Month;
BEGIN
  ReadMonth(INPUT, Mo1);
  ReadMonth(INPUT, Mo2);
  IF (Mo1 = NoMonth) OR (Mo2 = NoMonth)
  THEN
    WRITELN('������� ������ �������� �������')
  ELSE
    BEGIN
      IF Mo1 < Mo2
      THEN
        BEGIN
          WriteMonth(OUTPUT, Mo1);
          WRITE(OUTPUT, ' ������������ ')        
        END
      ELSE
        BEGIN        
          IF Mo1 > Mo2
          THEN
            BEGIN
              WriteMonth(OUTPUT, Mo1);
              WRITE(OUTPUT, ' ������� �� ')
            END
          ELSE
            WRITE(OUTPUT, '��� ������ ')         
        END;          
      WriteMonth(OUTPUT, Mo2);
      WRITELN(OUTPUT)
    END  
END.
