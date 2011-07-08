class OtherHtml < ActiveRecord::Base
  belongs_to :template_group
  validates :f_name, :prev_img, :presence => true
end
