class Specialty
  attr_accessor :title, :id

  def initialize(attributes)
    @title = attributes['title']
    @id = attributes['id']
  end

  def self.all
    specialties = []
    result = DB.exec("SELECT * FROM specialty;")
    result.each do |spec|
      title = spec['title']
      id = spec['id']
      specialties << Specialty.new({'title' => title, 'id' => id})
    end
    specialties
  end

  def save
    result = DB.exec("INSERT INTO specialty (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first['id']
  end

  def ==(other_title)
    @title == other_title.title
  end

end
