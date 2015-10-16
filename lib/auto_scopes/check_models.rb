module AutoScopes
	class CheckModels < Rails::Railtie
		config.after_initialize do
			AutoScopes.associations_source.each_pair do |model, associations|
				AssociationsChains.new(model.constantize, associations, []).look_inside_chain
			end
  	end
	end
end

