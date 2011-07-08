require 'test_helper'

class OtherHtmlTest < ActiveSupport::TestCase
  should belong_to :template_group
  should validate_presence_of :f_name
  should validate_presence_of :prev_img
end
