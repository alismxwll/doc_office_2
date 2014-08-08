class Doctor
  attr_accessor :name, :specialty_id, :id

  def initialize(attributes)
    @name = attributes['name']
    @specialty_id = attributes['specialty_id']
    @id = attributes['id'].to_i
  end

  def add_specialty(specialty)
    DB.exec("UPDATE doctors SET specialty_id = #{specialty.id} WHERE id = #{@id};")
    @specialty_id = specialty.id
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
end
