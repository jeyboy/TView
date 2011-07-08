require 'test_helper'

class UsershowControllerTest < ActionController::TestCase
  context "on GET index" do
    setup do
      get :index
    end
    should assign_to(:groups)
    should render_with_layout(:usershow)
    should render_template(:index)
  end

  context "on XHR tagname" do
    setup do   
      xhr :post, :tagname
    end
    should respond_with(:success)
    should respond_with_content_type(:json)
  end

  context "on XHR changetemplate" do
    setup do
      xhr :post, :changetemplate
    end
    should respond_with(:success)
    should respond_with_content_type(:json)
  end

  context "on XHR tview" do
    setup do
      xhr :post, :tview
    end
    should respond_with(:success)
    should respond_with_content_type(:json)
  end

  context "on GET downloadtemplate"do
    setup do      
      get :downloadtemplate, :myhtml => "/data/test/testdownload/README.txt"      
    end
    should respond_with(:success)
  end

end
