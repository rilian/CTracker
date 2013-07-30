Feature: Manage countries
  In order to manage his travel itinerary
  Mr. Smart
  wants to manage the countries he has visited.

  Scenario: List Countries
    Given I am a new, authenticated user
    Given the following countries exist:
      |name|code|
      |CountryOne|c1|
      |CountryTwo|c2|
      |CountryThree|c3|
      |CountryFour|c4|
      |CountryFive|c5|
    Given user visited following countries:
      |code|
      |c3|
      |c4|
      |c5|
    And I am on the countries page
    Then I should see the following countries table:
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

  Scenario: Filter Countries
    Given I am a new, authenticated user
    Given the following countries exist:
      | name      | code |
      | CountryA1 | c1   |
      | CountryA2 | c2   |
      | CountryB  | c3   |
    Given user visited following countries:
      | code |
      | c2   |
      | c3   |
    Given I am on the countries page

    When I fill in "Name or Country" with "A"
    And I press "Search"
    Then I should see the following countries table:
      | Name      | Code | Status      |
      | CountryA1 | c1   | Not Visited |
      | CountryA2 | c2   | Visited     |
