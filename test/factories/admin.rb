Factory.define :admin, :class => Auth do |f|
  f.sequence(:username) { |n| "user#{n}" }
  f.password "secret"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "user#{n}@example.com" }
end
