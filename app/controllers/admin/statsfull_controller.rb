class Admin::StatsfullController < ApplicationController
  before_filter :authenticate_auth!
  before_filter :search_logic, :only => [:index]
 
    
  def index
    @userstats = @search.paginate(:per_page => 10, :page => params[:page])    
  end
  
  def small    
    @top_viewed={}
    ViewTemplate.all.map(&:viewed_id).each do |t|
      @top_viewed.each_key.include?(t.to_s) ? @top_viewed[t.to_s]+=1 : @top_viewed.update({t.to_s => 1})
    end   
    
  end

  def top_downloaded
     @top_downloaded={}
    DownloadTemplate.all.map(&:download_id).each do |t|
      @top_downloaded.each_key.include?(t.to_s) ? @top_downloaded[t.to_s]+=1 : @top_downloaded.update({t.to_s => 1})
    end
  end

  def show
    @userstat = Userstat.find(params[:format])
  end
 
  def rules_config
    expire_fragment("rules")
    rules=RulesStat.find_by_name(params[:rule])
    rules!=nil ? rules.destroy : RulesStat.new({:name => params[:rule]}).save
    render :text => nil
  end


  private

  def search_logic
    #defaults = {'meta_sort' => 'created_at.desc'}
    @search = Userstat.search(params[:search])
  end


end