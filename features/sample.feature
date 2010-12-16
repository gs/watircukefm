Feature: Sample

  @_done @m0 @_deprecated
  Scenario: Check google results for Ruby
    Given I go to "http://www.google.de/firefox?client=firefox-a&rls=org.mozilla:en-GB:official"
    And I fill in the text field "sf" with "ruby"
    And I make a screenshot
    And I click the "Google-Suche" button
    And I click the "Die Programmiersprache Ruby" link
    Then I should see the text "This text is not on Ruby page"