class CreateOtherHtmls < ActiveRecord::Migration
  def self.up
    create_table :other_htmls do |t|
      t.string :f_name
      t.string :prev_img
      t.timestamps
    end
  end

  def self.down
    drop_table :other_htmls
  end
end
