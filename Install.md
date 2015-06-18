# Installation

## Binary packages

```
  $ sudo apt-get install sqlite3 libsqlite3-dev
```

## Gems

Gems used are:  sqlite3, redcarpet
Managed by Bundler in ./Gemfile

```
  $ bundle
```


## Database

The test database is in db/test.db - a Sqlite database.
It contains one table : patients with a single column : name.

```
  $ cd db
  $ sqlite3 test.db
  >> select name from patients;
  ^D
  $
```


You can create HTML from any markdown (*.md) by using the redcarpet executable.

```
  $ redcarpet Install.md > Install.html
```
