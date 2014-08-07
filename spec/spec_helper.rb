require 'rspec'
require 'doctor'
require 'patient'
require 'pg'

DB = PG.connect(:dbname => 'doc_office_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM doctors *;')
  end
end


