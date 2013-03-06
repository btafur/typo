Feature: Merge Articles
  As a blog administrator
  In order to organize the posts better
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully write articles
    Given I am on the new article page
    When I fill in "article_title" with "Foo"
    And I fill in "article__body_and_extended_editor" with "Hello"
    And I press "Publish"
    Then I should be on the admin content page
    Given I am on the new article page
    When I fill in "article_title" with "Bar"
    And I fill in "article__body_and_extended_editor" with "World"
    And I press "Publish"
    Then I should be on the admin content page
    Given I am on the edit article page for "Foo"
    And I fill in "merge_with" with id of article "Bar"
    And I press "Merge"
    Then I should be on the home page
    Given I follow "Foo"
    Then I should see "Foo"
    And I should see "Hello"
    And I should see "World"

