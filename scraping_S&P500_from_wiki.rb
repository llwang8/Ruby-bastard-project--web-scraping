require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'

URL='https://en.wikipedia.org/wiki/List_of_S%26P_500_companies'

SUBDIR = 'data-hold'
Dir.mkdir(SUBDIR) unless File.exists?SUBDIR
DB = SQLite3::Database.new( DBNAME )

DB.execute("DROP TABLE IF EXISTS COMPANIES;")
DB.execute("CREATE TABLE COMPANIES(id INTEGER PRIMARY KEY AUTOINCREMENT, NAME, ticker_symbol, sector, city, state) ")

rows =