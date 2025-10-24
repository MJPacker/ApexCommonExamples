public with sharing class CloseOpportunitiesInvocable {
    
    @InvocableMethod(label='Close Opportunities' description='Closes the given opportunities and performs related actions')
    public static void closeOpportunities(List<Id> opportunityIds) {
        IOpportunitiesService opportunitiesService = Application.Service(IOpportunitiesService.class);
        opportunitiesService.initiateOpportunityClose(new Set<Id>(opportunityIds));
    }
}