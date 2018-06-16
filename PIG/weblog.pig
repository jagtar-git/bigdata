data = load '/inputs/weblog.txt';
b = foreach data generate FLATTEN(STRSPLIT($0,':',2)); 
c = foreach b generate $0; 
d = foreach data generate SUBSTRING($0, LAST_INDEX_OF($0,'[')+1, LAST_INDEX_OF($0,'[')+12) as day; 
Groups = GROUP d BY day; 
Counts = FOREACH Groups GENERATE  group, COUNT(d); 
dump Counts; 
