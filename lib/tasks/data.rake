namespace :data do
  desc 'add new admin with default login and password'
  task :reset_admin => :environment do
        Auth.delete_all
        auth = Auth.new(:email => "admin@testdomain.ua", :password => "12345")
        if auth.save!
		puts 'Done'
	else
		puts 'No done'
	end
      end
end
