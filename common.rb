require 'active_record'
require 'dotenv/load'
require 'csv'

# Define table names
TABLE_NAME = File.basename(ARGV[0], '.csv')
SCHEMA_NAME = ''
SCHEMA_NAME = ARGV[1] + '.' if ARGV.size > 1

puts "TABLE_NAME:  #{TABLE_NAME}"
puts "SCHEMA_NAME: #{SCHEMA_NAME}"

# Define table class
class TargetTable < ActiveRecord::Base
  self.table_name = SCHEMA_NAME + TABLE_NAME
end
TargetTable.establish_connection(ENV['DB_URL'])

# Define CSV file name
CSV_FILE = TABLE_NAME + '.csv'
