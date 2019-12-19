require 'active_record'
require 'dotenv/load'
require 'csv'

# Define table names
TABLE_NAME = File.basename(ARGV[0], '.csv')
$schema_name = ''
$schema_name = ARGV[1] if ARGV.size > 1

puts "table_name:  #{TABLE_NAME}"
puts "schema_name: #{$schema_name}"

# Define table class
class TargetTable < ActiveRecord::Base
  self.table_name = $schema_name + '.' + TABLE_NAME
end
TargetTable.establish_connection(ENV['DB_URL'])

# Define CSV file name
CSV_FILE = "csv/#{TABLE_NAME}.csv"
