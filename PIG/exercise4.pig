--data = load '/inputs/books.csv' using PigStorage('$delim'); 
--data = load '/inputs/books.csv' using PigStorage(','); 
data = load '/inputs/books.csv';
b = foreach data generate $0;
dump b;
d = foreach data generate FLATTEN(STRSPLIT($0,',',4)); 
Groups = GROUP d BY $4; 
Counts = FOREACH Groups GENERATE  group, COUNT(d); 
dump Counts; 


--c = foreach b generate $0; 
--d = foreach data generate SUBSTRING($0, LAST_INDEX_OF($0,'[')+1, LAST_INDEX_OF($0,'[')+12) as day; 
