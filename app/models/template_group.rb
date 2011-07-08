class TemplateGroup < ActiveRecord::Base
  belongs_to :group
  has_many :other_htmls,  :dependent => :destroy
  validates :group_id, :img_template, :template_link, :folder_template, :presence => true
  validates :group_id, :numericality => true
end
