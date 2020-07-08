PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR;
  Land, Sea: BOOLEAN; 
  
PROCEDURE WindowMove(VAR W1, W2, W3, W4: CHAR);
BEGIN
  W1 := W2;
  W2 := W3;
  W3 := W4;
  READ(W4)    
END; 

PROCEDURE CheckLand(VAR Land: BOOLEAN; VAR W1, W2, W3, W4: CHAR);
BEGIN
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
END;

PROCEDURE CheckSea(VAR Land: BOOLEAN; VAR W2, W3, W4: CHAR);
BEGIN
  Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
END;

PROCEDURE WriteMessage(VAR Land, Sea: BOOLEAN);
BEGIN
  IF Land
  THEN
    WRITELN('The Britsish are coming by land')
  ELSE
    IF Sea
    THEN
      WRITELN('The British are coming by sea')
    ELSE
      WRITELN('Sarah didn''t say')  
END;

BEGIN {SarahRevere}   
  {Инициализация} 
  Land := FALSE;
  Sea := FALSE;  
  IF NOT EOLN
  THEN
    BEGIN
      READ(W4);
      W3 := W4;
      W2 := W3;
      W1 := W2  
    END;          
  WHILE NOT EOLN AND NOT (Land OR Sea)   
  DO
    BEGIN
      {движение окна}
       WindowMove(W1, W2, W3, W4);   
      {проверка окна на land}
       CheckLand(Land, W1, W2, W3, W4);
      {проверка окна на sea}
       CheckSea(Land, W2, W3, W4)
    END;
  {создание сообщения Sarah}
  WriteMessage(Land, Sea) 
END.  {SarahRevere} 

