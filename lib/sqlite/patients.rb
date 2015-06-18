# patients.rb - Sqlite interface to patients table

require 'sqlite3'

db = SQLite3::Database.open '../../db/test.db'

begin
  puts db.get_first_value('SELECT * FROM patients')
rescue => err
  puts err.message
  ensure
  db.close
end

