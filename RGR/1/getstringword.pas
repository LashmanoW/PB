UNIT GetStringWord;

INTERFACE
  USES 
    ConstAndTypes;
     
  PROCEDURE GetWord(VAR Fin: TEXT; VAR SomeWord: WordString; VAR FindWord: BOOLEAN); {Считываем слово}      
IMPLEMENTATION
  FUNCTION NewWord(VAR Fin: TEXT): CHAR;
  VAR 
    Ch: CHAR;
  BEGIN
    IF NOT(EOF(Fin))
    THEN
      BEGIN     
        READ(Fin, Ch);
        WHILE NOT(EOF(Fin)) AND NOT(Ch IN ValidAlphabet)
        DO
          READ(Fin, Ch)  
      END;
    NewWord := Ch             
  END;
  
  FUNCTION UpToLower(VAR Ch: CHAR): CHAR;
  BEGIN
    {Преобразуем символы верхнего регистра в нижний}
    IF (Ch IN Uppercase)
    THEN
      Ch := CHR(ORD(Ch) + ASCIIStep);
    {Заменяем Ё и ё на е}  
    IF (Ch = 'Ё') OR (Ch = 'ё')
    THEN
      Ch := 'е';
    UpToLower := Ch
  END;

  PROCEDURE GetWord(VAR Fin: TEXT; VAR SomeWord: WordString; VAR FindWord: BOOLEAN);
  VAR    
    Ch: CHAR;  
  BEGIN
    FindWord := FALSE;
    {Пропускаем все невалидные символы} 
    Ch := NewWord(Fin);   
    SomeWord := UpToLower(Ch);    
    IF (Ch IN ValidAlphabet)
    THEN
      FindWord := TRUE; 
    IF NOT(EOF(Fin))
    THEN
      BEGIN 
        READ(Fin, Ch);               
        WHILE NOT(EOF(Fin)) AND (Ch IN ValidAlphabet)
        DO
          BEGIN {Посимвольно собираем слово, преобразуя символы верхнего регистра в нижний и заменяя Ё и ё на е}            
            SomeWord := SomeWord + UpToLower(Ch);                
            READ(Fin, Ch)           
          END
      END    
  END;
  
BEGIN {GetStringWord}
END. {GetStringWord}


