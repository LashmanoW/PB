UNIT GetStringWord;

INTERFACE
  USES 
    ConstAndTypes;
     
  FUNCTION GetWord(VAR Fin: TEXT): WordString; {��������� �����}      
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
    {����������� ������� �������� �������� � ������}
    IF (Ch IN RuUppercase) OR (Ch IN EnUppercase)
    THEN
      Ch := CHR(ORD(Ch) + ASCIIStep);
    {�������� � � � �� �}  
    IF (Ch = '�') OR (Ch = '�')
    THEN
      Ch := '�';
    UpToLower := Ch    
  END;

  FUNCTION GetWord(VAR Fin: TEXT): WordString;
  VAR
    SomeWord: WordString;
    Ch: CHAR;  
  BEGIN
    {���������� ��� ���������� �������}     
    SomeWord := NewWord(Fin);
    IF NOT(EOF(Fin))
    THEN
      BEGIN
        READ(Fin, Ch);
        WHILE NOT(EOF(Fin)) AND (Ch IN ValidAlphabet)
        DO
          BEGIN {����������� �������� �����, ���������� ������� �������� �������� � ������ � ������� � � � �� �}            
            SomeWord := SomeWord + UpToLower(Ch);                
            READ(Fin, Ch)           
          END
      END;             
    GetWord := SomeWord           
  END;
  
BEGIN {GetStringWord}
END. {GetStringWord}


