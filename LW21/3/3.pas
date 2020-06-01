PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
  MsgLen = 0 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: MsgLen;      
  Error: BOOLEAN;
  UsersChar: SET OF CHAR;

PROCEDURE Initialize(VAR Code: Chiper; VAR Error: BOOLEAN);
{Присвоить Code шифр замены}
VAR  
  InitializeFile: TEXT;
  W1, W2, W3: CHAR;  
BEGIN {Initialize}  
  ASSIGN(InitializeFile, 'Initialize.txt');
  RESET(InitializeFile);
  UsersChar := [];  
  WHILE NOT EOF(InitializeFile) AND NOT Error
  DO
    BEGIN
      IF NOT EOLN(InitializeFile)
      THEN 
        READ(InitializeFile, W1);
      IF NOT EOLN(InitializeFile)
      THEN 
        READ(InitializeFile, W2);
      IF NOT EOLN(InitializeFile)
      THEN 
        READ(InitializeFile, W3)
      ELSE
       Error := TRUE;     
      IF ((NOT Error) AND (W1 IN ['A' .. 'Z']) AND (W2 = '=') AND (NOT(W3 IN UsersChar)))
      THEN
        BEGIN
          UsersChar := UsersChar + [W3];
          Code[W1] := W3  
        END
      ELSE  
        WRITELN(OUTPUT, ' Error: invalid values');      
      READLN(InitializeFile)   
    END;
  CLOSE(InitializeFile)  
END;  {Initialize}
 
PROCEDURE Decrypt(VAR S: Str; StrLength: MsgLen);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: MsgLen;
  SomeChar: 'A' .. 'Z';
BEGIN {Decrypt}
  FOR Index := 1 TO StrLength
  DO
    IF S[Index] IN UsersChar
    THEN
      BEGIN
        FOR SomeChar := 'A' TO 'Z'
        DO 
          IF Code[SomeChar] = S[Index]
          THEN  
            WRITE(OUTPUT, SomeChar)
      END
    ELSE
      IF S[Index] = '_'
      THEN
        WRITE(OUTPUT, ' ')
      ELSE
        WRITE(OUTPUT, S[Index]);          
  WRITELN(OUTPUT)        
END;  {Decrypt}
 
BEGIN {Decryption}
  {Инициализировать Code}
  Error := FALSE;
  Initialize(Code, Error);  
  WHILE NOT Error AND NOT EOF(INPUT)
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;         
      WHILE NOT EOLN(INPUT) AND (I < Len)
      DO
        BEGIN
          I := I + 1;           
          READ(INPUT, Msg[I]);
          WRITE(OUTPUT, Msg[I])
        END;
      WRITELN(OUTPUT);  
      IF NOT EOLN(INPUT)
      THEN
        BEGIN
          Error := TRUE;
          WRITE(OUTPUT, '{ Error: Message exceeds 20 characters per line }')
        END;    
      READLN(INPUT);        
      WRITELN(OUTPUT);
      {распечатать кодированное сообщение}
      IF I <> 0
      THEN
        Decrypt(Msg, I)
      ELSE
        WRITELN(OUTPUT);
      WRITELN(OUTPUT, '{ Message length is ', I, ' }')      
    END    
END.  {Decryption}

