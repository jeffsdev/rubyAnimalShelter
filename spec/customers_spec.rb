require('spec_helper')

describe(Customer) do
  describe('.all') do
    it('is empty at first') do
      expect(Customer.all()).to(eq([]))
    end
  end
end
