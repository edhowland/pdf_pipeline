# patients.rb - Sqlite interface to patients table

require 'sqlite3'


begin
db = SQLite3::Database.open '../../db/test.db'

  rs = db.execute 'SELECT name FROM patients'
  puts ' Nmae'
  rs.each do |row|
    puts row[0]
  end
rescue => err
  puts err.message
  ensure
  db.close
end

