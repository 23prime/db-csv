require 'active_record'
require 'dotenv/load'
require 'csv'

# Define table names
TABLE_NAME = ARGV[0]

# Define table class
class TargetTable < ActiveRecord::Base
  self.table_name = TABLE_NAME
end
TargetTable.establish_connection(ENV['HEROKU_DB_URL'])

# Define CSV file name
csv_file = TABLE_NAME + '.csv'

# DB -> CSV
col_names = TargetTable.column_names
# col_names.shift
all_recs = TargetTable.all.to_a

CSV.open(csv_file, 'w') do |csv|
  csv << col_names
  i = 1
  all_recs.each do |rec|
    csv << col_names.map { |col_name| rec[col_name] }
    puts "#{i} records to CSV done!"
    i += 1
  end
end
