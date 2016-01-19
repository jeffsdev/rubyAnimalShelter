require('spec_helper')

describe(Customer) do
  describe('.all') do
    it('is empty at first') do
      expect(Customer.all()).to(eq([]))
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
end
