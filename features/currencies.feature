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

  @javascript
  Scenario: Collect Currency
    Given I am a new, authenticated user
    Given the following countries exist:
      | name       | code |
      | CountryOne | c1   |
    Given the following currencies exist:
      | name   | code | country_code |
      | CurOne | cur1 | c1           |
    And I am on the currencies page

    Then I should see "Not Collected"
    When I check "Select all"
    And I press "Collect Selected Currencies"
    Then I should see "Collected"
    And I should not see "Not Collected"

  Scenario: Filter Currencies
    Given I am a new, authenticated user
    Given the following countries exist:
      | name      | code |
      | CountryA1 | c1   |
      | CountryA2 | c2   |
      | CountryB  | c3   |
    Given the following currencies exist:
      | name  | code | country_code |
      | CurA1 | cur1 | c1           |
      | CurA2 | cur2 | c2           |
      | CurB  | cur3 | c3           |
    Given user visited following countries:
      | code |
      | c2   |
      | c3   |
    Given I am on the currencies page

    When I fill in "Name or Country" with "A"
    And I press "Search"
    Then I should see the following currencies table:
      | Select all | Name  | Code | Status          |
      |            | CurA1 | cur1   | Not Collected |
      |            | CurA2 | cur2   | Collected     |
    And I follow "Name"
    Then I should see the following currencies table:
      | Select all | Name ▲ | Code | Status          |
      |            | CurA1   | cur1   | Not Collected |
      |            | CurA2   | cur2   | Collected     |
    And I follow "Name ▲"
    Then I should see the following currencies table:
      | Select all | Name ▼  | Code   | Status       |
      |            | CurA2   | cur2   | Collected     |
      |            | CurA1   | cur1   | Not Collected |

    When I fill in "Name or Country" with ""
    And I press "Search"
    Then I should see the following currencies table:
      | Select all | Name  | Code | Status        |
      |            | CurA1 | cur1 | Not Collected |
      |            | CurA2 | cur2 | Collected     |
      |            | CurB  | cur3 | Collected     |
