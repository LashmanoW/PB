UNIT GetStringWord;

INTERFACE
  USES 
    ConstAndTypes;
     
  FUNCTION GetWord(VAR Fin: TEXT): WordString; {Считываем слово}      
IMPLEMENTATION
  FUCTION NewWord(VAR Fin: TEXT): CHAR;
  VAR 
    Ch: CHAR;
  BEGIN
    Ch := '';
    IF NOT(EOF(Fin))
    THEN
      BEGIN       
        READ(Fin, Ch);
        WHILE NOT(Ch IN ValidAlphabet)
        THEN
          READ(Fin, Ch) 
      END;
    NewWord := Ch             
  END;
  
  FUNCTION UpToLower(VAR Ch: CHAR): CHAR;
  BEGIN
    {Преобразуем символы верхнего регистра в нижний}
    IF (Ch IN RuUppercase) OR (Ch IN EnUppercase)
    THEN
      Ch := CHR(ORD(Ch) + ASCIIStep);
    {Заменяем Ё и ё на е}  
    IF (Ch = 'Ё') OR (Ch = 'ё')
    THEN
      Ch := 'е';
    UpToLower := Ch    
  END;

  FUNCTION GetWord(VAR Fin: TEXT): WordString;
  VAR
    SomeWord: WordString;
    Ch: CHAR;  
  BEGIN
    {Пропускаем все невалидные символы}     
    SomeWord := NewWord(Fin);
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
      END;             
    GetWord := SomeWord           
  END;
  
BEGIN {GetStringWord}
END. {GetStringWord}


