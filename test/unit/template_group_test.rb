require 'test_helper'

class TemplateGroupTest < ActiveSupport::TestCase
  should belong_to :group
  should have_many(:other_htmls).dependent(:destroy)
  should validate_presence_of :group_id
  should validate_presence_of :img_template
  should validate_presence_of :template_link
  should validate_presence_of :folder_template
  should validate_numericality_of :group_id
end
