package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import support.Helper;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static org.assertj.core.api.Assertions.*;
import static support.TestContext.getDriver;

public class AnaStepsDefs {
    @And("I confirm user account with email {string}")
    public void iConfirmUserAccountWithEmail(String email) throws SQLException, IOException {
        String activationString =  Helper.getAccessToken(email);
        String[] str = activationString.split(";") ;
        int userId = Integer.parseInt(str[0]);
        String activationCode = str[1];
        Helper.activateUser(userId, activationCode);

    }

    @And("I add {int} options")
    public void iAddOptions(int numberOfOptions) {

        for(int i = 0; i < numberOfOptions; i++){
            int optionNum = i + 3;
            WebElement addOptionButton = getDriver().findElement(By.xpath("//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::button[./span[contains(text(),'Add Option')]]"));
            addOptionButton.click();
            WebElement optionTitle = getDriver().findElement(By.xpath("//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option " + optionNum + "')]"));
            optionTitle.sendKeys("Option " + optionNum);
        }
    }

    @And("I choose option {int} as correct option")
    public void iChooseOptionAsCorrectOption(int correctOption) {
//        List<WebElement> optionsList = getDriver().findElements(By.xpath("//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option']"));
//        for (WebElement option : optionsList){
//            var x = option;
//////*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option 1')]
//
//        }
        WebElement we = getDriver().findElement(By.xpath("//*[contains(text(), 'Q1')]//ancestor::mat-expansion-panel//child::label[contains(text(),'Option "+ correctOption +"')]//ancestor::div[contains(@class,'option-row')]//child::div[contains(@class,'mat-checkbox-inner-container')]"));
        we.click();
    }


    @When("I login into teacher account")
    public void iLoginIntoTeacherAccount() {
        WebElement login = getDriver().findElement(By.xpath("//input[@formcontrolname='email']"));
        WebElement passw = getDriver().findElement(By.xpath("//input[@formcontrolname='password']"));
        login.sendKeys("awillimanf@kenalintah.dev");
        passw.sendKeys("passw123");
        WebElement sbutton = getDriver().findElement(By.xpath("//button[@type='submit']"));
        sbutton.click();
    }


    @Then("I verify user name {string} and role {string}")
    public void iVerifyUserNameAndRole(String nameText, String roleText) {
        new WebDriverWait(getDriver(), 15, 200).until(ExpectedConditions.presenceOfElementLocated(By.xpath("//h3[contains(text(),'"+ nameText +"')]")));
        WebElement name = getDriver().findElement(By.xpath("//h3"));
        WebElement role = getDriver().findElement(By.xpath("//p[contains(text(),'"+ roleText +"')]"));
        assertThat(name.getText()).isEqualTo(nameText);
        assertThat(role.getText()).isEqualTo(roleText);
    }


    @Then("I choose {string} question type for question {int}")
    public void iChooseQuestionTypeForQuestion(String questType, int questNum) {
        switch (questType){
            case "textual":
                WebElement text = getDriver().findElement(By.xpath("//*[contains(text(), 'Q"+ questNum +"')]//ancestor::mat-expansion-panel//child::div[contains(text(),'Textual')]"));
                text.click();
                break;
            case "single-choice":
                WebElement single = getDriver().findElement(By.xpath("//*[contains(text(), 'Q"+ questNum +"')]//ancestor::mat-expansion-panel//child::div[contains(text(),'Single-Choice')]"));
                single.click();
                break;
            case "multiple-choice":
                WebElement multiple = getDriver().findElement(By.xpath("//*[contains(text(), 'Q"+ questNum +"')]//ancestor::mat-expansion-panel//child::div[contains(text(),'Multiple-Choice')]"));
                multiple.click();
                break;
            default:
                System.out.println("Wrong question type");
        }
    }

    @And("I enter question text {string} for question number {int}")
    public void iEnterQuestionTextForQuestionNumber(String questText, int questNum) {
        WebElement textField = getDriver().findElement(By.xpath("//*[contains(text(), 'Q"+ questNum +"')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='question']"));
        textField.sendKeys(questText);
    }


    @And("I select value {string} for Group Filter drop down")
    public void iSelectValueForGroupFilterDropDown(String grFilVal) {
        WebElement grFil = getDriver().findElement(By.xpath("//span[contains(text(),'All')]//ancestor::div[@class='mat-select-trigger']"));
        grFil.click();
        WebElement val = getDriver().findElement(By.xpath("//mat-option[@role='option']/span[contains(text(),'"+ grFilVal +"')]"));
        val.click();
    }

    @And("I select quiz {string} for Select Quiz to Assign drop down")
    public void iSelectQuizForSelectQuizToAssignDropDown(String quizName) {
        WebElement quizDD = getDriver().findElement(By.xpath("//span[contains(text(),'Select Quiz To Assign')]//ancestor::div[@class='mat-select-value']"));
        quizDD.click();
        WebElement quizVal = getDriver().findElement(By.xpath("//mat-option[@role='option']/span[contains(text(),'"+ quizName +"')]"));
        quizVal.click();
    }
    @Then("^I wait for element with xpath \"([^\"]*)\" to be visible$")
    public void iWaitForElementWithXpathToBeVisible(String xpath) {
        new WebDriverWait(getDriver(), 10, 200).until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
    }

    @And("I log out of teacher's account")
    public void iLogOutOfTeacherSAccount() {
        WebElement logOutButton = getDriver().findElement(By.xpath("//h5[contains(text(),'Log Out')]//ancestor::div[@class='mat-list-item-content']"));
        logOutButton.click();
        WebElement logOutConBut = getDriver().findElement(By.xpath("//button[./span[contains(text(),'Log Out')]]"));
        logOutConBut.click();
    }

    @And("I login into Ava Stud student account")
    public void iLoginIntoAvaStudStudentAccount() {
        WebElement login = getDriver().findElement(By.xpath("//input[@formcontrolname='email']"));
        WebElement passw = getDriver().findElement(By.xpath("//input[@formcontrolname='password']"));
        login.sendKeys("avstud@vaievem.tk");
        passw.sendKeys("passw123");
        WebElement sbutton = getDriver().findElement(By.xpath("//button[@type='submit']"));
        sbutton.click();
    }


    @And("I navigate to {string} page")
    public void iNavigateToPage(String menuItem) throws InterruptedException {
        switch (menuItem){
            case "login":
                getDriver().get("http://ask-stage.portnov.com/");
                break;
            case "Assignments":
                WebElement iTAssign = getDriver().findElement(By.xpath("//h5[contains(text(),'Assignments')]//ancestor::a"));
                iTAssign.click();
                break;
            case "Quizzes":
                WebElement iTQuiz = getDriver().findElement(By.xpath("//h5[contains(text(),'Quizzes')]//ancestor::a"));
                iTQuiz.click();
                break;
            case "Home":
                WebElement iSHome = getDriver().findElement(By.xpath("//h5[contains(text(),'Home')]//ancestor::a"));
                iSHome.click();
                break;
            case "My Assignments":
                WebElement iSAssign = getDriver().findElement(By.xpath("//h5[contains(text(),'My Assignments')]//ancestor::a"));
                iSAssign.click();
                break;
            case "My Grades":
                Thread.sleep(1 * 1000);
                WebElement iSGrades = getDriver().findElement(By.xpath("//h5[contains(text(),'My Grades')]//ancestor::a"));
                iSGrades.click();
                break;
            case "Settings":
                WebElement iSSettings = getDriver().findElement(By.xpath("//h5[contains(text(),'Settings')]//ancestor::a"));
                iSSettings.click();
                break;
            default:
                System.out.println("No such menu/navigational item");
        }

    }

    @Then("assignment with quiz name {string} should be displayed")
    public void assignmentWithQuizNameShouldBeDisplayed(String qName) {
        LocalDate myDate = LocalDate.now();
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("MM/dd/yy");
        String currDate = myDate.format(dateFormat);
        WebElement assignment = getDriver().findElement(By.xpath("//*[contains(text(),'" + currDate + "')]//ancestor::span//child::span[contains(text(),'" + qName + "')]"));
        assertThat(assignment.isDisplayed()).isTrue();
    }

    @And("I enter text {string} for option number {int} in question number {int}")
    public void iEnterTextForOptionNumberInQuestionNumber(String optText, int optNum, int questNum) {
        WebElement optTitle = getDriver().findElement(By.xpath("//*[contains(text(), 'Q" + questNum + "')]//ancestor::mat-expansion-panel//child::textarea[@formcontrolname='option' and contains(@placeholder,'Option " + optNum + "')]"));
        optTitle.sendKeys(optText);
    }


    @And("I add {int} options for question {int}")
    public void iAddOptionsForQuestion(int optNum, int questNum) {
        for (int i = 0; i < optNum; i++){
            WebElement addOptionButton = getDriver().findElement(By.xpath("//*[contains(text(), 'Q" + questNum + "')]//ancestor::mat-expansion-panel//child::button[./span[contains(text(),'Add Option')]]"));
            addOptionButton.click();
        }
    }

    @And("I choose option number {int} as correct option for {string} question number {int}")
    public void iChooseOptionNumberAsCorrectOptionForQuestionNumber(int optNum, String questType, int questNum) {
        switch (questType){
            case "single-choice":
                WebElement corrSOpt = getDriver().findElement(By.xpath("//*[contains(text(), 'Q" + questNum + "')]//ancestor::mat-expansion-panel//child::label[contains(text(),'Option " + optNum + "')]//ancestor::mat-radio-group//child::div[@class='mat-radio-container']"));
                corrSOpt.click();
                break;
            case "multiple-choice":
                WebElement corrMOpt = getDriver().findElement(By.xpath("//*[contains(text(), 'Q" + questNum + "')]//ancestor::mat-expansion-panel//child::label[contains(text(),'Option " + optNum + "')]//ancestor::div[contains(@class,'option-row')]//child::div[contains(@class,'mat-checkbox-inner-container')]"));
                corrMOpt.click();
                break;
            default:
                System.out.println("Wrong question type");
        }
    }

    @Then("assignment with quiz name {string} should have result {string}")
    public void assignmentWithQuizNameShouldHaveResult(String quizName, String res) {
        LocalDate myDate = LocalDate.now();
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("MM/dd/yy");
        String currDate = myDate.format(dateFormat);
        WebElement quiz = getDriver().findElement(By.xpath("//td[contains(text(),'" + currDate + "')]//ancestor::tr//child::td[contains(text(),'" + quizName + "')]//ancestor::tr//child::td[@class='result']"));
        String actualText = quiz.getText();
        assertThat(actualText).containsIgnoringCase(res);
    }

    @Then("assignment with quiz name {string} should have score {string}")
    public void assignmentWithQuizNameShouldHaveScore(String quizName, String score) {
        LocalDate myDate = LocalDate.now();
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("MM/dd/yy");
        String currDate = myDate.format(dateFormat);
        WebElement quiz = getDriver().findElement(By.xpath("//td[contains(text(),'" + currDate + "')]//ancestor::tr//child::td[contains(text(),'" + quizName + "')]//ancestor::tr//child::td[@class='ng-star-inserted']"));
        String actualText = quiz.getText();
        assertThat(actualText).containsIgnoringCase(score);
    }
}
