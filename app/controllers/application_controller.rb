class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :userstat

  def userstat
    unless session[:user]
      rule=RulesStat.all.map(&:name)
      user_stat=Userstat.new
      user_stat.browser=request.env["HTTP_USER_AGENT"] if rule.include?("browser")
      user_stat.user_ip=request.env["REMOTE_ADDR"] if rule.include?("user_ip")
      user_stat.went_from=request.env["REMOTE_HOST"] if rule.include?("went_from")
      user_stat.save
      session[:user]=user_stat.id
    end
  end

end
