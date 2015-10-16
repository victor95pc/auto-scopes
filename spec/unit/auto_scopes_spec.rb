require 'spec_helper'

describe AutoScopes do
  describe '.associations_source' do
  	it 'load YAML' do
  		expect(AutoScopes.associations_source).not_to be nil
  	end
  end
end
