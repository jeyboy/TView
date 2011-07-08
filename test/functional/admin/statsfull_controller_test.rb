require 'test_helper'

class Admin::StatsfullControllerTest < ActionController::TestCase
  signed_in_admin_context do
    context "on GET index" do
      setup do
        get :index
      end
      should render_template(:index)
      should render_with_layout(:application)
      should assign_to(:userstats)
    end

    context "on GET show" do
      setup do
        @userstat = Factory :userstat
        get :show, :format => @userstat.id
      end
      should render_template(:show)
      should render_with_layout(:application)
      should assign_to(:userstat)
    end

    context "on GET small" do
      setup do
        get :small
      end
      should render_template(:small)
      should render_with_layout(:application)
      should assign_to(:top_viewed)
    end

    context "on GET top_downloaded" do
      setup do
        get :top_downloaded
      end
      should render_template(:top_downloaded)
      should render_with_layout(:application)
      should assign_to(:top_downloaded)
    end

#    context "on POST rules_config" do   #test for chache. fix me
#      setup do
#        @rules = Factory :rules_stat
#        post :rules_config, :rule => @rules.name
#      end
#      should_not render_with_layout()
#
#    end
  end

end
