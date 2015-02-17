require "sqlite3"

# create a new SQLite3 Database by the name "test.db"
conn = SQLite3::Database.new "test.db"
# run some sql in that db that will create a table called "post" with 4 columns: id, posted, title, body
# note to self: I can have code like that generated for me using vertabelo

# Basic syntax of CREATE TABLE statement is as follows:
#  "CREATE TABLE database_name.table_name(
#    column1 datatype PRIMARY KEY(one or more columns),
#    column2 datatype,
#    column3 datatype,
#       .....
#    columnN datatype,
#  );

conn.execute <<SQL
create table post(
id INTEGER PRIMARY KEY,
posted INTEGER,
title VARCHAR(30),
body VARCHAR(32000));
SQL