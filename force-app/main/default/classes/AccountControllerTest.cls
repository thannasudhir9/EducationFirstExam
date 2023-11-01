/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 11-01-2023
 * @last modified by  : Sudhir Kumar Thanna
**/
@isTest
public with sharing class AccountControllerTest {

    @isTest
    static void testGetAccounts() {
        // Create a RecordType for 'Person Account'
        Id rtId = [SELECT Id,Name FROM RecordType WHERE Name = 'Person Account' AND SObjectType = 'Account' LIMIT 1].Id;

        // Create test accounts
        Account account1 = new Account(RecordTypeId = rtId);
        account1.FirstName = 'John';
        account1.LastName = 'Greek';
        insert account1;

        Account account2 = new Account(RecordTypeId = rtId);
        account2.FirstName = 'Jane';
        account2.LastName = 'Smith';
        insert account2;

        // Test case 1: Search for 'John'
        List<Account> result1 = AccountController.getAccounts('John');
        System.assertEquals(1, result1.size(), 'One result should be found for "John" search.');

        // Test case 2: Search for 'Smith'
        List<Account> result2 = AccountController.getAccounts('Smith');
        System.assertEquals(1, result2.size(), 'One result should be found for "Smith" search.');

        // Test case 3: Search for 'Non-Existent'
        List<Account> result3 = AccountController.getAccounts('Non-Existent');
        System.assertEquals(0, result3.size(), 'No results should be found for "Non-Existent" search.');

        // Test case 4: Search with an empty searchString
        List<Account> result4 = AccountController.getAccounts('');
        System.assertEquals(0, result4.size(), 'No results should be found for an empty search string.');

    }
}