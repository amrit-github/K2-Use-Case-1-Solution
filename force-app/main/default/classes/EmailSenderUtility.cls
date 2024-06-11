/****************************************************************
ClassName : EmailSenderUtility
Description : Used as a controller to send renewal Email to customers 
for Contracts
Author : Amrit Suman - 11 June 2024
*****************************************************************/

public with sharing class EmailSenderUtility{

	/****************************************************************
	MethodName : sendEmails
	Description : Used to send renewal Email to customers for Contracts
	Last ModifiedBy : Amrit Suman - 11 June 2024
	*****************************************************************/
    @InvocableMethod(label = 'Contract Flow' description = 'SendEmailToCustomer')
    public static void sendEmails(List<ContractClass> listOfCon){
        
		List<Contract> li = listOfCon[0].conList;
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
		
		try{

			Map<Id, EmailTemplate> template = new Map<Id, EmailTemplate>([SELECT ID, HtmlValue, DeveloperName, Body FROM EmailTemplate WHERE DeveloperName = 'ContractRenewalEmailTemplate']);
			
			if(template?.values()?.size() > 0){
				for(Contract con : li){
					Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(template.values()[0].Id, null, con.Id);
					mail.setBccSender(false);
					mail.setUseSignature(false);
					mail.setToAddresses(new List<String>{con.Customer_Email__c});
					mail.setSaveAsActivity(false);
					emailList.add(mail);
				}            
			}
			Messaging.sendEmail(emailList);

		}catch(Exception ex){
			System.debug('Exception Log Trace:: ' + ex.getMessage());
		}
    }
	
	public class ContractClass{
		@InvocableVariable(required=true)
		public List<Contract> conList;
	}
}