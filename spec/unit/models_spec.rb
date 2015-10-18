require 'spec_helper'

describe AutoScopes::Models do
	let(:auto_scopes_associations) do
		{"Ceo"=>{"companies"=>{"employeds"=>["by_name", "age"]}}, "Employed"=>{"company"=>nil}}
	end


  describe '.check' do
		before(:each) do
			expect(described_class).to receive(:load_association_file) { auto_scopes_associations }
		end
		
  	it 'call load_association_file to get auto_scopes associations' do
  		described_class.check!
  	end

  	it 'look inside which model on auto_scopes_associations' do
  		associations_chains = double()

  		allow(AutoScopes::AssociationsChains).to receive(:new) { associations_chains }

  		expect(associations_chains).to receive(:look_inside_chain).exactly(2).times
  		described_class.check!
  	end
  end
end