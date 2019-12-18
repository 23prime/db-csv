# db-csv

Import/Export DB table <-> CSV file.

## Usage

### Prepare

Install dependecies.

```
$ bundle install --path=vendor/bundle
```

Make `.env` and add `DB_URL`.

e.g.

```
DB_URL='postgres://<user>:<password>@<host>:<port>/<DB>'
```

### DB table -> CSV file

```
$ bundle exec ruby db2csv.rb <table name>
```

If the table under a schema:

```
$ bundle exec ruby db2csv.rb <table name> <schema name>
```

### CSV file -> DB table

```
$ bundle exec ruby csv2db.rb <table name>
```

If the table under a schema:

```
$ bundle exec ruby csv2db.rb <table name> <schema name>
```

## Note

CSV file must include column names.  
And, exported CSV file include column names.
