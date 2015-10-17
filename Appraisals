%w(2.0 2.1 2.2).each do |ruby_version|
	%w(3.2 4.0 4.1 4.2).each do |rails_version|
		appraise "ruby#{ruby_version}-rails#{rails_version}" do
			ruby '2.1.6'
		  gem "rails", git: 'https://github.com/rails/rails.git', branch: "#{rails_version.gsub('.', '-')}-stable"
		end
	end
end