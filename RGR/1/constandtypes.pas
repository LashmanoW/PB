UNIT ConstAndTypes;

INTERFACE 
  CONST
    ValidAlphabet: SET OF CHAR = ['A' .. 'Z', 'a' .. 'z', 'Ё', 'ё', 'А' .. 'Я', 'а' .. 'я'];  {Все допустимые символы}
    Uppercase: SET OF CHAR = ['A' .. 'Z', 'А' .. 'Я'];  {Буквы в верхнем регистре}      
    ASCIIStep = 32;  {Рассояние между верхним и нижним регистром}
      
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
