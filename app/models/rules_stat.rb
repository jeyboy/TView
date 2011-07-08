class RulesStat < ActiveRecord::Base
  validates_inclusion_of :name, :in => %w(download_template went_from view_template user_ip browser)
end
