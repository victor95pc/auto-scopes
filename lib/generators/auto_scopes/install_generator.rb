require 'rails/generators/base'

module AutoScopes
  module Generators
    class InstallGenerator < Rails::Generators::Base
    	source_root File.expand_path('../../../../config', __FILE__)

      desc 'Create a default files for auto_scopes with some use cases'

      def copy_initializer
        copy_file 'initializers/auto_scopes.rb', 'config/initializers/auto_scopes.rb'
      end

      def copy_auto_scopes_yml
        copy_file 'auto_scopes.yml', 'config/auto_scopes.yml'
      end
    end
  end
end