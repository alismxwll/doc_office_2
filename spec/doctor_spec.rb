require 'spec_helper'

describe Doctor do
  it 'initializes with a name, specialty and id' do
    doc = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty' => 'Brain Surgeon'})
    expect(doc).to be_an_instance_of Doctor
  end

  it 'will start with an empty array of doctors' do
    expect(Doctor.all).to eq []
  end

  it 'will read out the name, specialty and id of a doctor' do
    doc = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty' => 'Brain Surgeon'})
    expect(doc.name).to eq 'Dr. Ronaldo'
    expect(doc.specialty).to eq 'Brain Surgeon'
  end

  it 'will add a doctor to the database' do
    doc = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty' => 'Brain Surgeon'})
    doc.save
    expect(Doctor.all).to eq [doc]
  end

  it 'is the same doctor if they have the same name and id' do
    doc1 = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty' => 'Brain Surgeon'})
    doc2 = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty' => 'Brain Surgeon'})
    expect(doc1).to eq doc2
  end
end
