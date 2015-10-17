%w(3.2 4.0 4.1 4.2).each do |rails_version|
	appraise rails_version do
		gem 'test-unit', '~> 3.0' if rails_version == '3.2'
		gem "rails", "~> #{rails_version}"
	end
end
