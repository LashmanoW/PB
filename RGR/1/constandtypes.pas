UNIT ConstAndTypes;

INTERFACE 
  CONST
    ValidAlphabet: SET OF CHAR = ['A' .. 'Z', 'a' .. 'z', '�', '�', '�' .. '�', '�' .. '�'];  {��� ���������� �������}
    Uppercase: SET OF CHAR = ['A' .. 'Z', '�' .. '�'];  {����� � ������� ��������}      
    ASCIIStep = 32;  {��������� ����� ������� � ������ ���������}
      
  TYPE
    WordString = STRING(52);  
    Tree = ^NodeType;
    NodeType = RECORD
                 SomeWord: WordString;
                 CountWord: INTEGER;
                 LLink, RLink: Tree
               END;   

IMPLEMENTATION
   
BEGIN  {ConstAndTypes}
END.  {ConstAndTypes}
