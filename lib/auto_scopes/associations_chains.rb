module AutoScopes
	class AssociationsChains < Struct.new(:klass, :associations, :path)

		delegate :config, to: AutoScopes

		attr_accessor :association

		def look_inside_chain
      associations.each_pair do |association_parent, association|
      	self.association = association

      	path.push(association_parent)

        method_maker.create_association if config.create_scope_for_association

        if nested_hash?
        	self.class.new(klass, association, path.clone).look_inside_chain
        else
        	call_methods_maker
        end
      end
    end

		private

		def method_maker(another_path = self.path)
			AssociationsMethods.new(self, another_path)
		end

		def call_methods_maker
      if methods_inside? 
      	method_maker.create_merge(association)
      elsif association.present?
  			method_maker(path + [associations]).create_association
      end
		end

		def nested_hash?
			association.is_a? Hash
		end

		def methods_inside?
			association.is_a? Array
		end
	end
end