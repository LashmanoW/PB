UNIT TreeSort;

INTERFACE
  USES 
    ConstAndTypes;
                       
  PROCEDURE Insert(VAR Ptr: Tree; Data: WordString);
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR Fout: TEXT);
  PROCEDURE CleanTree(VAR Ptr: Tree);   
IMPLEMENTATION  
  PROCEDURE Insert(VAR Ptr: Tree; Data: WordString);
  BEGIN  {Insert}
    IF Ptr = NIL
    THEN
      BEGIN  {Создаем лист со значением Data}
        NEW(Ptr);
        Ptr^.SomeWord := Data;
        Ptr^.CountWord := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE  
      IF Data < Ptr^.SomeWord
      THEN 
        Insert(Ptr^.LLink, Data)
      ELSE
        IF Data > Ptr^.SomeWord 
        THEN      
          Insert(Ptr^.RLink, Data) 
        ELSE {Увеличиваем счетчик слова на 1, если встретили повторно}
          Ptr^.CountWord :=  Ptr^.CountWord + 1
  END;  {Insert}

  PROCEDURE PrintTree(VAR Ptr: Tree; VAR Fout: TEXT);
  BEGIN  {PrintTree}
    IF Ptr <> NIL
    THEN 
      BEGIN  {Печатает поддерево слева, вершину, поддерево справа}
        PrintTree(Ptr^.LLink, Fout);
        WRITELN(Fout, Ptr^.SomeWord, ' ', Ptr^.CountWord);
        PrintTree(Ptr^.RLink, Fout)
      END
  END;  {PrintTree}
  
  PROCEDURE CleanTree(VAR Ptr: Tree);
  BEGIN  {CleanTree}
    IF Ptr <> NIL
    THEN
      BEGIN         
        CleanTree(Ptr^.LLink);
        CleanTree(Ptr^.RLink)
      END;
    DISPOSE(Ptr);
    Ptr := NIL  
  END;  {CleanTree}
  
BEGIN  {TreeSort}
END.  {TreeSort}
