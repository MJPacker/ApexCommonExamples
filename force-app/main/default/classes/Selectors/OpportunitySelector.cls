/**
 * @description Selector class for Opportunity sObject
 */
public with sharing class OpportunitySelector extends ApplicationSelector{
    
    public OpportunitySelector() {
        super();
    }

    public override getSObjectFieldList() {
        return new List<Schema.SObjectField>{
            Opportunity.Id,
            Opportunity.Name,
            Opportunity.StageName,
            Opportunity.CloseDate,
            Opportunity.Amount
        };
    }

    public override getSObjectType() {
        return Opportunity.SObjectType;
    }
}