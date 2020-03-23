require_relative 'target_table'

setup = Setup.instance
TargetTable.establish_connection(ENV['DB_URL'])

col_names = TargetTable.column_names
all_recs = TargetTable.all.to_a

mode = 'a'
mode = 'w' if setup.is_sync

CSV.open(setup.csv_file, mode) do |csv|
  csv << col_names if setup.is_sync

  all_recs.each do |rec|
    csv << col_names.map { |col_name| rec[col_name] }
  end
end

setup.logger.info("Insert #{all_recs.size} records to '#{setup.csv_file}' done!")
