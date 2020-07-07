UNIT GetTextStatistic;

INTERFACE
  USES 
    ConstAndTypes, GetStringWord, TreeSort; 
           
  PROCEDURE GetStatistic;  {�������� ����������}   
IMPLEMENTATION
  VAR
    Fin, Fout: TEXT;
    
  PROCEDURE GetStatistic; 
  VAR     
    Root: Tree;
    CountWord: INTEGER;
    SomeWord: WordString;
    FindWord: BOOLEAN; 
  BEGIN 
    Root := NIL;
    CountWord := 0;
    WHILE NOT(EOF(Fin))
    DO
      BEGIN         
        GetWord(Fin, SomeWord, FindWord);
        IF FindWord
        THEN 
          BEGIN      
            Insert(Root, SomeWord);
            CountWord :=  CountWord + 1
          END     
      END;       
   {������� ����� ���������� ����}    
   WRITELN(Fout, 'All words: ', CountWord);   
   {������� ���������� ������� �����} 
   PrintTree(Root, Fout);
   {������ ������}    
   CleanTree(Root)       
  END;
  
BEGIN {GetTextStatistic}
  {���������� ����� input � output}
  ASSIGN(Fin, 'input.txt');
  ASSIGN(Fout, 'output.txt');
  {�������������� ����� � �������������}
  RESET(Fin);
  REWRITE(Fout)
END. {GetTextStatistic}


