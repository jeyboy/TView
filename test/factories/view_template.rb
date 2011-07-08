Factory.define :view_template do |v|
  v.viewed_id {rand(60)  }
  v.association :userstat
end