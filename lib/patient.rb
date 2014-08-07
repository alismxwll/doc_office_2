class Patient
  attr_accessor :name, :birthday, :id

  def initialize(attributes)
    @name = attributes['name']
    @birthday = attributes['birthday']
    @id = attributes['id']
  end

  def Patient.all
    []
  end

  def ==(another_patient)
    @name == another_patient.name && @id == another_patient.id
  end
end
