class UsershowController < ApplicationController
  after_filter :path_track

  def index
    @groups=Group.select('DISTINCT tag').all    
  end
	
  def tagname  #conditions by tagname
    render :json => Group.find(:all, :conditions => ["tag= ?",params[:tag]])
  end

  def changetemplate #post
    render :json => TemplateGroup.find_all_by_group_id(params[:id])
  end

  def downloadtemplate        
    file_name="tview.zip"
    send_file Zipparser::create_zip(params[:myhtml]).path, :type => 'application/zip',
      :disposition => 'attachment',
      :filename => file_name    
  end

  def tview #post    
    render :json => OtherHtml.find_all_by_template_group_id(params[:id])    
  end

  def otherhtml
    if params[:other]
      render :text => OtherHtml.find_by_id(params[:other]).f_name
    elsif params[:template]
      render :text => TemplateGroup.find_by_id(params[:template]).template_link
    end
  end

  private

  def path_track   
    if params[:action] == "tview" and RulesStat.all.map(&:name).include?("view_template")
      templ = ViewTemplate.new
      templ.userstat_id=session[:user].to_i
      templ.viewed_id=params[:id].to_i
      templ.save
    elsif params[:action] == "downloadtemplate" and RulesStat.all.map(&:name).include?("download_template")
      templ_download = DownloadTemplate.new
      templ_download.userstat_id=session[:user].to_i
      templ_download.download_id=TemplateGroup.find_by_folder_template(File.dirname(params[:myhtml])).id.to_i
      templ_download.save
    end
  end

end
