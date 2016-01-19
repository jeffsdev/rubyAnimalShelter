class Animal
  attr_reader(:id, :name, :gender, :admittance_date, :type, :breed, :customer_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @admittance_date = attributes.fetch(:admittance_date)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @customer_id = attributes.fetch(:customer_id)
  end

  def ==(another_animal)
    self.name().==(another_animal.name()).&(self.id().==(another_animal.id()))
  end

  def self.all
    returned_animals = DB.exec("SELECT * FROM animals")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch('name')
      gender = animal.fetch('gender')
      admittance_date = animal.fetch('admittance_date')
      type = animal.fetch('type')
      breed = animal.fetch('breed')
      customer_id = animal.fetch('customer_id').to_i
      id = animal.fetch('id').to_i
      animals.push(Animal.new({name: name,
                               gender: gender,
                               admittance_date: admittance_date,
                               type: type,
                               breed: breed,
                               customer_id: customer_id,
                               id: id}))
    end
    animals
  end

  def save
    result = DB.exec("INSERT INTO animals (name, gender, admittance_date, type, breed, customer_id) VALUES ('#{@name}', '#{@gender}', '#{@admittance_date}', '#{@type}', '#{@breed}', '#{@customer_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_animal)
    self.name() == another_animal.name() &&
    self.gender() == another_animal.gender() &&
    self.admittance_date() == another_animal.admittance_date() &&
    self.type() == another_animal.type() &&
    self.customer_id() == another_animal.customer_id().to_i &&
    self.id() == another_animal.id()
  end

  def self.sort(column)
     #sorting alphabetically
     sorted_animals = DB.exec("SELECT * FROM animals ORDER BY #{column} ASC;")
     animals = []
     sorted_animals.each() do |animal|
       name = animal.fetch('name')
       gender = animal.fetch('gender')
       admittance_date = animal.fetch('admittance_date')
       type = animal.fetch('type')
       breed = animal.fetch('breed')
       customer_id = animal.fetch('customer_id').to_i
       id = animal.fetch('id').to_i
       animals.push(Animal.new({name: name,
                                gender: gender,
                                admittance_date: admittance_date,
                                type: type,
                                breed: breed,
                                customer_id: customer_id,
                                id: id}))
     end
     animals
  end

  def self.filter(column, filter)
    filtered_animals = DB.exec("SELECT * FROM animals WHERE #{column} LIKE '#{filter}';")
    animals = []
    filtered_animals.each() do |animal|
      name = animal.fetch('name')
      gender = animal.fetch('gender')
      admittance_date = animal.fetch('admittance_date')
      type = animal.fetch('type')
      breed = animal.fetch('breed')
      customer_id = animal.fetch('customer_id').to_i
      id = animal.fetch('id').to_i
      animals.push(Animal.new({name: name,
                               gender: gender,
                               admittance_date: admittance_date,
                               type: type,
                               breed: breed,
                               customer_id: customer_id,
                               id: id}))
    end
    animals
  end
end
