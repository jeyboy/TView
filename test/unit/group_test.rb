require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should have_many(:template_groups).dependent(:destroy)
  should validate_presence_of :tag
  should validate_presence_of :name_project
  should validate_presence_of :img_url
end
