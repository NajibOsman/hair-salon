require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/clients')
require('./lib/stylist')
require('pg')

DB = PG.connect(dbname: 'hair_salon_database')

get('/') do
  erb(:index)
end
