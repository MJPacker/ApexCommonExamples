trigger JobTrigger on Job__c (before insert, before update, after insert, after update, after delete, after undelete) {
    fflib_SObjectDomain.triggerHandler(Jobs.class);
}