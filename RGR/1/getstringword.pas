UNIT GetStringWord;

INTERFACE
  USES 
    ConstAndTypes;
     
  FUNCTION GetWord(VAR Fin: TEXT): WordString; {Считываем слово}      
IMPLEMENTATION
  PROCEDURE NewWord(VAR Fin: TEXT);
  BEGIN     
    WHILE NOT(EOF(Fin)) AND NOT(Fin^ IN ValidAlphabet)
    DO 
       GET(Fin)           
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
  BEGIN
    {Пропускаем все невалидные символы}
    NewWord(Fin);
    SomeWord := '';
    WHILE NOT(EOF(Fin)) AND (Fin^ IN ValidAlphabet)
    DO
      BEGIN {Посимвольно собираем слово, преобразуя символы верхнего регистра в нижний и заменяя Ё и ё на е}            
        SomeWord := SomeWord + UpToLower(Fin^);                
        GET(Fin)           
      END;          
    GetWord := SomeWord           
  END;
  
BEGIN {GetStringWord}
END. {GetStringWord}


