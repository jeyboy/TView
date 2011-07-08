class ViewTemplate < ActiveRecord::Base
  belongs_to :userstat, :counter_cache => :viewtemplates_count, :touch => true
  validates :userstat_id, :viewed_id, :numericality => true
end
