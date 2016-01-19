require('sinatra')
require('sinatra/reloader')
require('./lib/animals')
require('./lib/customers')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "animal_shelter"})
