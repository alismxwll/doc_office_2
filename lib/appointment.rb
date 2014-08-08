class Appointment
  attr_accessor :patient, :doctor, :date, :cost

  def initialize(attributes)
    @patient = attributes['patient']
    @doctor = attributes['doctor']
    @date = attributes['date']
    @cost = attributes['cost']
  end

  def self.all
    []
  end
end
