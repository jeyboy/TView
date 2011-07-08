class ChangeOtherHtml < ActiveRecord::Migration
  def self.up
  add_column :other_htmls, :template_group_id, :integer
  end

  def self.down
  end
end
