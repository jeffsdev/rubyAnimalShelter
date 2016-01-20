require('sinatra')
require('sinatra/reloader')
require('./lib/animals')
require('./lib/customers')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "animal_shelter"})

get('/') do
  erb(:index)
end

get('/shelter') do
  erb(:shelter)
end

get('/shelter/add_animal_form') do
  erb(:animal_form)
end

post('/shelter/add_animal_form/new') do
  name = params.fetch('name')
  gender = params.fetch('gender')
  admittance_date = params.fetch('admittance_date')
  type = params.fetch('type')
  breed = params.fetch('breed')
  animal = Animal.new({name: name,
                        gender: gender,
                        admittance_date: admittance_date,
                        type: type,
                        breed: breed,
                        customer_id: 1,
                        id: nil})
  animal.save()
  erb(:success)
end

get('/shelter/view_animals') do
  @animals = Animal.all()
  erb(:animal)
end

get('/shelter/add_cust_form') do
  erb(:customer_form)
end

post('/shelter/add_cust_form/new') do
  name = params.fetch('name')
  phone = params.fetch('phone').to_i
  animal_type_pref = params.fetch('animal_type_pref')
  breed_preference = params.fetch('breed_preference')
  customer = Customer.new({name: name,
                               phone: phone,
                               animal_type_pref: animal_type_pref,
                               breed_preference: breed_preference,
                               id: nil})
  customer.save()
  erb(:success)
end

get('/shelter/view_customers') do
  @customers = Customer.all()
  erb(:customer)
end


get('/adoption_page') do
  erb(:adoption)
end
