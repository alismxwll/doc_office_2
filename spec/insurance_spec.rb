require 'spec_helper'

describe Insurance_Companies do
  it 'initializes an insurance company class with a name and id' do
    insurance_company = Insurance_Companies.new({'name' => 'Pacific Span', 'id' => 1})
    expect(insurance_company).to be_an_instance_of Insurance_Companies
  end

  it 'will start with an empty array of insurance companies' do
    expect(Insurance_Companies.all).to eq []
  end

  it 'will save an insurance company to the database' do
    test_company = Insurance_Companies.new({'name' => 'Pacific Span', 'id' => 1})
    test_company.save
    expect(Insurance_Companies.all).to eq [test_company]
  end

  it 'will be the same company if they have the same name' do
    test_company1 = Insurance_Companies.new({'name' => 'Pacific Span', 'id' => 1})
    test_company2 = Insurance_Companies.new({'name' => 'Pacific Span', 'id' => 1})
    test_company1.save
    test_company2.save
    expect(test_company1).to eq test_company2
  end

  it 'will update the insurance company name' do
    test_company = Insurance_Companies.new({'name' => 'Pacific Span', 'id' => 1})
    test_company.save
    test_company2 = Insurance_Companies.new({'name' => 'Red Cross', ' id' => 1})
    test_company.update_insurance_company(test_company2)
    expect(test_company.name).to eq 'Red Cross'
  end

  it 'will delete an insurance company from the system' do
    test_company = Insurance_Companies.new({'name' => 'Pacific Span', 'id' => 1})
    test_company.save
    test_company.delete_insurance!
    expect(Insurance_Companies.all).to eq []
  end
end

