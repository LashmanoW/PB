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
    WRITELN('¬ходные данные записаны неверно')
  ELSE
    BEGIN
      IF Mo1 < Mo2
      THEN
        BEGIN
          WriteMonth(OUTPUT, Mo1);
          WRITE(OUTPUT, ' предшествует ')        
        END
      ELSE
        BEGIN        
          IF Mo1 > Mo2
          THEN
            BEGIN
              WriteMonth(OUTPUT, Mo1);
              WRITE(OUTPUT, ' следует за ')
            END
          ELSE
            WRITE(OUTPUT, 'ќба мес€ца ')         
        END;          
      WriteMonth(OUTPUT, Mo2);
      WRITELN(OUTPUT)
    END  
END.
