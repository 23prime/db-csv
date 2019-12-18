require_relative './common.rb'

# CSV -> DB
col_names = TargetTable.column_names
_header, *all_recs = CSV.read(CSV_FILE)

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
