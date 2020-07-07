UNIT GetStringWord;

INTERFACE
  USES 
    ConstAndTypes;
     
  PROCEDURE GetWord(VAR Fin: TEXT; VAR SomeWord: WordString; VAR FindWord: BOOLEAN); {��������� �����}      
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
    {����������� ������� �������� �������� � ������}
    IF (Ch IN Uppercase)
    THEN
      Ch := CHR(ORD(Ch) + ASCIIStep);
    {�������� � � � �� �}  
    IF (Ch = '�') OR (Ch = '�')
    THEN
      Ch := '�';
    UpToLower := Ch
  END;

  PROCEDURE GetWord(VAR Fin: TEXT; VAR SomeWord: WordString; VAR FindWord: BOOLEAN);
  VAR    
    Ch: CHAR;  
  BEGIN
    FindWord := FALSE;
    {���������� ��� ���������� �������} 
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
          BEGIN {����������� �������� �����, ���������� ������� �������� �������� � ������ � ������� � � � �� �}            
            SomeWord := SomeWord + UpToLower(Ch);                
            READ(Fin, Ch)           
          END
      END    
  END;
  
BEGIN {GetStringWord}
END. {GetStringWord}


