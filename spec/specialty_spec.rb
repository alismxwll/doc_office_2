require 'spec_helper'

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

  it 'will be the same specialty if they have the same name' do
    title1 = Specialty.new({'title' => 'Pediatrician'})
    title2 = Specialty.new({'title' => 'Pediatrician'})
    title1.save
    title2.save
    expect(title1).to eq title2
  end

  describe 'doctors_with_specialty' do
    it 'will list all of the doctors with a specific specialty' do
      specialty = Specialty.new({'title' => 'Pediatrician', 'id' => 1})
      specialty.save
      doctor1 = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => specialty.id})
      doctor1.save
      doctor2 = Doctor.new({'name' => 'Dr. Evil', 'specialty_id' => specialty.id})
      doctor2.save
      doctor3 = Doctor.new({'name' => 'Dr. Giggle', 'specialty_id' => 2})
      doctor3.save
      expect(specialty.doctors_with_specialty).to eq [doctor1, doctor2]
    end
  end
end
