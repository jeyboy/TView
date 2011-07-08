Factory.define :download_template do |d|
  d.download_id {rand(60) }
  d.association :userstat
end