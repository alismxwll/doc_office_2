require 'spec_helper'

describe Patient do
  it 'initializes with a name, birthday and id' do
    patient = Patient.new({'name' => 'Bill Clinton', 'birthday' => '05151948'})
    expect(patient).to be_an_instance_of Patient
  end

  it 'will read out the name and birthday of a patient' do
    patient = Patient.new({'name' => 'Bill Clinton', 'birthday' => '05151948'})
    expect(patient.name).to eq 'Bill Clinton'
    expect(patient.birthday).to eq '05151948'
  end

  it 'will start with an empty array of patients' do
    expect(Patient.all).to eq []
  end

  it 'will be the same patient if they have same name and same id' do
    patient1 = Patient.new({'name' => 'Bill Clinton', 'birthday' => '05151948'})
    patient2 = Patient.new({'name' => 'Bill Clinton', 'birthday' => '05151948'})
    expect(patient1).to eq patient2
  end

  it 'will save a new patient to the system' do
    patient = Patient.new({'name' => 'Bill Clinton', 'birthday' => '05151948'})
    patient.save
    expect(Patient.all).to eq [patient]
  end

  it 'will assign a patient to a doctor' do
    patient = Patient.new({'name' => 'Bill Clinton', 'birthday' => '05151948'})
    patient.save
    doctor = Doctor.new({'name' => 'Dr. Ronaldo', 'specialty_id' => 1})
    doctor.save
    patient.assign_doctor(doctor)
    expect(patient.doctors).to eq [doctor]
  end
end

