PROGRAM Encryption(INPUT, OUTPUT);
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

PROCEDURE Initialize(VAR Code: Chiper; VAR Error: BOOLEAN);
{Присвоить Code шифр замены}
VAR  
  InitializeFile: TEXT;
  W1, W2, W3: CHAR;
  UsersChar: SET OF CHAR;
BEGIN {Initialize}  
  ASSIGN(InitializeFile, 'Initialize.txt');
  RESET(InitializeFile);
  UsersChar := [];
  W1 := '';
  W2 := '';
  W3 := '';
  WHILE NOT EOF(InitializeFile) AND NOT Error
  DO
    BEGIN
      WHILE NOT EOLN(InitializeFile)
      DO
        BEGIN
          W1 := W2;
          W2 := W3;
          READ(InitializeFile, W3)
        END;      
      IF ((W1 IN ['A' .. 'Z']) AND (W2 = '=') AND (NOT(W3 IN UsersChar)))
      THEN
        BEGIN
          UsersChar := UsersChar + [W3];
          Code[W1] := W3  
        END
      ELSE
        BEGIN
          Error := TRUE;
          WRITELN(OUTPUT, ' Error: invalid values')
        END;
      READLN(InitializeFile)   
    END;
  CLOSE(InitializeFile)  
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str; StrLength: MsgLen);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: MsgLen;
BEGIN {Encode}
  FOR Index := 1 TO StrLength
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(OUTPUT, Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE(OUTPUT, '_') 
      ELSE  
        WRITE(OUTPUT, S[Index]);
  WRITELN(OUTPUT);        
END;  {Encode}
 
BEGIN {Encryption}
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
      READLN(INPUT);        
      WRITELN(OUTPUT);
      {распечатать кодированное сообщение}
      IF I <> 0
      THEN
        Encode(Msg, I)
      ELSE
        WRITELN(OUTPUT);
      WRITELN(OUTPUT, '{ Message length is ', I, ' }')      
    END    
END.  {Encryption}

