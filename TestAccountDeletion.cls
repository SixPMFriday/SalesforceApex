@isTest
private class TestAccountDeletion {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        // Test data set up
        // create account w/ oppotunity, then try to delete it
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false);
        Test.stopTest();
        
        // Verify that deletion threw error and was stopped by trigger
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.',
                           result.getErrors()[0].getMessage());
        
    }
    
    @isTest static void TestDeleteAccountWithNoOpportunities() {
        // Test data set up
        // create account w/ oppotunity, then try to delete it
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,0);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false);
        Test.stopTest();
        
        // Verify that deletion was a success 
        System.assert(result.isSuccess());
        
    }

    
    @isTest static void TestDeleteBulkAccountsWithOneOpportunity() {
        // Test data set up
        // create account w/ oppotunity, then try to delete it
        Account[] accts = TestDataFactory.createAccountsWithOpps(200,1);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accts, false);
        Test.stopTest();
        
        // Verify that deletion threw error and was stopped by trigger
        for(Database.DeleteResult dr : results) {
             
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size() > 0);
            System.assertEquals('Cannot delete account with related opportunities.',
                               dr.getErrors()[0].getMessage());   
        }
        
    }

    
    @isTest static void TestDeleteBulkAccountsWithNoOpportunities() {
        // Test data set up
        // create account w/ oppotunity, then try to delete it
        Account[] accts = TestDataFactory.createAccountsWithOpps(200,0);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accts, false);
        Test.stopTest();
        
        // Verify that deletion threw error and was stopped by trigger
        for(Database.DeleteResult dr : results) {
            System.assert(dr.isSuccess());  
        }
        
    }


}
