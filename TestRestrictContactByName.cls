@isTest
private class TestRestrictContactByName {
    @isTest static void TestAddContactWithInvalidName() {
		Contact c = new Contact(LastName='INVALIDNAME');
        
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        
        // Verify that deletion threw error and was stopped by trigger
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',
                           result.getErrors()[0].getMessage());
    }
    
    @isTest static void TestUpdateContactWithInvalidName() {
		Contact c = new Contact(LastName='ValidName');
        insert c;

        Test.startTest();
        c.LastName='INVALIDNAME';
        Database.SaveResult result = Database.update(c, false);
        Test.stopTest();
        
        // Verify that deletion threw error and was stopped by trigger
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',
                           result.getErrors()[0].getMessage());
        
    }
	
}
