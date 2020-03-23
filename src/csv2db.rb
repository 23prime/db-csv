require_relative 'target_table'

setup = Setup.instance
TargetTable.establish_connection(ENV['DB_URL'])

col_names = TargetTable.column_names
_header, *all_recs = CSV.read(setup.csv_file)

TargetTable.delete_all if setup.is_sync

i = 0
all_recs.each do |rec|
  insert_hash = {}

  (0..(col_names.size - 1)).each do |j|
    insert_hash.store(col_names[j], rec[j])
  end

  begin
    TargetTable.create(insert_hash)
    i += 1
  rescue
    setup.logger.error("Could not insert '#{insert_hash}'.")
  end
end

setup.logger.info("Insert #{i} records to '#{setup.table_name}' done!")
