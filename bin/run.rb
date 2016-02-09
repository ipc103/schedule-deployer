require_relative "../config/environment"

puts "Running..."
Deployer.new('learn-co-curriculum/web-0216').post_todays_schedule
puts "Deployed!"
