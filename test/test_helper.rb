ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'shoulda_macros/auth'
require 'action_dispatch/testing/test_process.rb'



#require 'redgreen'
#require 'test/unit/ui/console/testrunner'
#class Test::Unit::UI::Console::TestRunner
#  def guess_color_availability
#    true
#  end
#end


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  #fixtures :all
  
  # Add more helper methods to be used by all tests here...
end
class ActionController::TestCase
  include Devise::TestHelpers
end