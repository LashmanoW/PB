UNIT GetTextStatistic;

INTERFACE
  USES 
    ConstAndTypes, GetStringWord, TreeSort; 
           
  PROCEDURE GetStatistic;  {Получить статистику}   
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
   {Выводим общее количество слов}    
   WRITELN(Fout, 'All words: ', CountWord);   
   {Выводим статистику каждого слова} 
   PrintTree(Root, Fout);
   {Чистим дерево}    
   CleanTree(Root)       
  END;
  
BEGIN {GetTextStatistic}
  {Подключаем файлы input и output}
  ASSIGN(Fin, 'input.txt');
  ASSIGN(Fout, 'output.txt');
  {Подготавливаем файлы к использованию}
  RESET(Fin);
  REWRITE(Fout)
END. {GetTextStatistic}


