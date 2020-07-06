UNIT ConstAndTypes;

INTERFACE 
  CONST
    RuUppercase = ['�' .. '�'];  {������� ������� � ������� ��������}
    EnUppercase = ['A' .. 'Z'];  {���������� ������� � ������� ��������}
    RuLowercase = ['�' .. '�'];  {������� ������� � ������ ��������}
    EnLowercase = ['a' .. 'z'];  {���������� ������� � ������ ��������}
    ValidAlphabet =  RuUppercase +  EnUppercase + RuLowercase + EnLowercase + ['�', '�']; {��� ���������� �������}
    ASCIIStep = 32; {��������� ����� ������� � ������ ���������}
      
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
