@xpath_tests_student
  Feature: Check Xpathes for student page

    Background: Student login
      Given I open url "http://ask-stage.portnov.com"
      And I type "avstud@vaievem.tk" into element with xpath "//input[@formcontrolname='email']"
      And I type "passw123" into element with xpath "//input[@formcontrolname='password']"
      And I click on element with xpath "//span[contains(text(), 'Sign In')]//ancestor::button"
      Then I wait for element with xpath "//h3[contains(text(),'Ava Stud')]" to be present
      And I take screenshot
      Then element with xpath "//h3" should contain text "Ava Stud"
      Then element with xpath "//p[contains(text(),'STUDENT')]" should be displayed
      
    @check-navigation
    Scenario: Check menu navigation
      And I click on element with xpath "//h5[contains(text(),'My Assignments')]//ancestor::a"
      Then element with xpath "//h4[contains(text(),'My Assignments')]" should be displayed
      And I click on element with xpath "//h5[contains(text(),'My Grades')]//ancestor::a"
      Then element with xpath "//h4[contains(text(),'My Grades')]" should be displayed
      And I click on element with xpath "//h5[contains(text(),'Settings')]//ancestor::a"
      Then element with xpath "//h5[contains(text(),'Settings')]" should be displayed
      And I click on element with xpath "//h5[contains(text(),'Home')]//ancestor::a"
      Then element with xpath "//h4[contains(normalize-space(),'Assignments')]" should be displayed
      And I take screenshot
      And I click on element with xpath "//h5[contains(text(),'Log Out')]//ancestor::div[@class='mat-list-item-content']"
      Then element with xpath "//h1[contains(text(),'Confirmation')]" should be displayed
      And I click on element with xpath "//button[./span[contains(text(),'Log Out')]]"

    @take-assignment
    Scenario: Take assignment
      And I click on element with xpath "//h5[contains(text(),'My Assignments')]//ancestor::a"
      Then element with xpath "//h4[contains(text(),'My Assignments')]" should be displayed
      And I wait for element with xpath "//td[contains(text(),'Ava automation test quiz2')]/following-sibling::td/a/button" to be present
      And I wait for 2 sec
      And I click on element with xpath "//td[contains(text(),'Ava automation test quiz2')]/following-sibling::td/a/button"
      And I type "Answer 1" into element with xpath "//mat-card[./h3[contains(text(),'Quiestion')]]//child::textarea"
      And I click on element with xpath "//div[contains(text(),'Option 2')]//ancestor::mat-radio-button//child::div[@class='mat-radio-container']"
      And I click on element with xpath "//span[contains(text(),'Option 1')]//ancestor::mat-checkbox//child::div[@class='mat-checkbox-inner-container']"
      And I click on element with xpath "//button[./span[contains(text(),'Submit My Answer')]]"
      And I wait for element with xpath "//h1[contains(text(),'Success!')]" to be present
      Then element with xpath "//h1[contains(text(),'Success!')]" should be displayed
      And I click on element with xpath "//button[./span[contains(text(),'Ok')]]"
      And I click on element with xpath "//h5[contains(text(),'My Grades')]//ancestor::a"
      Then element with xpath "//td[contains(text(),'ava test')]" should be displayed





















