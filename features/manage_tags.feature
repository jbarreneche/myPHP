Feature: Manage tags
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: Login required
    Given I am on the new tag page
    Then I should see "Log in, you bitch!"  
    And I should see "Log in"
    
  Scenario: Register new tag
    Given a user is logged in as "Jimbo"
    And I am on the new tag page
    When I fill in "Name" with "name 1"
    And I press "Submit"
    Then I should see "name 1"

  Scenario: Delete tag
    Given a user is logged in as "Jimbo"
    And only the following tags exist:
      |name|
      |name 1|
      |name 2|
      |name 3|
      |name 4|
    When I delete the 3rd tag
    Then I should see "Successfully destroyed tag."
    And I should see the following tags:
      |Name|
      |name 1|
      |name 2|
      |name 4|
      
  Scenario: Successful login
    Given a user is logged in as "Jimbo"
    Then I should see "Logged in successfully."

