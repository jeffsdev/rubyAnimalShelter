class Customer
  attr_reader(:id, :name, :phone, :animal_type_pref, :breed_preference)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @animal_type_pref = attributes.fetch(:animal_type_pref)
    @breed_preference = attributes.fetch(:breed_preference)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each do |customer|
      name = customer.fetch('name')
      phone = customer.fetch('phone')
      animal_type_pref = customer.fetch('animal_type_pref')
      breed_preference = customer.fetch('breed_preference')
      id = customer.fetch("id").to_i()
      customers.push(Customer.new({name: name,
                                   phone: phone,
                                   animal_type_pref: animal_type_pref,
                                   breed_preference: breed_preference,
                                   id: id}))
    end
    customers
  end

  def save
    result = DB.exec("INSERT INTO customers (name, phone, animal_type_pref, breed_preference) VALUES ('#{@name}', '#{@phone}', '#{@animal_type_pref}', '#{@breed_preference}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_customer)
    self.name() == another_customer.name() &&
    self.id() == another_customer.id() &&
    self.phone().to_i == another_customer.phone().to_i &&
    self.animal_type_pref() == another_customer.animal_type_pref() &&
    self.breed_preference() == another_customer.breed_preference()
  end
  #
  # def self.sort(column)
  #    #sorting alphabetically
  #    sorted_customers = DB.exec("SELECT * FROM customers ORDER BY #{column} ASC;")
  #    customers = []
  #    sorted_customers.each() do |customer|
  #      name = customer.fetch('name')
  #      phone = customer.fetch('phone')
  #      animal_type_pref = customer.fetch('animal_type_pref')
  #      breed_preference = customer.fetch('breed_preference')
  #      id = customer.fetch("id").to_i()
  #      customers.push(Customer.new({name: name,
  #                                   phone: phone,
  #                                   animal_type_pref: animal_type_pref,
  #                                   breed_preference: breed_preference,
  #                                   id: id}))
  #    end
  #    customers
  # end
  def self.filter(column, filter)
    filtered_customers = DB.exec("SELECT * FROM customers WHERE #{column} LIKE '#{filter}';")
    customers = []
    filtered_customers.each() do |customer|
      name = customer.fetch('name')
      phone = customer.fetch('phone')
      animal_type_pref = customer.fetch('animal_type_pref')
      breed_preference = customer.fetch('breed_preference')
      id = customer.fetch("id").to_i()
      customers.push(Customer.new({name: name,
                                   phone: phone,
                                   animal_type_pref: animal_type_pref,
                                   breed_preference: breed_preference,
                                   id: id}))
    end
    customers
  end
end
