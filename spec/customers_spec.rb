require('spec_helper')

describe(Customer) do
  describe('.all') do
    it('is empty at first') do
      expect(Customer.all()).to(eq([]))
    end
  end

  describe("#name, #phone, #animal_type_pref, #breed_preference") do
    it("tells you customer information") do
      customer1 = Customer.new({name: 'fenwick',
                           phone: 5551234,
                           animal_type_pref: 'dog',
                           breed_preference: 'dachshund',
                           id: nil})
      expect(customer1.name()).to(eq("fenwick"))
      expect(customer1.phone()).to(eq(5551234))
      expect(customer1.animal_type_pref()).to(eq('dog'))
      expect(customer1.breed_preference()).to(eq('dachshund'))
    end
  end

  describe('#==') do
    it('returns same customer if they have the same name') do
      customer1 = Customer.new({name: 'fenwick',
                                phone: 5551234,
                                animal_type_pref: 'dog',
                                breed_preference: 'dachshund',
                                id: nil})
      customer2 = Customer.new({name: 'fenwick',
                                phone: 5551234,
                                animal_type_pref: 'dog',
                                breed_preference: 'dachshund',
                                id: nil})
      expect(customer1).to(eq(customer2))
    end
  end

  describe('#save') do
    it('lets you save customers to the database') do
      customer1 = Customer.new({name: 'fenwick',
                                    phone: 5551234,
                                    animal_type_pref: 'dog',
                                    breed_preference: 'dachshund',
                                    id: nil})
      customer1.save()
      expect(Customer.all()).to(eq([customer1]))
    end
  end

  describe('#id') do
    it('set an id when saved') do
      customer = Customer.new({name: 'fenwick',
                               phone: 5551234,
                               animal_type_pref: 'dog',
                               breed_preference: 'dachshund',
                               id: nil})
      customer.save()
      expect(customer.id()).to(be_an_instance_of(Fixnum))
    end
  end




  describe('.filter') do
    it('filters customers by breed_preference alphabetically') do
      customer1 = Customer.new({name: 'Dave',
                                phone: 5551234,
                                animal_type_pref: 'dog',
                                breed_preference: 'dachshund',
                                id: nil})
      customer1.save
      customer2 = Customer.new({name: 'Karen',
                                phone: 5551234,
                                animal_type_pref: 'cat',
                                breed_preference: 'normal',
                                id: nil})
     customer2.save
     customer3 = Customer.new({name: 'Hamlet',
                               phone: 5551234,
                               animal_type_pref: 'dog',
                               breed_preference: 'dachshund',
                               id: nil})
      customer3.save
      expect(Customer.filter("breed_preference", "dachshund")).to(eq([customer1, customer3]))
    end
  end



end
