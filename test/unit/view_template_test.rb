require 'test_helper'

class ViewTemplateTest < ActiveSupport::TestCase
  should belong_to :userstat
  should validate_numericality_of :userstat_id
  should validate_numericality_of :viewed_id
end
