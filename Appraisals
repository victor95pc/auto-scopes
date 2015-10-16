%w(3.2 4.0 4.1 4.2).each do |version|
	appraise version do
	  gem "rails", git: 'https://github.com/rails/rails.git', branch: "#{version.gsub('.', '-')}-stable"
	end
end