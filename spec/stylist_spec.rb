require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe('#name') do
    it('tells you its name') do
      stylist = Stylist.new(name: 'Najib', id: nil)
      expect(stylist.name).to(eq('Najib'))
    end
  end

  describe('#id') do
    it('sets its ID when you save it') do
      stylist = Stylist.new(name: 'Najib', id: nil)
      stylist.save
      expect(stylist.id).to(be_an_instance_of(Integer))
    end
  end
end
