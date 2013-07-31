Given /the following currencies exist:/ do |countries|
  countries.hashes.each do |currency_hash|
    country_id = Country.find_by_code(currency_hash['country_code'])
    Currency.create!(currency_hash.merge({country_id: country_id}))
  end
end

Then /^I should see the following currencies table:$/ do |expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.css('section>*>table#currencies_table>tr').collect { |row| row.xpath('.//th|td').collect { |cell| cell.text } }

  expected_table.diff!(rows)
end
