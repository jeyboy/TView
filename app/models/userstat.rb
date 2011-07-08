class Userstat < ActiveRecord::Base
  has_many :view_templates
  has_many :download_templates
end
