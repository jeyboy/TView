require 'test_helper'

class Admin::AdminsControllerTest < ActionController::TestCase
  signed_in_admin_context do
    context "on GET index" do
      setup do       
        get :index
      end
      should respond_with(:success)
      should assign_to(:groups)
      should render_with_layout(:application)
      should render_template(:index)
    end

    context "on GET new" do
      setup do
        get :new
      end
      should respond_with(:success)
      should render_with_layout(:application)
      should render_template(:new)
    end

    context "on GET edit" do
      setup do
        @group = Factory :group
        get :edit, :id => @group.id
      end
      should respond_with(:success)
      should render_with_layout(:application)
      should render_template(:edit)
      should assign_to(:group)
    end

    context "on POST create" do      
      #      context "success" do
      setup do
        post :create, :admin => {:path_test => "tmp/test/" , :tag => "Tag1", :name_project => "Project1",
          :f_field => fixture_file_upload('test.zip', 'application/zip')
        }
      end
      should respond_with(:redirect)
      should redirect_to("new template"){new_admin_template_path(:id=>assigns(:group).id)}
      should assign_to(:group)
      #      end

      #      context "fail" do
      #        setup do
      #          post :create, :admin => {:path_test => "tmp/test/" , :tag => nil, :name_project => "Project1"}
      #        end
      #        should redirect_to(:new)
      #        should set_the_flash{"All fields have not to be empty"}
      #        should assign_to(:group)
      #      end
    end

    context "on PUT update" do
      setup do
        @group = Factory :group
        put :update, :id => @group.id, :group => {:tag => "Tag_updated", :name_project => "Project_updated"}
      end
      should redirect_to("admin index"){admin_path}
      should respond_with(:redirect)
      should assign_to(:group)
    end

    context "on DELETE destroy" do
      setup do
        @group = Factory :group
        delete :destroy, :id => @group.id
      end
      should respond_with(:redirect)
      should redirect_to("admin index"){admin_path}
      should assign_to(:group)
    end

  end

end
