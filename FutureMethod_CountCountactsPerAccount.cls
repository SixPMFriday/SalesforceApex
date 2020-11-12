public class AccountProcessor {
	@future
    public static void countContacts(List<Id> accountIds) {
    	List<Account> accounts = [
            Select Id, Number_of_Contacts__c, (Select Id from Contacts) 
            from Account 
            Where Id IN :accountIds];
        List<Account> accountsUpdate = new List<Account>();
        for (Account a : accounts) {
            integer num = 0;
            if(a.Contacts!=null && a.Contacts.size()>0)
                num = a.Contacts.size();
            a.Number_of_Contacts__c = num;
            accountsUpdate.Add(a);
        }
        if(accountsUpdate.size()>0) {
            update accountsUpdate;
        }
    }
}


@isTest
private class AccountProcessorTest{
    @IsTest
    private static void testCountContacts(){
         Account acc = new Account(Name = 'TestAcc2');
         Insert acc;
         
         Contact con = new Contact(LastName = 'TestCont2', AccountId = acc.Id);
         Insert con;
         
         List<Id> lstOfAccIds = new List<Id>();
         lstOfAccIds.add(acc.Id);
         
         Test.startTest();
             AccountProcessor.countContacts(lstOfAccIds);
         Test.stopTest();    
    }
}
