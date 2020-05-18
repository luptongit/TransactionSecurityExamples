@isTest
 public class SecurityRuleTestByProfile {
 
      static testMethod void testAccountExportsByProfile() {
          // set up our event and its field values
          ReportEvent testEvent = new ReportEvent();
          testEvent.QueriedEntities = 'Account, Lead';
          testEvent.Operation = 'ReportExported';
          testEvent.UserId = UserInfo.getUserId();
          testEvent.RowsProcessed = 2001;
          
          
          // test that the Apex returns true for this event
          SecurityRuleAccountExports  eventCondition = new SecurityRuleAccountExports();
          System.assert(eventCondition.evaluate(testEvent));   
      }
     
    
     
 
 }