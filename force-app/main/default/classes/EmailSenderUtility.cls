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
	CreatedBy : Amrit Suman - 11 June 2024
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
					mail.setUseSignature(true);
					mail.setToAddresses(new List<String>{con.Customer_Email__c});
					emailList.add(mail);
				}            
			}

			for (Messaging.SendEmailResult mr : Messaging.sendEmail(emailList)) {
				if (!mr.isSuccess()) {
					for(Messaging.SendEmailError err : mr.getErrors()) {
						System.debug('The following error has occurred.');                    
						System.debug(err.getStatusCode() + ': ' + err.getMessage());
						System.debug('fields that affected this error: ' + err.getFields());
					}
				}
			}

		}catch(Exception ex){
			System.debug('Exception Log Trace:: ' + ex.getMessage());
		}
    }
	
	public class ContractClass{
		@InvocableVariable(required=true)
		public List<Contract> conList;
	}
}