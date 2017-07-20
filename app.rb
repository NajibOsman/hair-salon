require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect(dbname: 'hair_salon_database')

# connetced it to the database
get('/') do
  @stylists = Stylist.all
  erb(:index)
end

get('/stylists/new') do
  @stylists = Stylist.all
  erb(:index)
end
# to display the list form

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylist.new(name: name, id: nil)
  stylist.save
  erb(:sucess)
end
#fetches the name from the input
#the id is set to nil so as to let the db do the id assigning

get('/stylists') do
  @stylists = Stylist.all
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist)
end

post('/clients') do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id').to_i
  @stylist = Stylist.find(stylist_id)
  @client = Client.new(name: name, stylist_id: stylist_id)
  @client.save
  erb(:sucess)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist_edit)
end

patch('/stylists/:id') do
  name = params.fetch('name')
  @stylist = Stylist.find(params.fetch('id').to_i)
  @stylist.update(name: name)
  erb(:stylist)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @stylist.delete
  @stylists = stylist.all
  erb(:index)
end
