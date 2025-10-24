/**@description Configuration file for application mappings */
public with sharing class Application {
    

   /**
    * @description Factory Domain mapping for application
    */
    public static final fflib_Application.DomainFactory Domain = 
        new fflib_Application.DomainFactory(
            //Map sObject types to their corresponding Domain classes
            new Map<Schema.SObjectType, Type>{
                Job__c.SObjectType => Jobs.Constructor.class
            } 
        );
}