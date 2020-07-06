UNIT GetStringWord;

INTERFACE
  USES 
    ConstAndTypes;
     
  FUNCTION GetWord(VAR Fin: TEXT): WordString; {��������� �����}      
IMPLEMENTATION
  PROCEDURE NewWord(VAR Fin: TEXT);
  BEGIN     
    WHILE NOT(EOF(Fin)) AND NOT(Fin^ IN ValidAlphabet)
    DO 
       GET(Fin)           
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
  BEGIN
    {���������� ��� ���������� �������}
    NewWord(Fin);
    SomeWord := '';
    WHILE NOT(EOF(Fin)) AND (Fin^ IN ValidAlphabet)
    DO
      BEGIN {����������� �������� �����, ���������� ������� �������� �������� � ������ � ������� � � � �� �}            
        SomeWord := SomeWord + UpToLower(Fin^);                
        GET(Fin)           
      END;          
    GetWord := SomeWord           
  END;
  
BEGIN {GetStringWord}
END. {GetStringWord}


