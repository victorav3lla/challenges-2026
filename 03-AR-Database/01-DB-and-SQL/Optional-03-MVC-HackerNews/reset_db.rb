gem 'activerecord', '~> 8.1'
gem 'sqlite3', '2.8.1'
# ^ DO NOT CHANGE! This makes sure your system uses the correct versions of activerecord and sqlite3

require "sqlite3"

dir = File.dirname(__FILE__)
db = SQLite3::Database.new(File.join(dir, "db/posts.db"))

db.execute('DROP TABLE IF EXISTS `posts`;')
create_statement = "
CREATE TABLE `posts` (
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `title` TEXT,
  `url` TEXT,
  `votes`  INTEGER
);"
db.execute(create_statement)
