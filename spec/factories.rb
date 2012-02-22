Factory.define :announcement do |f|
  f.title "Announcement"
  f.body "Testing"
  f.author "Tester"
end

Factory.define :comment do |f|
  f.body "Testing"
  f.author "Tester"
  f.ip "127.0.0.1"
end
