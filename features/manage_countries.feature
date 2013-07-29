Feature: Manage countries
  In order to manage his travel itinerary
  Mr. Smart
  wants to manage the countries he has visited.

  Scenario: List Countries
    Given I am a new, authenticated user
    Given the following countries exist:
      |name|code|visited|
      |CountryOne|c1|false|
      |CountryTwo|c2|false|
      |CountryThree|c3|true|
      |CountryFour|c4|true|
      |CountryFive|c5|true|
    Given user visited following countries:
      |code|
      |c3|
      |c4|
      |c5|
    And I am on the countries page
    Then I should see the following table:
      |Name|Code|Status|
      |CountryOne|c1|Not Visited|
      |CountryTwo|c2|Not Visited|
      |CountryThree|c3|Visited|
      |CountryFour|c4|Visited|
      |CountryFive|c5|Visited|

#  Scenario: Visit Country
#    Given I am a new, authenticated user
#    Given I am on a country page
#    When I follow "Edit"
#    Then I should see "Visited"
#    And I check "Visited"
#    Then the "Visited" checkbox should be checked
#    And I press "Update Country"
#    Given I am on a country page
#    Then I should see "Status: Visited"
