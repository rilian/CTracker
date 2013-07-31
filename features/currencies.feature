Feature: Manage currencies
  In order to manage his travel itinerary
  Mr. Smart
  wants to manage the currencies he collected

  Scenario: List Countries
    Given I am a new, authenticated user
    Given the following countries exist:
      | name         | code |
      | CountryOne   | c1   |
      | CountryTwo   | c2   |
      | CountryThree | c3   |
      | CountryFour  | c4   |
      | CountryFive  | c5   |
    Given the following currencies exist:
      | name         | code | country_code |
      | CurOne       | cur1 | c1           |
      | CurTwo       | cur2 | c2           |
      | CurThree     | cur3 | c3           |
      | CurFour      | cur4 | c4           |
      | CurFive      | cur5 | c5           |
    Given user visited following countries:
      | code |
      | c3   |
      | c4   |
      | c5   |
    And I am on the currencies page
    Then I should see the following currencies table:
      | Select all | Name     | Code | Status      |
      |            | CurOne   | cur1   | Not Collected |
      |            | CurTwo   | cur2   | Not Collected |
      |            | CurThree | cur3   | Collected     |
      |            | CurFour  | cur4   | Collected     |
      |            | CurFive  | cur5   | Collected     |

