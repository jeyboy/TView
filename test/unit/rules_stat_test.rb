require 'test_helper'

class RulesStatTest < ActiveSupport::TestCase
  %w(download_template went_from view_template user_ip browser).each do |value|
    should allow_value(value).for(:name)
  end
end
