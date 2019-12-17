require 'active_record'
require 'dotenv/load'
require 'csv'

# Define table names
TABLE_NAME = ARGV[0]
SCHEMA_NAME = '.'
SCHEMA_NAME = ARGV[1] + '.' if ARGV.size > 1

# Define table class
class TargetTable < ActiveRecord::Base
  self.table_name = SCHEMA_NAME + TABLE_NAME
end
TargetTable.establish_connection(ENV['DB_URL'])

# Define CSV file name
csv_file = TABLE_NAME + '.csv'

# CSV -> DB
col_names = TargetTable.column_names
_header, *all_recs = CSV.read(csv_file)

i = 1
all_recs.each do |rec|
  insert_hash = {}

  for j in 0..(col_names.size - 1) do
    insert_hash.store(col_names[j], rec[j])
  end

  TargetTable.create(insert_hash)
  puts "#{i} records insert done!"
  i += 1
end
