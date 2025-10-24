/** @description Selector for Contact records. */
public with sharing class ContactSelector extends ApplicationSelector {
    
    /** 
     * @description Default constructor for ContactSelector class. Initializes the selector with default settings.
     */
    public ContactSelector() {
        super();
    }

    /**
     * @description Gets the list of SObject fields to be queried for Contact records.
     * @return List of SObject fields to be queried.
     */
    public override List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
            Contact.Id,
            Contact.FirstName,
            Contact.LastName,
            Contact.Email,
            Contact.Phone
        };
    }

    /**
     * @description Gets the SObject type to be queried for Contact records.
     * @return Schema.SObjectType to be queried.
     */
    public override Schema.SObjectType getSObjectType() {
        return Contact.SObjectType;
    }

    /**
     * @description Selects Contact records by email domain.
     * @param emailDomain The email domain to filter contacts by.
     * @return List of Contact records matching the email domain.
     */
    public List<Contact> selectContactsByEmailDomain(String emailDomain) {
        fflib_QueryFactory qf = new fflib_QueryFactory(); //Initialize Query Factory
        qf.selectFields(getSObjectFieldList()); //Select fields defined in the selector
        qf.setCondition('Email LIKE %' + emailDomain); //Set condition to filter by email domain
        return (List<Contact>) Database.query(qf.toSOQL()); //Execute the query and return results
    }
}