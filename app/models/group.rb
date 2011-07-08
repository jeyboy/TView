class Group < ActiveRecord::Base
  has_many :template_groups,  :dependent => :destroy
  validates :tag, :name_project, :img_url, :presence => true
end
