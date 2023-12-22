package definitions;

import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import support.Helper;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
}
