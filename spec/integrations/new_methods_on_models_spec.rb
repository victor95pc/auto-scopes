require 'spec_helper'


describe 'NewMethodsOnModels', type: :integration do
	before(:each) do
		allow(YAML).to receive(:load_file) do
			{"Ceo"=>{"companies"=>{"employeds"=>["by_name", "age"]}}, "Employed"=>{"company"=>nil}}
		end

		AutoScopes.setup do |c|
		end
	end

  it 'check if scopes was created' do
  	expect(Ceo.respond_to?(:by_name)).to      be_truthy
  	expect(Ceo.respond_to?(:age)).to          be_truthy
  	expect(Ceo.respond_to?(:by_companies)).to be_truthy
  	expect(Ceo.respond_to?(:by_employeds)).to be_truthy

  	expect(Employed.respond_to?(:by_company)).to be_truthy
  end

  it 'dont make a join if the last association is a belongs_to' do
  	expect(Employed.where(company_id: 10).to_sql).to eq( Employed.by_company(10).to_sql)
  end
end
