/** @description Sample controller for managing Contact records */
public with sharing class SampleContactController {

    /** 
     * @description Method to retrieve contacts by email domain using ContactSelector.
     * @param emailDomain The email domain to filter contacts by.
     * @return List of Contact records matching the email domain.
     */
    public List<Contact> getContactsByEmailDomain(String emailDomain) {
        List<Contact> contacts = Application.Selector.selectContactsByEmailDomain(emailDomain);
        return contacts;
    }

    //You can also call the selector directly if you'd rather not use the application class, but this does not support mocking as well. 
    public List<Contact> getContactsDirectlyByEmailDomain(String emailDomain) {
        ContactSelector contactSelector = new ContactSelector();
        return contactSelector.selectContactsByEmailDomain(emailDomain);
    }
}