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

  describe 'add_insurance' do
    it 'will assign an insurance company to a doctor' do
      test_doc = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1})
      test_doc.save
      test_insurance = Insurance_Companies.new({'name' => 'Pacific Span'})
      test_insurance.save
      test_doc.add_insurance(test_insurance)
      expect(test_doc.insurance_company_id).to eq test_insurance.id
    end
  end

  describe 'update_doctor' do
    it 'will update a doctors record' do
      doctor = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1, 'insurance_company_id' => 3})
      doctor.save
      doctor2 = Doctor.new({'name' => 'Dr. Ronny', 'specialty_id' => 2, 'insurance_company_id' => 2})
      doctor.save
      doctor.update_doctor(doctor2)
      expect(doctor.name).to eq 'Dr. Ronny'
      expect(doctor.specialty_id).to eq 2
    end
  end

  describe 'delete_doctor!' do
    it 'will delete a doctors record' do
      doctor = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1})
      doctor.save
      doctor.delete_doctor!
      expect(Doctor.all).to eq []
    end
  end


#   describe 'update_patient' do
#   it 'will update a patients record' do
#     patient = Patient.new({'name' => 'Bill Clinton', 'birthday' => '05151948'})
#     patient.save
#     patient2 = Patient.new({'name' => 'William Clinton', 'birthday' => '05161948'})
#     patient.update_patient(patient2)
#     expect(patient.name).to eq 'William Clinton'
#     expect(patient.birthday).to eq '05161948'
#   end
# end
