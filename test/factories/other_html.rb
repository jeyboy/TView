Factory.sequence :f_name do |n|
  "about#{n.to_s}.html"

end

Factory.define :other_html do |h|
  h.f_name {Factory.attributes_for(:template_group)[:folder_template]+Factory.next(:f_name)}
  h.prev_img {Factory.attributes_for(:template_group)[:folder_template]+"img#{rand(5).to_s}.jpg"}
  h.association :template_group
end