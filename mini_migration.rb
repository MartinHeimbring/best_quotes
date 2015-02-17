require "sqlite3"

# create a new SQLite3 Database by the name "test.db"
conn = SQLite3::Database.new "test.db"
# run some sql in that db that will create a table called "post" with 4 columns: id, posted, title, body
# note to self: I can have code like that generated for me using vertabelo
conn.execute <<SQL
create table post(
id INTEGER PRIMARY KEY,
posted INTEGER,
title VARCHAR(30),
body VARCHAR(32000));
SQL