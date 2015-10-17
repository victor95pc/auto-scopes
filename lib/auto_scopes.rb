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
# require "auto_scopes/create"
require "auto_scopes/check_models"

module AutoScopes
	include Configurations

	configurable :associations_location, :prefix

	configuration_defaults do |c|
    c.associations_location = 'config/auto_scopes'
    c.prefix                = 'by'
  end

	class << self
		def associations_source
			@_associations_source ||= YAML.load_file(Rails.root.join(AutoScopes.configuration.associations_location + '.yml')) || []
		end
	end
end