data = load '/inputs/books.csv' using PigStorage('$delim'); 
b = foreach data generate $0;
dump b;
