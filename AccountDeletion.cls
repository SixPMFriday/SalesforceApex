trigger AccountDeletion on Account (before delete) {
    	// prevent deletion of accounts if they have related opportunities
    	for (Account a : [SELECT Id FROM Account 
                         WHERE Id in (SELECT AccountId FROM Opportunity) 
                          AND Id in : Trigger.old]) {
        	Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities');
		}
}
