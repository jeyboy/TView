require 'test_helper'

class DownloadTemplateTest < ActiveSupport::TestCase
  should belong_to(:userstat)
  should validate_numericality_of :userstat_id
  should validate_numericality_of :download_id  
end
