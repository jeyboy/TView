Factory.sequence :name_project do |proj|
  "Project#{proj}"
end

Factory.sequence :img_url do |img|
  "index_group#{img}"
end

Factory.define :group do |g|
  r="/data/projectdir#{rand(10).to_s}/"
  g.tag {"Tag_#{rand(10).to_s}"}
  g.img_url {"#{r}"+"#{Factory.next :img_url}"}
  g.name_project {Factory.next :name_project}
  g.dir_project {"#{r}"}
end