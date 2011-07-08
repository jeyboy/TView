require 'ipaddr'



Factory.define :userstat do |u|
  browsers=["Opera","Mozzila","Safari","IE","Chrome","other"]
  u.user_ip {"#{IPAddr.new(rand(2**32),Socket::AF_INET)}"}
  u.browser {browsers[rand(6)]}
  u.went_from {"#{IPAddr.new(rand(2**32),Socket::AF_INET)}"}
  u.viewtemplates_count 0
  u.downloadtemplates_count 0
end