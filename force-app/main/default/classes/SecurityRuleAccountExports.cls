global class SecurityRuleAccountExports implements TxnSecurity.EventCondition {
    
    public boolean evaluate(SObject event) {
        
        switch on event{
            when ReportEvent reportEvent {
                System.debug('Evaluating a ReportEvent');
                return evaluateReport(reportEvent);
            }
            when null {
                 return false;   
            }
            when else{
                return false;
            }
        }
    }

    private boolean evaluateReport(ReportEvent reportEvent){
        // Variable Assignment
        String queriedEntities = reportEvent.QueriedEntities;
        Decimal rowsProcessed = reportEvent.RowsProcessed;
        String reportOperation = reportEvent.Operation;
        String userId = reportEvent.UserId; 
            
        // Get User Profile 
        Profile profile = [SELECT Name FROM Profile WHERE Id IN (SELECT profileId FROM User WHERE Id = :userId)];
        System.debug(LoggingLevel.INFO, 'Profile:  ' + profile);
        System.debug(LoggingLevel.INFO, 'Queried Entities:  ' + queriedEntities);
        
        // If Profile is Admin or VP - Allow export no matter what
        if (PROFILES_TO_ALLOW.contains(profile.Name)) {
            return false;
        }
        
       
        // Otherwise Make sure no one is exporting more than 10 Accounts
        if(queriedEntities.contains('Account') 
            && rowsProcessed > 10
            && reportOperation.contains('ReportExported'))
        {
            
            return true;
        }
        
        // Didn't satisfy requirements
        return false;
    }
    
    
    // For these powerful profiles
    private Set<String> PROFILES_TO_ALLOW = new Set<String> { 
        'System Administrator', 
        'VP'
    };

    
        
}