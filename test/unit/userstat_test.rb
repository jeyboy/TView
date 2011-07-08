require 'test_helper'

class UserstatTest < ActiveSupport::TestCase
  should have_many :view_templates
  should have_many :download_templates

  context "count templates" do
    setup do
      @userstat = Factory :userstat
      @size = 5
      Array.new(@size) {
        Factory(:view_template, :userstat => @userstat)
        Factory(:download_template, :userstat => @userstat)
      }
    end
    should "count viewed templates" do
      assert_equal @userstat.reload.viewtemplates_count, @size
    end
    should "count downloaded templates" do
      assert_equal @userstat.reload.downloadtemplates_count, @size
    end
  end
end
