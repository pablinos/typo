Feature: Merge Articles
  As a blog administrator
  In order to prevent the blog from containing duplicate content
  I want to be able to merge two articles

  Background:
    Given the blog is set up

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And I am on the edit article page for id "1"
    Then I should see the "merge_with" text field
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the edit article page for id "1"
    And I should see "Successfully merged article"
    And the article text should contain the text of both articles

  Scenario: Merge option not avaible to non-admin roles
    Given I am logged into the admin panel not as an admin
    And I am on the edit article page
    Then I should not see the "merge_with" text field
  
  Scenario: A non-admin cannot merge two articles
    Given I am not an admin
    And I am logged into the admin panel
    And I make a post request to the merge article URL for id "1"
    Then I should be on the edit article page for id "1"
    And I should see "Article merging not permitted for non-admin users"
    
    
