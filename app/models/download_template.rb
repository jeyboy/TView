class DownloadTemplate < ActiveRecord::Base
  belongs_to :userstat, :touch => true, :counter_cache => :downloadtemplates_count
  validates :userstat_id, :download_id, :numericality => true
end
