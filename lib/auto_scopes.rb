require 'yaml'
require 'configurations'
require "rails/paths"
require "active_support/concern"
require 'active_support/core_ext/module/delegation'
require 'rails/railtie'
require 'active_record'

require "auto_scopes/version"
require "auto_scopes/associations_methods"
require "auto_scopes/associations_chains"
require "auto_scopes/check_models"

module AutoScopes
	include Configurations

	configurable :auto_scopes_location, :scope_association_prefix, :create_scope_for_association

	configuration_defaults do |c|
		c.auto_scopes_location         = 'config/auto_scopes'
		c.scope_association_prefix     = 'by'
		c.create_scope_for_association = true
  end

	class << self
		def config
			AutoScopes.configuration
		end

		def associations_source
			@_associations_source ||= YAML.load_file(Rails.root.join(config.auto_scopes_location + '.yml')) || []
		end
	end
end