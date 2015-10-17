require "spec_helper"

describe AutoScopes::Generators::InstallGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before :all do
    prepare_destination
    run_generator
  end

  it "creates initializer" do
    assert_file "config/initializers/auto_scopes.rb"
  end

  it 'creates auto_scopes yaml' do
    assert_file "config/auto_scopes.yml"
  end
end