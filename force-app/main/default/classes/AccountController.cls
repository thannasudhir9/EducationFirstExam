/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 11-01-2023
 * @last modified by  : Sudhir Kumar Thanna
**/
public with sharing class AccountController {
    
    //@AuraEnabled is annotation enables LWC to access below apex method
    //(cacheable=true) is for caching the data on client side
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchString) {
        String accPARecordTypeId  = [SELECT Id,Name FROM RecordType WHERE Name = 'Person Account' AND SObjectType = 'Account' LIMIT 1]?.Id;
        String searchVal = '%'+ searchString +'%'; 
        List<Account> acclist = new List<Account>();
        if(accPARecordTypeId != '' && searchString != '') {
            acclist = [SELECT Id, Name, FirstName, LastName FROM Account WHERE RecordTypeId =:accPARecordTypeId AND Name LIKE :searchVal ];
            return acclist;
        }
        return acclist;
    }
}