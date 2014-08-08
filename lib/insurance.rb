class Insurance_Companies
  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def self.all
    companies = []
    result = DB.exec("SELECT * FROM insurance_companies;")
    result.each do |company|
      companies << Insurance_Companies.new(company)
    end
    companies
  end

  def save
    result = DB.exec("INSERT INTO insurance_companies (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(other_company)
    @name == other_company.name
  end

  def update_insurance_company(insurance)
    DB.exec("UPDATE insurance_companies SET name = '#{insurance.name}' WHERE id = #{@id}")
    @name = insurance.name
  end

  def delete_insurance!
    DB.exec("DELETE FROM insurance_companies WHERE id = #{@id};")
  end
end
