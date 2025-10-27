public with sharing class OpportunitiesServiceImpl implements IOpportunitiesService {
    

    public void initiateOpportunityClose(Set<Id> oppIds) {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();//Instantiate Unit of Work
        List<Opportunity> opportunities = (List<Opportunity>) Application.Selector.selectById(oppIds);//get opportunities via selector
        generateContracts(opportunities, uow);//Business logic to generate contracts, pass in uow to register DML
        notifyAccountTeams(opportunities, uow);//Business logic to notify account teams, pass in uow to register DML
        uow.commitWork();//Commit all registered DML operations
    }


    private void generateContracts(List<Opportunity> opportunities, fflib_ISObjectUnitOfWork uow) {//Could potentially live in its own service
        for(Opportunity opp : opportunities) {
            if(opp.StageName == 'Closed Won') {
                // Logic to generate contract for the opportunity
                uow.registerNew(new Contract(// Register the new contract with the Unit of Work
                    OpportunityId = opp.Id,
                    Status = 'Draft',
                    StartDate = Date.today(),
                    EndDate = Date.today().addYears(1)
                )); 
            }
        }
    }

    private void notifyAccountTeams(List<Opportunity> opportunities, fflib_ISObjectUnitOfWork uow) {//Could potentially live in its own service
        for(Opportunity opp : opportunities) {
            // Logic to notify account team members about the opportunity closure
            // For demonstration, we will just create a Task record as a notification
            uow.registerNew(new Task(// Register the new task with the Unit of Work
                WhatId = opp.Id,
                Subject = 'Opportunity Closed',
                ActivityDate = Date.today(),
                Status = 'Not Started'
            ));
        }
    }
}