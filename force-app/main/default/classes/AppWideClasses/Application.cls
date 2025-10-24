/**@description Configuration file for application mappings */
public with sharing class Application {
    

    /**@description Configure and create the SelectorFactory for this Application */
    public static final fflib_Application.SelectorFactory Selector = 
        new fflib_Application.SelectorFactory(
            //Map sObject types to their corresponding Selector classes
            new Map<Schema.SObjectType, Type>{
                Contact.SObjectType => ContactSelector.class
            }
        );
}