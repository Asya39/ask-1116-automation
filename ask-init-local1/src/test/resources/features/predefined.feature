@predefined
Feature: Smoke steps

#  @predefined1
#  @regression
#  Scenario: Predefined steps for Google
#    Given I open url "https://google.com"
#    Then I should see page title as "Google"
#    Then I type "Cucumber" into element with xpath "//input[@name='q']"
#    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
#    # Then I wait for 2 sec
#    Then I wait for element with xpath "//*[@id='res']" to be present
#    Then I should see page title contains "- Google Search"
#    Then element with xpath "//*[@id='res']" should contain text "Cucumber"

 @test-scenario
 Scenario: Test scenario for XPath validations
   Given I open url "http://ask-stage.portnov.com"
   And I type "awillimanf@kenalintah.dev" into element with xpath "//input[@formcontrolname='email']"
   And I type "passw123" into element with xpath "//input[@formcontrolname='password']"
   And I click on element with xpath "//span[contains(text(), 'Sign In')]//ancestor::button"
   Then I wait for element with xpath "//h3[contains(text(),'Anastasia Vladimirova')]" to be present
   Then element with xpath "//h3" should contain text "Anastasia Vladimirova"

 @registration
 Scenario: Register user
   Given I open url "http://ask-stage.portnov.com"
   And I click on element with xpath "//button[span[contains(text(),'Register Now')]]"
   And I type "Ava" into element with xpath "//input[@formcontrolname='firstName']"
   And I type "D" into element with xpath "//input[@formcontrolname='lastName']"
   And I type "ava.d@mail.com" into element with xpath "//input[@formcontrolname='email']"
   And I type "11.16" into element with xpath "//input[@formcontrolname='group']"
   And I type "passw123" into element with xpath "//input[@formcontrolname='password']"
   And I type "passw123" into element with xpath "//input[@formcontrolname='confirmPassword']"
   And I click on element with xpath "//button[./span[contains(text(),'Register Me')]]"
   And I confirm user account with email "ava.d@mail.com"


  @create-quiz
  Scenario: Create quiz
    Given I open url "http://ask-stage.portnov.com"
    And I type "awillimanf@kenalintah.dev" into element with xpath "//input[@formcontrolname='email']"
    And I type "passw123" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(), 'Sign In')]//ancestor::button"
    Then I wait for element with xpath "//h3[contains(text(),'Anastasia Vladimirova')]" to be present
    Then element with xpath "//h3" should contain text "Anastasia Vladimirova"
    Then element with xpath "//p[contains(text(),'TEACHER')]" should be displayed
    And I click on element with xpath "//h5[contains(text(),'Quizzes')]//ancestor::a"
    And I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]//ancestor::button"
    And I wait for element with xpath "//button[./span[contains(text(),'Back To Quizzes List')]]" to be present
    And I type "Ava automation test quiz (on lesson)" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I click on element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::div[contains(text(),'Multiple-Choice')]"
    And I type "Question 1" into element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']"
    And I type "Option 1" into element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option 1')]"
    And I type "Option 2" into element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option 2')]"
    And I click on element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::label[contains(text(),'Option 2')]//ancestor::div[contains(@class,'option-row')]//child::div[contains(@class,'mat-checkbox-inner-container')]"
    And I add 3 options
    And I choose option 3 as correct option


















