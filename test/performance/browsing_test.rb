require 'test_helper'
require 'rails/performance_test_help'
#require  File.dirname(__FILE__) + '/performance_helper'
#require File.dirname(__FILE__) + '/../test_helper'

# Profiling results for each test method are written to tmp/performance.
class BrowsingTest < ActionController::PerformanceTest
  def test_homepage
    group=Factory(:group)
    tmpl=Factory(:template_group, :group=>group)
    puts Factory(:other_html,:template_group=>tmpl).inspect
    puts tmpl.inspect
    puts group.inspect
    get 'usershow/index'
  end

   def test_get_usershow_changetemplate
     Group.all.each do |group|
       get usershow_changetemplate_path(:id => group.id)
     end
   end

   def test_get_usershow_downloadtemplate
     TemplateGroup.find_all_by_template_link.each do |link|
       get usershow_downloadtemplate_path(:myhtml => link)
     end
   end

#   def test_get_usershow_otherhtml
#
#   end

end
