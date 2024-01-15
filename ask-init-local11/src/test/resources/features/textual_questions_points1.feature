@textual_questions_points_test_set_textual_can_not_graded_automatically
Feature: Textual questions - points test set: Verify textual questions can not be graded automatically

  @textual_can_not_graded_automatically_teacher
  Scenario Outline: Verify textual questions can not be graded automatically (teacher part)
    Given I navigate to "login" page
    Then I should see page title contains "Assessment Control @ Portnov"
    When I login into teacher account
    Then I verify user name "Anastasia Vladimirova" and role "TEACHER"
    And I navigate to "Quizzes" page
    And I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]//ancestor::button"
    And I wait for element with xpath "//button[./span[contains(text(),'Back To Quizzes List')]]" to be present
    And I type "<quizName>" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q1')]//ancestor::mat-expansion-panel" to be visible
    And I choose "textual" question type for question 1
    And I wait for element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "What is Software Quality Assurance?" for question number 1
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q2')]//ancestor::mat-expansion-panel" to be visible
    And I wait for 1 sec
    And I choose "textual" question type for question 2
    And I wait for element with xpath "//*[contains(text(), 'Q2')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "Why QA?" for question number 2
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q3')]//ancestor::mat-expansion-panel" to be visible
    And I wait for 1 sec
    And I choose "textual" question type for question 3
    And I wait for element with xpath "//*[contains(text(), 'Q3')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "What is Integration Testing?" for question number 3
    And I click on element with xpath "//button[./span[contains(text(),'Save')]]"
    And I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    Then element with xpath "//*[contains(text(),'<quizName>')]" should be displayed
    And I navigate to "Assignments" page
    And I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    Then element with xpath "//h4[contains(text(),'List of Assignments')]" should be displayed
    And I click on element with xpath "//button[./span[contains(text(),'Create New Assignment')]]"
    And I select value "11.16" for Group Filter drop down
    And I select quiz "<quizName>" for Select Quiz to Assign drop down
    And I click on element with xpath "//div[@class='mat-list-text' and contains(normalize-space(),'Ava Stud')]"
    And I click on element with xpath "//button[./span[contains(text(),'Give Assignment')]]"
    And I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    Then assignment with quiz name "<quizName>" should be displayed
    And I log out of teacher's account
    Examples:
    | quizName   |
    | Ava auto text quest |


  @textual_can_not_graded_automatically_student
  Scenario Outline: Verify textual questions can not be graded automatically (student part)
    Given I navigate to "login" page
    And I login into Ava Stud student account
    Then I verify user name "Ava Stud" and role "STUDENT"
    And I navigate to "My Assignments" page
    And I wait for element with xpath "//table" to be visible
    And I wait for 2 sec
    And I click on element with xpath "//td[contains(text(),'<quizName>')]//following-sibling::td//child::button"
    And I wait for element with xpath "//h4[contains(text(),'<quizName>')]" to be visible
    Then element with xpath "//h4[contains(text(),'<quizName>')]" should be displayed
    And I type "SQA is a process of monitoring and improving all activities associated with software development, from requirements gathering, design and reviews to coding, testing and implementation." into element with xpath "//mat-card[./h5[contains(text(),'Question 1')]]//child::textarea"
    And I type "Because I like it" into element with xpath "//mat-card[./h5[contains(text(),'Question 2')]]//child::textarea"
    And I type "Integration testing is a phase in software testing in which individual software modules are combined and tested as a group." into element with xpath "//mat-card[./h5[contains(text(),'Question 3')]]//child::textarea"
    And I click on element with xpath "//button[./span[contains(text(),'Submit')]]"
    And I wait for element with xpath "//h1[contains(text(),'Success!')]" to be visible
    And I click on element with xpath "//button[./span[contains(text(),'Ok')]]"
    And I navigate to "My Grades" page
    And I wait for element with xpath "//h4[contains(text(),'My Grades')]" to be visible
    And I wait for element with xpath "//td[contains(text(),'<quizName>')]//ancestor::tr//child::td[@class='result']" to be present
    And I scroll to the element with xpath "//td[contains(text(),'<quizName>')]//ancestor::tr" with offset 500
    Then element with xpath "//td[contains(text(),'<quizName>')]//ancestor::tr//child::td[@class='result']" should contain text "PENDING"
    Then element with xpath "//td[contains(text(),'<quizName>')]//ancestor::tr//child::td[@class='ng-star-inserted']" should contain text "-"

    Examples:
    | quizName   |
    | Ava auto text quest |
    
    











    
    
    

