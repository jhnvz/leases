require 'active_record'
require 'action_controller'

require 'leases'
require 'with_model'
require 'rspec/rails'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3',
                                        :database => File.dirname(__FILE__) + '/leaser.sqlite3')

Dir['spec/support/**/*.rb'].each { |f| load f }

RSpec.configure do |config|

  config.mock_with :rspec
  config.extend WithModel

  config.before(:each) do
    # Stub Apartment database interactions
    Apartment::Database.stub(:switch)
    Apartment::Database.stub(:reset)
    Apartment::Database.stub(:create)
    Apartment::Database.stub(:drop)
  end

end

module Dummy
  class Application < Rails::Application
  end
end
