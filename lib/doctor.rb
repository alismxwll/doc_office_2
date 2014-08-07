class Doctor
  attr_accessor :name, :specialty, :id

  def initialize(attributes)
    @name = attributes['name']
    @specialty = attributes['specialty']
    @id = attributes['id']
  end

  def self.all
    doctors = []
    new_doctor = DB.exec('SELECT * FROM doctors')
    new_doctor.each do |doctor|
      name = doctor['name']
      specialty = doctor['specialty']
      id = doctor['id']
      doctors << Doctor.new({'name' => name, 'specialty' => specialty, 'id' => id})
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES
            ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first['id']
  end

  def ==(doctor_obj)
    @name == doctor_obj.name
  end
end
