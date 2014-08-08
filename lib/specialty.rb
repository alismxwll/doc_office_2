class Specialty
  attr_accessor :title, :id

  def initialize(attributes)
    @title = attributes['title']
    @id = attributes['id'].to_i
  end

  def doctors_with_specialty
    doctors = []
    result = DB.exec("SELECT * FROM doctors WHERE specialty_id = '#{@id}';")
    result.each do |doc|
      doctors << Doctor.new(doc)
    end
    doctors
  end

  def self.all
    specialties = []
    result = DB.exec("SELECT * FROM specialty;")
    result.each do |spec|
      title = spec['title']
      id = spec['id'].to_i
      specialties << Specialty.new({'title' => title, 'id' => id})
    end
    specialties
  end

  def save
    result = DB.exec("INSERT INTO specialty (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(other_title)
    @title == other_title.title
  end

  def update_specialty(specialty)
    DB.exec("UPDATE specialty SET title = '#{specialty.title}' WHERE id = #{@id};")
    @title = specialty.title
  end

  def delete_specialty!
    DB.exec("DELETE FROM specialty WHERE id = #{@id};")
  end
end
