# patients.rb - Sqlite interface to patients table

require 'sqlite3'


# return names from patients table as array of strings
def patients_names
  begin
  db = SQLite3::Database.open '../../db/test.db'

    rs = db.execute 'SELECT name FROM patients'
  rescue => err
    puts err.message
    ensure
    db.close
  end

  rs
end

