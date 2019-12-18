require_relative './common.rb'

# DB -> CSV
col_names = TargetTable.column_names
all_recs = TargetTable.all.to_a

CSV.open(CSV_FILE, 'w') do |csv|
  csv << col_names
  i = 1

  all_recs.each do |rec|
    csv << col_names.map { |col_name| rec[col_name] }
    puts "#{i} records to CSV done!"
    i += 1
  end
end
