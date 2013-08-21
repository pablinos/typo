Feature: Merge Articles
  As a blog administrator
  In order to prevent the blog from containing duplicate content
  I want to be able to merge two articles

  Background:
    Given the blog is set up

  Scenario: Successfullly merge two articles
    Given I am logged into the admin panel
    And I am on the edit article page
    Then I should see the "merge_with" text field
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
