class Doctor
  attr_accessor :name, :specialty_id, :id, :insurance_company_id

  def initialize(attributes)
    @name = attributes['name']
    @specialty_id = attributes['specialty_id']
    @id = attributes['id'].to_i
    @insurance_company_id = attributes['insurance_company_id']
  end

  def add_specialty(specialty)
    DB.exec("UPDATE doctors SET specialty_id = #{specialty.id} WHERE id = #{@id};")
    @specialty_id = specialty.id
  end

  def add_insurance(insurance)
    DB.exec("UPDATE doctors SET insurance_company_id = #{insurance.id} WHERE id = #{@id};")
    @insurance_company_id = insurance.id
  end

  def self.all
    doctors = []
    new_doctor = DB.exec('SELECT * FROM doctors')
    new_doctor.each do |doctor|
      name = doctor['name']
      specialty_id = doctor['specialty_id']
      id = doctor['id'].to_i
      doctors << Doctor.new({'name' => name, 'specialty_id' => specialty_id, 'id' => id})
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES
            ('#{@name}', '#{@specialty_id}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(doctor_obj)
    @name == doctor_obj.name && @id == doctor_obj.id
  end

  def update_doctor(doctor)
    DB.exec("UPDATE doctors SET name = '#{doctor.name}' WHERE id = #{@id}")
    DB.exec("UPDATE doctors SET specialty_id = '#{doctor.specialty_id}' WHERE id = #{@id};")
    DB.exec("UPDATE doctors SET insurance_company_id = '#{doctor.insurance_company_id}' WHERE id = #{@id}")
    @insurance_company_id = doctor.insurance_company_id
    @name = doctor.name
    @specialty_id = doctor.specialty_id
  end

  def delete_doctor!
    DB.exec("DELETE FROM doctors WHERE id = #{@id};")
  end

  def count_patients
    doctors =  []
    docs = DB.exec("SELECT * FROM doctors")
    docs.each do |doc|
      id = doc['id']
      number_patients = DB.exec("SELECT COUNT (*) FROM doctor_patient WHERE doctor_id = #{id};")
      doctors << number_patients.first['count'].to_i
    end
    doctors
  end
end
