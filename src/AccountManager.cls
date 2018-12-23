//SuperBadge:Apex Specialist HIIII
//Badge:Apex Integration Services

@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager{
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        system.debug('testtt'+accountId);
        Account objAccount = [SELECT Id,Name,(SELECT Id,Name FROM Contacts) FROM Account WHERE Id = :accountId LIMIT 1];
        return objAccount;
    }
}