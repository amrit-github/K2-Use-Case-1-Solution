@isTest
public class EmailSenderUtilityTest {
    
    @TestSetup
    static void makeData(){

        Account acc = new Account();
        acc.Name = 'University of Arizona';
        acc.Phone = '(520) 773-9050';
        acc.Active__c = 'Yes';
        acc.NumberOfEmployees = 39000;
        acc.Rating = 'Warm';
        acc.Website = 'www.universityofarizona.com';
        insert acc;

        Contact cont = new Contact();
        cont.LastName = 'Young';
        cont.AccountId = acc.Id;
        insert cont;

        Contract con = new Contract();
        con.Status = 'Draft';
        con.CustomerSignedId = cont.Id;
        con.AccountId = acc.Id;
        con.Customer_Email__c = 'hello@xyzabc.com';
        con.StartDate = System.today().addDays(-100);
        con.ContractTerm = 2;
        insert con;
        
        con.Status = 'Active';
        update con;
    }

    @isTest
    public static void testEmailUtility(){
        List<EmailSenderUtility.ContractClass> wrapList = new List<EmailSenderUtility.ContractClass>();
        List<Contract> listOfCon = new List<Contract>([SELECT Id, Customer_Email__c FROM Contract]);
        EmailSenderUtility.ContractClass wrap = new EmailSenderUtility.ContractClass();
        wrap.conList = listOfCon;
        wrapList.add(wrap);

        Test.startTest();
        EmailSenderUtility.sendEmails(wrapList);
        Test.stopTest();
    }
}