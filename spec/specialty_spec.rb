describe Specialty do
  it 'initalizes a specialty object with a title and id' do
    title1 = Specialty.new({'title' => 'Pediatrician'})
    expect(title1).to be_an_instance_of Specialty
  end

  it 'will read out the title' do
    title1 = Specialty.new({'title' => 'Pediatrician'})
    expect(title1.title).to eq 'Pediatrician'
  end

  it 'will start with an empty array' do
    expect(Specialty.all).to eq []
  end

  it 'will save a title to the list' do
    title1 = Specialty.new({'title' => 'Pediatrician'})
    title2 = Specialty.new({'title' => 'Neurosurgeon'})
    title1.save
    title2.save
    expect(Specialty.all).to eq [title1, title2]
  end

  it 'will list out all specialties' do
    title1 = Specialty.new({'title' => 'Pediatrician'})
    title2 = Specialty.new({'title' => 'Neurosurgeon'})
    title1.save
    title2.save
    expect(Specialty.all).to eq [title1, title2]
  end

  it 'will be the same specialty if they have the same name and id' do
    title1 = Specialty.new({'title' => 'Pediatrician'})
    title2 = Specialty.new({'title' => 'Pediatrician'})
    title1.save
    title2.save
    expect(title1).to eq title2
  end
end
