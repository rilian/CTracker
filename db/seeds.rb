# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.delete_all
UserCountry.delete_all

user = User.create!(email: 'user@example.com', password: 'please', password_confirmation: 'please')

puts "Created User #{user.inspect}"

Country.all.shuffle[0..20].each do |country|
  UserCountry.create!(user_id: user.id, country_id: country.id, created_at: (Time.now - rand(300).days))
end

puts "Created #{UserCountry.count} UserCountries"


