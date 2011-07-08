class Admin::TemplateController < ApplicationController
  before_filter :authenticate_auth!
  before_filter :search_logic  

  def index
    @templategroups = @search.paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @tmpl = TemplateGroup.find(params[:id])
  end

  def new
    @g_id=params[:id] 
  end
   
  def destroy
    @template=TemplateGroup.find(params[:id])
    FileUtils.remove_dir("public"+@template.folder_template,true)
    @template.destroy
    redirect_to admin_template_index_path
  rescue
  end

  def create            
    inner = Zipparser::upload_zip(params)
    @template = TemplateGroup.new(inner[:template_group])
    respond_to do |format|
      if @template.save
        inner[:other_html].each {|inn|
          inn[:template_group_id]=@template.id
          other=OtherHtml.new(inn)
          other.save
        }
        format.html {redirect_to admin_template_index_path}
      else
        FileUtils.remove_dir("public"+@template.folder_template) if @template.folder_template !=""
        flash[:error] = "Structure of your archive is incorrect or Group ID isn't set."
        format.html {redirect_to :back}
      end
    end
  rescue
  end

  private
  def search_logic
    @search = TemplateGroup.search(params[:search])
  end

end
