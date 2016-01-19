class Customer
  attr_reader(:id, :name, :phone, :animal_type_pref, :breed_preference)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:animal_type_pref)
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

  def ==(another_customer)
    self.name().==(another_customer.name()).&(self.id().==(another_customer.id()))
  end
end
