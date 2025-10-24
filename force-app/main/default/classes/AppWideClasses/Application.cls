/**@description Configuration file for application mappings */
public with sharing class Application {
    

    public static final fflib__Application.ServiceFactory Service = 
        new fflib__Application.ServiceFactory(
            new Map<Type, Type>{
                IOpportunitiesService.class => OpportunitiesServiceImpl.class
            }
        );

        //This is where we could overwrite the service factory via Custom Metadata to allow for different implementations per environment
}