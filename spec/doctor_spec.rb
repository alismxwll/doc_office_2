require 'spec_helper'

describe Doctor do
  it 'initializes with a name, specialty and id' do
    doc = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1})
    expect(doc).to be_an_instance_of Doctor
  end

  it 'will start with an empty array of doctors' do
    expect(Doctor.all).to eq []
  end

  it 'will read out the name, specialty and id of a doctor' do
    doc = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1 })
    expect(doc.name).to eq 'Dr. Ronaldo'
    expect(doc.specialty_id).to eq 1
  end

  it 'will add a doctor to the database' do
    doc = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1})
    doc.save
    expect(Doctor.all).to eq [doc]
  end

  it 'is the same doctor if they have the same name and id' do
    doc1 = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1})
    doc2 = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1})
    expect(doc1).to eq doc2
  end
end

  describe 'add_specialty' do
    it 'will assign a specialty to a doctor' do
      specialty = Specialty.new({'title' => 'Brain Surgeon'})
      specialty.save
      doctor = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1})
      doctor.save
      doctor.add_specialty(specialty)
      expect(doctor.specialty_id).to eq specialty.id
    end
  end
