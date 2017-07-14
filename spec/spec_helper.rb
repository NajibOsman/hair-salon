require('rspec')
require('pg')
require('clients')
require('stylist')

DB = PG.connect(dbname: 'hair_salon_database')
