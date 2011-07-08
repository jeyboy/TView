Factory.define :template_group do |t|
  r=rand(10).to_s
  t.folder_template {"#{Factory.attributes_for(:group)[:dir_project]}"+"FolderTemplate_#{r}/"}
  t.img_template {"#{Factory.attributes_for(:group)[:dir_project]}"+"FolderTemplate_#{r}/" + ActiveSupport::SecureRandom.hex(2).to_s + ".jpg"}
  t.template_link {"#{Factory.attributes_for(:group)[:dir_project]}"+"FolderTemplate_#{r}/" + "index.html"}
  t.association :group
end