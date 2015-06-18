# patients.rb - run ERb template on patients.emd

require 'erb'
require '../lib/sqlite'


renderer = ERB.new(File.read("patients.emd"))
puts renderer.result

