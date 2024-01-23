@single_choice_show-stopper_testSet_single_choice_show-stopper_functionality
Feature: Single Choice Question - Show-Stopper test set: Verify single choice show stopper functionality

  Background:
    Given I navigate to "login" page
    Then I should see page title contains "Assessment Control @ Portnov"

  @single_choice_show-stopper_functionality_teacher
  Scenario Outline:
    When I login into teacher account
    Then I verify user name "Anastasia Vladimirova" and role "TEACHER"
    And I navigate to "Quizzes" page
    And I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]//ancestor::button"
    And I wait for element with xpath "//button[./span[contains(text(),'Back To Quizzes List')]]" to be present
    And I type "<quizName>" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q1')]//ancestor::mat-expansion-panel" to be visible
    And I wait for 1 sec
    And I choose "single-choice" question type for question 1
    And I wait for element with xpath "//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "Question 1" for question number 1
    And I enter text "Option 1" for option number 1 in question number 1
    And I enter text "Option 2" for option number 2 in question number 1
    And I choose option number 2 as correct option for "single-choice" question type for question number 1
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q2')]//ancestor::mat-expansion-panel" to be visible
    And I wait for 1 sec
    And I choose "single-choice" question type for question 2
    And I wait for element with xpath "//*[contains(text(), 'Q2')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "Question 2" for question number 2
    And I enter text "Option 1" for option number 1 in question number 2
    And I enter text "Option 2" for option number 2 in question number 2
    And I choose option number 2 as correct option for "single-choice" question type for question number 2
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q3')]//ancestor::mat-expansion-panel" to be visible
    And I wait for 1 sec
    And I choose "single-choice" question type for question 3
    And I wait for element with xpath "//*[contains(text(), 'Q3')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "Question 3" for question number 3
    And I enter text "Option 1" for option number 1 in question number 3
    And I enter text "Option 2" for option number 2 in question number 3
    And I choose option number 2 as correct option for "single-choice" question type for question number 3
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q4')]//ancestor::mat-expansion-panel" to be visible
    And I wait for 1 sec
    And I choose "single-choice" question type for question 4
    And I wait for element with xpath "//*[contains(text(), 'Q4')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "Question 4" for question number 4
    And I enter text "Option 1" for option number 1 in question number 4
    And I enter text "Option 2" for option number 2 in question number 4
    And I choose option number 2 as correct option for "single-choice" question type for question number 4
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q5')]//ancestor::mat-expansion-panel" to be visible
    And I wait for 1 sec
    And I choose "single-choice" question type for question 5
    And I wait for element with xpath "//*[contains(text(), 'Q5')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "Question 5" for question number 5
    And I enter text "Option 1" for option number 1 in question number 5
    And I enter text "Option 2" for option number 2 in question number 5
    And I choose option number 2 as correct option for "single-choice" question type for question number 5
    And I click on element with xpath "//button[./span[contains(normalize-space(), 'Add Question')]]"
    And I wait for element with xpath "//*[contains(text(),'Q6')]//ancestor::mat-expansion-panel" to be visible
    And I wait for 1 sec
    And I choose "single-choice" question type for question 6
    And I wait for element with xpath "//*[contains(text(), 'Q6')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']" to be visible
    And I enter question text "Question 6" for question number 6
    And I enter text "Option 1" for option number 1 in question number 6
    And I enter text "Option 2" for option number 2 in question number 6
    And I choose option number 2 as correct option for "single-choice" question type for question number 6
    And I mark question number 6 as Show-Stopper question
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
    | quizName |
    | Ava showstopper |


  @single_choice_show-stopper_functionality_student
  Scenario Outline:
    And I login into Ava Stud student account
    Then I verify user name "Ava Stud" and role "STUDENT"
    And I navigate to "My Assignments" page
    And I wait for element with xpath "//table" to be visible
    And I wait for 2 sec
    And I click on element with xpath "//td[contains(text(),'<quizName>')]//following-sibling::td//child::button"
    And I wait for element with xpath "//h4[contains(text(),'<quizName>')]" to be visible
    Then element with xpath "//h4[contains(text(),'<quizName>')]" should be displayed
    And I mark option 2 as my answer for question number 1
    And I mark option 2 as my answer for question number 2
    And I mark option 2 as my answer for question number 3
    And I mark option 2 as my answer for question number 4
    And I mark option 2 as my answer for question number 5
    And I mark option 1 as my answer for question number 6
    And I click on element with xpath "//button[./span[contains(text(),'Submit')]]"
    And I wait for element with xpath "//h1[contains(text(),'Success!')]" to be visible
    And I click on element with xpath "//button[./span[contains(text(),'Ok')]]"
    And I navigate to "My Grades" page
    And I wait for element with xpath "//h4[contains(text(),'My Grades')]" to be visible
    And I wait for element with xpath "//td[contains(text(),'<quizName>')]//ancestor::tr//child::td[@class='result']" to be present
    And I scroll to the element with xpath "//td[contains(text(),'<quizName>')]//ancestor::tr" with offset 500
    And I click on Details button for assignment with quiz name  "<quizName>"
    Then element with xpath "//td[contains(text(),'<quizName>')]" should be displayed
    Then element with xpath "//div[@class='result']//child::div[contains(text(),'ASSESSMENT FAILED')]" should be displayed
    Then Actual score points amount should be "greater" than Passing score points amount
    Then Actual percentage amount should be "greater" than Passing percentage points amount

# "Actual points" amount is higher than "Passing score" points amount

    Examples:
      | quizName |
      | Ava showstopper |

#  @check
#  Scenario: Check
#    And I login into Ava Stud student account
#    Then I verify user name "Ava Stud" and role "STUDENT"
#    And I navigate to "My Grades" page
#    And I wait for element with xpath "//h4[contains(text(),'My Grades')]" to be visible
#    And I wait for element with xpath "//td[contains(text(),'Ava show')]//ancestor::tr//child::td[@class='result']" to be present
#    And I scroll to the element with xpath "//td[contains(text(),'Ava show')]//ancestor::tr" with offset 500
##    And I click on Details button for assignment with quiz name  "Ava show"
#    And I click on element with xpath "//td[contains(text(),'01/20/24')]//ancestor::tr//child::td[contains(text(),'Ava show')]//ancestor::tr//child::button"
#    Then element with xpath "//td[contains(text(),'Ava show')]" should be displayed
#    Then element with xpath "//div[@class='result']//child::div[contains(text(),'ASSESSMENT FAILED')]" should be displayed
#    Then Actual score points amount should be "greater" than Passing score points amount