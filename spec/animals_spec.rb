require('spec_helper')

describe(Animal) do
  describe('.all') do
    it('is empty at first') do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe('#name, #gender, #admittance_date, #type, #breed, #customer_id, #id') do
    it('get animal information') do
      animal = Animal.new({name: "Pancake",
                           gender: "male",
                           admittance_date: '2016-01-01',
                           type: 'cat',
                           breed: 'Maine Coon',
                           customer_id: 1,
                           id: nil})
      expect(animal.name()).to(eq("Pancake"))
      expect(animal.gender()).to(eq("male"))
      expect(animal.admittance_date()).to(eq('2016-01-01'))
      expect(animal.type()).to(eq("cat"))
      expect(animal.breed()).to(eq("Maine Coon"))
      expect(animal.customer_id()).to(eq(1))
    end
  end

  describe('#save') do
    it('saves the animal into the database') do
      animal = Animal.new({name: "Pancake",
                           gender: "male",
                           admittance_date: '2016-01-01 00:00:00',
                           type: 'cat',
                           breed: 'Maine Coon',
                           customer_id: 1,
                           id: nil})
      animal.save()
      expect(Animal.all()).to(eq([animal]))
    end
  end

  describe('#==') do
    it('returns same animal if they have the same information') do
      animal1 = Animal.new({name: "Pancake",
                           gender: "male",
                           admittance_date: '2016-01-01',
                           type: 'cat',
                           breed: 'Maine Coon',
                           customer_id: 1,
                           id: nil})
      animal2 = Animal.new({name: "Pancake",
                           gender: "male",
                           admittance_date: '2016-01-01',
                           type: 'cat',
                           breed: 'Maine Coon',
                           customer_id: 1,
                           id: nil})
      expect(animal1).to(eq(animal2))
    end
  end

  describe('.sort') do
    it('sorts by breed alphabetically') do
      animal1 = Animal.new({name: "Pancake",
                           gender: "male",
                           admittance_date: '2016-01-02 00:00:00',
                           type: 'cat',
                           breed: 'Maine Coon',
                           customer_id: 1,
                           id: nil})
      animal1.save
      animal2 = Animal.new({name: "Tony",
                           gender: "male",
                           admittance_date: '2016-01-01 00:00:00',
                           type: 'brocat',
                           breed: 'Bengal',
                           customer_id: 1,
                           id: nil})
     animal2.save
     animal3 = Animal.new({name: "Siam",
                           gender: "female",
                           admittance_date: '2016-01-03 00:00:00',
                           type: 'cat',
                           breed: 'Siamese',
                           customer_id: 1,
                           id: nil})
      animal3.save
      expect(Animal.sort("breed")).to(eq([animal2, animal1, animal3]))
    end
  end

  describe('.filter') do
    it('filters by type') do
      animal1 = Animal.new({name: "Pancake",
                           gender: "male",
                           admittance_date: '2016-01-02 00:00:00',
                           type: 'cat',
                           breed: 'Maine Coon',
                           customer_id: 1,
                           id: nil})
      animal1.save
      animal2 = Animal.new({name: "Barky",
                           gender: "male",
                           admittance_date: '2016-01-01 00:00:00',
                           type: 'dog',
                           breed: 'pug',
                           customer_id: 1,
                           id: nil})
     animal2.save
     animal3 = Animal.new({name: "Siam",
                           gender: "female",
                           admittance_date: '2016-01-03 00:00:00',
                           type: 'cat',
                           breed: 'Siamese',
                           customer_id: 1,
                           id: nil})
      animal3.save
      expect(Animal.filter("type", "cat")).to(eq([animal1, animal3]))
    end
  end
end
