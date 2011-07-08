require 'test_helper'

class Admin::TemplateControllerTest < ActionController::TestCase
  signed_in_admin_context do
    context "on GET index" do
      setup do
        get :index
      end
      should render_template(:index)
      should render_with_layout(:application)
      should assign_to(:templategroups)
    end
  

    context "on GET show" do
      setup do
        @template=Factory :template_group
        get :show, :id => @template.id
      end
      should render_template(:show)
      should render_with_layout(:application)
      should assign_to(:tmpl)
    end

    context "on GET new" do
      setup do
        @group=Factory :group
        get :new, :id => @group.id
      end
      should render_template(:new)
      should render_with_layout(:application)
      should assign_to(:g_id)
    end

#    context "on POST create" do #fix me%)
#      setup do
#        @template = Factory :template_group
#        @group = Factory :group
#        post :create, :admin => {:path_test => "tmp/test/" , :tag => @group.tag, :name_project => @group.name_project, :group_id => @group.id,
#          :f_field => fixture_file_upload('test.zip', 'application/zip'),
#          :template_group=>{:img_template=>@template.img_template, :template_link => @template.template_link, :folder_template => @template.folder_template, :group_id => @group.id}
#        }
#      end
#      should respond_with(:redirect)
#      should redirect_to("template index"){admin_template_index_path}
#      should assign_to(:template)
#    end
    context "on DELETE destroy" do
      setup do
        @template = Factory :template_group
        delete :destroy, :id=>@template.id
      end
      should assign_to(:template)
      should respond_with(:redirect)
      should redirect_to("template index"){admin_template_index_path}
    end
  end
end
