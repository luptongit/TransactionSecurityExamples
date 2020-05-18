@isTest
 public class SecurityRuleTestByDistinctAccount {
 
     static testMethod void testAccountExportsForDistinctCount() {
          // set up our event and its field values
          ReportEvent testEvent = new ReportEvent();
          testEvent.QueriedEntities = 'Contact, User, Account';
          testEvent.Operation = 'ReportExported';
          testEvent.UserId = UserInfo.getUserId();
          testEvent.RowsProcessed = 2001;
          testEvent.Records = '{\"totalSize\":21,\"rows\":[{\"datacells\":[\"003B000000GHh7pIAD\",\"005B0000005GeB0IAK\",\"001B000000tngy9IAA\"]},{\"datacells\":[\"003B000000DwxB0IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2pIAC\"]},{\"datacells\":[\"003B000000DwxB1IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2pIAC\"]},{\"datacells\":[\"003B000000DwxB2IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2qIAC\"]},{\"datacells\":[\"003B000000DwxB3IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2rIAC\"]},{\"datacells\":[\"003B000000DwxB4IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2sIAC\"]},{\"datacells\":[\"003B000000DwxB5IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2tIAC\"]},{\"datacells\":[\"003B000000DwxB6IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2tIAC\"]},{\"datacells\":[\"003B000000DwxB7IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2uIAC\"]},{\"datacells\":[\"003B000000DwxB8IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2uIAC\"]},{\"datacells\":[\"003B000000DwxB9IAJ\",\"005B0000005GeB0IAK\",\"001B000000sMl2vIAC\"]},{\"datacells\":[\"003B000000DwxBAIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl2vIAC\"]},{\"datacells\":[\"003B000000DwxBBIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl2wIAC\"]},{\"datacells\":[\"003B000000DwxBCIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl2uIAC\"]},{\"datacells\":[\"003B000000DwxBDIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl2xIAC\"]},{\"datacells\":[\"003B000000DwxBEIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl2yIAC\"]},{\"datacells\":[\"003B000000DwxBFIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl2yIAC\"]},{\"datacells\":[\"003B000000DwxBGIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl2zIAC\"]},{\"datacells\":[\"003B000000DwxBHIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl2uIAC\"]},{\"datacells\":[\"003B000000DwxBIIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl30IAC\"]},{\"datacells\":[\"003B000000DwxBJIAZ\",\"005B0000005GeB0IAK\",\"001B000000sMl30IAC\"]}]}';
          
          
          // test that the Apex returns true for this event
          SecurityRuleAccountDistinctCount  eventCondition = new SecurityRuleAccountDistinctCount();
          System.assert(eventCondition.evaluate(testEvent));   
      }
     
 
 }