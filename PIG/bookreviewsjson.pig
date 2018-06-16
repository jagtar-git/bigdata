data = load '/inputs/pig_bookreviews.json' using JsonLoader('author:chararray, title:chararray, year:int, reviews:{review:(name:chararray,stars:int)}');
dump data;

