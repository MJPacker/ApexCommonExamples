/**
 * @description Domain class for Job__c SObject.
 */
public inherited sharing class Jobs extends ApplicationDomain  {
    
    public Jobs(List<Job__c> jobs) {
        super(jobs);
    }

    public override void onValidate(){
        // Custom validation logic for Job__c records
        validateStartEndDates();
    }

    public override void onBeforeInsert(){
        // Custom logic before inserting Job__c records
        setIntegrationId();
    }

    private void validateStartEndDates(){
        for (Job__c job : (List<Job__c>) Records){
            if (job.End_Date__c != null && job.Start_Date__c != null &&
                job.End_Date__c < job.Start_Date__c){
                throw new JobsException(
                    'End Date cannot be earlier than Start Date for Job: ' + job.Name
                );
            }
        }
    }

    private void setIntegrationId(){
        for (Job__c job : (List<Job__c>) Records){
            job.IntegrationId = IntegrationIdHelper.getSObjectIntegrationId();
        }
    }

    /**
     * @description Constructor for Jobs domain class.
     * @param sObjectList List of SObjects to be processed by the domain.
     */
    public class Constructor implements fflib_SObjectDomain.IConstructable{
        public fflib_SObjectDomain construct(List<SObject> sObjectList){
            return new Jobs(sObjectList);
        }
    }

    public class JobsException extends fflib_SObjectDomain.SObjectDomainException{
        public JobsException(String message){
            super(message);
        }
    }



}