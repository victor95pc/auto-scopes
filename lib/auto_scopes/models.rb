module AutoScopes
	module Models
		class << self
			def check!
				load_association_file.each_pair do |model, associations|
					AssociationsChains.new(model.constantize, associations, []).look_inside_chain
				end
			end

			private 

			def load_association_file
				YAML.load_file(Rails.root.join(AutoScopes.config.auto_scopes_location + '.yml')) || []
			end
		end
	end
end