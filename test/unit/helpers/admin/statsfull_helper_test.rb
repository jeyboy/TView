require 'test_helper'

class Admin::StatsfullHelperTest < ActionView::TestCase
  context "checker should return path or 'deleted' " do
    setup do
      @template = Factory :template_group
    end
    should "return path" do
      assert_equal (link_to "Show", admin_template_path(@template.id)), checker(@template.id)
    end
    should "return 'deleted'" do
      assert_equal "Deleted", checker(@template.id+1000)
    end
  end
end
