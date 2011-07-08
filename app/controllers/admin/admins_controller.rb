class Admin::AdminsController < ApplicationController
  before_filter :authenticate_auth!
  before_filter :search_logic
 
  def index
    @groups = @search.paginate(:per_page => 10, :page => params[:page])    
  end

  def new  
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(Zipparser::create(params))
    respond_to do |format|
      if @group.save        
        format.html { redirect_to new_admin_template_path(:id=>@group) }        
      else
        FileUtils.remove_dir("public"+@group.dir_project) if @group.dir_project != ''# and params[:admin][:path_test].empty?
        format.html { render :action => :new }
        flash[:error] = "All fields have not to be empty"        
      end
    end
  rescue
  end

  def update
    @group=Group.find(params[:id])
    if params[:group][:f_field]
      fpath=Zipparser::upload_file("public"+@group.dir_project, params[:group])
      @group.update_attributes(:img_url => fpath.gsub("public",""), :tag => params[:group][:tag], :name_project => params[:group][:name_project])
    else
      @group.update_attributes(:tag => params[:group][:tag], :name_project => params[:group][:name_project])
    end
    redirect_to admin_path    
  end

  def destroy
    @group = Group.find(params[:id])
    FileUtils.remove_dir("public"+@group.dir_project,true) unless @group.dir_project.empty?
    @group.destroy
    redirect_to admin_path
  rescue
  end

  private

  def search_logic
    @search = Group.search(params[:search])
  end


end
