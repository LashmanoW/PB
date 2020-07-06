UNIT GetTextStatistic;

INTERFACE
  USES 
    GetStringWord, TreeSort, ConstAndTypes; 
           
  PROCEDURE GetStatistic;  {�������� ����������}   
IMPLEMENTATION
  VAR
    Fin, Fout: TEXT;
    
  PROCEDURE GetStatistic; 
  VAR     
    Root: Tree;
    CountWord: INTEGER;
    SomeWord: WordString; 
  BEGIN 
    Root := NIL;
    CountWord := 0;
    WHILE NOT(EOF(Fin))
    DO
      BEGIN         
        SomeWord := GetWord(Fin);
        IF SomeWord <> ''
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


