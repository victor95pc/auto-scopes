module AutoScopes
	class AssociationsMethods < Struct.new(:associations_chains)
		attr_accessor :path

		delegate :klass, to: :associations_chains

		delegate :config, to: AutoScopes

		def initialize(associations_chains, path = associations_chains.path)
			self.associations_chains = associations_chains
			self.path                = path.clone
		end

		def create_merge(methods)
			association_klass = get_last_association_from_path
			joins_path        = organize_joins

    	methods.each do |method|
	    	klass.define_singleton_method(method) do |*args|
	        joins(joins_path).merge association_klass.send(method, *args)
	      end
    	end
		end

		def create_association
    	association_klass, field = get_last_association_from_path do |klass, foreign_key|
    		path.pop
  			[klass, foreign_key]
    	end

    	joins_path = organize_joins

    	field ||= 'id'

      klass.define_singleton_method("#{config.scope_association_prefix}_#{associations_chains.path.last}") do |id|
        joins(joins_path).where(association_klass.table_name => { field => id })
      end
		end

		private

		def organize_joins
			path.map(&:to_sym).reverse.inject() { |a, n| { n => a } }
    end

    def get_last_association_from_path
    	path.inject(klass) do |klass, reflection|

    		reflection_access = if Rails.version < '4.2'
    				reflection.to_sym 
	    		else
    				reflection 
    		end

    		reflection_klass = klass.reflections[reflection_access]

    		if block_given? && path.last == reflection && reflection_klass.macro == :belongs_to
    			yield klass, reflection_klass.foreign_key
    		else
    			reflection_klass.class_name.constantize
    		end
    	end
    end
	end
end