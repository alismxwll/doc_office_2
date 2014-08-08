require 'spec_helper'

describe 'Appointment' do
  it 'will initialize with patient and doctor' do
    patient = Patient.new({'name' => 'William Clinton', 'birthday' => '05161948'})
    patient.save
    specialty = Specialty.new({'title' => "Psychologist"})
    specialty.save
    doctor = Doctor.new({'name' => 'Dr. Drew', 'specialty_id' => specialty.id})
    doctor.save
    insurance = Insurance_Companies.new({'name' => 'Pacific Span'})
    insurance.save
    test_appointment = Appointment.new({'patient' => patient, 'doctor' => doctor, 'date' => '2001,2,3', 'cost' => 999})
    doctor.add_specialty(specialty)
    doctor.add_insurance(insurance)
    patient.assign_doctor(doctor)
    expect(test_appointment).to be_an_instance_of Appointment
  end

  it 'will start with an empty array of appointments' do
    expect(Appointment.all).to eq []
  end

  # it 'will save an appointment' do
  #   appointment = Appointment.new({'patient' => patient, 'doctor' => doctor, 'date' => '2001,2,3', 'cost' => 999})
  #   appointment.save
  #   expect(Appointment.all).to eq [appointment]
  # end


end

