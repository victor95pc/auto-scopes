require 'pry'
require 'fileutils'
# Remove tmp dir of dummy app before it's booted.
FileUtils.rm_rf "#{File.dirname(__FILE__)}/dummy/tmp"

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require_relative '../spec/dummy/config/environment.rb'
require 'auto_scopes'
