require('spec_helper')

describe(Shoe) do

  it("validates presence of brand") do
    result1 = Shoe.create({:brand => ""}).valid?
    result2 = Shoe.create({:brand => nil}).valid?
    expect(result1).to eq(false)
    expect(result2).to eq(false)
  end

  it('capitalizes brands users enter') do
    shoe = Shoe.create({:brand => "entered lower"})
    expect(shoe.brand).to eq 'Entered Lower'
  end
end
