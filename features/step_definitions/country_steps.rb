Given /the following countries exist:/ do |countries|
  Country.create!(countries.hashes)
end

Given /user visited following countries:/ do |countries|
  countries.hashes.collect { |c| c['code'] }.each do |code|
    UserCountry.create!(user_id: User.last.id, country_id: Country.find_by_code(code).id)
  end
end

Then /^I should see the following countries table:$/ do |expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.css('section>table#countries_table>tr').collect { |row| row.xpath('.//th|td').collect {|cell| cell.text } }

  expected_table.diff!(rows)
end
