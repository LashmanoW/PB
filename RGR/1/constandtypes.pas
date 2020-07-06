UNIT ConstAndTypes;

INTERFACE 
  CONST
    RuUppercase = ['А' .. 'Я'];  {Русский алфавит в верхнем регистре}
    EnUppercase = ['A' .. 'Z'];  {Английский алфавит в верхнем регистре}
    RuLowercase = ['а' .. 'я'];  {Русский алфавит в нижнем регистре}
    EnLowercase = ['a' .. 'z'];  {Английский алфавит в нижнем регистре}
    ValidAlphabet =  RuUppercase +  EnUppercase + RuLowercase + EnLowercase + ['Ё', 'ё']; {Все допустимые символы}
    ASCIIStep = 32; {Рассояние между верхним и нижним регистром}
      
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
