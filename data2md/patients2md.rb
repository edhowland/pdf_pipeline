# patients2md.rb - read records from patients table and create markdown

require '../lib/mdgen'
require '../lib/sqlite'

markdown do
  h1 'PATIENT REPORT'
  h2 'Patients Names'
  ordered_list patients_names('../db/test.db')

h2 'Footer'
  text 'Copyright 2015, Me'
end
