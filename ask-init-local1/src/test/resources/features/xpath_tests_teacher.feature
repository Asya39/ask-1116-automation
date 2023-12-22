@xpath_tests_teacher
Feature: Check XPathes for teacher page

  Background: Teacher login
    Given I open url "http://ask-stage.portnov.com"
    And I type "awillimanf@kenalintah.dev" into element with xpath "//input[@formcontrolname='email']"
    And I type "passw123" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(), 'Sign In')]//ancestor::button"
    Then I wait for element with xpath "//h3[contains(text(),'Anastasia Vladimirova')]" to be present
    Then element with xpath "//h3" should contain text "Anastasia Vladimirova"
    Then element with xpath "//p[contains(text(),'TEACHER')]" should be displayed
    
  @check-navigation
  Scenario: Check menu navigation
    And I click on element with xpath "//h5[contains(text(),'Submissions')]//ancestor::a"
    Then element with xpath "//h4[contains(text(),'Submissions')]" should be displayed
    And I click on element with xpath "//h5[contains(text(),'Assignments')]//ancestor::a"
    Then element with xpath "//h4[contains(text(),'List of Assignments')]" should be displayed
    And I click on element with xpath "//h5[contains(text(),'Quizzes')]//ancestor::a"
    And I wait for 3 sec
    Then element with xpath "//h4[contains(text(),'List of Quizzes')]" should be displayed
    And I click on element with xpath "//h5[contains(text(),'Management')]//ancestor::a"
    Then element with xpath "//h4[contains(text(),'Management')]" should be displayed
    And I click on element with xpath "//h5[contains(text(),'Settings')]//ancestor::a"
    Then element with xpath "//h4[contains(text(),'Settings')]" should be displayed
    And I click on element with xpath "//h5[contains(text(),'Home')]//ancestor::a"
    Then element with xpath "//h4[contains(normalize-space(),'New Submissions From Students')]" should be displayed
    And I click on element with xpath "//h5[contains(text(),'Log Out')]//ancestor::div[@class='mat-list-item-content']"
    Then element with xpath "//h1[contains(text(),'Confirmation')]" should be displayed
    And I click on element with xpath "//button[./span[contains(text(),'Log Out')]]"
    Then I wait for 4 sec
    
  @create-quiz
  Scenario: Create quiz
    And I click on element with xpath "//h5[contains(text(),'Quizzes')]//ancestor::a"
    And I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]//ancestor::button"
    And I wait for element with xpath "//button[./span[contains(text(),'Back To Quizzes List')]]" to be present
    And I type "Ava automation test quiz2" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I click on element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::div[contains(text(),'Textual')]"
    And I wait for 3 sec
    And I wait for element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be present
    And I type "Quiestion 1" into element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']"
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I click on element with xpath "//*[contains(text(), 'Q2')]//ancestor::mat-expansion-panel//child::div[contains(text(),'Single-Choice')]"
    And I type "Question 2" into element with xpath "//*[contains(text(), 'Q2')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']"
    And I type "Option 1" into element with xpath "//*[contains(text(), 'Q2')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option 1')]"
    And I type "Option 2" into element with xpath "//*[contains(text(), 'Q2')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option 2')]"
    And I click on element with xpath "//*[contains(text(), 'Q2')]//ancestor::mat-expansion-panel//child::label[contains(text(),'Option 1')]//ancestor::mat-radio-group//child::div[@class='mat-radio-container']"
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I click on element with xpath "//*[contains(text(), 'Q3')]//ancestor::mat-expansion-panel//child::div[contains(text(),'Multiple-Choice')]"
    And I type "Question 3" into element with xpath "//*[contains(text(), 'Q3')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']"
    And I type "Option 1" into element with xpath "//*[contains(text(), 'Q3')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option 1')]"
    And I type "Option 2" into element with xpath "//*[contains(text(), 'Q3')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option 2')]"
    And I click on element with xpath "//*[contains(text(), 'Q3')]//ancestor::mat-expansion-panel//child::label[contains(text(),'Option 2')]//ancestor::div[contains(@class,'option-row')]//child::div[contains(@class,'mat-checkbox-inner-container')]"
    And I click on element with xpath "//button[./span[contains(text(),'Save')]]"
    And I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    Then element with xpath "//*[contains(text(),'Ava automation test quiz')]" should be displayed
    And I click on element with xpath "//*[contains(text(),'Ava automation test quiz')]"
    And I click on element with xpath "//*[contains(text(),'Ava automation test quiz')]//ancestor::mat-expansion-panel//child::button[./span[contains(text(),'Preview')]]"
    Then element with xpath "//h3[contains(text(),'PREVIEW MODE')]" should be displayed
    Then element with xpath "//h4[contains(text(),'Ava automation test quiz')]" should be displayed

  @assign-quiz
  Scenario: Assign created quiz to a student
    And I click on element with xpath "//h5[contains(text(),'Assignments')]//ancestor::a"
    And I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    Then element with xpath "//h4[contains(text(),'List of Assignments')]" should be displayed
    And I wait for 2 sec
    And I wait for element with xpath "//button[./span[contains(text(),'Create New Assignment')]]" to be present
    And I click on element with xpath "//button[./span[contains(text(),'Create New Assignment')]]"
    And I click on element with xpath "//span[contains(text(),'All')]//ancestor::div[@class='mat-select-trigger']"
    And I click on element with xpath "//mat-option[@role='option']/span[contains(text(),'11.16')]"
    And I click on element with xpath "//span[contains(text(),'Select Quiz To Assign')]//ancestor::div[@class='mat-select-value']"
    And I click on element with xpath "//mat-option[@role='option']/span[contains(text(),'Ava automation test quiz2')]"
    And I click on element with xpath "//div[@class='mat-list-text' and contains(normalize-space(),'Ava Stud')]"
    And I click on element with xpath "//button[./span[contains(text(),'Give Assignment')]]"
    And I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    Then element with xpath "//*[contains(text(),'12/20/23')]//ancestor::span//child::span[contains(text(),'Ava automation test quiz')]" should be displayed
    And I take screenshot

    











