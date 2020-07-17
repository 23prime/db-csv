# db-csv

Import/Export DB table <-> CSV file.

## Usage

### Prepare

Install dependecies.

```sh
bundle config set path vendor/bundle
bundle install
```

Make `.env` and add `DB_URL`.

e.g.

```env
DB_URL='postgres://<user>:<password>@<host>:<port>/<DB>'
```

### DB table -> CSV file

```sh
bundle exec ruby src/db2csv.rb <table name>
```

If the table under a schema:

```sh
bundle exec ruby src/db2csv.rb <schema name>.<table name>
```

### CSV file -> DB table

```sh
bundle exec ruby src/csv2db.rb <table name>
```

If the table under a schema:

```sh
bundle exec ruby src/csv2db.rb <schema name>.<table name>
```

### Sync mode

If delete all and insert, add `--sync` option:

```sh
bundle exec ruby src/db2csv.rb <table name> --sync
```

```sh
bundle exec ruby src/csv2db.rb <table name> --sync
```

## Note

CSV file must include column names.  
And, exported CSV file include column names.
