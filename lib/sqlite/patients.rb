# patients.rb - Sqlite interface to patients table

require 'sqlite3'


# return names from patients table as array of strings
# pass path to sqlite db file
def patients_names dbpath
  begin
  db = SQLite3::Database.open dbpath

    rs = db.execute 'SELECT name FROM patients'
  rescue => err
    puts err.message
    ensure
    db.close
  end

  rs
end

