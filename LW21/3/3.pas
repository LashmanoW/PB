PROGRAM Decryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
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
  StrLength: MsgLen;
  Error: BOOLEAN;
  UsersChar: SET OF CHAR;

PROCEDURE Initialize(VAR Code: Chiper; VAR Error: BOOLEAN);
{��������� Code ���� ������}
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
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: MsgLen;
  SomeChar: 'A' .. 'Z';
BEGIN {Encode}
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
END;  {Encode}
 
BEGIN {Decryption}
  {���������������� Code}
  Error := FALSE;
  Initialize(Code, Error);  
  WHILE NOT Error AND NOT EOF(INPUT)
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      I := 0;
      StrLength := I;
      WHILE NOT EOLN(INPUT) AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          StrLength := I;
          READ(INPUT, Msg[I]);
          WRITE(OUTPUT, Msg[I])
        END;
      READLN(INPUT);        
      WRITELN(OUTPUT);
      {����������� ������������ ���������}
      IF I <> 0
      THEN
        Encode(Msg, StrLength)
      ELSE
        WRITELN(OUTPUT);
      WRITELN(OUTPUT, '{ Message length is ', StrLength, ' }')      
    END    
END.  {Decryption}

