global class SecurityRuleAccountDistinctCount implements TxnSecurity.EventCondition {
    
    public boolean evaluate(SObject event) {
        switch on event{
            when ReportEvent reportEvent {
                
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
   		
        System.debug(LoggingLevel.INFO,'Evaluating a ReportEvent');
        // Variable Assignment
        String queriedEntities = reportEvent.QueriedEntities;
        Decimal rowsProcessed = reportEvent.RowsProcessed;
        String reportOperation = reportEvent.Operation;
        String exportedData = reportEvent.Records;
            
        System.debug(LoggingLevel.INFO,'Exported Data:' + exportedData);
        System.debug(LoggingLevel.INFO,'Queried Entities:  ' + queriedEntities);
        
        // Get Distinct Count of Accounts
        Integer distinctAccountCount = GetDistinctAccountCount(queriedEntities, exportedData);
        
        // Otherwise Make sure no one is exporting more than 10 Accounts
        if(queriedEntities.contains('Account') 
            && distinctAccountCount > 10
            && reportOperation.contains('ReportExported'))
        {
            return true;
        }
        
        // Didn't satisfy requirements
        return false;
    }
    
    private Integer GetDistinctAccountCount(string queriedEntities, string exportedData)
    {
        // Get Position of Account Column 
        List<String> columnNames = queriedEntities.split(',');
        
        Integer accountPosition = 0;
        Integer count = 0;
        
        // Loop through to look for Account Column
        do {
            String columnName = columnNames[count];
            if (columnName.contains('Account')){accountPosition = count;  break; }
            count++;
        } while (count < columnNames.size());
        System.debug(LoggingLevel.INFO,'Account Column #: ' + String.valueOf(accountPosition));
        
        // Deserialize JSON into Object Model
        ReportRecords reportData = (ReportRecords)JSON.deserialize(exportedData, ReportRecords.class);
        System.debug(LoggingLevel.INFO,'Number of Records: ' + String.valueOf(reportData.totalSize));
        
        Set<String> distictAccountSet = new Set<String>();
        
        // Loop through rows to add accounts to distinct list
        for (DataRow reportRow:reportData.rows) {
            String accountId = reportRow.datacells[accountPosition];
            distictAccountSet.add(accountId);
        }
        System.debug(LoggingLevel.INFO,'Set String : ' + distictAccountSet.toString());
       
        // Convert Set back to list
        List<String> distinctAccountList = new List<String>(distictAccountSet);
        System.debug(LoggingLevel.INFO,'Number of Distinct Accounts: ' + String.valueOf(distinctAccountList.size()));
        
        // Return the count
        return distinctAccountList.size();
    }
    
    
        
}